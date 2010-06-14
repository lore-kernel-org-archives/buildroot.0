From: Jonathan dumaresq <jdumaresq@cimeq.qc.ca>
Date: Mon, 14 Jun 2010 09:51:53 -0400
Subject: [Buildroot] [PATCH 05/49] u-boot: remove ancient versions
In-Reply-To: <4cbd9ed6131651f029fcc93deecf6e9b9ac9a6a5.1276352308.git.thomas.petazzoni@free-electrons.com>
References: <cover.1276352307.git.thomas.petazzoni@free-electrons.com>
	<4cbd9ed6131651f029fcc93deecf6e9b9ac9a6a5.1276352308.git.thomas.petazzoni@free-electrons.com>
Message-ID: <B4E78A8571BC4BAE91ACD7035DAA005A@cimeq.ca>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Like I already said, removing the 2008.10 version will broke the atngw100
target and stk1000 too. I wonder if we can use the GIT version of Haavard
Skinnemoen directly. I have not use it and tested it but this tree should
work. 
I think only this patch is needed to get the atngw100 bord working

http://git.denx.de/?p=u-boot/u-boot-avr32.git;a=commit;h=fc3174ef4dc5a90d528
58e37505c51573fc3cfe3

Again I couldn't confirm it. 

Jonathan

buildroot-bounces at busybox.net wrote:
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  boot/u-boot/Config.in |   26 --------------------------
>  1 files changed, 0 insertions(+), 26 deletions(-)
> 
> diff --git a/boot/u-boot/Config.in b/boot/u-boot/Config.in index
> b07e67c..49d66c4 100644 --- a/boot/u-boot/Config.in
> +++ b/boot/u-boot/Config.in
> @@ -25,26 +25,6 @@ config BR2_TARGET_UBOOT_2009_11  config
>  	BR2_TARGET_UBOOT_2009_08 bool "u-boot-2009.08"
> 
> -config BR2_TARGET_UBOOT_2009_06
> -	bool "u-boot-2009.06"
> -	depends on BR2_DEPRECATED
> -
> -config BR2_TARGET_UBOOT_2009_03
> -	bool "u-boot-2009.03"
> -	depends on BR2_DEPRECATED
> -
> -config BR2_TARGET_UBOOT_2009_01
> -	bool "u-boot-2009.01"
> -	depends on BR2_DEPRECATED
> -
> -config BR2_TARGET_UBOOT_2008_10
> -	bool "u-boot-2008.10"
> -	depends on BR2_DEPRECATED
> -
> -config BR2_TARGET_UBOOT_1_2_0_ATMEL
> -	bool "u-boot-1.2.0-atmel"
> -	depends on BR2_TARGET_AT91
> -
>  endchoice
> 
>  config BR2_UBOOT_VERSION
> @@ -52,15 +32,9 @@ config BR2_UBOOT_VERSION
>  	default "2010.03"	if BR2_TARGET_UBOOT_2010_03
>  	default "2009.11"	if BR2_TARGET_UBOOT_2009_11
>  	default "2009.08"	if BR2_TARGET_UBOOT_2009_08
> -	default "2009.06"	if BR2_TARGET_UBOOT_2009_06
> -	default "2009.03"	if BR2_TARGET_UBOOT_2009_03
> -	default "2009.01"	if BR2_TARGET_UBOOT_2009_01
> -	default "2008.10"	if BR2_TARGET_UBOOT_2008_10
> -	default "1.2.0-atmel"	if BR2_TARGET_UBOOT_1_2_0_ATMEL
> 
>  config BR2_U_BOOT_SITE
>  	string
> -	default "$(BR2_ATMEL_MIRROR)"		if
BR2_TARGET_UBOOT_1_2_0_ATMEL
>  	default "ftp://ftp.denx.de/pub/u-boot"
> 
>  source "target/device/Config.in.u-boot"
> --
> 1.7.0.4
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
