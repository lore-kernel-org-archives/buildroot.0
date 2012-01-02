From: Alexandre Belloni <abelloni@adeneo-embedded.com>
Date: Mon, 02 Jan 2012 17:09:49 +0100
Subject: [Buildroot] [git commit] u-boot: remove 2010.x versions,
 deprecate 2011.03 / 2011.06
In-Reply-To: <20120102160217.580058FFBF@busybox.osuosl.org>
References: <20120102160217.580058FFBF@busybox.osuosl.org>
Message-ID: <1325520589.2442.5.camel@emblysd024.adetel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Isn't that breaking all the at91sam def_configs ?

I'm in the process of updating those configs to use uboot 2011.12 and
linux 3.1. But until then, I guess those won't build anymore.

On Mon, 2012-01-02 at 17:00 +0100, Peter Korsgaard wrote:

> commit: http://git.buildroot.net/buildroot/commit/?id=0c5f68a4d31c1c437fbc920c2ecdad03301fb5da
> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
> ---
>  boot/uboot/Config.in |   14 ++------------
>  1 files changed, 2 insertions(+), 12 deletions(-)
> 
> diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
> index 281a909..c8db9fb 100644
> --- a/boot/uboot/Config.in
> +++ b/boot/uboot/Config.in
> @@ -24,18 +24,11 @@ config BR2_TARGET_UBOOT_2011_09
>  
>  config BR2_TARGET_UBOOT_2011_06
>  	bool "2011.06"
> +	depends on BR2_DEPRECATED
>  
>  config BR2_TARGET_UBOOT_2011_03
>  	bool "2011.03"
> -
> -config BR2_TARGET_UBOOT_2010_12
> -	bool "2010.12"
> -
> -config BR2_TARGET_UBOOT_2010_09
> -	bool "2010.09"
> -
> -config BR2_TARGET_UBOOT_2010_06
> -	bool "2010.06"
> +	depends on BR2_DEPRECATED
>  
>  config BR2_TARGET_UBOOT_CUSTOM_TARBALL
>  	bool "Custom tarball"
> @@ -58,9 +51,6 @@ config BR2_TARGET_UBOOT_VERSION
>  	default "2011.09"	if BR2_TARGET_UBOOT_2011_09
>  	default "2011.06"	if BR2_TARGET_UBOOT_2011_06
>  	default "2011.03"	if BR2_TARGET_UBOOT_2011_03
> -	default "2010.12"	if BR2_TARGET_UBOOT_2010_12
> -	default "2010.09"	if BR2_TARGET_UBOOT_2010_09
> -	default "2010.06"	if BR2_TARGET_UBOOT_2010_06
>  	default "custom"	if BR2_TARGET_UBOOT_CUSTOM_TARBALL
>  	default $BR2_TARGET_UBOOT_CUSTOM_GIT_VERSION if BR2_TARGET_UBOOT_CUSTOM_GIT
>  
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot


-- 
Alexandre Belloni

Adeneo Embedded
Adetel Group

2, ch. du Ruisseau - 69134 Ecully, France

www.adeneo-embedded.com
 




-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120102/830a0a06/attachment.html>
