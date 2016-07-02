From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 2 Jul 2016 11:52:29 +0200
Subject: [Buildroot] [PATCH 06/12] reproducibility/libgcrypt: override
 timestamps
In-Reply-To: <1465918277-30675-6-git-send-email-gilles.chanteperdrix@xenomai.org>
References: <20160614152928.GH3060@hermes.click-hack.org>
 <1465918277-30675-1-git-send-email-gilles.chanteperdrix@xenomai.org>
 <1465918277-30675-6-git-send-email-gilles.chanteperdrix@xenomai.org>
Message-ID: <20160702095229.GF22343@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gilles, All,

On 2016-06-14 17:31 +0200, Gilles Chanteperdrix spake thusly:
> with SOURCE_DATE_EPOCH
> 
> Signed-off-by: Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org>
> ---
>  package/libgcrypt/libgcrypt.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/libgcrypt/libgcrypt.mk b/package/libgcrypt/libgcrypt.mk
> index 7c27a22..89fe6a0 100644
> --- a/package/libgcrypt/libgcrypt.mk
> +++ b/package/libgcrypt/libgcrypt.mk
> @@ -18,6 +18,10 @@ LIBGCRYPT_CONF_ENV = \
>  LIBGCRYPT_CONF_OPTS = \
>  	--with-gpg-error-prefix=$(STAGING_DIR)/usr
>  
> +ifeq ($(BR2_REPRODUCIBLE),y)
> +LIBGCRYPT_MAKE_OPTS = BUILD_TIMESTAMP=$(SOURCE_DATE)
                                           ^^^^^^^^^^^

You probably meant SOURCE_DATE_EPOCH here, right?

Regards,
Yann E. MORIN.

> +endif
> +
>  # Code doesn't build in thumb mode
>  ifeq ($(BR2_arm),y)
>  LIBGCRYPT_CONF_ENV += CFLAGS="$(patsubst -mthumb,,$(TARGET_CFLAGS))"
> -- 
> 2.8.2
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
