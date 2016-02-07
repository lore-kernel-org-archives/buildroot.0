From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  7 Feb 2016 17:03:03 +0100
Subject: [Buildroot] [PATCH 19/28] package/kodi-screensaver-planestate: new
	package
In-Reply-To: <1454860992-25114-1-git-send-email-bernd.kuhls@t-online.de>
References: <1454860992-25114-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1454860992-25114-20-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-screensaver-planestate/Config.in                 | 11 +++++++++++
 .../kodi-screensaver-planestate.mk                            | 11 +++++++++++
 package/kodi/Config.in                                        |  1 +
 3 files changed, 23 insertions(+)
 create mode 100644 package/kodi-screensaver-planestate/Config.in
 create mode 100644 package/kodi-screensaver-planestate/kodi-screensaver-planestate.mk

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
index ce5aa1e..f201008 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -271,6 +271,7 @@ menu "Screensavers"
 	source "package/kodi-screensaver-greynetic/Config.in"
 	source "package/kodi-screensaver-matrixtrails/Config.in"
 	source "package/kodi-screensaver-pingpong/Config.in"
+	source "package/kodi-screensaver-planestate/Config.in"
 	source "package/kodi-screensaver-pyro/Config.in"
 	source "package/kodi-screensaver-rsxs/Config.in"
 	source "package/kodi-screensaver-stars/Config.in"
-- 
2.7.0
