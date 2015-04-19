From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Apr 2015 23:10:31 +0200
Subject: [Buildroot] [git commit] package/libebml: bump version to 1.3.1
Message-ID: <20150419212236.16C487FBF7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5da6f1a08e54c9d8bf9a3b048aca3a4d6e64c065
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Package now uses GNU autoconf infrastructure.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libebml/libebml.mk |   27 ++-------------------------
 1 files changed, 2 insertions(+), 25 deletions(-)

diff --git a/package/libebml/libebml.mk b/package/libebml/libebml.mk
index 67dcfc6..4613c6e 100644
--- a/package/libebml/libebml.mk
+++ b/package/libebml/libebml.mk
@@ -4,34 +4,11 @@
 #
 ################################################################################
 
-LIBEBML_VERSION = 1.2.2
+LIBEBML_VERSION = 1.3.1
 LIBEBML_SOURCE = libebml-$(LIBEBML_VERSION).tar.bz2
 LIBEBML_SITE = http://dl.matroska.org/downloads/libebml
 LIBEBML_INSTALL_STAGING = YES
 LIBEBML_LICENSE = LGPLv2.1+
 LIBEBML_LICENSE_FILES = LICENSE.LGPL
 
-ifeq ($(BR2_STATIC_LIBS),y)
-LIBEBML_MAKE_TARGETS = staticlib
-LIBEBML_MAKE_INSTALL_TARGETS = install_staticlib install_headers
-else
-LIBEBML_MAKE_TARGETS = staticlib sharedlib
-LIBEBML_MAKE_INSTALL_TARGETS = install_staticlib install_sharedlib install_headers
-endif
-
-define LIBEBML_BUILD_CMDS
-	$(MAKE) -C $(@D)/make/linux CROSS="$(CCACHE) $(TARGET_CROSS)" \
-		$(LIBEBML_MAKE_TARGETS)
-endef
-
-define LIBEBML_INSTALL_STAGING_CMDS
-	$(MAKE) -C $(@D)/make/linux prefix=$(STAGING_DIR)/usr \
-		$(LIBEBML_MAKE_INSTALL_TARGETS)
-endef
-
-define LIBEBML_INSTALL_TARGET_CMDS
-	$(MAKE) -C $(@D)/make/linux prefix=$(TARGET_DIR)/usr \
-		$(LIBEBML_MAKE_INSTALL_TARGETS)
-endef
-
-$(eval $(generic-package))
+$(eval $(autotools-package))
