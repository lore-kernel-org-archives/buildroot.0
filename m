From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 18 Aug 2019 21:56:28 +0200
Subject: [Buildroot] [git commit] configs/acmesystems_{aria,
 arietta}*: Linux kernel needs host-openssl
Message-ID: <20190818200324.4982382596@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f6949cacfb0359ee777ec2a27bf09101c6733d88
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since the bump of the Linux kernel version in the acmesystems
defconfigs in the following commits:

42ea31c114f32a100923e51cb2b6b6d67c38ca3f configs/acmesystems_arietta_g25: bump Linux and AT91Bootstrap versions
ab10b5b3ee6aa1e19aa6264153eeed9054d4c2e7 configs/acmesystems_aria_g25: bump Linux and AT91Bootstrap versions

The Linux kernel configuration in use needs host-openssl to build
successfully. This commit therefore adds the necessary
BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/273673074 (acmesystems_arietta_g25_128mb_defconfig)
  https://gitlab.com/buildroot.org/buildroot/-/jobs/273673072 (acmesystems_aria_g25_128mb_defconfig)
  https://gitlab.com/buildroot.org/buildroot/-/jobs/273673075 (acmesystems_arietta_g25_256mb_defconfig)
  https://gitlab.com/buildroot.org/buildroot/-/jobs/273673073 (acmesystems_aria_g25_256mb_defconfig)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/acmesystems_aria_g25_128mb_defconfig    | 1 +
 configs/acmesystems_aria_g25_256mb_defconfig    | 1 +
 configs/acmesystems_arietta_g25_128mb_defconfig | 1 +
 configs/acmesystems_arietta_g25_256mb_defconfig | 1 +
 4 files changed, 4 insertions(+)

diff --git a/configs/acmesystems_aria_g25_128mb_defconfig b/configs/acmesystems_aria_g25_128mb_defconfig
index f2fe5cbefb..4f8f4d5406 100644
--- a/configs/acmesystems_aria_g25_128mb_defconfig
+++ b/configs/acmesystems_aria_g25_128mb_defconfig
@@ -19,6 +19,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19"
 BR2_LINUX_KERNEL_DEFCONFIG="at91_dt"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-ariag25"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
 # Root filesystem
 BR2_TARGET_ROOTFS_EXT2=y
diff --git a/configs/acmesystems_aria_g25_256mb_defconfig b/configs/acmesystems_aria_g25_256mb_defconfig
index bb719603e9..4569a7b7aa 100644
--- a/configs/acmesystems_aria_g25_256mb_defconfig
+++ b/configs/acmesystems_aria_g25_256mb_defconfig
@@ -19,6 +19,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19"
 BR2_LINUX_KERNEL_DEFCONFIG="at91_dt"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-ariag25"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
 # Root filesystem
 BR2_TARGET_ROOTFS_EXT2=y
diff --git a/configs/acmesystems_arietta_g25_128mb_defconfig b/configs/acmesystems_arietta_g25_128mb_defconfig
index d66d80d5ab..0174f356da 100644
--- a/configs/acmesystems_arietta_g25_128mb_defconfig
+++ b/configs/acmesystems_arietta_g25_128mb_defconfig
@@ -19,6 +19,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19"
 BR2_LINUX_KERNEL_DEFCONFIG="at91_dt"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-ariettag25"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
 # Root filesystem
 BR2_TARGET_ROOTFS_EXT2=y
diff --git a/configs/acmesystems_arietta_g25_256mb_defconfig b/configs/acmesystems_arietta_g25_256mb_defconfig
index 5104291c48..14e4dd00be 100644
--- a/configs/acmesystems_arietta_g25_256mb_defconfig
+++ b/configs/acmesystems_arietta_g25_256mb_defconfig
@@ -19,6 +19,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19"
 BR2_LINUX_KERNEL_DEFCONFIG="at91_dt"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-ariettag25"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
 # Root filesystem
 BR2_TARGET_ROOTFS_EXT2=y
