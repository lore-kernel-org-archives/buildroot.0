From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 25 Oct 2015 16:11:36 +0100
Subject: [Buildroot] [PATCH v5 16/36] package/efl/libefl: enable
	xinput2.2
In-Reply-To: <1445720476-21517-17-git-send-email-romain.naour@openwide.fr>
References: <1445720476-21517-1-git-send-email-romain.naour@openwide.fr>
 <1445720476-21517-17-git-send-email-romain.naour@openwide.fr>
Message-ID: <20151025151136.GN11692@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2015-10-24 23:00 +0200, Romain Naour spake thusly:
> X11 XInput v2.2+ support is one of the recommended
> feature for the efl libraries:
> https://git.enlightenment.org/core/efl.git/tree/README?h=efl-1.15#n490
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> ---
> v4: rename to libefl
>     improve commit log
> v3: new patch
> ---
>  package/efl/libefl/libefl.mk | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/package/efl/libefl/libefl.mk b/package/efl/libefl/libefl.mk
> index e275699..02c9005 100644
> --- a/package/efl/libefl/libefl.mk
> +++ b/package/efl/libefl/libefl.mk
> @@ -173,10 +173,12 @@ else
>  LIBEFL_CONF_OPTS += --enable-fb=no
>  endif
>  
> +# --enable-xinput22 is recommended
>  ifeq ($(BR2_PACKAGE_LIBEFL_X),y)
>  LIBEFL_CONF_OPTS += --with-x=$(STAGING_DIR) \
>  	--x-includes=$(STAGING_DIR)/usr/include \
> -	--x-libraries=$(STAGING_DIR)/usr/lib
> +	--x-libraries=$(STAGING_DIR)/usr/lib \
> +	--enable-xinput22

xinput22 needs xlib_libXi.

Also, you may also want to explicitly enable (or disable?) xinput2.

Regards,
Yann E. MORIN.

>  LIBEFL_DEPENDENCIES += \
>  	xlib_libX11 \
> -- 
> 2.4.3
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
