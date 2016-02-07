From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  7 Feb 2016 17:03:10 +0100
Subject: [Buildroot] [PATCH 26/28] package/kodi-adsp-biquad-filters: new
	package
In-Reply-To: <1454860992-25114-1-git-send-email-bernd.kuhls@t-online.de>
References: <1454860992-25114-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1454860992-25114-27-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-adsp-biquad-filters/Config.in                 | 10 ++++++++++
 .../kodi-adsp-biquad-filters/kodi-adsp-biquad-filters.mk   | 14 ++++++++++++++
 package/kodi/Config.in                                     |  1 +
 3 files changed, 25 insertions(+)
 create mode 100644 package/kodi-adsp-biquad-filters/Config.in
 create mode 100644 package/kodi-adsp-biquad-filters/kodi-adsp-biquad-filters.mk

diff --git a/package/kodi-adsp-biquad-filters/Config.in b/package/kodi-adsp-biquad-filters/Config.in
new file mode 100644
index 0000000..efb783c
--- /dev/null
+++ b/package/kodi-adsp-biquad-filters/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_KODI_ADSP_BIQUAD_FILTERS
+	bool "kodi-adsp-biquad-filters"
+	select BR2_PACKAGE_LIBASPLIB
+	select BR2_PACKAGE_LIBPLATFORM
+	select BR2_PACKAGE_KODI_PLATFORM
+	select BR2_PACKAGE_TINYXML
+	help
+	  Biquad filter addon for Kodi's AudioDSP-System
+
+	  https://github.com/kodi-adsp/adsp.biquad.filters
diff --git a/package/kodi-adsp-biquad-filters/kodi-adsp-biquad-filters.mk b/package/kodi-adsp-biquad-filters/kodi-adsp-biquad-filters.mk
new file mode 100644
index 0000000..e5543bb
--- /dev/null
+++ b/package/kodi-adsp-biquad-filters/kodi-adsp-biquad-filters.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# kodi-adsp-biquad-filters
+#
+################################################################################
+
+KODI_ADSP_BIQUAD_FILTERS_VERSION = 71087c48bb655b4539fdb2f367f7f7d820bdb1d6
+KODI_ADSP_BIQUAD_FILTERS_SITE = $(call github,kodi-adsp,adsp.biquad.filters,$(KODI_ADSP_BIQUAD_FILTERS_VERSION))
+KODI_ADSP_BIQUAD_FILTERS_LICENSE = GPLv2+
+KODI_ADSP_BIQUAD_FILTERS_LICENSE_FILES = LICENSE.md
+KODI_ADSP_BIQUAD_FILTERS_DEPENDENCIES = libasplib libplatform \
+	kodi-platform tinyxml
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 09513a2..55b2afa 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -238,6 +238,7 @@ endmenu
 
 menu "Audio DSP addons"
 	source "package/kodi-adsp-basic/Config.in"
+	source "package/kodi-adsp-biquad-filters/Config.in"
 	source "package/kodi-adsp-freesurround/Config.in"
 endmenu
 
-- 
2.7.0
