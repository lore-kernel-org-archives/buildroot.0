From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 8 Apr 2010 07:40:01 +0200
Subject: [Buildroot] [git commit master] matchbox-desktop: fix compilation
	and installation
Message-ID: <20100408054106.78F6E8DEAE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=c03c626ecb5ad285dbfc126fec46d2b94bf23a16
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Libtool patch applies just fine.
mbdesktop_modules is installed by the matchbox-desktop and we
don't have to overwrite it with our copy(contains wrong paths).

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../matchbox/matchbox-desktop/matchbox-desktop.mk  |    7 -------
 .../matchbox/matchbox-desktop/mbdesktop_modules    |    9 ---------
 2 files changed, 0 insertions(+), 16 deletions(-)
 delete mode 100644 package/matchbox/matchbox-desktop/mbdesktop_modules

diff --git a/package/matchbox/matchbox-desktop/matchbox-desktop.mk b/package/matchbox/matchbox-desktop/matchbox-desktop.mk
index a3312af..d5f61c1 100644
--- a/package/matchbox/matchbox-desktop/matchbox-desktop.mk
+++ b/package/matchbox/matchbox-desktop/matchbox-desktop.mk
@@ -7,16 +7,9 @@
 MATCHBOX_DESKTOP_VERSION = 0.9.1
 MATCHBOX_DESKTOP_SOURCE = matchbox-desktop-$(MATCHBOX_DESKTOP_VERSION).tar.bz2
 MATCHBOX_DESKTOP_SITE = http://matchbox-project.org/sources/matchbox-desktop/$(MATCHBOX_DESKTOP_VERSION)
-MATCHBOX_DESKTOP_LIBTOOL_PATCH = NO
 MATCHBOX_DESKTOP_DEPENDENCIES = matchbox-lib
 MATCHBOX_DESKTOP_CONF_OPT = --enable-expat
 
-define MATCHBOX_DESKTOP_POST_INSTALL_FIXES
- cp -f ./package/matchbox/matchbox-desktop/mbdesktop_modules $(TARGET_DIR)/etc/matchbox/
-endef
-
-MATCHBOX_DESKTOP_POST_INSTALL_TARGET_HOOKS += MATCHBOX_DESKTOP_POST_INSTALL_FIXES
-
 #############################################################
 
 ifeq ($(BR2_PACKAGE_STARTUP_NOTIFICATION),y)
diff --git a/package/matchbox/matchbox-desktop/mbdesktop_modules b/package/matchbox/matchbox-desktop/mbdesktop_modules
deleted file mode 100644
index 8206dad..0000000
--- a/package/matchbox/matchbox-desktop/mbdesktop_modules
+++ /dev/null
@@ -1,9 +0,0 @@
-# This file lists the 'plug-ins' with any arguments to be loaded by
-# matchbox-desktop. 
-#
-# It can be overridden on a per-user basis by copying this file to ~/.matchbox/
-# and editing. 
-
-/usr/lib/tasks.so
-/usr/lib/dotdesktop.so
-# /usr/lib/simplefilebrowser.so /
-- 
1.6.3.3
