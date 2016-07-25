From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 25 Jul 2016 08:14:04 +0200
Subject: [Buildroot] [PATCH] package/pflash: new package
References: <1469426487-19558-1-git-send-email-joel@jms.id.au>
Message-ID: <cang6dxeas.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Am Mon, 25 Jul 2016 15:31:27 +0930 schrieb Joel Stanley:

> diff --git a/package/pflash/Config.in b/package/pflash/Config.in
> new file mode 100644
> index 000000000000..315989724088
> --- /dev/null
> +++ b/package/pflash/Config.in
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_PFLASH
> +	bool "pflash"
> +	depends on BR2_arm || BR2_powerpc64 || BR2_powerpc64le || BR2_x86_64
> +	help
> +	  PNOR Flash reading and writing tool for OpenPower servers. Used for
> +	  firmware upgrades and extracting diagnostic infromation from flash.

please add 

         https://github.com/open-power/skiboot

to the help text.

> diff --git a/package/pflash/pflash.mk b/package/pflash/pflash.mk
> new file mode 100644
> index 000000000000..ab19ad699866
> --- /dev/null
> +++ b/package/pflash/pflash.mk
> @@ -0,0 +1,32 @@
> +################################################################################
> +#
> +# pflash
> +#
> +################################################################################
> +
> +PFLASH_VERSION = skiboot-5.2.4
> +

no newline here.

> +PFLASH_SITE = $(call github,open-power,skiboot,$(PFLASH_VERSION))
> +PFLASH_INSTALL_STAGING = YES

Do other packages need header files from pflash? If not, it is
not necessary to install the package to staging.

Regards, Bernd
