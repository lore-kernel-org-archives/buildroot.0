From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Mar 2016 15:46:31 +0100
Subject: [Buildroot] [git commit] package/kodi-screensaver-planestate: new
	package
Message-ID: <20160305144959.2B19D7FF2A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e885188759f76e95edb82f0ae1ecaddfad0c2bde
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kodi-screensaver-planestate/Config.in                 | 11 +++++++++++
 .../kodi-screensaver-planestate.hash                          |  2 ++
 .../kodi-screensaver-planestate.mk                            | 11 +++++++++++
 package/kodi/Config.in                                        |  1 +
 4 files changed, 25 insertions(+)

diff --git a/package/kodi-screensaver-planestate/Config.in b/package/kodi-screensaver-planestate/Config.in
new file mode 100644
index 0000000..1032292
--- /dev/null
+++ b/package/kodi-screensaver-planestate/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_KODI_SCREENSAVER_PLANESTATE
+	bool "kodi-screensaver-planestate"
+	depends on BR2_PACKAGE_KODI_GL # libsoil
+	select BR2_PACKAGE_LIBSOIL
+	help
+	  PlaneState screensaver for Kodi
+
+	  https://github.com/notspiff/screensaver.planestate
+
+comment "planestate needs an OpenGL backend"
+	depends on !BR2_PACKAGE_KODI_GL
diff --git a/package/kodi-screensaver-planestate/kodi-screensaver-planestate.hash b/package/kodi-screensaver-planestate/kodi-screensaver-planestate.hash
new file mode 100644
index 0000000..9aea929
--- /dev/null
+++ b/package/kodi-screensaver-planestate/kodi-screensaver-planestate.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 13ce2881f8eaf9936691cf66b9f3471a718ae87249d62ade55174201873fb496 kodi-screensaver-planestate-95b6d1ec72f37bcd16cf8e5d49806193dba883f0.tar.gz
diff --git a/package/kodi-screensaver-planestate/kodi-screensaver-planestate.mk b/package/kodi-screensaver-planestate/kodi-screensaver-planestate.mk
new file mode 100644
index 0000000..38885c5
--- /dev/null
+++ b/package/kodi-screensaver-planestate/kodi-screensaver-planestate.mk
@@ -0,0 +1,11 @@
+################################################################################
+#
+# kodi-screensaver-planestate
+#
+################################################################################
+
+KODI_SCREENSAVER_PLANESTATE_VERSION = 95b6d1ec72f37bcd16cf8e5d49806193dba883f0
+KODI_SCREENSAVER_PLANESTATE_SITE = $(call github,notspiff,screensaver.planestate,$(KODI_SCREENSAVER_PLANESTATE_VERSION))
+KODI_SCREENSAVER_PLANESTATE_DEPENDENCIES = kodi libsoil
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index f2fee59..37f962d 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -272,6 +272,7 @@ menu "Screensavers"
 	source "package/kodi-screensaver-crystalmorph/Config.in"
 	source "package/kodi-screensaver-greynetic/Config.in"
 	source "package/kodi-screensaver-pingpong/Config.in"
+	source "package/kodi-screensaver-planestate/Config.in"
 	source "package/kodi-screensaver-pyro/Config.in"
 	source "package/kodi-screensaver-rsxs/Config.in"
 	source "package/kodi-screensaver-stars/Config.in"
