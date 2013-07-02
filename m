From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 2 Jul 2013 23:44:37 +0200
Subject: [Buildroot] [git commit] libtpl: bump version
Message-ID: <20130702215129.D7A099A093@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=751c2d20d786f5ed05a27bdfddf00473efba1fac
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Note that libtpl has moved from sourceforge to github, and there is no longer
a version-specific tarball available.

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libtpl/Config.in |    2 +-
 package/libtpl/libtpl.mk |   13 ++++++++++---
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/package/libtpl/Config.in b/package/libtpl/Config.in
index a2c2c2d..0286e03 100644
--- a/package/libtpl/Config.in
+++ b/package/libtpl/Config.in
@@ -3,4 +3,4 @@ config BR2_PACKAGE_LIBTPL
 	help
 	  Easily store and retrieve binary data in C
 
-	  http://tpl.sourceforge.net/
+	  http://troydhanson.github.io/tpl/
diff --git a/package/libtpl/libtpl.mk b/package/libtpl/libtpl.mk
index 0016c31..478b298 100644
--- a/package/libtpl/libtpl.mk
+++ b/package/libtpl/libtpl.mk
@@ -4,11 +4,18 @@
 #
 ################################################################################
 
-LIBTPL_VERSION = 1.5
-LIBTPL_SOURCE = libtpl-$(LIBTPL_VERSION).tar.bz2
-LIBTPL_SITE = http://downloads.sourceforge.net/project/tpl/tpl/libtpl-$(LIBTPL_VERSION)
+LIBTPL_VERSION = 445b4e9f236a48e274eaace31acf56d700da142a
+LIBTPL_SITE = http://github.com/troydhanson/tpl/tarball/$(LIBTPL_VERSION)
 LIBTPL_INSTALL_STAGING = YES
 LIBTPL_LICENSE = BSD-like
 LIBTPL_LICENSE_FILES = LICENSE
 
+LIBTPL_AUTORECONF = YES
+LIBTPL_AUTORECONF_OPT = --install --force
+
+define LIBTPL_CREATE_MISSING_FILES
+	touch $(@D)/NEWS $(@D)/AUTHORS $(@D)/ChangeLog $(@D)/COPYING
+endef
+LIBTPL_POST_EXTRACT_HOOKS += LIBTPL_CREATE_MISSING_FILES
+
 $(eval $(autotools-package))
