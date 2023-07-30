Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 023D1C001DF
	for <buildroot@archiver.kernel.org>; Sun, 30 Jul 2023 10:32:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A3CC760B9F;
	Sun, 30 Jul 2023 10:32:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A3CC760B9F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u1CvzBp52zHr; Sun, 30 Jul 2023 10:32:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C12B560ACA;
	Sun, 30 Jul 2023 10:32:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C12B560ACA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 542D21BF41B
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 10:32:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2B87060761
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 10:32:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B87060761
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Jj-k_sQAsyCM for <buildroot@lists.busybox.net>;
 Sun, 30 Jul 2023 10:32:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3CD1D60774
 for <buildroot@buildroot.org>; Sun, 30 Jul 2023 10:32:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3CD1D60774
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 299E883BC4; Sun, 30 Jul 2023 10:32:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 30 Jul 2023 12:31:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f23178772075a6bf1a06c7de4954c7aa17aab7b7
X-Git-Newrev: 4350a1f1035dffc48e9ef3155f8f7f9aa3903069
X-Patchwork-Hint: ignore
Message-Id: <20230730103202.299E883BC4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kodi-imagedecoder-heif: new package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4350a1f1035dffc48e9ef3155f8f7f9aa3903069
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/kodi-imagedecoder-heif/Config.in               | 18 ++++++++++++++++++
 .../kodi-imagedecoder-heif/kodi-imagedecoder-heif.hash |  3 +++
 .../kodi-imagedecoder-heif/kodi-imagedecoder-heif.mk   | 13 +++++++++++++
 package/kodi/Config.in                                 |  4 ++++
 4 files changed, 38 insertions(+)

diff --git a/package/kodi-imagedecoder-heif/Config.in b/package/kodi-imagedecoder-heif/Config.in
new file mode 100644
index 0000000000..32f375be3e
--- /dev/null
+++ b/package/kodi-imagedecoder-heif/Config.in
@@ -0,0 +1,18 @@
+config BR2_PACKAGE_KODI_IMAGEDECODER_HEIF
+	bool "kodi-imagedecoder-heif"
+	depends on BR2_INSTALL_LIBSTDCPP # libde265, libheif, tinyxml2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libde265
+	depends on !BR2_m68k_cf # libheif
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # libheif
+	select BR2_PACKAGE_LIBDE265
+	select BR2_PACKAGE_LIBHEIF
+	select BR2_PACKAGE_TINYXML2
+	help
+	  HEIF image decoder add-on for Kodi
+
+	  https://github.com/xbmc/imagedecoder.heif
+
+comment "kodi-imagedecoder-heif needs a toolchain w/ C++, threads, gcc >= 4.8"
+	depends on !BR2_m68k_cf # libheif
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \\
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
diff --git a/package/kodi-imagedecoder-heif/kodi-imagedecoder-heif.hash b/package/kodi-imagedecoder-heif/kodi-imagedecoder-heif.hash
new file mode 100644
index 0000000000..4c7dec7df1
--- /dev/null
+++ b/package/kodi-imagedecoder-heif/kodi-imagedecoder-heif.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  17f50aada11528c02db2ff3871a355c89709ab7e2a5e6b5e33957b790cf207ff  kodi-imagedecoder-heif-20.1.0-Nexus.tar.gz
+sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-imagedecoder-heif/kodi-imagedecoder-heif.mk b/package/kodi-imagedecoder-heif/kodi-imagedecoder-heif.mk
new file mode 100644
index 0000000000..40b091d8b4
--- /dev/null
+++ b/package/kodi-imagedecoder-heif/kodi-imagedecoder-heif.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# kodi-imagedecoder-heif
+#
+################################################################################
+
+KODI_IMAGEDECODER_HEIF_VERSION = 20.1.0-Nexus
+KODI_IMAGEDECODER_HEIF_SITE = $(call github,xbmc,imagedecoder.heif,$(KODI_IMAGEDECODER_HEIF_VERSION))
+KODI_IMAGEDECODER_HEIF_LICENSE = GPL-2.0+
+KODI_IMAGEDECODER_HEIF_LICENSE_FILES = LICENSE.md
+KODI_IMAGEDECODER_HEIF_DEPENDENCIES = kodi libde265 libheif tinyxml2
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 0bdb8c50ee..3926c26ff2 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -291,6 +291,10 @@ menu "Audio encoder addons"
 	source "package/kodi-audioencoder-wav/Config.in"
 endmenu
 
+menu "Image decoder addons"
+	source "package/kodi-imagedecoder-heif/Config.in"
+endmenu
+
 menu "Peripheral addons"
 	source "package/kodi-peripheral-joystick/Config.in"
 	source "package/kodi-peripheral-xarcade/Config.in"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
