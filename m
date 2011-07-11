From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 11 Jul 2011 21:43:47 +0200
Subject: [Buildroot] [PATCH 08/12] Add x-loader bootloader
In-Reply-To: <a50f6419bfba04ed1c24b23be18752b12c951c7d.1310392269.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Mon, 11 Jul 2011 15:53:52 +0200")
References: <cover.1310392269.git.thomas.petazzoni@free-electrons.com>
 <cover.1310392269.git.thomas.petazzoni@free-electrons.com>
 <a50f6419bfba04ed1c24b23be18752b12c951c7d.1310392269.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87ei1wli18.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> From: Philippe Reynes <tremyfr@yahoo.fr>
 Thomas> Signed-off-by: Philippe Reynes <tremyfr@yahoo.fr>
 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

 Thomas> merge xloader

A bit more info would be good. There seem to be quite a few xloader
trees around. Is this the best choice for omap3, omap4, .. ?


 Thomas> ---
 Thomas>  boot/Config.in          |    1 +
 Thomas>  boot/xloader/Config.in  |   15 +++++++++++++++
 Thomas>  boot/xloader/xloader.mk |   37 +++++++++++++++++++++++++++++++++++++
 Thomas>  3 files changed, 53 insertions(+), 0 deletions(-)
 Thomas>  create mode 100644 boot/xloader/Config.in
 Thomas>  create mode 100644 boot/xloader/xloader.mk

 Thomas> diff --git a/boot/Config.in b/boot/Config.in
 Thomas> index 67adae8..2a97695 100644
 Thomas> --- a/boot/Config.in
 Thomas> +++ b/boot/Config.in
 Thomas> @@ -6,6 +6,7 @@ source "boot/syslinux/Config.in"
 Thomas>  source "boot/uboot/Config.in"
 Thomas>  source "boot/at91bootstrap/Config.in"
 Thomas>  source "boot/at91dataflashboot/Config.in"
 Thomas> +source "boot/xloader/Config.in"
 
 Thomas>  endmenu
 
 Thomas> diff --git a/boot/xloader/Config.in b/boot/xloader/Config.in
 Thomas> new file mode 100644
 Thomas> index 0000000..fe9a20c
 Thomas> --- /dev/null
 Thomas> +++ b/boot/xloader/Config.in
 Thomas> @@ -0,0 +1,15 @@
 Thomas> +menuconfig BR2_TARGET_XLOADER
 Thomas> +	bool "X-loader"
 Thomas> +	depends on BR2_arm

This could be more explicit like BR2_cortex_a8 || BR2_cortex_a9 I
believe.

 Thomas> +	help
 Thomas> +	  The x-loader bootloader. It is mainly used on OMAP-based
 Thomas> +	  platforms.
 Thomas> +
 Thomas> +if BR2_TARGET_XLOADER
 Thomas> +config BR2_TARGET_XLOADER_BOARDNAME
 Thomas> +	string "x-loader board name"
 Thomas> +	help
 Thomas> +	  One of x-loader supported boards to be built.
 Thomas> +	  This will be suffixed with _config to meet x-loader
 Thomas> +	  standard naming.
 Thomas> +endif

Perhaps we should add a custom git location option like for u-boot /
linux.

Otherwise it looks good.

-- 
Bye, Peter Korsgaard
