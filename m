From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 14 Mar 2021 22:37:45 +0100
Subject: [Buildroot] [PATCH v2 2/6] package/gnutls: disable package if
 binutils is affected from bug 21464
In-Reply-To: <20210310091453.23611-3-giulio.benetti@benettiengineering.com>
References: <20210310091453.23611-1-giulio.benetti@benettiengineering.com>
 <20210310091453.23611-3-giulio.benetti@benettiengineering.com>
Message-ID: <20210314223745.0ae58c68@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 10 Mar 2021 10:14:49 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> This package is affected from binutils bug 21464, since there is no
> workaround, let's disable it.
> 
> Fixes:
> http://autobuild.buildroot.net/results/ce9/ce9050a183a3f1e31cefbc4d4a6d780235466e39/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/gnutls/Config.in | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/package/gnutls/Config.in b/package/gnutls/Config.in
> index 15b930b6bd..c4fa729e71 100644
> --- a/package/gnutls/Config.in
> +++ b/package/gnutls/Config.in
> @@ -5,6 +5,7 @@ config BR2_PACKAGE_GNUTLS
>  	# gnulib requires a library that implements wctomb().
>  	# This is noticed only when linking with libgnutls.so.
>  	depends on BR2_USE_WCHAR
> +	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_21464

Not correct: there are plenty of packages that select
BR2_PACKAGE_GNUTLS.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
