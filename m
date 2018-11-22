From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 22 Nov 2018 23:36:36 +0100
Subject: [Buildroot] [PATCH] configs/chiliboard: remove explicit getty
 port
In-Reply-To: <20181121210142.21769-1-m.niestroj@grinn-global.com>
References: <20181121210142.21769-1-m.niestroj@grinn-global.com>
Message-ID: <66d34c66-c928-e00a-d59a-e09553fc7638@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 21/11/2018 22:01, Marcin Niestroj wrote:
> Using default value (console) works well, so there is no reason to set
> tty explicitly. Additionally after selecting newer kernels (tested
> with 4.19 and 4.20-rc3) ttyO0 no longer works due to missing device
> node.

 Actually, does it still work with the 4.16 kernel? IIRC the ttyO were replaced
by the standard ttyS ages ago (like, 3.18 or something like that). If it doesn't
work with the 4.16 kernel, it should be applied to master.

 Anyway,

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

> 
> Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
> ---
>  configs/grinn_chiliboard_defconfig | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/configs/grinn_chiliboard_defconfig b/configs/grinn_chiliboard_defconfig
> index 81d7bae911..84f24e1cc4 100644
> --- a/configs/grinn_chiliboard_defconfig
> +++ b/configs/grinn_chiliboard_defconfig
> @@ -1,7 +1,6 @@
>  BR2_arm=y
>  BR2_cortex_a8=y
>  BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_16=y
> -BR2_TARGET_GENERIC_GETTY_PORT="ttyO0"
>  BR2_SYSTEM_DHCP="eth0"
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/grinn/chiliboard/post-image.sh"
>  BR2_LINUX_KERNEL=y
> 
