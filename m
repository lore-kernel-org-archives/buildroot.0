From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:56:38 -0000
Subject: [Buildroot] [git commit branch/next] package/simicsfs: use
	kernel-module helper
Message-ID: <20150808105628.69D5B7FC31@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e5f4122c56debc43bba1d0e8085a2cd25541e546
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

We were already using the Linux buildsystem to build simicsfs' modules,
so switch to using the kernel-module infra instead.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/simicsfs/simicsfs.mk |   10 +---------
 1 files changed, 1 insertions(+), 9 deletions(-)

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
