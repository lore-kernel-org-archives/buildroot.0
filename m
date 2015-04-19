From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Apr 2015 20:09:33 +0200
Subject: [Buildroot] [PATCH 2/3] package/libmatroska: bump version to 1.4.2
In-Reply-To: <1429466974-12546-1-git-send-email-bernd.kuhls@t-online.de>
References: <1429466974-12546-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1429466974-12546-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Package now uses GNU autoconf infrastructure.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libmatroska/libmatroska.mk |   27 ++-------------------------
 1 file changed, 2 insertions(+), 25 deletions(-)

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
-- 
1.7.10.4
