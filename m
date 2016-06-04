From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 4 Jun 2016 12:07:45 +0200
Subject: [Buildroot] [PATCH 3/4] package/nodejs: Update openssl to use
 NODEJS_CONF_OPTS
In-Reply-To: <1464981346-11741-3-git-send-email-martin@barkynet.com>
References: <1464981346-11741-1-git-send-email-martin@barkynet.com>
 <1464981346-11741-3-git-send-email-martin@barkynet.com>
Message-ID: <20160604100745.GC3852@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Martin, All,

On 2016-06-03 20:15 +0100, Martin Bark spake thusly:
> Signed-off-by: Martin Bark <martin@barkynet.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/nodejs/nodejs.mk | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
> index e5844b0..aff73e8 100644
> --- a/package/nodejs/nodejs.mk
> +++ b/package/nodejs/nodejs.mk
> @@ -21,6 +21,9 @@ NODEJS_CONF_OPTS = --without-snapshot \
>  
>  ifeq ($(BR2_PACKAGE_OPENSSL),y)
>  NODEJS_DEPENDENCIES += openssl
> +NODEJS_CONF_OPTS += --shared-openssl
> +else
> +NODEJS_CONF_OPTS += --without-ssl
>  endif
>  
>  ifeq ($(BR2_PACKAGE_ICU),y)
> @@ -106,7 +109,6 @@ define NODEJS_CONFIGURE_CMDS
>  		PYTHON=$(HOST_DIR)/usr/bin/python2 \
>  		$(HOST_DIR)/usr/bin/python2 ./configure \
>  		--prefix=/usr \
> -		$(if $(BR2_PACKAGE_OPENSSL),--shared-openssl,--without-ssl) \
>  		$(if $(BR2_PACKAGE_NODEJS_NPM),,--without-npm) \
>  		--dest-cpu=$(NODEJS_CPU) \
>  		$(if $(NODEJS_ARM_FP),--with-arm-float-abi=$(NODEJS_ARM_FP)) \
> -- 
> 2.7.4
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
