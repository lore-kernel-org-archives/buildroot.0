From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  2 Sep 2015 00:01:13 +0200
Subject: [Buildroot] [PATCHv3 12/15] linux-fusion: use a more traditional
	style to define LINUX_FUSION_MAKE_OPTS
In-Reply-To: <1441144876-2628-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1441144876-2628-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1441144876-2628-13-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use a single assignment to define the value of LINUX_FUSION_MAKE_OPTS
instead of a sequence of += assignments.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/linux-fusion/linux-fusion.mk | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/linux-fusion/linux-fusion.mk b/package/linux-fusion/linux-fusion.mk
index a245b8f..f34e0a8 100644
--- a/package/linux-fusion/linux-fusion.mk
+++ b/package/linux-fusion/linux-fusion.mk
@@ -15,14 +15,14 @@ LINUX_FUSION_LICENSE_FILES = debian/copyright
 LINUX_FOR_FUSION = $(LINUX_VERSION_PROBED)
 LINUX_FUSION_ETC_DIR = $(TARGET_DIR)/etc/udev/rules.d
 
-LINUX_FUSION_MAKE_OPTS = KERNEL_VERSION=$(LINUX_FOR_FUSION)
-LINUX_FUSION_MAKE_OPTS += KERNEL_BUILD=$(LINUX_DIR)
-LINUX_FUSION_MAKE_OPTS += KERNEL_SOURCE=$(LINUX_DIR)
-
-LINUX_FUSION_MAKE_OPTS += SYSROOT=$(TARGET_DIR)
-LINUX_FUSION_MAKE_OPTS += ARCH=$(KERNEL_ARCH)
-LINUX_FUSION_MAKE_OPTS += CROSS_COMPILE=$(TARGET_CROSS)
-LINUX_FUSION_MAKE_OPTS += KERNEL_MODLIB=/lib/modules/$(LINUX_FOR_FUSION)/kernel
+LINUX_FUSION_MAKE_OPTS = \
+	KERNEL_VERSION=$(LINUX_FOR_FUSION) \
+	KERNEL_BUILD=$(LINUX_DIR) \
+	KERNEL_SOURCE=$(LINUX_DIR) \
+	SYSROOT=$(TARGET_DIR) \
+	ARCH=$(KERNEL_ARCH) \
+	CROSS_COMPILE=$(TARGET_CROSS) \
+	KERNEL_MODLIB=/lib/modules/$(LINUX_FOR_FUSION)/kernel
 
 define LINUX_FUSION_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(MAKE) $(LINUX_FUSION_MAKE_OPTS) -C $(@D)
-- 
2.5.1
