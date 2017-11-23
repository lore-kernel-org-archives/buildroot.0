From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Nov 2017 21:43:18 +0100
Subject: [Buildroot] [PATCH 1/1] libupnp18: new package
In-Reply-To: <20171118202440.28645-1-fontaine.fabrice@gmail.com>
References: <20171118202440.28645-1-fontaine.fabrice@gmail.com>
Message-ID: <20171123214318.72a8901d@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 18 Nov 2017 21:24:40 +0100, Fabrice Fontaine wrote:
> Branch 1.8.x of libupnp is not compatible with branch 1.6.x so add a
> dedicated package and make it depends on !BR2_PACKAGE_LIBUPNP as
> suggested by Thomas Petazzoni and Arnout Vandecappelle during review
> of "libupnp: add 1.8.3 version" patch.
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Thanks, I've applied to next, with one minor tweak.

> diff --git a/package/libupnp18/Config.in b/package/libupnp18/Config.in
> new file mode 100644
> index 000000000..80ac59542
> --- /dev/null
> +++ b/package/libupnp18/Config.in
> @@ -0,0 +1,15 @@
> +config BR2_PACKAGE_LIBUPNP18
> +	bool "libupnp18"
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on !BR2_PACKAGE_LIBUPNP
> +	help
> +	  The portable SDK for UPnP(tm) Devices (libupnp) provides
> +	  developers with an API and open source code for building
> +	  control points, devices, and bridges that are compliant with
> +	  Version 1.0 of the Universal Plug and Play Device Architecture
> +	  Specification
> +
> +	  http://pupnp.sourceforge.net/
> +
> +comment "libupnp18 needs a toolchain w/ threads"
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS

I've added:

	depends on !BR2_PACKAGE_LIBUPNP

otherwise the Config.in comment would appear even if libupnp18 is not
selectable.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
