Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1850BC433EF
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 21:53:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BF8DA405C5;
	Wed,  9 Feb 2022 21:53:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cOsN3ViIHmr2; Wed,  9 Feb 2022 21:53:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B0D4A405BC;
	Wed,  9 Feb 2022 21:53:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 234B81BF2F0
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 21:34:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1F3AF60BF2
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 21:33:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LFbrSJsPlouw for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 21:33:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B639B60FF8
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 21:33:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id B948481335; Wed,  9 Feb 2022 21:26:02 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 9 Feb 2022 22:13:38 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 82e096a23e67961feef3e41a326aefe34cc974b8
X-Git-Newrev: 67aad59d5eebd9150d5787780f754df9703eff84
X-Patchwork-Hint: ignore
Message-Id: <20220209212602.B948481335@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-nfc: drop python2 specific
 package
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=67aad59d5eebd9150d5787780f754df9703eff84
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 Config.in.legacy                   |  6 ++++++
 DEVELOPERS                         |  1 -
 package/Config.in                  |  1 -
 package/python-nfc/Config.in       | 16 ----------------
 package/python-nfc/python-nfc.hash |  3 ---
 package/python-nfc/python-nfc.mk   | 14 --------------
 6 files changed, 6 insertions(+), 35 deletions(-)

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
index 9fb51b4481..d661693e4d 100644
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
