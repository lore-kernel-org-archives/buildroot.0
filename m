From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 10 Sep 2015 14:03:20 +0200
Subject: [Buildroot] [git commit] linux-fusion: use a more traditional style
	to define LINUX_FUSION_MAKE_OPTS
Message-ID: <20150910122136.ECDEE80E4B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e2fc084c675c12000f8c976d74254da73155305b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use a single assignment to define the value of LINUX_FUSION_MAKE_OPTS
instead of a sequence of += assignments.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-fusion/linux-fusion.mk |   16 ++++++++--------
 1 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/linux-fusion/linux-fusion.mk b/package/linux-fusion/linux-fusion.mk
index 4d113e7..ba4bb31 100644
--- a/package/linux-fusion/linux-fusion.mk
+++ b/package/linux-fusion/linux-fusion.mk
@@ -20,14 +20,14 @@ endif
 
 LINUX_FUSION_ETC_DIR = $(TARGET_DIR)/etc/udev/rules.d
 
-LINUX_FUSION_MAKE_OPTS = KERNEL_VERSION=$(LINUX_VERSION_PROBED)
-LINUX_FUSION_MAKE_OPTS += KERNEL_BUILD=$(LINUX_DIR)
-LINUX_FUSION_MAKE_OPTS += KERNEL_SOURCE=$(LINUX_DIR)
-
-LINUX_FUSION_MAKE_OPTS += SYSROOT=$(TARGET_DIR)
-LINUX_FUSION_MAKE_OPTS += ARCH=$(KERNEL_ARCH)
-LINUX_FUSION_MAKE_OPTS += CROSS_COMPILE=$(TARGET_CROSS)
-LINUX_FUSION_MAKE_OPTS += KERNEL_MODLIB=/lib/modules/$(LINUX_VERSION_PROBED)/kernel
+LINUX_FUSION_MAKE_OPTS = \
+	KERNEL_VERSION=$(LINUX_VERSION_PROBED) \
+	KERNEL_BUILD=$(LINUX_DIR) \
+	KERNEL_SOURCE=$(LINUX_DIR) \
+	SYSROOT=$(TARGET_DIR) \
+	ARCH=$(KERNEL_ARCH) \
+	CROSS_COMPILE=$(TARGET_CROSS) \
+	KERNEL_MODLIB=/lib/modules/$(LINUX_VERSION_PROBED)/kernel
 
 define LINUX_FUSION_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(MAKE) $(LINUX_FUSION_MAKE_OPTS) -C $(@D)
