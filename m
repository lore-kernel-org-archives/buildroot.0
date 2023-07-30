Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4AB5C001DC
	for <buildroot@archiver.kernel.org>; Sun, 30 Jul 2023 10:35:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 64D2160AEC;
	Sun, 30 Jul 2023 10:35:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 64D2160AEC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CczZoHVgHoqu; Sun, 30 Jul 2023 10:35:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8891960ACF;
	Sun, 30 Jul 2023 10:35:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8891960ACF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5C7A71BF41B
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 10:35:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 43A1840193
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 10:35:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 43A1840193
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WYvUEFWyKTqR for <buildroot@lists.busybox.net>;
 Sun, 30 Jul 2023 10:35:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 655174014D
 for <buildroot@buildroot.org>; Sun, 30 Jul 2023 10:35:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 655174014D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4DB5183BD1; Sun, 30 Jul 2023 10:35:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 30 Jul 2023 12:34:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 801419c8112d1fc021be9db5faac3fc75eb18903
X-Git-Newrev: 38370aa2f9bda68b31a52fe0a2041fc4c631a71e
X-Patchwork-Hint: ignore
Message-Id: <20230730103545.4DB5183BD1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kodi-imagedecoder-raw: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=38370aa2f9bda68b31a52fe0a2041fc4c631a71e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/kodi-imagedecoder-raw/Config.in                  | 15 +++++++++++++++
 package/kodi-imagedecoder-raw/kodi-imagedecoder-raw.hash |  3 +++
 package/kodi-imagedecoder-raw/kodi-imagedecoder-raw.mk   | 13 +++++++++++++
 package/kodi/Config.in                                   |  1 +
 4 files changed, 32 insertions(+)

diff --git a/package/kodi-imagedecoder-raw/Config.in b/package/kodi-imagedecoder-raw/Config.in
new file mode 100644
index 0000000000..1f04a2a5f8
--- /dev/null
+++ b/package/kodi-imagedecoder-raw/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_KODI_IMAGEDECODER_RAW
+	bool "kodi-imagedecoder-raw"
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on BR2_INSTALL_LIBSTDCPP
+	select BR2_PACKAGE_JPEG
+	select BR2_PACKAGE_LCMS2
+	select BR2_PACKAGE_LIBRAW
+	help
+	  RAW image decoder add-on for Kodi
+
+	  https://github.com/xbmc/imagedecoder.raw
+
+comment "kodi-imagedecoder-raw needs a toolchain w/ C++"
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/kodi-imagedecoder-raw/kodi-imagedecoder-raw.hash b/package/kodi-imagedecoder-raw/kodi-imagedecoder-raw.hash
new file mode 100644
index 0000000000..8be6ed98da
--- /dev/null
+++ b/package/kodi-imagedecoder-raw/kodi-imagedecoder-raw.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  6235c0be431bbb814b3e464753af9ad17febf6001f77cbf030e6c6e1cdc41a04  kodi-imagedecoder-raw-20.1.0-Nexus.tar.gz
+sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-imagedecoder-raw/kodi-imagedecoder-raw.mk b/package/kodi-imagedecoder-raw/kodi-imagedecoder-raw.mk
new file mode 100644
index 0000000000..171956df41
--- /dev/null
+++ b/package/kodi-imagedecoder-raw/kodi-imagedecoder-raw.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# kodi-imagedecoder-raw
+#
+################################################################################
+
+KODI_IMAGEDECODER_RAW_VERSION = 20.1.0-Nexus
+KODI_IMAGEDECODER_RAW_SITE = $(call github,xbmc,imagedecoder.raw,$(KODI_IMAGEDECODER_RAW_VERSION))
+KODI_IMAGEDECODER_RAW_LICENSE = GPL-2.0+
+KODI_IMAGEDECODER_RAW_LICENSE_FILES = LICENSE.md
+KODI_IMAGEDECODER_RAW_DEPENDENCIES = kodi jpeg lcms2 libraw
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 3926c26ff2..6b68e6d504 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -293,6 +293,7 @@ endmenu
 
 menu "Image decoder addons"
 	source "package/kodi-imagedecoder-heif/Config.in"
+	source "package/kodi-imagedecoder-raw/Config.in"
 endmenu
 
 menu "Peripheral addons"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
