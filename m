From: Sam Tennent <Sam.Tennent@synopsys.com>
Date: Fri, 9 Oct 2020 15:58:19 +0000
Subject: [Buildroot] Issue Building gdbserver in Buildroot 2019.02.7
Message-ID: <DM6PR12MB41534F87E9A4D9CCED3057B1AA080@DM6PR12MB4153.namprd12.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Folks,

I'm seeing an issue when trying to build gdbserver for our ARMv8 based Virtual Prototype.

I can do this successfully for an older revision of Buildroot ( 2018.02.1) but for 2019.02.7 I can't get it to build.

I realize that these builds a quite different since they are before and after gdbserver switched from a C app to C++ but I think I have taken this into account in my defconfig.

Here's my defconfig

BR2_aarch64=y
BR2_GLOBAL_PATCH_DIR="$(TOPDIR)/../input/patches/"
BR2_KERNEL_HEADERS_4_14=y
BR2_TARGET_GENERIC_HOSTNAME="mini-aarch64"
BR2_TARGET_GENERIC_ISSUE="Welcome to SNPS Mini AArch64 by Buildroot"
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_VERSION=y
BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="$(VER)"
BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
BR2_TARGET_ROOTFS_CPIO=y
BR2_TARGET_ROOTFS_CPIO_GZIP=y
#BR2_TARGET_ROOTFS_EXT2=y
#BR2_TARGET_ROOTFS_EXT2_4=y
# BR2_TARGET_ROOTFS_TAR is not set
BR2_ENABLE_DEBUG=y
BR2_STRIP_strip=n

#Enable GDBSERVER

BR2_PACKAGE_HOST_GDB=y
BR2_PACKAGE_GDB=y
BR2_PACKAGE_GDB_SERVER=y

BR2_TOOLCHAIN_HAS_THREADS_DEBUG=y
BR2_PTHREAD_DEBUG=y
BR2_INSTALL_LIBSTDCPP=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_TOOLCHAIN_HAS_THREADS=y

When I build with this I see several errors of the form:

n file included from build-gnulib-gdbserver/import/stdint.h:556:0,
from ../common/common-defs.h:55,
from ../common/buffer.c:20:
/localdev/stennent/wsLinuxTraining/LinuxSWDev_Training/software/mini-aarch64-linux/buildroot-2019.02.7/output/host/aarch64-buildroot-linux-uclibc/include/c++/7.4.0/cwchar:58:5: error: conflicting declaration 'typedef struct rpl_mbstate_t rpl_mbstate_t'
} mbstate_t;

I see a similar issue was reported on here back on 2017:
http://lists.busybox.net/pipermail/buildroot/2017-August/199874.html

but I guess that should have been fixed by now.

Any ideas on how I can fix this.

Thanks,

Sam.



-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20201009/d94fcab9/attachment.html>
