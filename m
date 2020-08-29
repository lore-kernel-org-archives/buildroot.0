From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 29 Aug 2020 13:48:37 +0200
Subject: [Buildroot] [PATCH v4 1/1] package/easyframes: new package
In-Reply-To: <20200829072416.951156-1-horatiu.vultur@microchip.com>
References: <20200829072416.951156-1-horatiu.vultur@microchip.com>
Message-ID: <20200829134837.5ffbc3d0@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 29 Aug 2020 09:24:16 +0200
Horatiu Vultur via buildroot <buildroot@busybox.net> wrote:

> Signed-off-by: Horatiu Vultur <horatiu.vultur@microchip.com>

Thanks, I've applied to next, with a few changes, see below.

> diff --git a/package/easyframes/Config.in b/package/easyframes/Config.in
> new file mode 100644
> index 0000000000..f3a4ddbb34
> --- /dev/null
> +++ b/package/easyframes/Config.in
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_EASYFRAMES
> +	bool "easyframes"
> +	select BR2_PACKAGE_LIBPCAP
> +	help
> +	  This is a small and simple command-line tool for network testing.
> +	  The tool makes it simple to compose a frame, inject and express what
> +	  and where frames are expected to be received.

These lines were too long, so I wrapped them.

> +################################################################################
> +#
> +# easyframes
> +#
> +################################################################################
> +
> +EASYFRAMES_VERSION = v0.3
> +EASYFRAMES_SITE = $(call github,microchip-ung,easyframes,$(EASYFRAMES_VERSION))

I changed this so that the version is just 0.3. Indeed, we want our
_VERSION variable to not have any "v" prefix, so that its value can be
matched against what release-monitoring.org is reporting for upstream
projects.

> +EASYFRAMES_INSTALL_STAGING = YES

I dropped this line, since easyframes does not install a library.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
