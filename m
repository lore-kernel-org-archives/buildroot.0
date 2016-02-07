From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  7 Feb 2016 17:03:09 +0100
Subject: [Buildroot] [PATCH 25/28] package/kodi-adsp-basic: new package
In-Reply-To: <1454860992-25114-1-git-send-email-bernd.kuhls@t-online.de>
References: <1454860992-25114-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1454860992-25114-26-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-adsp-basic/Config.in          | 12 ++++++++++++
 package/kodi-adsp-basic/kodi-adsp-basic.mk | 13 +++++++++++++
 package/kodi/Config.in                     |  1 +
 3 files changed, 26 insertions(+)
 create mode 100644 package/kodi-adsp-basic/Config.in
 create mode 100644 package/kodi-adsp-basic/kodi-adsp-basic.mk

diff --git a/package/kodi-adsp-basic/Config.in b/package/kodi-adsp-basic/Config.in
new file mode 100644
index 0000000..9ebc1ca
--- /dev/null
+++ b/package/kodi-adsp-basic/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_KODI_ADSP_BASIC
+	bool "kodi-adsp-basic"
+	select BR2_PACKAGE_LIBPLATFORM
+	select BR2_PACKAGE_KODI_PLATFORM
+	help
+	  This add-on contains basic dsp related parts to handle speaker
+	  delays, channel related volume amplification. As mode it
+	  supports a Dolby Pro Logic II compatible multichannel downmix
+	  to stereo, which becomes available if only 2 channel output on
+	  Kodi is selected.
+
+	  https://github.com/kodi-adsp/adsp.basic
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
index d36106a..09513a2 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -237,6 +237,7 @@ menu "Audio decoder addons"
 endmenu
 
 menu "Audio DSP addons"
+	source "package/kodi-adsp-basic/Config.in"
 	source "package/kodi-adsp-freesurround/Config.in"
 endmenu
 
-- 
2.7.0
