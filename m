From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 10 May 2012 07:45:57 -0300
Subject: [Buildroot] [PATCH 4/5] Added the gnupg package.
In-Reply-To: <1336598986-9518-4-git-send-email-stijn.souffriau@essensium.com>
References: <1336598986-9518-1-git-send-email-stijn.souffriau@essensium.com>
 <1336598986-9518-4-git-send-email-stijn.souffriau@essensium.com>
Message-ID: <8d92bd28501e62c31881e9a2bcc42cf6@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2012-05-09 18:29, Stijn Souffriau wrote:

> +++ b/package/gnupg/Config.in
> @@ -0,0 +1,12 @@
> +config BR2_PACKAGE_GNUPG
> +	bool "gnupg"
> +	select BR2_PACKAGE_LIBGPG_ERROR
> +	select BR2_PACKAGE_LIBGCRYPT
> +	select BR2_PACKAGE_LIBKSBA
> +	select BR2_PACKAGE_LIBASSUAN
> +	select BR2_PACKAGE_LIBPTH
> +	select BR2_PACKAGE_ZLIB
> +	help
> +	  GnuPG 2.0 is the new modularized version of GnuPG supporting
> OpenPGP and S/MIME
> +
> +	  http://www.gnupg.org/

depends on BR2_TOOLCHAIN_EXTERNAL_GLIBC || BR2_TOOLCHAIN_CTNG_glibc || 
BR2_TOOLCHAIN_CTNG_eglibc
Needs pth which doesn't work with uClibc.
Regards.
