From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 8 Dec 2018 22:59:02 +0100
Subject: [Buildroot] [PATCH] minnowboard-max: defconfigs: bump kernel to
 4.19.8
In-Reply-To: <20181208215231.17886-1-peter@korsgaard.com>
References: <20181208215231.17886-1-peter@korsgaard.com>
Message-ID: <20181208215902.GA3383@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2018-12-08 22:52 +0100, Peter Korsgaard spake thusly:
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

However, I have a very minor comment, see below...

[--SNIP--]
> diff --git a/configs/minnowboard_max_defconfig b/configs/minnowboard_max_defconfig
> index 9495bf3769..523ddffd51 100644
> --- a/configs/minnowboard_max_defconfig
> +++ b/configs/minnowboard_max_defconfig
> @@ -7,8 +7,8 @@ BR2_SYSTEM_DHCP="eth0"
>  BR2_ROOTFS_POST_BUILD_SCRIPT="board/minnowboard/post-build.sh"
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/minnowboard/post-image.sh"
>  
> -# Linux headers same as kernel, a 4.14 series
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_14=y
> +# Linux headers same as kernel, a 4.19 series

Do we really need that comment? It is interesting for defconfigs that
use a sha1 from a git tree, for which it is impossible to quickly
identify the kernel version, but here, the kernel version is
human-readable, so we don;t really care about the comment, do we?

Regards,
Yann E. MORIN.

> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
>  # Needed for grub2
>  BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
>  
> @@ -23,7 +23,7 @@ BR2_PACKAGE_LINUX_FIRMWARE_RTL_8169=y
>  # Linux kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.14.13"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.8"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/minnowboard/linux.config"
>  
> -- 
> 2.11.0
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
