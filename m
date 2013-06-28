From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 27 Jun 2013 21:59:23 -0300
Subject: [Buildroot] [RFC v3 1/1] ti-gfx: add new package
In-Reply-To: <1372373766-23735-1-git-send-email-spenser@gillilanding.com>
References: <1372373766-23735-1-git-send-email-spenser@gillilanding.com>
Message-ID: <51CCDFEB.6070805@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/27/2013 07:56 PM, Spenser Gilliland wrote:
> --- /dev/null
> +++ b/package/ti-gfx/Config.in
> @@ -0,0 +1,64 @@
> +config BR2_PACKAGE_TI_GFX
> +	bool "ti-gfx"
> +	select BR2_PACKAGE_HAS_OPENGL_EGL
> +	select BR2_PACKAGE_HAS_OPENGL_ES
> +	depends on BR2_LINUX_KERNEL && (BR2_TOOLCHAIN_EXTERNAL_GLIBC || \
> +		BR2_TOOLCHAIN_CTNG_eglibc || BR2_TOOLCHAIN_CTNG_glibc)
> +	help
> +	  Graphics libraries for TI boards.
> +
> +	  http://downloads.ti.com/dsps/dsps_public_sw/gfxsdk/

depends on BR2_arm might be suitable here to avoid unnecessary noise and
failures.

I'll give it a spin on omap35xx once i kick my mutant beagle back into
working order.
Regards.
