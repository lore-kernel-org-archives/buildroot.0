Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E3FDCCD195
	for <buildroot@archiver.kernel.org>; Fri, 17 Oct 2025 08:09:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 14C5D809A8;
	Fri, 17 Oct 2025 08:09:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id laye_jI_Y-Hb; Fri, 17 Oct 2025 08:09:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 357EC809AF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 357EC809AF;
	Fri, 17 Oct 2025 08:09:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5EB371EB1
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 08:09:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5BD4C809AF
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 08:09:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aOy-J7mmzBWB for <buildroot@buildroot.org>;
 Fri, 17 Oct 2025 08:09:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 71FA6809A8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 71FA6809A8
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 71FA6809A8
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 08:09:21 +0000 (UTC)
Received: from framework-OT (unknown [93.240.174.20])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 3C20A2C8398D;
 Fri, 17 Oct 2025 10:09:19 +0200 (CEST)
To: buildroot@buildroot.org
Date: Fri, 17 Oct 2025 10:09:19 +0200
Message-ID: <20251017080920.28339-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1760688559; bh=5Q4fQCRb3N+zmoOp2joc/6lzlTGrbKMWuYtl65iEE2A=;
 h=From:To:Cc:Subject:Date;
 b=hdcW0H+LiFj3UXqbK/lrc8k705d9NMxn7jjificY8ROpZgKBKMM1uWcSEGxtf8mQu
 EE+RtT7C5xsQus14QUQv1gEhjDAtZogrOd5JUi4bldAnQZFmJF1R9skv00JZiKvyoy
 3+UpW2d+xZmhHXUi89EzEwno1uBvodoaM6tEr2ZZ0enMr3R+8ax2eziLEwTjvtzld3
 guWs+S/xH4uqRbimwHKLqJOamX6M1l0aqfdW8QeN2hykBvwaN4Dl3ui52hZRdlSG0m
 R4BSsh/16a0DfPE489uiuqZ6e4RrlPVlJ04VJQqBbT6tXaXXzLD4C4g2Hf9Z+54wYc
 H6TdHe0ylcwCw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=hdcW0H+L
Subject: [Buildroot] [PATCH] package/python-uvloop: bump to v0.22.0
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog: https://github.com/MagicStack/uvloop/releases/tag/v0.22.0

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/python-uvloop/python-uvloop.hash | 7 +++----
 package/python-uvloop/python-uvloop.mk   | 4 ++--
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/python-uvloop/python-uvloop.hash b/package/python-uvloop/python-uvloop.hash
index 24111e759b..e6eb188739 100644
--- a/package/python-uvloop/python-uvloop.hash
+++ b/package/python-uvloop/python-uvloop.hash
@@ -1,6 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/uvloop/json
-md5  adedf20cf065ff49a96813b783ec1d29  uvloop-0.21.0.tar.gz
-sha256  3bf12b0fda68447806a7ad847bfa591613177275d35b6724b1ee573faa3704e3  uvloop-0.21.0.tar.gz
+md5  3fdd58ac1b7c2a520ed05e3151a64515  uvloop-0.22.1.tar.gz
+sha256  6c84bae345b9147082b17371e3dd5d42775bddce91f885499017f4607fdaf39f  uvloop-0.22.1.tar.gz
 # Locally computed sha256 checksums
-sha256  377025287798f9dcd819e1f826fa5fc5e2f382528691ab0528c5cf8c8c282c27  LICENSE-APACHE
-sha256  6dd4c399f26de043d77a2ad7e31db4cb5bf08ea8368b0a42d6e158635cc8ab62  LICENSE-MIT
+sha256  16de0c32b265cb7d46a6d3bd614f259dd4d693a5e26b3407b04aae8d73041f0c  vendor/libuv/LICENSE
diff --git a/package/python-uvloop/python-uvloop.mk b/package/python-uvloop/python-uvloop.mk
index fbdf74769e..419ee33062 100644
--- a/package/python-uvloop/python-uvloop.mk
+++ b/package/python-uvloop/python-uvloop.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_UVLOOP_VERSION = 0.21.0
+PYTHON_UVLOOP_VERSION = 0.22.1
 PYTHON_UVLOOP_SOURCE = uvloop-$(PYTHON_UVLOOP_VERSION).tar.gz
-PYTHON_UVLOOP_SITE = https://files.pythonhosted.org/packages/af/c0/854216d09d33c543f12a44b393c402e89a920b1a0a7dc634c42de91b9cf6
+PYTHON_UVLOOP_SITE = https://files.pythonhosted.org/packages/06/f0/18d39dbd1971d6d62c4629cc7fa67f74821b0dc1f5a77af43719de7936a7
 PYTHON_UVLOOP_SETUP_TYPE = setuptools
 PYTHON_UVLOOP_LICENSE = Apache-2.0, MIT
 PYTHON_UVLOOP_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
