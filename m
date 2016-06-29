From: Julien Floret <julien.floret@6wind.com>
Date: Wed, 29 Jun 2016 15:46:27 +0200
Subject: [Buildroot] [PATCH 20/24] bzip2: drop unused host variant
In-Reply-To: <1467207991-4905-1-git-send-email-julien.floret@6wind.com>
References: <1467207991-4905-1-git-send-email-julien.floret@6wind.com>
Message-ID: <1467207991-4905-21-git-send-email-julien.floret@6wind.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Julien Floret <julien.floret@6wind.com>
---
 package/bzip2/bzip2.mk | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/package/bzip2/bzip2.mk b/package/bzip2/bzip2.mk
index 0597ab97d620..6011cd3965d0 100644
--- a/package/bzip2/bzip2.mk
+++ b/package/bzip2/bzip2.mk
@@ -51,19 +51,4 @@ define BZIP2_INSTALL_TARGET_CMDS
 	$(BZIP2_INSTALL_TARGET_SHARED_CMDS)
 endef
 
-define HOST_BZIP2_BUILD_CMDS
-	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) \
-		$(MAKE) -C $(@D) -f Makefile-libbz2_so
-	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) \
-		$(MAKE) -C $(@D) libbz2.a bzip2 bzip2recover
-endef
-
-define HOST_BZIP2_INSTALL_CMDS
-	$(HOST_MAKE_ENV) \
-		$(MAKE) PREFIX=$(HOST_DIR)/usr -C $(@D) install
-	$(HOST_MAKE_ENV) \
-		$(MAKE) -f Makefile-libbz2_so PREFIX=$(HOST_DIR)/usr -C $(@D) install
-endef
-
 $(eval $(generic-package))
-$(eval $(host-generic-package))
-- 
2.1.0
