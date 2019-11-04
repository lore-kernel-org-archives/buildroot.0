From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 4 Nov 2019 22:05:13 +0100
Subject: [Buildroot] [PATCH] package/modem-manager: use libqmi and
 libmbim if they are selected
In-Reply-To: <20191104124844.8112-1-unixmania@gmail.com>
References: <20191104124844.8112-1-unixmania@gmail.com>
Message-ID: <20191104220513.5e8c6269@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Adding our Config.in.legacy expert Arnout.

On Mon,  4 Nov 2019 09:48:44 -0300
unixmania at gmail.com wrote:

> diff --git a/Config.in.legacy b/Config.in.legacy
> index fcb10b1291..3336ef85d1 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -146,6 +146,22 @@ endif
>  
>  comment "Legacy options removed in 2019.11"
>  
> +config BR2_PACKAGE_MODEM_MANAGER_LIBMBIM
> +	bool "BR2_PACKAGE_MODEM_MANAGER_LIBMBIM has been removed"
> +	select BR2_LEGACY
> +	select BR2_PACKAGE_LIBMBIM
> +	help
> +	  Select BR2_PACKAGE_LIBMBIM to enable support for MBIM protocol
> +	  in ModemManager
> +
> +config BR2_PACKAGE_MODEM_MANAGER_LIBQMI
> +	bool "BR2_PACKAGE_MODEM_MANAGER_LIBQMI has been removed"
> +	select BR2_LEGACY
> +	select BR2_PACKAGE_LIBQMI
> +	help
> +	  Select BR2_PACKAGE_LIBQMI to enable support for QMI protocol
> +	  in ModemManager

I think in this specific case, we don't need Config.in.legacy handling.
Indeed, a full .config that had BR2_PACKAGE_MODEM_MANAGER_LIBQMI
enabled will already have BR2_PACKAGE_LIBQMI, and since the .mk file
now relies on BR2_PACKAGE_LIBQMI to enable libqmi support in
modem-manager, I think we're good.

Of course, that won't work for defconfigs, but I believe updating with
a defconfig is not really guaranteed to give the right result. Arnout ?

Other than that, patch looks good to me. No need to resend, let's just
wait to see what Arnout says about the Config.in.legacy handling.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
