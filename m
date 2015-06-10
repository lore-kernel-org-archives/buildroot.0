From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 10 Jun 2015 21:22:12 +0200
Subject: [Buildroot] [PATCH 08/11 v2] package/on2-8170-modules: use
	kernel-module helper
In-Reply-To: <cover.1433964001.git.yann.morin.1998@free.fr>
References: <cover.1433964001.git.yann.morin.1998@free.fr>
Message-ID: <a0a6da880beb6b888e98944f68388c3049093797.1433964001.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/on2-8170-modules/on2-8170-modules.mk | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/package/on2-8170-modules/on2-8170-modules.mk b/package/on2-8170-modules/on2-8170-modules.mk
index 209bcb5..b40ed86 100644
--- a/package/on2-8170-modules/on2-8170-modules.mk
+++ b/package/on2-8170-modules/on2-8170-modules.mk
@@ -7,17 +7,8 @@
 ON2_8170_MODULES_VERSION = 73b08061d30789178e692bc332b73d1d9922bf39
 ON2_8170_MODULES_SITE = $(call github,alexandrebelloni,on2-8170-modules,$(ON2_8170_MODULES_VERSION))
 
-ON2_8170_MODULES_DEPENDENCIES = linux
-
 ON2_8170_MODULES_LICENSE = GPLv2+
 #There is no license file
 
-define ON2_8170_MODULES_BUILD_CMDS
-	$(MAKE) -C $(LINUX_DIR) $(LINUX_MAKE_FLAGS) M=$(@D)
-endef
-
-define ON2_8170_MODULES_INSTALL_TARGET_CMDS
-	$(MAKE) -C $(LINUX_DIR) $(LINUX_MAKE_FLAGS) M=$(@D) modules_install
-endef
-
+$(eval $(kernel-module))
 $(eval $(generic-package))
-- 
1.9.1
