From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  7 Jun 2015 00:20:46 +0200
Subject: [Buildroot] [PATCH 10/11] package/simicsfs: use kernel-module helper
In-Reply-To: <cover.1433628825.git.yann.morin.1998@free.fr>
References: <cover.1433628825.git.yann.morin.1998@free.fr>
Message-ID: <d95d59c6c3f1b8e41fc77e12c28d9143d0925eac.1433628825.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/simicsfs/simicsfs.mk | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/package/simicsfs/simicsfs.mk b/package/simicsfs/simicsfs.mk
index 51987c5..91ed413 100644
--- a/package/simicsfs/simicsfs.mk
+++ b/package/simicsfs/simicsfs.mk
@@ -8,14 +8,6 @@ SIMICSFS_VERSION = 1.18
 SIMICSFS_SITE = http://download.simics.net/pub
 SIMICSFS_LICENSE = GPLv2+
 SIMICSFS_LICENSE_FILES = hostfs.h
-SIMICSFS_DEPENDENCIES = linux
-
-define SIMICSFS_BUILD_CMDS
-	$(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) M=$(@D) modules
-endef
-
-define SIMICSFS_INSTALL_TARGET_CMDS
-	$(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) M=$(@D) INSTALL_MOD_PATH=$(TARGET_DIR) modules_install
-endef
 
+$(eval $(kernel-module))
 $(eval $(generic-package))
-- 
1.9.1
