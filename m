From: Mark Corbin <mark.corbin@embecosm.com>
Date: Tue, 19 Mar 2019 15:20:46 +0000
Subject: [Buildroot] [PATCH v2 2/5] configs: qemu_riscv32_virt: Upgrade
 to 4.20 kernel
In-Reply-To: <20190318210106.6347-2-alistair.francis@wdc.com>
References: <20190318210106.6347-1-alistair.francis@wdc.com>
 <20190318210106.6347-2-alistair.francis@wdc.com>
Message-ID: <d7dc0632-940c-e87f-14c9-42b231106723@embecosm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Alistair

On 18/03/2019 21:02, Alistair Francis wrote:
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  configs/qemu_riscv32_virt_defconfig | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/configs/qemu_riscv32_virt_defconfig b/configs/qemu_riscv32_virt_defconfig
> index fb37da6a89..6f9a61b11c 100644
> --- a/configs/qemu_riscv32_virt_defconfig
> +++ b/configs/qemu_riscv32_virt_defconfig
> @@ -10,14 +10,14 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
>  # Filesystem
>  BR2_TARGET_ROOTFS_EXT2=y
>  
> -# Linux headers same as kernel, a 4.15 series
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_15=y
> +# Linux headers same as kernel, a 4.20 series
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_20=y
>  
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_GIT=y
>  BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/riscv/riscv-linux.git"
> -BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="fe92d7905c6ea0ebeabeb725b8040754ede7c220"
> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="8fe28cb58bcb235034b64cbbb7550a8a43fd88be"

I wasn't sure that the 4.20 kernel worked for riscv32 under qemu which
is probably why it wasn't bumped from 4.15 in January when the
qemu_riscv64_virt_defconfig kernel version was.

How did you manage to test this? I've tried both qemu 2.12.0 and 3.1.0
and neither version will boot the resulting kernel.

Regards

Mark

-- 
Mark Corbin
Embecosm Ltd.
https://www.embecosm.com
