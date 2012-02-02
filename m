From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 2 Feb 2012 13:07:23 +0100
Subject: [Buildroot] [git commit] pixman: Bump version to 0.24.2
Message-ID: <20120202121044.58B4D90974@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a2a9f6358d3c1442028a7fd5366651b8826d4547
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: depend on pkg-config, forcibly disable gtk-based demos]
Signed-off-by: Will Newton <will.newton@imgtec.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/pixman/pixman-0.10.0-no-tests.patch |   11 -----------
 package/pixman/pixman.mk                    |    6 ++++--
 2 files changed, 4 insertions(+), 13 deletions(-)

diff --git a/package/pixman/pixman-0.10.0-no-tests.patch b/package/pixman/pixman-0.10.0-no-tests.patch
deleted file mode 100644
index fbd0d26..0000000
--- a/package/pixman/pixman-0.10.0-no-tests.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- a/Makefile.in.orig	2008-05-23 14:04:37.000000000 +0000
-+++ b/Makefile.in	2008-05-23 14:04:50.000000000 +0000
-@@ -198,7 +198,7 @@ sysconfdir = @sysconfdir@
- target_alias = @target_alias@
- top_builddir = @top_builddir@
- top_srcdir = @top_srcdir@
--SUBDIRS = pixman test
-+SUBDIRS = pixman
- pkgconfigdir = $(libdir)/pkgconfig
- pkgconfig_DATA = pixman-1.pc
- USERNAME = $$USER
diff --git a/package/pixman/pixman.mk b/package/pixman/pixman.mk
index 2b39a77..a2e1832 100644
--- a/package/pixman/pixman.mk
+++ b/package/pixman/pixman.mk
@@ -3,11 +3,13 @@
 # pixman
 #
 ################################################################################
-PIXMAN_VERSION = 0.17.6
+PIXMAN_VERSION = 0.24.2
 PIXMAN_SOURCE = pixman-$(PIXMAN_VERSION).tar.gz
 PIXMAN_SITE = http://cairographics.org/releases/
-PIXMAN_AUTORECONF = NO
 PIXMAN_INSTALL_STAGING = YES
+PIXMAN_DEPENDENCIES = host-pkg-config
+# don't build gtk based demos
+PIXMAN_CONF_OPT = --disable-gtk
 
 $(eval $(call AUTOTARGETS))
 $(eval $(call AUTOTARGETS,host))
