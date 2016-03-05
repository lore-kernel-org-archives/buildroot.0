From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Mar 2016 16:04:41 +0100
Subject: [Buildroot] [git commit] package/kodi-adsp-basic: new package
Message-ID: <20160305150448.CFA60807E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=80470c9f1a94b4de784c22e61162819b23614270
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kodi-adsp-basic/Config.in            | 12 ++++++++++++
 package/kodi-adsp-basic/kodi-adsp-basic.hash |  2 ++
 package/kodi-adsp-basic/kodi-adsp-basic.mk   | 13 +++++++++++++
 package/kodi/Config.in                       |  1 +
 4 files changed, 28 insertions(+)

diff --git a/package/kodi-adsp-basic/Config.in b/package/kodi-adsp-basic/Config.in
new file mode 100644
index 0000000..87bdd19
--- /dev/null
+++ b/package/kodi-adsp-basic/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_KODI_ADSP_BASIC
+	bool "kodi-adsp-basic"
+	select BR2_PACKAGE_LIBPLATFORM
+	select BR2_PACKAGE_KODI_PLATFORM
+	help
+	  This add-on contains basic dsp related parts to handle
+	  speaker delays, channel related volume amplification. As
+	  mode it supports a Dolby Pro Logic II compatible
+	  multichannel downmix to stereo, which becomes available if
+	  only 2 channel output on Kodi is selected.
+
+	  https://github.com/kodi-adsp/adsp.basic
diff --git a/package/kodi-adsp-basic/kodi-adsp-basic.hash b/package/kodi-adsp-basic/kodi-adsp-basic.hash
new file mode 100644
index 0000000..e668ff2
--- /dev/null
+++ b/package/kodi-adsp-basic/kodi-adsp-basic.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 0ae320af73085c322671d4b361248ff4341a6a04bd81c8b699847d5b04da828f kodi-adsp-basic-cb56e0eb6530fd50a286d47ef0be529001e9d556.tar.gz
diff --git a/package/kodi-adsp-basic/kodi-adsp-basic.mk b/package/kodi-adsp-basic/kodi-adsp-basic.mk
new file mode 100644
index 0000000..0b1ba95
--- /dev/null
+++ b/package/kodi-adsp-basic/kodi-adsp-basic.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# kodi-adsp-basic
+#
+################################################################################
+
+KODI_ADSP_BASIC_VERSION = cb56e0eb6530fd50a286d47ef0be529001e9d556
+KODI_ADSP_BASIC_SITE = $(call github,kodi-adsp,adsp.basic,$(KODI_ADSP_BASIC_VERSION))
+KODI_ADSP_BASIC_LICENSE = GPLv3+
+KODI_ADSP_BASIC_LICENSE_FILES = LICENSE.md
+KODI_ADSP_BASIC_DEPENDENCIES = libplatform kodi-platform
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index d727764..bd40ac3 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -239,6 +239,7 @@ menu "Audio decoder addons"
 endmenu
 
 menu "Audio DSP addons"
+	source "package/kodi-adsp-basic/Config.in"
 	source "package/kodi-adsp-freesurround/Config.in"
 endmenu
 
