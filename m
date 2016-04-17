From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 17 Apr 2016 21:35:44 +0200
Subject: [Buildroot] [PATCH v5] dpdk: new package
In-Reply-To: <20160417155607.5861459.38806.3255@rehivetech.com>
References: <1458642986-32365-1-git-send-email-viktorin@rehivetech.com>
 <1460826490-15614-1-git-send-email-viktorin@rehivetech.com>
 <20160417163814.03b67f53@free-electrons.com>
 <20160417155607.5861459.38806.3255@rehivetech.com>
Message-ID: <20160417213544.2960f7cf@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 17 Apr 2016 17:56:07 +0200, Jan Viktorin wrote:

> what configuration do you use?

BR2_arm=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2016.02-3-g762b7c9.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_4_7=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_10=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_VERSION=y
BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.5"
BR2_LINUX_KERNEL_DEFCONFIG="mvebu_v7"
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_DPDK=y
# BR2_TARGET_ROOTFS_TAR is not set

Before starting the build, I do "make linux-menuconfig", and enable
CONFIG_UIO in the kernel configuration.

> In general, I cannot say? we are always fine with the in-kernel
> modules. There are configurations of DPDK that build certain drivers.
> Of course, DPDK community would like to have no out-of-tree drivers.
> Some devices require a certain driver.
> 
> The x86 configuration builds drivers. The armv7 one doesn't (there
> are no useful drivers for this purpose).

Then IMO the dependency on the Linux kernel should be optional.

> A user may serve its own configuration of DPDK where a kernel driver
> is selected and thus, the user would expect it to be built and
> installed.

Right. But if the default configuration doesn't require the kernel to
be built, we probably shouldn't require it as well.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
