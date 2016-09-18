From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 18 Sep 2016 01:58:23 +0000
Subject: [Buildroot] [Bug 9256] New: [Config file] New device: Odroid-U2/U3
Message-ID: <bug-9256-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9256

            Bug ID: 9256
           Summary: [Config file] New device: Odroid-U2/U3
           Product: buildroot
           Version: 2016.08
          Hardware: All
                OS: All
            Status: NEW
          Severity: enhancement
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: qlb1234 at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Hi. Here's a config file for Hardkernel's Odroid-U2 and Odroid-U3. They're
software compatible.

Name suggestion: odroidu2_defconfig

# Target
BR2_arm=y
BR2_cortex_a9=y
BR2_ARM_ENABLE_NEON=y
BR2_ARM_ENABLE_VFP=y
BR2_ARM_FPU_VFPV3=y

# Toolchain
BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
BR2_BINUTILS_VERSION_2_26_X=y
BR2_GCC_VERSION_6_X=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y

# Kernel
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_DEFCONFIG="exynos"
BR2_LINUX_KERNEL_DTS_SUPPORT=y
BR2_LINUX_KERNEL_INTREE_DTS_NAME="exynos4412-odroidu3"

# Bootloader
BR2_TARGET_UBOOT=y
BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
BR2_TARGET_UBOOT_BOARD_DEFCONFIG="odroid"
BR2_TARGET_UBOOT_NEEDS_DTC=y

-- 
You are receiving this mail because:
You are on the CC list for the bug.
