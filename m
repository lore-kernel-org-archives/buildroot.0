From: Paul Jones <paul@pauljones.id.au>
Date: Wed, 2 Jun 2010 17:14:18 +1000
Subject: [Buildroot] [PATCH 07/46] u-boot: remove option to
	configuredownload site
In-Reply-To: <fd8347fd9ea408c4150f9358521a5dfceca92bc4.1275343447.git.thomas.petazzoni@free-electrons.com>
References: <cover.1275343447.git.thomas.petazzoni@free-electrons.com>
	<fd8347fd9ea408c4150f9358521a5dfceca92bc4.1275343447.git.thomas.petazzoni@free-electrons.com>
Message-ID: <002101cb0223$38af8910$aa0e9b30$@pauljones.id.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> -----Original Message-----
> From: buildroot-bounces at busybox.net [mailto:buildroot-
> bounces at busybox.net] On Behalf Of Thomas Petazzoni
> Sent: Tuesday, 1 June 2010 8:08 AM
> To: buildroot at uclibc.org
> Cc: Thomas Petazzoni
> Subject: [Buildroot] [PATCH 07/46] u-boot: remove option to
> configuredownload site
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  boot/u-boot/Config.in |    4 ----
>  boot/u-boot/u-boot.mk |    2 +-
>  2 files changed, 1 insertions(+), 5 deletions(-)
> 
> diff --git a/boot/u-boot/Config.in b/boot/u-boot/Config.in index
> 49d66c4..3f4110a 100644
> --- a/boot/u-boot/Config.in
> +++ b/boot/u-boot/Config.in
> @@ -33,10 +33,6 @@ config BR2_UBOOT_VERSION
>  	default "2009.11"	if BR2_TARGET_UBOOT_2009_11
>  	default "2009.08"	if BR2_TARGET_UBOOT_2009_08
> 
> -config BR2_U_BOOT_SITE
> -	string
> -	default "ftp://ftp.denx.de/pub/u-boot"
> -
>  source "target/device/Config.in.u-boot"
> 
>  config BR2_TARGET_UBOOT_CUSTOM_PATCH
> diff --git a/boot/u-boot/u-boot.mk b/boot/u-boot/u-boot.mk index
> a875f2b..7e98ca8 100644
> --- a/boot/u-boot/u-boot.mk
> +++ b/boot/u-boot/u-boot.mk
> @@ -7,7 +7,7 @@ U_BOOT_VERSION:=$(call
> qstrip,$(BR2_UBOOT_VERSION))
> 
>  U_BOOT_SOURCE:=u-boot-$(U_BOOT_VERSION).tar.bz2
> 
> -U_BOOT_SITE:=$(call qstrip,$(BR2_U_BOOT_SITE))
> +U_BOOT_SITE:=ftp://ftp.denx.de/pub/u-boot
>  U_BOOT_DIR:=$(BUILD_DIR)/u-boot-$(U_BOOT_VERSION)
>  U_BOOT_PATCH_DIR:=$(BUILD_DIR)/u-boot-$(U_BOOT_VERSION)-patches
>  U_BOOT_CAT:=$(BZCAT)


It would be good if we could keep this feature - I'm in the process of
adding support for the Mini2440 ARM boards and there is no mainline support
for them in uboot, so buildroot needs to get uboot from
http://repo.or.cz/w/u-boot-openmoko/mini2440.git/snapshot/HEAD.tar.gz or the
git equivalent when git support is added.

I guess another way is to just put an #ifdef equivilant in u-boot.mk to
change the download location but that's a bit ugly.


Cheers,
Paul.
