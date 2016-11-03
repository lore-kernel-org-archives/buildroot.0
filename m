From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 3 Nov 2016 13:15:04 +0200
Subject: [Buildroot] [PATCH 1/2] libidn2: new package
In-Reply-To: <20161103110512.13676-2-jer@airfi.aero>
References: <20161103110512.13676-1-jer@airfi.aero>
 <20161103110512.13676-2-jer@airfi.aero>
Message-ID: <20161103111504.lawynjws2xl77twf@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Jeroen,

On Thu, Nov 03, 2016 at 12:05:11PM +0100, Jeroen Roovers wrote:
> diff --git a/package/libidn2/Config.in b/package/libidn2/Config.in
> new file mode 100644
> index 0000000..ce0a841
> --- /dev/null
> +++ b/package/libidn2/Config.in
> @@ -0,0 +1,5 @@
> +config BR2_PACKAGE_LIBIDN2
> +	bool "libidn2"
> +

A redundant empty line.

> +	help
> +	  An implementation of the IDNA2008 specifications (RFCs 5890, 5891, 5892, 5893)
> diff --git a/package/libidn2/libidn2.hash b/package/libidn2/libidn2.hash
> new file mode 100644
> index 0000000..5aedde0
> --- /dev/null
> +++ b/package/libidn2/libidn2.hash
> @@ -0,0 +1,2 @@
> +# Calculated locally after checking signature
> +sha256  3d301890bdbb137424f5ea495f82730a4b85b6a2549e47de3a34afebeac3e0e3  libidn2-0.10.tar.gz
> diff --git a/package/libidn2/libidn2.mk b/package/libidn2/libidn2.mk
> new file mode 100644
> index 0000000..7adc1d8
> --- /dev/null
> +++ b/package/libidn2/libidn2.mk
> @@ -0,0 +1,12 @@
> +################################################################################
> +#
> +# libidn2
> +#
> +################################################################################
> +
> +LIBIDN2_VERSION = 0.10

Why not version 0.11?

> +LIBIDN2_SITE = ftp://alpha.gnu.org/gnu/libidn
> +LIBIDN2_SOURCE = libidn2-$(LIBIDN2_VERSION).tar.gz

This is the default.

> +LIBIDN2_INSTALL_STAGING = YES
> +
> +$(eval $(autotools-package))

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
