From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 21 Feb 2013 10:55:57 +0100
Subject: [Buildroot] [git commit] matchbox-desktop: needs zlib
Message-ID: <20130221100114.D76AE9AC0E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=30876b26a7683384f7aeb3b6254e387c6bea6cac
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Otherwise the build fails with:

In file included from mbdesktop_win_plugin.c:1:0:
mbdesktop.h:31:18: fatal error: zlib.h: No such file or directory

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/matchbox/Config.in                         |    1 +
 .../matchbox/matchbox-desktop/matchbox-desktop.mk  |    2 +-
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/matchbox/Config.in b/package/matchbox/Config.in
index e4b6149..d89a176 100644
--- a/package/matchbox/Config.in
+++ b/package/matchbox/Config.in
@@ -19,6 +19,7 @@ config BR2_PACKAGE_MATCHBOX_PANEL
 config BR2_PACKAGE_MATCHBOX_DESKTOP
 	bool "Matchbox Desktop"
 	depends on BR2_PACKAGE_MATCHBOX
+	select BR2_PACKAGE_ZLIB
 	help
 	  A PDA style application launcher or 'item browser'.
 
diff --git a/package/matchbox/matchbox-desktop/matchbox-desktop.mk b/package/matchbox/matchbox-desktop/matchbox-desktop.mk
index f8e854c..13ea730 100644
--- a/package/matchbox/matchbox-desktop/matchbox-desktop.mk
+++ b/package/matchbox/matchbox-desktop/matchbox-desktop.mk
@@ -10,7 +10,7 @@ MATCHBOX_DESKTOP_SOURCE = matchbox-desktop-$(MATCHBOX_DESKTOP_VERSION).tar.bz2
 MATCHBOX_DESKTOP_SITE = http://downloads.yoctoproject.org/releases/matchbox/matchbox-desktop/$(MATCHBOX_DESKTOP_VERSION_MAJOR)
 MATCHBOX_DESKTOP_LICENSE = GPLv2+
 MATCHBOX_DESKTOP_LICENSE_FILES = COPYING
-MATCHBOX_DESKTOP_DEPENDENCIES = matchbox-lib
+MATCHBOX_DESKTOP_DEPENDENCIES = matchbox-lib zlib
 MATCHBOX_DESKTOP_CONF_OPT = --enable-expat
 
 # The bundled configure script does not properly replace LIBADD_DL, so
