Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58BC6C83F1B
	for <buildroot@archiver.kernel.org>; Mon, 14 Jul 2025 14:46:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B8CE81EA6;
	Mon, 14 Jul 2025 14:46:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oJk0kOOo89Xr; Mon, 14 Jul 2025 14:46:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 33FE781E4E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 33FE781E4E;
	Mon, 14 Jul 2025 14:46:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7AFCADF
 for <buildroot@buildroot.org>; Mon, 14 Jul 2025 14:46:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6CDC960ABB
 for <buildroot@buildroot.org>; Mon, 14 Jul 2025 14:46:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qvrQ192Pg_iw for <buildroot@buildroot.org>;
 Mon, 14 Jul 2025 14:46:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B71F660854
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B71F660854
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B71F660854
 for <buildroot@buildroot.org>; Mon, 14 Jul 2025 14:46:21 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 9509F2C890A0;
 Mon, 14 Jul 2025 16:46:19 +0200 (CEST)
To: buildroot@buildroot.org
Date: Mon, 14 Jul 2025 16:46:16 +0200
Message-ID: <20250714144618.65723-2-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250714144618.65723-1-buildroot@bubu1.eu>
References: <20250714144618.65723-1-buildroot@bubu1.eu>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1752504379; bh=fHFM0ELdkqXEpQ76XEit+ORvwvWVpvoIBQxodl39/jM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=Q6WTX26Q1puKxuHmiTljjyGR4cp5M+CMAqiHIdrAcx8hvvv1MX3p2XE95a5RFRhz6
 MGudKW/DYiFPSr2JkXkS9L8SYbxmdRndBNF6guMOxSyJNMkY8I+wluk6T67Hv6NKfq
 bAEwIDSKIcPZKcxmMcmB4havRpJRcQFhHcVYQmnTAbtywMvmlm9255XF52Av+YCYgZ
 HB/K8ChdUq5vIhkGfbOzdnpoErdP6Pt8R1JBGpVkf/zO3X2sBdLpikAmsuBwTmvpjT
 N0zFPkpr5TBrXpcwkaz3fydSA1x8417zgk2+AXDlIif4Cxa7c/2w6lQ0elQsg+p1jx
 ky38F0kw5qmRQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=Q6WTX26Q
Subject: [Buildroot] [PATCH 2/2] package/python-starlette: bump to 0.47.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
* https://github.com/encode/starlette/releases/tag/0.47.0
* https://github.com/encode/starlette/releases/tag/0.47.1

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/python-starlette/python-starlette.hash | 4 ++--
 package/python-starlette/python-starlette.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-starlette/python-starlette.hash b/package/python-starlette/python-starlette.hash
index ce2ee91bed..be23e4ccb1 100644
--- a/package/python-starlette/python-starlette.hash
+++ b/package/python-starlette/python-starlette.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/starlette/json
-md5  d745d832d3f585d6144e8cd0c8f06697  starlette-0.46.2.tar.gz
-sha256  7f7361f34eed179294600af672f565727419830b54b7b084efe44bb82d2fccd5  starlette-0.46.2.tar.gz
+md5  b876ddd8665f70bb74e45d1fda053699  starlette-0.47.1.tar.gz
+sha256  aef012dd2b6be325ffa16698f9dc533614fb1cebd593a906b90dc1025529a79b  starlette-0.47.1.tar.gz
 # Locally computed sha256 checksums
 sha256  dcb95677a02240243187e964f941847d19b17821cf99e5afae684fab328c19bf  LICENSE.md
diff --git a/package/python-starlette/python-starlette.mk b/package/python-starlette/python-starlette.mk
index b4d28a6d08..eb49230600 100644
--- a/package/python-starlette/python-starlette.mk
+++ b/package/python-starlette/python-starlette.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_STARLETTE_VERSION = 0.46.2
+PYTHON_STARLETTE_VERSION = 0.47.1
 PYTHON_STARLETTE_SOURCE = starlette-$(PYTHON_STARLETTE_VERSION).tar.gz
-PYTHON_STARLETTE_SITE = https://files.pythonhosted.org/packages/ce/20/08dfcd9c983f6a6f4a1000d934b9e6d626cff8d2eeb77a89a68eef20a2b7
+PYTHON_STARLETTE_SITE = https://files.pythonhosted.org/packages/0a/69/662169fdb92fb96ec3eaee218cf540a629d629c86d7993d9651226a6789b
 PYTHON_STARLETTE_SETUP_TYPE = hatch
 PYTHON_STARLETTE_LICENSE = BSD-3-Clause
 PYTHON_STARLETTE_LICENSE_FILES = LICENSE.md
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
