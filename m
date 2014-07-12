From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 12 Jul 2014 19:16:08 +0200
Subject: [Buildroot] [PATCH] libgpgme: disable all tests
In-Reply-To: <1405170481-18028-1-git-send-email-gustavo@zacarias.com.ar>
References: <1405170481-18028-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140712171608.GC3582@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On 2014-07-12 10:08 -0300, Gustavo Zacarias spake thusly:
> Disable all of the tests, including runtime that needs gnupg.
> There's no longer --without configure options for them, it's now
> --disable. Fixes:
> http://autobuild.buildroot.net/results/eb1/eb1e06b1d99c441b6086c07ee04b084a61041dc7/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/libgpgme/libgpgme.mk | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libgpgme/libgpgme.mk b/package/libgpgme/libgpgme.mk
> index c06d713..43d7484 100644
> --- a/package/libgpgme/libgpgme.mk
> +++ b/package/libgpgme/libgpgme.mk
> @@ -16,9 +16,10 @@ LIBGPGME_DEPENDENCIES = libassuan libgpg-error
>  LIBGPGME_CONF_OPT = --with-gpg=/usr/bin/gpg \
>  	--with-gpg-error-prefix=$(STAGING_DIR)/usr \
>  	--with-libassuan-prefix=$(STAGING_DIR)/usr \
> -	--without-gpgsm \
> -	--without-gpgconf \
> -	--without-g13
> +	--disable-gpgsm-test \
> +	--disable-gpgconf-test \
> +	--disable-g13-test \
> +	--disable-gpg-test
>  
>  # Handle argp-standalone or it errors out during build
>  ifeq ($(BR2_PACKAGE_ARGP_STANDALONE)$(BR2_TOOLCHAIN_USES_UCLIBC),yy)
> -- 
> 1.8.5.5
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
