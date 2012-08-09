From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Aug 2012 10:23:51 +0200
Subject: [Buildroot] [PATCH] uboot: add AIS binary target format
In-Reply-To: <1344474253-19265-1-git-send-email-vivien.didelot@savoirfairelinux.com>
References: <1344474253-19265-1-git-send-email-vivien.didelot@savoirfairelinux.com>
Message-ID: <20120809102351.6491fb52@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Wed,  8 Aug 2012 21:04:13 -0400,
Vivien Didelot <vivien.didelot@savoirfairelinux.com> a ?crit :

> This format embeds the SPL boot code with U-Boot, which is necessary
> on TI platforms such as the DA850.
> 
> Signed-off-by: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
> ---
>  boot/uboot/Config.in | 3 +++
>  boot/uboot/uboot.mk  | 3 +++
>  2 files changed, 6 insertions(+)
> 
> diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
> index afc2f91..7f4b076 100644
> --- a/boot/uboot/Config.in
> +++ b/boot/uboot/Config.in
> @@ -80,6 +80,9 @@ endif
>  choice
>  	prompt "U-Boot binary format"
>  

Could you add a 'default BR2_TARGET_UBOOT_FORM_BIN' here, so that even
though u-boot.bin is no longer the first choice (and therefore the
default one), it remains the one selected by default?

> +config BR2_TARGET_UBOOT_FORMAT_AIS
> +	bool "u-boot.ais"
> +

Could you add a help text that mentions which platforms use this
format? For newcomers, it's not necessarily easy to find which image
format they should use, especially amongst the numerous SoC-specific
formats.

Otherwise, looks good, thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
