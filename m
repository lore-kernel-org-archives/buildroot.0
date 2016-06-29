From: Julien Floret <julien.floret@6wind.com>
Date: Wed, 29 Jun 2016 15:46:19 +0200
Subject: [Buildroot] [PATCH 12/24] lzip: drop unused host variant
In-Reply-To: <1467207991-4905-1-git-send-email-julien.floret@6wind.com>
References: <1467207991-4905-1-git-send-email-julien.floret@6wind.com>
Message-ID: <1467207991-4905-13-git-send-email-julien.floret@6wind.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Julien Floret <julien.floret@6wind.com>
---
 package/lzip/lzip.mk | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/package/lzip/lzip.mk b/package/lzip/lzip.mk
index 7b1fdf48afbb..41f8af88da07 100644
--- a/package/lzip/lzip.mk
+++ b/package/lzip/lzip.mk
@@ -14,27 +14,13 @@ define LZIP_CONFIGURE_CMDS
 		$(TARGET_CONFIGURE_OPTS) )
 endef
 
-define HOST_LZIP_CONFIGURE_CMDS
-	(cd $(@D); ./configure --prefix=/usr \
-		$(HOST_CONFIGURE_OPTS) )
-endef
-
 define LZIP_BUILD_CMDS
 	$(MAKE) -C $(@D)
 endef
 
-define HOST_LZIP_BUILD_CMDS
-	$(MAKE) -C $(@D)
-endef
-
 define LZIP_INSTALL_TARGET_CMDS
 	$(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
 endef
 
-define HOST_LZIP_INSTALL_CMDS
-	$(MAKE) -C $(@D) DESTDIR=$(HOST_DIR) install
-endef
-
 # It's not autotools-based
 $(eval $(generic-package))
-$(eval $(host-generic-package))
-- 
2.1.0
