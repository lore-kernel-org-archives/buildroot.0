From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 20 Feb 2016 23:09:36 +0100
Subject: [Buildroot] [PATCH/next 31/31] package/kodi-visualisation-vsxu: new
	package
In-Reply-To: <1456006176-21308-1-git-send-email-bernd.kuhls@t-online.de>
References: <1456006176-21308-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1456006176-21308-32-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-visualisation-vsxu/Config.in                   |  8 ++++++++
 .../kodi-visualisation-vsxu/kodi-visualisation-vsxu.hash    |  2 ++
 package/kodi-visualisation-vsxu/kodi-visualisation-vsxu.mk  | 13 +++++++++++++
 package/kodi/Config.in                                      |  1 +
 4 files changed, 24 insertions(+)
 create mode 100644 package/kodi-visualisation-vsxu/Config.in
 create mode 100644 package/kodi-visualisation-vsxu/kodi-visualisation-vsxu.hash
 create mode 100644 package/kodi-visualisation-vsxu/kodi-visualisation-vsxu.mk

diff --git a/package/kodi-visualisation-vsxu/Config.in b/package/kodi-visualisation-vsxu/Config.in
new file mode 100644
index 0000000..2c2df17
--- /dev/null
+++ b/package/kodi-visualisation-vsxu/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_KODI_VISUALISATION_VSXU
+	bool "kodi-visualisation-vsxu"
+	select BR2_PACKAGE_VSXU
+	depends on BR2_i386 || BR2_x86_64 # vsxu
+	help
+	  VSXu visualisation for Kodi
+
+	  https://github.com/notspiff/visualization.vsxu
diff --git a/package/kodi-visualisation-vsxu/kodi-visualisation-vsxu.hash b/package/kodi-visualisation-vsxu/kodi-visualisation-vsxu.hash
new file mode 100644
index 0000000..fd916e3
--- /dev/null
+++ b/package/kodi-visualisation-vsxu/kodi-visualisation-vsxu.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 c8d48cb52c348bf2ff2d027f0c86a5122c72b8263886cc25b35872431fe5e319 kodi-visualisation-vsxu-990332f0719503c4575021f5f64daa0fbc35ac4e.tar.gz
diff --git a/package/kodi-visualisation-vsxu/kodi-visualisation-vsxu.mk b/package/kodi-visualisation-vsxu/kodi-visualisation-vsxu.mk
new file mode 100644
index 0000000..7ba39c7
--- /dev/null
+++ b/package/kodi-visualisation-vsxu/kodi-visualisation-vsxu.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# kodi-visualisation-vsxu
+#
+################################################################################
+
+KODI_VISUALISATION_VSXU_VERSION = 990332f0719503c4575021f5f64daa0fbc35ac4e
+KODI_VISUALISATION_VSXU_SITE = $(call github,notspiff,visualization.vsxu,$(KODI_VISUALISATION_VSXU_VERSION))
+KODI_VISUALISATION_VSXU_LICENSE = GPLv2+
+KODI_VISUALISATION_VSXU_LICENSE_FILES = debian/copyright
+KODI_VISUALISATION_VSXU_DEPENDENCIES = kodi vsxu
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index d9a24f5..d4721c2 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -291,6 +291,7 @@ menu "Visualisations"
 	source "package/kodi-visualisation-goom/Config.in"
 	source "package/kodi-visualisation-shadertoy/Config.in"
 	source "package/kodi-visualisation-spectrum/Config.in"
+	source "package/kodi-visualisation-vsxu/Config.in"
 	source "package/kodi-visualisation-waveforhue/Config.in"
 	source "package/kodi-visualisation-waveform/Config.in"
 endmenu
-- 
2.7.0
