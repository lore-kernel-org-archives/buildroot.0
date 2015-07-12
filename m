From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Jul 2015 11:56:19 +0200
Subject: [Buildroot] [git commit] package/on2-8170-modules: use
	kernel-module helper
Message-ID: <20150712095704.91CFB8010C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=731c71d23f4dc747a3542c7ccbd163f9e073b9d3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We were already using the Linux buildsystem to build on2-8170-modules,
so just switch to the new kernel-module infra.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/on2-8170-modules/on2-8170-modules.mk |   11 +----------
 1 files changed, 1 insertions(+), 10 deletions(-)

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
