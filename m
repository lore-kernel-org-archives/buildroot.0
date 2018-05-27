From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 27 May 2018 22:10:55 +0200
Subject: [Buildroot] [PATCH 1/1] beaglebone_qt5_defconfig: use gcc 5.x
In-Reply-To: <1502450164-3015-1-git-send-email-lothar.felten@gmail.com>
References: <1502450164-3015-1-git-send-email-lothar.felten@gmail.com>
Message-ID: <f0e3ddc5-390d-a5ae-6624-b2f57c42e92a@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Lothar,

Le 11/08/2017 ? 13:16, Lothar Felten a ?crit?:
> The linux 4.1 kernel does not compile with gcc 6.x.
> The compiler version is now fixed to 5.x until a new kernel is used.

gcc 5.x will be removed from Buildroot soon [1] and this defconfig is the only
one using this gcc version.

Why beaglebone_qt5_defconfig and beaglebode_defconfig don't use the same SDK,
kernel, uboot?

What about updating ti-sgx-* packages to a newer version of the TI SDK?
The SDK 02.00.00 seems old (Released October 2015), now you have the SDK 4.02.00
(Released Dec 2017)

Best regards,
Romain

[1] http://lists.busybox.net/pipermail/buildroot/2018-May/222057.html

> 
> Signed-off-by: Lothar Felten <lothar.felten@gmail.com>
> ---
>  configs/beaglebone_qt5_defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/configs/beaglebone_qt5_defconfig b/configs/beaglebone_qt5_defconfig
> index 4135f71..fb61bf5 100644
> --- a/configs/beaglebone_qt5_defconfig
> +++ b/configs/beaglebone_qt5_defconfig
> @@ -3,6 +3,7 @@ BR2_cortex_a8=y
>  BR2_GLOBAL_PATCH_DIR="board/beaglebone/patches"
>  BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
>  BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
> +BR2_GCC_VERSION_5_X=y
>  BR2_TOOLCHAIN_BUILDROOT_CXX=y
>  BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
>  BR2_TARGET_GENERIC_GETTY_PORT="ttyO0"
> 
