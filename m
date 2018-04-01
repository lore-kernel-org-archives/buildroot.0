From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 1 Apr 2018 16:20:11 +0200
Subject: [Buildroot] [git commit] package/kodi-adsp-*: remove packages
Message-ID: <20180401142013.5B8A982ADB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9657e964f08033c1c71a8d94968fdc997360af4f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Those packages are unmaintained and not in a working state, for
details see https://github.com/xbmc/xbmc/pull/13723

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy                                          | 15 +++++++++++++++
 package/kodi-adsp-basic/Config.in                         | 12 ------------
 package/kodi-adsp-basic/kodi-adsp-basic.hash              |  2 --
 package/kodi-adsp-basic/kodi-adsp-basic.mk                | 15 ---------------
 package/kodi-adsp-freesurround/Config.in                  | 11 -----------
 .../kodi-adsp-freesurround/kodi-adsp-freesurround.hash    |  2 --
 package/kodi-adsp-freesurround/kodi-adsp-freesurround.mk  | 15 ---------------
 package/kodi/Config.in                                    |  5 -----
 8 files changed, 15 insertions(+), 62 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index fa083eaf79..2e3b1b6001 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -143,6 +143,21 @@ comment "----------------------------------------------------"
 endif
 
 ###############################################################################
+comment "Legacy options removed in 2018.05"
+
+config BR2_PACKAGE_KODI_ADSP_BASIC
+	bool "kodi-adsp-basic package removed"
+	select BR2_LEGACY
+	help
+	  kodi-adsp-basic is unmaintained
+
+config BR2_PACKAGE_KODI_ADSP_FREESURROUND
+	bool "kodi-adsp-freesurround package removed"
+	select BR2_LEGACY
+	help
+	  kodi-adsp-freesurround is unmaintained
+
+###############################################################################
 comment "Legacy options removed in 2018.02"
 
 config BR2_KERNEL_HEADERS_3_4
diff --git a/package/kodi-adsp-basic/Config.in b/package/kodi-adsp-basic/Config.in
deleted file mode 100644
index 87bdd1973c..0000000000
--- a/package/kodi-adsp-basic/Config.in
+++ /dev/null
@@ -1,12 +0,0 @@
-config BR2_PACKAGE_KODI_ADSP_BASIC
-	bool "kodi-adsp-basic"
-	select BR2_PACKAGE_LIBPLATFORM
-	select BR2_PACKAGE_KODI_PLATFORM
-	help
-	  This add-on contains basic dsp related parts to handle
-	  speaker delays, channel related volume amplification. As
-	  mode it supports a Dolby Pro Logic II compatible
-	  multichannel downmix to stereo, which becomes available if
-	  only 2 channel output on Kodi is selected.
-
-	  https://github.com/kodi-adsp/adsp.basic
diff --git a/package/kodi-adsp-basic/kodi-adsp-basic.hash b/package/kodi-adsp-basic/kodi-adsp-basic.hash
deleted file mode 100644
index 10dd773c1e..0000000000
--- a/package/kodi-adsp-basic/kodi-adsp-basic.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Locally computed
-sha256 d6ef031157ceb825a6e6ba114fb20c622ef7f396ddd17ae8bf1954aab25bc2af  kodi-adsp-basic-2ae604e591346741324663260696cfa231931870.tar.gz
diff --git a/package/kodi-adsp-basic/kodi-adsp-basic.mk b/package/kodi-adsp-basic/kodi-adsp-basic.mk
deleted file mode 100644
index bb114a41ea..0000000000
--- a/package/kodi-adsp-basic/kodi-adsp-basic.mk
+++ /dev/null
@@ -1,15 +0,0 @@
-################################################################################
-#
-# kodi-adsp-basic
-#
-################################################################################
-
-# This cset is on the branch 'Krypton'
-# When Kodi is updated, then this should be updated to the corresponding branch
-KODI_ADSP_BASIC_VERSION = 2ae604e591346741324663260696cfa231931870
-KODI_ADSP_BASIC_SITE = $(call github,kodi-adsp,adsp.basic,$(KODI_ADSP_BASIC_VERSION))
-KODI_ADSP_BASIC_LICENSE = GPL-3.0+
-KODI_ADSP_BASIC_LICENSE_FILES = LICENSE.md
-KODI_ADSP_BASIC_DEPENDENCIES = libplatform kodi-platform
-
-$(eval $(cmake-package))
diff --git a/package/kodi-adsp-freesurround/Config.in b/package/kodi-adsp-freesurround/Config.in
deleted file mode 100644
index 80aadf1d40..0000000000
--- a/package/kodi-adsp-freesurround/Config.in
+++ /dev/null
@@ -1,11 +0,0 @@
-config BR2_PACKAGE_KODI_ADSP_FREESURROUND
-	bool "kodi-adsp-freesurround"
-	select BR2_PACKAGE_LIBPLATFORM
-	select BR2_PACKAGE_KODI_PLATFORM
-	help
-	  FreeSurround is meant to be the KODI equivalent of your
-	  hi-fi receiver's Dolby ProLogic II button. It's purpose is
-	  to decode surround information from your stereo music and to
-	  produce multichannel output from it.
-
-	  https://github.com/kodi-adsp/adsp.freesurround
diff --git a/package/kodi-adsp-freesurround/kodi-adsp-freesurround.hash b/package/kodi-adsp-freesurround/kodi-adsp-freesurround.hash
deleted file mode 100644
index 2649bbdcbf..0000000000
--- a/package/kodi-adsp-freesurround/kodi-adsp-freesurround.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Locally computed
-sha256 cf6985be6839530027861b54e2146693d05e802363281ef6f8c1f352dbf94b5c  kodi-adsp-freesurround-34f50406bcba22e364711562e5b9205e57ae844b.tar.gz
diff --git a/package/kodi-adsp-freesurround/kodi-adsp-freesurround.mk b/package/kodi-adsp-freesurround/kodi-adsp-freesurround.mk
deleted file mode 100644
index 927af74da7..0000000000
--- a/package/kodi-adsp-freesurround/kodi-adsp-freesurround.mk
+++ /dev/null
@@ -1,15 +0,0 @@
-################################################################################
-#
-# kodi-adsp-freesurround
-#
-################################################################################
-
-# This cset is on the branch 'Krypton'
-# When Kodi is updated, then this should be updated to the corresponding branch
-KODI_ADSP_FREESURROUND_VERSION = 34f50406bcba22e364711562e5b9205e57ae844b
-KODI_ADSP_FREESURROUND_SITE = $(call github,kodi-adsp,adsp.freesurround,$(KODI_ADSP_FREESURROUND_VERSION))
-KODI_ADSP_FREESURROUND_LICENSE = GPL-3.0+
-KODI_ADSP_FREESURROUND_LICENSE_FILES = LICENSE.md
-KODI_ADSP_FREESURROUND_DEPENDENCIES = libplatform kodi-platform
-
-$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 071c03d640..d96d546bf9 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -280,11 +280,6 @@ menu "Audio decoder addons"
 	source "package/kodi-audiodecoder-vgmstream/Config.in"
 endmenu
 
-menu "Audio DSP addons"
-	source "package/kodi-adsp-basic/Config.in"
-	source "package/kodi-adsp-freesurround/Config.in"
-endmenu
-
 menu "Audio encoder addons"
 	source "package/kodi-audioencoder-flac/Config.in"
 	source "package/kodi-audioencoder-lame/Config.in"
