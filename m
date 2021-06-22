From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 22 Jun 2021 22:43:15 +0200
Subject: [Buildroot] [PATCH 08/15] package/apache: Move
 APACHE_FIXUP_APR_LIBTOOL to <PKG>_PER_PACKAGE_TWEAK_HOOKS
In-Reply-To: <20210621141130.48654-9-herve.codina@bootlin.com>
References: <20210621141130.48654-1-herve.codina@bootlin.com>
 <20210621141130.48654-9-herve.codina@bootlin.com>
Message-ID: <20210622204315.GL44262@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Herv?, All,

On 2021-06-21 16:11 +0200, Herve Codina spake thusly:
> APACHE_FIXUP_APR_LIBTOOL tweaks files for per package directory build.
> This is typically the kind of operation expected to be in
> <PKG>_PER_PACKAGE_TWEAK_HOOKS
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  package/apache/apache.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/apache/apache.mk b/package/apache/apache.mk
> index 7dbd1a4512..f496333174 100644
> --- a/package/apache/apache.mk
> +++ b/package/apache/apache.mk
> @@ -23,7 +23,7 @@ define APACHE_FIXUP_APR_LIBTOOL
>  	$(SED) "s@$(PER_PACKAGE_DIR)/[^/]\+/@$(PER_PACKAGE_DIR)/apache/@g" \
>  		$(STAGING_DIR)/usr/build-1/libtool
>  endef
> -APACHE_POST_CONFIGURE_HOOKS += APACHE_FIXUP_APR_LIBTOOL
> +APACHE_PER_PACKAGE_TWEAK_HOOKS += APACHE_FIXUP_APR_LIBTOOL

Same, with the variable name:

    Reviewed-by: Yann E. MORIN <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

>  endif
>  
>  APACHE_CONF_ENV= \
> -- 
> 2.31.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
