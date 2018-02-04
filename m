From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 4 Feb 2018 17:15:24 +0100
Subject: [Buildroot] [PATCH 1/1] safeclib: new package
In-Reply-To: <20171217181732.13814-1-fontaine.fabrice@gmail.com>
References: <20171217181732.13814-1-fontaine.fabrice@gmail.com>
Message-ID: <20180204161524.GF2411@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabric, All,

On 2017-12-17 19:17 +0100, Fabrice Fontaine spake thusly:
> safec fork with all C11 Annex K functions
> 
> This library implements the secure C11 Annex K functions on
> top of most libc implementations, which are missing from them.
[--SNIP--]
> diff --git a/package/safeclib/safeclib.mk b/package/safeclib/safeclib.mk
> new file mode 100644
> index 0000000000..65c6621e0a
> --- /dev/null
> +++ b/package/safeclib/safeclib.mk
> @@ -0,0 +1,15 @@
> +################################################################################
> +#
> +# safeclib
> +#
> +################################################################################
> +
> +SAFECLIB_VERSION = v09102017
> +SAFECLIB_SITE = $(call github,rurban,safeclib,$(SAFECLIB_VERSION))
> +SAFECLIB_LICENSE = MIT 

Trailing space, causing chheck-package failures;

    https://gitlab.com/buildroot.org/buildroot/-/jobs/50971692

You can check locally with:
    ./utils/check-package package/safeclib/*

Regards,
Yann E. MORIN.

> +SAFECLIB_LICENSE_FILES = COPYING
> +SAFECLIB_INSTALL_STAGING = YES
> +# From git
> +SAFECLIB_AUTORECONF = YES
> +
> +$(eval $(autotools-package))
> -- 
> 2.14.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
