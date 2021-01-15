From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Date: Fri, 15 Jan 2021 12:03:19 -0800
Subject: [Buildroot] [PATCH 4/4] configs/snps_archs38_hsdk_defconfig: update
 for better out-of-box experience
In-Reply-To: <20210115200319.4139041-1-vgupta@synopsys.com>
References: <20210115200319.4139041-1-vgupta@synopsys.com>
Message-ID: <20210115200319.4139041-5-vgupta@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 - Enable C++ support
 - Don't strip executables
 - Add minimal debug symbols
 - Enable strace and openssh
 - Enable perf (and elfutils)

Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
---
 configs/snps_archs38_hsdk_defconfig | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/configs/snps_archs38_hsdk_defconfig b/configs/snps_archs38_hsdk_defconfig
index 69d0b1936b3a..7d406a90ed3c 100644
--- a/configs/snps_archs38_hsdk_defconfig
+++ b/configs/snps_archs38_hsdk_defconfig
@@ -1,8 +1,12 @@
 BR2_arcle=y
 BR2_archs38_full=y
+BR2_ENABLE_DEBUG=y
+BR2_DEBUG_1=y
+# BR2_STRIP_strip is not set
 BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_6=y
 BR2_PACKAGE_GLIBC_UTILS=y
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
 BR2_TARGET_OPTIMIZATION="-mfpu=fpud_all"
 BR2_TARGET_GENERIC_HOSTNAME="hsdk"
 BR2_TARGET_GENERIC_ISSUE="Welcome to the HSDK Platform"
@@ -14,8 +18,15 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.6.3"
 BR2_LINUX_KERNEL_DEFCONFIG="hsdk"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/synopsys/hsdk/linux.fragment"
+BR2_PACKAGE_LINUX_TOOLS_PERF=y
+BR2_PACKAGE_STRACE=y
+BR2_PACKAGE_MAKE=y
+BR2_PACKAGE_ELFUTILS=y
+BR2_PACKAGE_ELFUTILS_PROGS=y
+BR2_PACKAGE_OPENSSH=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="200M"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
-- 
2.25.1
