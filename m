Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17DC2C3DA64
	for <buildroot@archiver.kernel.org>; Thu,  1 Aug 2024 12:41:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A7D546061E;
	Thu,  1 Aug 2024 12:41:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8JmLK5VQGCsm; Thu,  1 Aug 2024 12:41:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B5D0760627
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B5D0760627;
	Thu,  1 Aug 2024 12:41:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D04471BF3C9
 for <buildroot@lists.busybox.net>; Thu,  1 Aug 2024 12:41:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BC78B81F5B
 for <buildroot@lists.busybox.net>; Thu,  1 Aug 2024 12:41:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cKC-dZc4gLTo for <buildroot@lists.busybox.net>;
 Thu,  1 Aug 2024 12:41:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3B5CC81E51
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B5CC81E51
Received: from mail.tkos.co.il (guitar.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3B5CC81E51
 for <buildroot@buildroot.org>; Thu,  1 Aug 2024 12:41:19 +0000 (UTC)
Received: from tarshish.tkos.co.il (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id 86064440850;
 Thu,  1 Aug 2024 15:39:53 +0300 (IDT)
To: buildroot@buildroot.org
Date: Thu,  1 Aug 2024 15:40:57 +0300
Message-ID: <bb3ab486ff7b0113e36b555f9fdbd850c4d132a8.1722516057.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1722515993;
 bh=zl23h23WPLs+X7maM/qmfzdf5kupimAbHSs2lfrVC4Q=;
 h=From:To:Cc:Subject:Date:From;
 b=S9p7EcXGX6UrGjBbzWR0m+NLLn/mxxYbMaarKaiBc00CF5K+hZDdRuXi0rRCD93wG
 Tb48LFYaUZy/h+lnZdJ+8AzvVY4uBiEl73TrzZzTMEltQ6R3bHC0YuI9nQs2O+Q1BB
 PSw6zSVjeP/MLWVemLmfW5X/AW8hbizcHgNPZ6I2nfYV29hbwBD/pTW9mQ6FL3sUHz
 q7Omyj9eXoYk21QJDcZp5uWtjSD/xJ1gLxJn1SZ/+474W/HTj8/ZXT88wQIae6nRSr
 ycQxJpyBdKvlfp7isB684JMRbP3p3XLTBr66e3tW6Sin/xDNo4GTSjEra13ZtMZ7ym
 I8diOJBgMsR/g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=tkos.co.il
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=S9p7EcXG
Subject: [Buildroot] [PATCH] package/picocom: bump to version 2024-07
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This release adds support for no-MMU build.

Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/picocom/picocom.hash | 2 +-
 package/picocom/picocom.mk   | 9 +++++++--
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/picocom/picocom.hash b/package/picocom/picocom.hash
index 8107f5633a6c..170de09cf463 100644
--- a/package/picocom/picocom.hash
+++ b/package/picocom/picocom.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  107d3e49e502ce63f826525f587826990451bcb39492efe2e0463dd62d64f3ea  picocom-2023-04.tar.gz
+sha256  4379de2ec591a5848123f37ccdbc7fbeee6dd3520ef1ce4119d84202fc268a17  picocom-2024-07.tar.gz
 sha256  9273c6b2c55be95f0f0df292d87e8900e5bfdf5b510a6ea09e80306cf45c10f6  LICENSE.txt
diff --git a/package/picocom/picocom.mk b/package/picocom/picocom.mk
index bb55c3c1d1d3..34c3bfb23069 100644
--- a/package/picocom/picocom.mk
+++ b/package/picocom/picocom.mk
@@ -4,14 +4,19 @@
 #
 ################################################################################
 
-PICOCOM_VERSION = 2023-04
+PICOCOM_VERSION = 2024-07
 PICOCOM_SITE = $(call gitlab,wsakernel,picocom,$(PICOCOM_VERSION))
 PICOCOM_LICENSE = GPL-2.0+
 PICOCOM_LICENSE_FILES = LICENSE.txt
 PICOCOM_CPE_ID_VALID = YES
 
+ifeq ($(BR2_USE_MMU),)
+PICOCOM_CPPFLAGS += -DNO_FORK
+endif
+
 define PICOCOM_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) \
+		EXTRA_CPPFLAGS='$(PICOCOM_CPPFLAGS)' $(MAKE) -C $(@D)
 endef
 
 define PICOCOM_INSTALL_TARGET_CMDS
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
