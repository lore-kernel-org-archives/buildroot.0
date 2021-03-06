From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 6 Mar 2021 22:56:51 +0100
Subject: [Buildroot] [git commit] package/kodi-visualisation-waveform: bump
 version to 4.4.0-Matrix
Message-ID: <20210308072139.A857488918@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e4ac6f11f21abc722412c034f3ad2806294807b3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add dependency to glm due to upstream commit:
https://github.com/xbmc/visualization.waveform/commit/18e32dd2416fc58e91c977d3c3a4c27b6ca59c3b

Switch license file to LICENSE.md.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/kodi-visualisation-waveform/Config.in                       | 1 +
 .../kodi-visualisation-waveform/kodi-visualisation-waveform.hash    | 4 ++--
 package/kodi-visualisation-waveform/kodi-visualisation-waveform.mk  | 6 +++---
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/kodi-visualisation-waveform/Config.in b/package/kodi-visualisation-waveform/Config.in
index 56f25096f5..24a5f7f365 100644
--- a/package/kodi-visualisation-waveform/Config.in
+++ b/package/kodi-visualisation-waveform/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_KODI_VISUALISATION_WAVEFORM
 	bool "kodi-visualisation-waveform"
+	select BR2_PACKAGE_GLM
 	help
 	  Waveform visualiser for Kodi
 
diff --git a/package/kodi-visualisation-waveform/kodi-visualisation-waveform.hash b/package/kodi-visualisation-waveform/kodi-visualisation-waveform.hash
index 578b2ea8a4..1255b6ed75 100644
--- a/package/kodi-visualisation-waveform/kodi-visualisation-waveform.hash
+++ b/package/kodi-visualisation-waveform/kodi-visualisation-waveform.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  d734cbe9d7e661e8d4e61ff2bada423fd8dba33c5148b5044f4b1a1997c51376  kodi-visualisation-waveform-3.1.2-Leia.tar.gz
-sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
+sha256  d9acf0a3758bfc4ee6fa492bcdcf8764519bbf0f1b6a3b10807b65a0d031e55e  kodi-visualisation-waveform-4.4.0-Matrix.tar.gz
+sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-visualisation-waveform/kodi-visualisation-waveform.mk b/package/kodi-visualisation-waveform/kodi-visualisation-waveform.mk
index 64a4db4fce..6c0ec3ac70 100644
--- a/package/kodi-visualisation-waveform/kodi-visualisation-waveform.mk
+++ b/package/kodi-visualisation-waveform/kodi-visualisation-waveform.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-KODI_VISUALISATION_WAVEFORM_VERSION = 3.1.2-Leia
+KODI_VISUALISATION_WAVEFORM_VERSION = 4.4.0-Matrix
 KODI_VISUALISATION_WAVEFORM_SITE = $(call github,xbmc,visualization.waveform,$(KODI_VISUALISATION_WAVEFORM_VERSION))
 KODI_VISUALISATION_WAVEFORM_LICENSE = GPL-2.0+
-KODI_VISUALISATION_WAVEFORM_LICENSE_FILES = COPYING
-KODI_VISUALISATION_WAVEFORM_DEPENDENCIES = kodi
+KODI_VISUALISATION_WAVEFORM_LICENSE_FILES = LICENSE.md
+KODI_VISUALISATION_WAVEFORM_DEPENDENCIES = glm kodi
 
 $(eval $(cmake-package))
