From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri, 10 Mar 2017 13:35:56 +0100
Subject: [Buildroot] [PATCH 1/3] configs: beaglebaordx15: fixate the header
	series
Message-ID: <20170310123558.22033-1-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The kernel headers version used to be default when the default was
still 4.9. Now, however, we switched the default headers version to
4.10 but the beagleboardx15 kernel is still 4.9, so we have to set
the kernel headers version explicitly.

Fixes https://gitlab.com/buildroot.org/buildroot/builds/11700987

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 configs/beagleboardx15_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/beagleboardx15_defconfig b/configs/beagleboardx15_defconfig
index 25ee21b8f6..393b29eef0 100644
--- a/configs/beagleboardx15_defconfig
+++ b/configs/beagleboardx15_defconfig
@@ -1,5 +1,6 @@
 BR2_arm=y
 BR2_cortex_a15=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/beagleboardx15/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-- 
2.11.0
