Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD8F4C4321E
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 17:05:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5785D40167;
	Wed,  9 Feb 2022 17:05:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s594_cRbcOte; Wed,  9 Feb 2022 17:05:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8387140268;
	Wed,  9 Feb 2022 17:05:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 59E281BF47D
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 16:53:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 474F0400D0
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 16:53:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ESm3y9laAHYK for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 16:53:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C9EA440146
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 16:53:11 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 241C0E0006;
 Wed,  9 Feb 2022 16:53:09 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1nHqDN-0001QH-OR; Wed, 09 Feb 2022 17:53:09 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed,  9 Feb 2022 17:51:59 +0100
Message-Id: <20220209165213.4498-94-peter@korsgaard.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220209165213.4498-1-peter@korsgaard.com>
References: <20220209165213.4498-1-peter@korsgaard.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 093/107] package/python-nfc: drop python2
 specific package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy                   |  6 ++++++
 DEVELOPERS                         |  1 -
 package/Config.in                  |  1 -
 package/python-nfc/Config.in       | 16 ----------------
 package/python-nfc/python-nfc.hash |  3 ---
 package/python-nfc/python-nfc.mk   | 14 --------------
 6 files changed, 6 insertions(+), 35 deletions(-)
 delete mode 100644 package/python-nfc/Config.in
 delete mode 100644 package/python-nfc/python-nfc.hash
 delete mode 100644 package/python-nfc/python-nfc.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index f6607deeeb..80adf521f8 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2022.02"
 
+config BR2_PACKAGE_PYTHON_NFC
+	bool "python-nfc removed"
+	select BR2_LEGACY
+	help
+	  Package was removed together with python 2.7 support.
+
 config BR2_PACKAGE_PYTHON_MAD
 	bool "python-mad removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index fe28772d8b..7b38d3c0f7 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2598,7 +2598,6 @@ F:	package/nanocom/
 F:	package/neard/
 F:	package/neardal/
 F:	package/owl-linux/
-F:	package/python-nfc/
 F:	package/rapidjson/
 F:	package/sconeserver/
 F:	package/sound-theme-borealis/
diff --git a/package/Config.in b/package/Config.in
index d5c46ef997..8dc91becb0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1110,7 +1110,6 @@ menu "External python modules"
 	source "package/python-netifaces/Config.in"
 	source "package/python-networkmanager/Config.in"
 	source "package/python-networkx/Config.in"
-	source "package/python-nfc/Config.in"
 	source "package/python-numpy/Config.in"
 	source "package/python-oauthlib/Config.in"
 	source "package/python-opcua-asyncio/Config.in"
diff --git a/package/python-nfc/Config.in b/package/python-nfc/Config.in
deleted file mode 100644
index 7008723f60..0000000000
--- a/package/python-nfc/Config.in
+++ /dev/null
@@ -1,16 +0,0 @@
-config BR2_PACKAGE_PYTHON_NFC
-	bool "python-nfc"
-	depends on BR2_PACKAGE_PYTHON
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
-	select BR2_PACKAGE_LIBUSB
-	select BR2_PACKAGE_LIBUSB_COMPAT
-	help
-	  Python module for near field communication.
-
-	  https://launchpad.net/nfcpy
-
-comment "python-nfc needs a toolchain w/ threads, gcc >= 4.9"
-	depends on BR2_PACKAGE_PYTHON
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/python-nfc/python-nfc.hash b/package/python-nfc/python-nfc.hash
deleted file mode 100644
index 6514973f53..0000000000
--- a/package/python-nfc/python-nfc.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally computed:
-sha256	7ff9265e393e9e70173ecef5a1f9124e67d3b6e481c2dc3a9537b6a769ebe16f	python-nfc-0.13.5.tar.gz
-sha256	0dc4b0a3362f197e250604567a6b4eb16bbc34c186425401e2201a193a82549f	LICENSE
diff --git a/package/python-nfc/python-nfc.mk b/package/python-nfc/python-nfc.mk
deleted file mode 100644
index f5417410c9..0000000000
--- a/package/python-nfc/python-nfc.mk
+++ /dev/null
@@ -1,14 +0,0 @@
-################################################################################
-#
-# python-nfc
-#
-################################################################################
-
-PYTHON_NFC_VERSION = 0.13.5
-PYTHON_NFC_SITE = $(call github,nfcpy,nfcpy,v$(PYTHON_NFC_VERSION))
-PYTHON_NFC_DEPENDENCIES = libusb libusb-compat
-PYTHON_NFC_SETUP_TYPE = setuptools
-PYTHON_NFC_LICENSE = EUPL-1.1+
-PYTHON_NFC_LICENSE_FILES = LICENSE
-
-$(eval $(python-package))
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
