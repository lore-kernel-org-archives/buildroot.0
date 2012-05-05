From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 5 May 2012 23:15:56 +0200
Subject: [Buildroot] [git commit] qemu/sparc-ss10: update to use kernel 3.3.4
Message-ID: <20120505211718.E0CCC96A95@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0160e9d8af83d9e0a03b5f36d49be9a45e8aaf4c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 configs/qemu_sparc_ss10_defconfig |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/configs/qemu_sparc_ss10_defconfig b/configs/qemu_sparc_ss10_defconfig
index 77250f8..62aee75 100644
--- a/configs/qemu_sparc_ss10_defconfig
+++ b/configs/qemu_sparc_ss10_defconfig
@@ -6,9 +6,12 @@ BR2_sparc_supersparc=y
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
+# Lock to 3.3 headers to avoid breaking with newer kernels
+BR2_KERNEL_HEADERS_3_3=y
+
 # Linux kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.3"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.3.4"
 BR2_LINUX_KERNEL_DEFCONFIG="sparc32"
 BR2_LINUX_KERNEL_ZIMAGE=y
