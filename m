From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Jul 2015 10:23:21 +0200
Subject: [Buildroot] [git commit branch/next]
	package/kodi-visualisation-waveform: new package
Message-ID: <20150808105651.C9B4F81830@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=74f64cc3bcbe9ed3973fbf007f975a366b4bc23f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

[Thomas:
   - do not pass -DCMAKE_MODULE_PATH, no longer needed.]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kodi-visualisation-waveform/Config.in      |    6 ++++++
 .../kodi-visualisation-waveform.mk                 |   13 +++++++++++++
 package/kodi/Config.in                             |    1 +
 3 files changed, 20 insertions(+), 0 deletions(-)

diff --git a/package/kodi-visualisation-waveform/Config.in b/package/kodi-visualisation-waveform/Config.in
new file mode 100644
index 0000000..56f2509
--- /dev/null
+++ b/package/kodi-visualisation-waveform/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_KODI_VISUALISATION_WAVEFORM
+	bool "kodi-visualisation-waveform"
+	help
+	  Waveform visualiser for Kodi
+
+	  https://github.com/notspiff/visualization.waveform
diff --git a/package/kodi-visualisation-waveform/kodi-visualisation-waveform.mk b/package/kodi-visualisation-waveform/kodi-visualisation-waveform.mk
new file mode 100644
index 0000000..eec0cfc
--- /dev/null
+++ b/package/kodi-visualisation-waveform/kodi-visualisation-waveform.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# kodi-visualisation-waveform
+#
+################################################################################
+
+KODI_VISUALISATION_WAVEFORM_VERSION = abbdbffc5fd2dff1d627de8df3cb5a3887d1119c
+KODI_VISUALISATION_WAVEFORM_SITE = $(call github,notspiff,visualization.waveform,$(KODI_VISUALISATION_WAVEFORM_VERSION))
+KODI_VISUALISATION_WAVEFORM_LICENSE = GPLv2+
+KODI_VISUALISATION_WAVEFORM_LICENSE_FILES = COPYING
+KODI_VISUALISATION_WAVEFORM_DEPENDENCIES = kodi
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index fd0a53b..edc471b 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -298,6 +298,7 @@ endmenu
 
 menu "Visualisations"
 	source "package/kodi-visualisation-shadertoy/Config.in"
+	source "package/kodi-visualisation-waveform/Config.in"
 endmenu
 
 endif # BR2_PACKAGE_KODI
