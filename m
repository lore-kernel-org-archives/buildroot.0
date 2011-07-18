From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 18 Jul 2011 13:13:25 +0200
Subject: [Buildroot] [git commit] linux-fusion: fix build after af52661d
	(linux: rename LINUX26 to LINUX)
Message-ID: <20110718111345.178148AA8F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=1dfc43cced8d30984687950beca6448203fb576d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

linux-fusion uses a number of linux-specific variables. Adjust to match
their new names.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/linux-fusion/linux-fusion.mk |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/linux-fusion/linux-fusion.mk b/package/linux-fusion/linux-fusion.mk
index 392ffd6..be1cc71 100644
--- a/package/linux-fusion/linux-fusion.mk
+++ b/package/linux-fusion/linux-fusion.mk
@@ -9,12 +9,12 @@ LINUX_FUSION_SITE = http://directfb.org/downloads/Core/linux-fusion
 LINUX_FUSION_INSTALL_STAGING = YES
 LINUX_FUSION_DEPENDENCIES = linux
 
-LINUX_FOR_FUSION=$(LINUX26_VERSION_PROBED)
+LINUX_FOR_FUSION=$(LINUX_VERSION_PROBED)
 LINUX_FUSION_ETC_DIR=$(TARGET_DIR)/etc/udev/rules.d
 
 LINUX_FUSION_MAKE_OPTS =  KERNEL_VERSION=$(LINUX_FOR_FUSION)
-LINUX_FUSION_MAKE_OPTS += KERNEL_BUILD=$(LINUX26_DIR)
-LINUX_FUSION_MAKE_OPTS += KERNEL_SOURCE=$(LINUX26_DIR)
+LINUX_FUSION_MAKE_OPTS += KERNEL_BUILD=$(LINUX_DIR)
+LINUX_FUSION_MAKE_OPTS += KERNEL_SOURCE=$(LINUX_DIR)
 
 LINUX_FUSION_MAKE_OPTS += SYSROOT=$(TARGET_DIR)
 LINUX_FUSION_MAKE_OPTS += ARCH=$(KERNEL_ARCH)
-- 
1.7.3.4
