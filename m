From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 12 Mar 2012 12:17:08 +0100
Subject: [Buildroot] [git commit] pixman: bump version and compilation fix
Message-ID: <20120312112158.0B2DB90D6E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8b51e3cfc8f386d1f59fa8f9447ce90428d2a267
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- bump to 2.5 and change download location
- disable iwmmxt support for CPU's that don't have
  this feature

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/pixman/pixman.mk |   11 ++++++++---
 1 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/pixman/pixman.mk b/package/pixman/pixman.mk
index a2e1832..3e056d4 100644
--- a/package/pixman/pixman.mk
+++ b/package/pixman/pixman.mk
@@ -3,13 +3,18 @@
 # pixman
 #
 ################################################################################
-PIXMAN_VERSION = 0.24.2
-PIXMAN_SOURCE = pixman-$(PIXMAN_VERSION).tar.gz
-PIXMAN_SITE = http://cairographics.org/releases/
+PIXMAN_VERSION = 0.25.2
+PIXMAN_SITE = http://xorg.freedesktop.org/releases/individual/lib
 PIXMAN_INSTALL_STAGING = YES
 PIXMAN_DEPENDENCIES = host-pkg-config
 # don't build gtk based demos
 PIXMAN_CONF_OPT = --disable-gtk
 
+# disable iwmmxt support for CPU's that don't have
+# this feature
+ifneq ($(BR2_iwmmxt),y)
+PIXMAN_CONF_OPT += --disable-arm-iwmmxt
+endif
+
 $(eval $(call AUTOTARGETS))
 $(eval $(call AUTOTARGETS,host))
