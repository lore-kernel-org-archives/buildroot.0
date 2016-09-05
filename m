From: qlb1234 <qlb1234@gmail.com>
Date: Tue, 6 Sep 2016 03:15:24 +0800
Subject: [Buildroot] New config file: Odroid-U2/U3
In-Reply-To: <CABKM0pDxc2ZwFDh80psCCv_nOjMrGWLC9Mg0rA348FGShdxdhQ@mail.gmail.com>
References: <CABKM0pDxc2ZwFDh80psCCv_nOjMrGWLC9Mg0rA348FGShdxdhQ@mail.gmail.com>
Message-ID: <CABKM0pBcojy73+KV4LDh-kUH6SG-izQcq6+428LxwKDo3N71bQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Buildroot dev team,

I have an Odroid-U2 and unfortunately Buildroot lacks a config file for it.
So I managed to make one for this sweet old device and it works perfectly.

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

You can also retrieve it from http://pastebin.com/rhEUbAvs

Odroid-U2 and Odroid-U3 are basically the same device (
http://magazine.odroid.com/wp-content/uploads/ODROID-Magazine-201401.pdf#page=22).
I don't have a U3 but the official page (
http://www.hardkernel.com/main/products/prdt_info.php?g_code=G138745696275&tab_idx=3)
stated they're fully compatible so I think it's safe to assume it also
works on U3.

Cheers,
Wesley Chan
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160906/60dd102a/attachment.html>
