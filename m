From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 9 Mar 2020 22:07:06 +0100
Subject: [Buildroot] [PATCH/next 4/6] package/belle-sip: new package
In-Reply-To: <20200227174714.3727844-4-fontaine.fabrice@gmail.com>
References: <20200227174714.3727844-1-fontaine.fabrice@gmail.com>
 <20200227174714.3727844-4-fontaine.fabrice@gmail.com>
Message-ID: <20200309220706.270f81c0@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 27 Feb 2020 18:47:12 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> diff --git a/package/belle-sip/Config.in b/package/belle-sip/Config.in
> new file mode 100644
> index 0000000000..96b89d1627
> --- /dev/null
> +++ b/package/belle-sip/Config.in
> @@ -0,0 +1,20 @@
> +config BR2_PACKAGE_BELLE_SIP
> +	bool "belle-sip"
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on !BR2_STATIC_LIBS # dlfcn.h
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # bctoolbox
> +	depends on BR2_USE_WCHAR
> +	select BR2_PACKAGE_BCTOOLBOX

	select BR2_PACKAGE_MBEDTLS

was needed here, as belle-sip requires crypto support in bctoolbox.

I've added that and applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
