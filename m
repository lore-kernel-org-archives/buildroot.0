From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Jul 2015 10:23:21 +0200
Subject: [Buildroot] [git commit] package/kodi-visualisation-spectrum: new
	package
Message-ID: <20150730132259.8CE027FFC3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9877d90092dbadf4d868e3cd01e5346b9a75bc67
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas:
   - do not pass -DCMAKE_MODULE_PATH, no longer needed.]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kodi-visualisation-spectrum/Config.in      |    6 ++++++
 .../kodi-visualisation-spectrum.mk                 |   13 +++++++++++++
 package/kodi/Config.in                             |    1 +
 3 files changed, 20 insertions(+), 0 deletions(-)

diff --git a/package/kodi-visualisation-spectrum/Config.in b/package/kodi-visualisation-spectrum/Config.in
new file mode 100644
index 0000000..3b2b0a2
--- /dev/null
+++ b/package/kodi-visualisation-spectrum/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_KODI_VISUALISATION_SPECTRUM
+	bool "kodi-visualisation-spectrum"
+	help
+	  Spectrum visualiser for Kodi
+
+	  https://github.com/notspiff/visualization.spectrum
diff --git a/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.mk b/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.mk
new file mode 100644
index 0000000..79f03c8
--- /dev/null
+++ b/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# kodi-visualisation-spectrum
+#
+################################################################################
+
+KODI_VISUALISATION_SPECTRUM_VERSION = aae1960b5bc14e50914205e2dabcb51077690a64
+KODI_VISUALISATION_SPECTRUM_SITE = $(call github,notspiff,visualization.spectrum,$(KODI_VISUALISATION_SPECTRUM_VERSION))
+KODI_VISUALISATION_SPECTRUM_LICENSE = GPLv2+
+KODI_VISUALISATION_SPECTRUM_LICENSE_FILES = COPYING
+KODI_VISUALISATION_SPECTRUM_DEPENDENCIES = kodi
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index edc471b..73ec88e 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -298,6 +298,7 @@ endmenu
 
 menu "Visualisations"
 	source "package/kodi-visualisation-shadertoy/Config.in"
+	source "package/kodi-visualisation-spectrum/Config.in"
 	source "package/kodi-visualisation-waveform/Config.in"
 endmenu
 
