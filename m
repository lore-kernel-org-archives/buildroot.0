Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6DB7CFD313
	for <buildroot@archiver.kernel.org>; Mon, 24 Nov 2025 14:34:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 60C5F821F2;
	Mon, 24 Nov 2025 14:34:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fui4NfMeIlYc; Mon, 24 Nov 2025 14:34:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 903A5821F9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 903A5821F9;
	Mon, 24 Nov 2025 14:34:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9FCA1E4
 for <buildroot@buildroot.org>; Mon, 24 Nov 2025 14:34:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7E542821F2
 for <buildroot@buildroot.org>; Mon, 24 Nov 2025 14:34:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T43WgfbxlYhq for <buildroot@buildroot.org>;
 Mon, 24 Nov 2025 14:34:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9DFA3821EF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9DFA3821EF
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9DFA3821EF
 for <buildroot@buildroot.org>; Mon, 24 Nov 2025 14:34:26 +0000 (UTC)
Received: from framework-OT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 31A3C2C80043;
 Mon, 24 Nov 2025 15:34:24 +0100 (CET)
From: Marcus Hoffmann <buildroot@bubu1.eu>
To: buildroot@buildroot.org
Date: Mon, 24 Nov 2025 15:34:24 +0100
Message-ID: <20251124143425.2841419-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1763994864; bh=e1wZGYk4/vq16Jcrt9E3FL8g29xmEu3EeDykOz2x/UI=;
 h=From:To:Cc:Subject:Date;
 b=UaRAv6NCiWg36EdR/WcLM5442+NdkR/uxqSlF5gqG1MAg1uoFNQ78zb1PNsXu19/u
 aHeVM5+sR5jwJCuMF9zdpU1NCiPBW2t+RiZnDi98A9PM+P/I4wyOy5mIdc92saiyKT
 hFHk7h/dJLsomAaNS8brKhyUk+2kj7LpAaRuUnGPs/1onlaqgYCOAImCWTZc/6g8RC
 Fm+51fGvCkJY4TO06RhdA0k5fVuNxS8AIIvUNl6vQfKXmrk6EeY4oMlmVxR8XKPgGr
 mSN5uagUyI+ozdALG+7nCLXtt+Jz0iDrZK2Jcb5LxPjy251xWybCKUmeKEjv0m0xNI
 lFMNH4x2RACqQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=UaRAv6NC
Subject: [Buildroot] [PATCH] package/python-click: bump to version 8.3.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Mauro Condarelli <mc5686@mclink.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog: https://click.palletsprojects.com/en/stable/changes/#version-8-3-1

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/python-click/python-click.hash | 4 ++--
 package/python-click/python-click.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-click/python-click.hash b/package/python-click/python-click.hash
index df8528a786..84eafea3b7 100644
--- a/package/python-click/python-click.hash
+++ b/package/python-click/python-click.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/click/json
-md5  fa228744ff03a339957e847fb7890823  click-8.3.0.tar.gz
-sha256  e7b8232224eba16f4ebe410c25ced9f7875cb5f3263ffc93cc3e8da705e229c4  click-8.3.0.tar.gz
+md5  5f89d725a424b101607ec40927f78773  click-8.3.1.tar.gz
+sha256  12ff4785d337a1bb490bb7e9c2b1ee5da3112e94a8622f26a6c77f5d2fc6842a  click-8.3.1.tar.gz
 # Locally computed sha256 checksums
 sha256  9a8ad106a394e853bfe21f42f4e72d592819a22805d991b5f3275029292b658d  LICENSE.txt
diff --git a/package/python-click/python-click.mk b/package/python-click/python-click.mk
index ef22c27439..8a4f99e9a1 100644
--- a/package/python-click/python-click.mk
+++ b/package/python-click/python-click.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CLICK_VERSION = 8.3.0
+PYTHON_CLICK_VERSION = 8.3.1
 PYTHON_CLICK_SOURCE = click-$(PYTHON_CLICK_VERSION).tar.gz
-PYTHON_CLICK_SITE = https://files.pythonhosted.org/packages/46/61/de6cd827efad202d7057d93e0fed9294b96952e188f7384832791c7b2254
+PYTHON_CLICK_SITE = https://files.pythonhosted.org/packages/3d/fa/656b739db8587d7b5dfa22e22ed02566950fbfbcdc20311993483657a5c0
 PYTHON_CLICK_SETUP_TYPE = flit
 PYTHON_CLICK_LICENSE = BSD-3-Clause
 PYTHON_CLICK_LICENSE_FILES = LICENSE.txt
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
