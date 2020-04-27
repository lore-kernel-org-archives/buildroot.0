From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 27 Apr 2020 17:51:09 +0200
Subject: [Buildroot] [V2 PATCH 1/1] cukinia: new package
In-Reply-To: <20200427080525.617-2-shyam.saini@savoirfairelinux.com>
References: <20200427080525.617-1-shyam.saini@savoirfairelinux.com>
 <20200427080525.617-2-shyam.saini@savoirfairelinux.com>
Message-ID: <20200427175109.04345be6@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Shyam,

On Mon, 27 Apr 2020 13:35:25 +0530
Shyam Saini <mayhs11saini@gmail.com> wrote:

> diff --git a/package/cukinia/Config.in b/package/cukinia/Config.in
> new file mode 100644
> index 000000000000..003e6110b12b
> --- /dev/null
> +++ b/package/cukinia/Config.in
> @@ -0,0 +1,15 @@
> +config BR2_PACKAGE_CUKINIA
> +	bool "cukinia"
> +	depends on BR2_PACKAGE_BUSYBOX || BR2_PACKAGE_GAWK

I think it would make sense to use instead:

	select BR2_PACKAGE_GAWK if !BR2_PACKAGE_BUSYBOX

here.

> diff --git a/package/cukinia/cukinia.conf b/package/cukinia/cukinia.conf
> new file mode 100644
> index 000000000000..3ac34e72cf0b
> --- /dev/null
> +++ b/package/cukinia/cukinia.conf

I don't think installing this example configuration file is really
useful. It's very use case specific. Users should just check the
documentation of cukinia if they want some examples.

Otherwise, looks good to me.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
