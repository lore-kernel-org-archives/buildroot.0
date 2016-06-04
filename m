From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 4 Jun 2016 12:08:48 +0200
Subject: [Buildroot] [PATCH 4/4] package/nodejs: Update npm to use
 NODEJS_CONF_OPTS
In-Reply-To: <1464981346-11741-4-git-send-email-martin@barkynet.com>
References: <1464981346-11741-1-git-send-email-martin@barkynet.com>
 <1464981346-11741-4-git-send-email-martin@barkynet.com>
Message-ID: <20160604100848.GD3852@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Martin, All,

On 2016-06-03 20:15 +0100, Martin Bark spake thusly:
> Signed-off-by: Martin Bark <martin@barkynet.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

> ---
>  package/nodejs/nodejs.mk | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
> index aff73e8..f8f819f 100644
> --- a/package/nodejs/nodejs.mk
> +++ b/package/nodejs/nodejs.mk
> @@ -33,6 +33,10 @@ else
>  NODEJS_CONF_OPTS += --with-intl=none
>  endif
>  
> +ifneq ($(BR2_PACKAGE_NODEJS_NPM),y)
> +NODEJS_CONF_OPTS += --without-npm
> +endif
> +
>  # nodejs build system is based on python, but only support python-2.6 or
>  # python-2.7. So, we have to enforce PYTHON interpreter to be python2.
>  define HOST_NODEJS_CONFIGURE_CMDS
> @@ -109,7 +113,6 @@ define NODEJS_CONFIGURE_CMDS
>  		PYTHON=$(HOST_DIR)/usr/bin/python2 \
>  		$(HOST_DIR)/usr/bin/python2 ./configure \
>  		--prefix=/usr \
> -		$(if $(BR2_PACKAGE_NODEJS_NPM),,--without-npm) \
>  		--dest-cpu=$(NODEJS_CPU) \
>  		$(if $(NODEJS_ARM_FP),--with-arm-float-abi=$(NODEJS_ARM_FP)) \
>  		$(if $(NODEJS_MIPS_ARCH_VARIANT),--with-mips-arch-variant=$(NODEJS_MIPS_ARCH_VARIANT)) \

IMHO, it would have been good to also handle the remaining, arch options
with the _CONF_OPTS variable as well.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
