From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 22 Feb 2015 19:35:31 +0100
Subject: [Buildroot] [PATCH 1/1] Added Raspberry Pi 2 defconfig
In-Reply-To: <1423866150-23697-1-git-send-email-james@hebden.net.au>
References: <1423866150-23697-1-git-send-email-james@hebden.net.au>
Message-ID: <20150222183531.GF4016@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

James, All,

On 2015-02-14 09:22 +1100, James Hebden spake thusly:
> Changes v2 -> v3
>   - Reformatted defonfig using make savedefconfig
> 
> Changes v1 -> v2
> 
>   - Removed custom kernel configuration, used default kernel config for 
> bcm2709
>   - Removed changes to rpi-firmware package, separate patch coming
>   - Enabled EABIhf

The changelog above should have been below the '---' line (below).

> Signed-off-by: James Hebden <james@hebden.net.au>
> ---
>  configs/raspberrypi2_defconfig | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>  create mode 100644 configs/raspberrypi2_defconfig
> 
> diff --git a/configs/raspberrypi2_defconfig b/configs/raspberrypi2_defconfig
> new file mode 100644
> index 0000000..571b026
> --- /dev/null
> +++ b/configs/raspberrypi2_defconfig
> @@ -0,0 +1,14 @@
> +BR2_arm=y
> +BR2_cortex_a7=y
> +BR2_ARM_EABIHF=y
> +BR2_ARM_FPU_NEON_VFPV4=y
> +BR2_TOOLCHAIN_BUILDROOT_LARGEFILE=y
> +BR2_TOOLCHAIN_BUILDROOT_CXX=y
> +BR2_TARGET_GENERIC_GETTY_PORT="tty1"
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_GIT=y
> +BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/raspberrypi/linux.git"
> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="087966e5e3bafdeb9f9ac7578f4995c7cc7ecf1d"

There's now a newer changeset with some fixes (one by me, yeah!).

> +BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"

The bcm2709_defconfig enables support for Device Tree, so I believe we
should also install the DTBs from rpi-firmware.

I'll fix and bump, then resubmit. So, I've marked your patch as
"Changes Requested" on our Patchwork.

Thank you! :-)

Regards,
Yann E. MORIN.

> +BR2_LINUX_KERNEL_ZIMAGE=y
> +BR2_PACKAGE_RPI_FIRMWARE=y
> -- 
> 2.1.4
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
