From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 3 Jul 2014 00:02:42 +0200
Subject: [Buildroot] [PATCH v2] update default configuration to Linux
 3.15.x
In-Reply-To: <20140702151121.GA16259@waldemar-brodkorb.de>
References: <20140702151121.GA16259@waldemar-brodkorb.de>
Message-ID: <20140703000242.1a9e5696@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Waldemar Brodkorb,

On Wed, 2 Jul 2014 17:11:21 +0200, Waldemar Brodkorb wrote:
> Result tested with Qemu 2.0.0 without issues.
> Old SCI problems are fixed in Qemu.
> 
> ---
> Changes v1 -> v2:
>   - split from binutils patch (suggested via #buildroot)
>   - comment about SCI issues in older Qemu (suggested via #buildroot)
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Same thing: misplaced Signed-off-by line.

> diff --git a/configs/qemu_sh4_r2d_defconfig b/configs/qemu_sh4_r2d_defconfig
> index b27d9ec..a6e5850 100644
> --- a/configs/qemu_sh4_r2d_defconfig
> +++ b/configs/qemu_sh4_r2d_defconfig
> @@ -10,11 +10,6 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttySC1"
>  BR2_TARGET_ROOTFS_EXT2=y
>  # BR2_TARGET_ROOTFS_TAR is not set
>  
> -# Lock to 3.2 headers to avoid breaking with newer kernels
> -BR2_KERNEL_HEADERS_VERSION=y
> -BR2_DEFAULT_KERNEL_VERSION="3.2.55"
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_2=y

Please keep those lines, but update them to use 3.15. Otherwise, the
default kernel headers version is used, which we regularly update. And
then, as soon as 3.16 is released, this defconfig is going to build a
3.15 kernel, with a toolchain that has used 3.16 kernel headers, which
is bad. So for all defconfigs, we want to lock down the kernel headers
version.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
