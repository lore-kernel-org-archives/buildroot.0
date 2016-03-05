From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Mar 2016 15:46:23 +0100
Subject: [Buildroot] [git commit] package/kodi-screensaver-cpblobs: new
	package
Message-ID: <20160305144959.1E89380E3D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0856e3ccc9896c18ea2457922f7951c6adaa76c5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[Thomas: fix license, it's GPLv2, not GPLv2+.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kodi-screensaver-cpblobs/Config.in                  | 11 +++++++++++
 .../kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.hash  |  2 ++
 .../kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.mk    | 13 +++++++++++++
 package/kodi/Config.in                                      |  1 +
 4 files changed, 27 insertions(+)

diff --git a/package/kodi-screensaver-cpblobs/Config.in b/package/kodi-screensaver-cpblobs/Config.in
new file mode 100644
index 0000000..184509e
--- /dev/null
+++ b/package/kodi-screensaver-cpblobs/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_KODI_SCREENSAVER_CPBLOBS
+	bool "kodi-screensaver-cpblobs"
+	depends on BR2_PACKAGE_KODI_GL # libsoil
+	select BR2_PACKAGE_LIBSOIL
+	help
+	  CpBlobs screensaver for Kodi
+
+	  https://github.com/notspiff/screensaver.cpblobs
+
+comment "cpblobs needs an OpenGL backend"
+	depends on !BR2_PACKAGE_KODI_GL
diff --git a/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.hash b/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.hash
new file mode 100644
index 0000000..ebf19d9
--- /dev/null
+++ b/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 c2d19c33aff73b99cbf51f943b62e58b2b6233dcf1d789ae8f73e92fa96f07bc kodi-screensaver-cpblobs-87a3abfbe6e4fd1089548eab77a84902d0e1af60.tar.gz
diff --git a/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.mk b/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.mk
new file mode 100644
index 0000000..bf67ea0
--- /dev/null
+++ b/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# kodi-screensaver-cpblobs
+#
+################################################################################
+
+KODI_SCREENSAVER_CPBLOBS_VERSION = 87a3abfbe6e4fd1089548eab77a84902d0e1af60
+KODI_SCREENSAVER_CPBLOBS_SITE = $(call github,notspiff,screensaver.cpblobs,$(KODI_SCREENSAVER_CPBLOBS_VERSION))
+KODI_SCREENSAVER_CPBLOBS_LICENSE = GPLv2
+KODI_SCREENSAVER_CPBLOBS_LICENSE_FILES = LICENSE
+KODI_SCREENSAVER_CPBLOBS_DEPENDENCIES = kodi libsoil
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index f305997..f2fee59 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -268,6 +268,7 @@ menu "Screensavers"
 	source "package/kodi-screensaver-asteroids/Config.in"
 	source "package/kodi-screensaver-asterwave/Config.in"
 	source "package/kodi-screensaver-biogenesis/Config.in"
+	source "package/kodi-screensaver-cpblobs/Config.in"
 	source "package/kodi-screensaver-crystalmorph/Config.in"
 	source "package/kodi-screensaver-greynetic/Config.in"
 	source "package/kodi-screensaver-pingpong/Config.in"
