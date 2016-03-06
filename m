From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 6 Mar 2016 14:37:10 +0100
Subject: [Buildroot] [git commit] package/kodi-screensaver-matrixtrails: new
	package
Message-ID: <20160306135853.0154E80E31@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7dddf3996bf6fd57a85ffcb502f5b709ca3213ed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kodi-screensaver-matrixtrails/Config.in            | 11 +++++++++++
 .../kodi-screensaver-matrixtrails.mk                       | 14 ++++++++++++++
 package/kodi/Config.in                                     |  1 +
 3 files changed, 26 insertions(+)

diff --git a/package/kodi-screensaver-matrixtrails/Config.in b/package/kodi-screensaver-matrixtrails/Config.in
new file mode 100644
index 0000000..72ed958
--- /dev/null
+++ b/package/kodi-screensaver-matrixtrails/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_KODI_SCREENSAVER_MATRIXTRAILS
+	bool "kodi-screensaver-matrixtrails"
+	depends on BR2_PACKAGE_KODI_GL # libsoil
+	select BR2_PACKAGE_LIBSOIL
+	help
+	  Matrix trails screensaver for Kodi
+
+	  https://github.com/notspiff/screensaver.matrixtrails
+
+comment "matrixtrails needs an OpenGL backend"
+	depends on !BR2_PACKAGE_KODI_GL
diff --git a/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.mk b/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.mk
new file mode 100644
index 0000000..5ecacdf
--- /dev/null
+++ b/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# kodi-screensaver-matrixtrails
+#
+################################################################################
+
+KODI_SCREENSAVER_MATRIXTRAILS_VERSION = 16057e7195f930109f0a4aea999296ca315700e5
+KODI_SCREENSAVER_MATRIXTRAILS_SITE = $(call github,notspiff,screensaver.matrixtrails,$(KODI_SCREENSAVER_MATRIXTRAILS_VERSION))
+KODI_SCREENSAVER_MATRIXTRAILS_LICENSE = GPLv2+
+KODI_SCREENSAVER_MATRIXTRAILS_LICENSE_FILES = src/matrixtrails.cpp
+
+KODI_SCREENSAVER_MATRIXTRAILS_DEPENDENCIES = kodi libsoil
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index bd40ac3..9590070 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -278,6 +278,7 @@ menu "Screensavers"
 	source "package/kodi-screensaver-cpblobs/Config.in"
 	source "package/kodi-screensaver-crystalmorph/Config.in"
 	source "package/kodi-screensaver-greynetic/Config.in"
+	source "package/kodi-screensaver-matrixtrails/Config.in"
 	source "package/kodi-screensaver-pingpong/Config.in"
 	source "package/kodi-screensaver-planestate/Config.in"
 	source "package/kodi-screensaver-pyro/Config.in"
