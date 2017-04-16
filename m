From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sun, 16 Apr 2017 16:29:04 +0200
Subject: [Buildroot] [PATCH v2] package/uclibc: Enable wordexp
	functionality
In-Reply-To: <20170321160237.31058-2-andriy.shevchenko@linux.intel.com>
References: <20170321160237.31058-1-andriy.shevchenko@linux.intel.com>
 <20170321160237.31058-2-andriy.shevchenko@linux.intel.com>
Message-ID: <20170416142904.GB11446@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
Andy Shevchenko wrote,

> The commit d7c54cb0c0cf ("bluez5_utils: not available with uClibc")
> disables bluez5_utils (most of them) to be built with uClibc. Looking to
> the development of BlueZ user space support that commit basically makes
> the bluez5_utils package somewhat piece of junk. Since bluez5_utils 5.44
> deprecates all previously used tools and focuses on btmgmt and
> bluetoothctl we need to restore status quo.
> 
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  package/uclibc/uClibc-ng.config | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/uclibc/uClibc-ng.config b/package/uclibc/uClibc-ng.config
> index 528bce965..91082975e 100644
> --- a/package/uclibc/uClibc-ng.config
> +++ b/package/uclibc/uClibc-ng.config
> @@ -32,6 +32,7 @@ UCLIBC_HAS_GLIBC_CUSTOM_STREAMS=y
>  UCLIBC_HAS_PRINTF_M_SPEC=y
>  # UCLIBC_HAS_REGEX_OLD is not set
>  # UCLIBC_HAS_FNMATCH_OLD is not set
> +UCLIBC_HAS_WORDEXP=y
>  UCLIBC_HAS_NFTW=y
>  UCLIBC_HAS_FTW=y
>  UCLIBC_HAS_GNU_GLOB=y

Acked-by: Waldemar Brodkorb <wbx@openadk.org>

I would like to see it included.

best regards
 Waldemar
