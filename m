From: Julien Floret <julien.floret@6wind.com>
Date: Wed, 29 Jun 2016 15:46:11 +0200
Subject: [Buildroot] [PATCH 04/24] directfb: drop unused host variant
In-Reply-To: <1467207991-4905-1-git-send-email-julien.floret@6wind.com>
References: <1467207991-4905-1-git-send-email-julien.floret@6wind.com>
Message-ID: <1467207991-4905-5-git-send-email-julien.floret@6wind.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Julien Floret <julien.floret@6wind.com>
---
 package/directfb/directfb.mk | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/package/directfb/directfb.mk b/package/directfb/directfb.mk
index d51094f850cb..773c9e2416b5 100644
--- a/package/directfb/directfb.mk
+++ b/package/directfb/directfb.mk
@@ -153,21 +153,4 @@ ifeq ($(BR2_PACKAGE_DIRECTFB_TESTS),y)
 DIRECTFB_CONF_OPTS += --with-tests
 endif
 
-HOST_DIRECTFB_DEPENDENCIES = host-pkgconf host-libpng
-HOST_DIRECTFB_CONF_OPTS = \
-	--disable-multi \
-	--enable-png \
-	--with-gfxdrivers=none \
-	--with-inputdrivers=none
-
-HOST_DIRECTFB_BUILD_CMDS = \
-	$(MAKE) -C $(@D)/tools directfb-csource
-
-HOST_DIRECTFB_INSTALL_CMDS = \
-	$(INSTALL) -m 0755 $(@D)/tools/directfb-csource $(HOST_DIR)/usr/bin
-
 $(eval $(autotools-package))
-$(eval $(host-autotools-package))
-
-# directfb-csource for the host
-DIRECTFB_HOST_BINARY = $(HOST_DIR)/usr/bin/directfb-csource
-- 
2.1.0
