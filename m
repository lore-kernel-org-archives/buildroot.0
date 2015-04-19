From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Apr 2015 23:10:31 +0200
Subject: [Buildroot] [git commit] package/libmatroska: bump version to 1.4.2
Message-ID: <20150419212236.1D7DD7FBF7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a894d51038a611f2f923d37f37c69e780fe1c48b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Package now uses GNU autoconf infrastructure.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libmatroska/libmatroska.mk |   27 ++-------------------------
 1 files changed, 2 insertions(+), 25 deletions(-)

diff --git a/package/libmatroska/libmatroska.mk b/package/libmatroska/libmatroska.mk
index 778e74c..1086e87 100644
--- a/package/libmatroska/libmatroska.mk
+++ b/package/libmatroska/libmatroska.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMATROSKA_VERSION = 1.3.0
+LIBMATROSKA_VERSION = 1.4.2
 LIBMATROSKA_SOURCE = libmatroska-$(LIBMATROSKA_VERSION).tar.bz2
 LIBMATROSKA_SITE = http://dl.matroska.org/downloads/libmatroska
 LIBMATROSKA_INSTALL_STAGING = YES
@@ -12,27 +12,4 @@ LIBMATROSKA_LICENSE = LGPLv2.1+
 LIBMATROSKA_LICENSE_FILES = LICENSE.LGPL
 LIBMATROSKA_DEPENDENCIES = libebml
 
-ifeq ($(BR2_STATIC_LIBS),y)
-LIBMATROSKA_MAKE_TARGETS = staticlib
-LIBMATROSKA_MAKE_INSTALL_TARGETS = install_staticlib install_headers
-else
-LIBMATROSKA_MAKE_TARGETS = staticlib sharedlib
-LIBMATROSKA_MAKE_INSTALL_TARGETS = install_staticlib install_sharedlib install_headers
-endif
-
-define LIBMATROSKA_BUILD_CMDS
-	$(MAKE) -C $(@D)/make/linux CROSS="$(CCACHE) $(TARGET_CROSS)" \
-		$(LIBMATROSKA_MAKE_TARGETS)
-endef
-
-define LIBMATROSKA_INSTALL_STAGING_CMDS
-	$(MAKE) -C $(@D)/make/linux prefix=$(STAGING_DIR)/usr \
-		$(LIBMATROSKA_MAKE_INSTALL_TARGETS)
-endef
-
-define LIBMATROSKA_INSTALL_TARGET_CMDS
-	$(MAKE) -C $(@D)/make/linux prefix=$(TARGET_DIR)/usr \
-		$(LIBMATROSKA_MAKE_INSTALL_TARGETS)
-endef
-
-$(eval $(generic-package))
+$(eval $(autotools-package))
