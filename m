From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 19 Oct 2020 19:08:27 +0200
Subject: [Buildroot] [PATCH 1/1] configs/qemu_s390x_defconfig: use linux
 headers same as kernel series 5.8
In-Reply-To: <20201019123145.1159123-1-egorenar@linux.ibm.com>
References: <20201019123145.1159123-1-egorenar@linux.ibm.com>
Message-ID: <20201019170827.GH3466@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A;exander, All,

On 2020-10-19 14:31 +0200, Alexander Egorenkov spake thusly:
> Broke since introduction of linux kernel series 5.9.
> 
> Signed-off-by: Alexander Egorenkov <egorenar@linux.ibm.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  configs/qemu_s390x_defconfig | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/configs/qemu_s390x_defconfig b/configs/qemu_s390x_defconfig
> index 3bd407b250..b3c2641d15 100644
> --- a/configs/qemu_s390x_defconfig
> +++ b/configs/qemu_s390x_defconfig
> @@ -11,6 +11,9 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>  BR2_TARGET_ROOTFS_EXT2=y
>  # BR2_TARGET_ROOTFS_TAR is not set
>  
> +# Linux headers same as kernel, a 5.8 series
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_8=y
> +
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -- 
> 2.26.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
