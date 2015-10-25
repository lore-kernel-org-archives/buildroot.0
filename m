From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 25 Oct 2015 17:11:15 +0100
Subject: [Buildroot] [PATCH v5 22/36] package/efl/libelementary: add
 host package
In-Reply-To: <1445720476-21517-23-git-send-email-romain.naour@openwide.fr>
References: <1445720476-21517-1-git-send-email-romain.naour@openwide.fr>
 <1445720476-21517-23-git-send-email-romain.naour@openwide.fr>
Message-ID: <20151025161115.GT11692@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2015-10-24 23:01 +0200, Romain Naour spake thusly:
> elm_prefs_cc builded for the host machine is
> needed to cross-compile correctly libelementary
> for the target. Otherwise, elm_prefs_cc for the
> target is used on the host machine.

Then,  either:
  - this should be folded in the previous patch, or
  - this should come berore the previous patch.

In which case you can keep my:
    Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

in that previous patch and add it to this one.

Regards,
Yann E. MORIN.

> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> ---
> v4: use libefl
>     reword the commit message
> ---
>  package/efl/libelementary/libelementary.mk | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/package/efl/libelementary/libelementary.mk b/package/efl/libelementary/libelementary.mk
> index a2c4a60..4ba8681 100644
> --- a/package/efl/libelementary/libelementary.mk
> +++ b/package/efl/libelementary/libelementary.mk
> @@ -12,14 +12,26 @@ LIBELEMENTARY_LICENSE_FILES = COPYING
>  
>  LIBELEMENTARY_INSTALL_STAGING = YES
>  
> -LIBELEMENTARY_DEPENDENCIES = host-pkgconf host-libefl libefl
> +LIBELEMENTARY_DEPENDENCIES = host-pkgconf host-libefl host-libelementary libefl
>  
>  LIBELEMENTARY_CONF_OPTS = \
>  	--with-edje-cc=$(HOST_DIR)/usr/bin/edje_cc \
>  	--with-eet-eet=$(HOST_DIR)/usr/bin/eet \
>  	--with-eolian-gen=$(HOST_DIR)/usr/bin/eolian_gen \
>  	--with-eldbus_codegen=$(HOST_DIR)/usr/bin/eldbus-codegen \
> +	--with-elm-prefs-cc=$(HOST_DIR)/usr/bin/elm_prefs_cc \
> +	--with-doxygen=no \
> +	--disable-elementary-test
> +
> +# We need a host package in order to provide elm_prefs_cc and
> +# elementary_codegen.
> +HOST_LIBELEMENTARY_DEPENDENCIES = host-pkgconf host-libefl
> +HOST_LIBELEMENTARY_CONF_OPTS = \
> +	--with-edje-cc=$(HOST_DIR)/usr/bin/edje_cc \
> +	--with-eet-eet=$(HOST_DIR)/usr/bin/eet \
> +	--with-eolian-gen=$(HOST_DIR)/usr/bin/eolian_gen \
>  	--with-doxygen=no \
>  	--disable-elementary-test
>  
>  $(eval $(autotools-package))
> +$(eval $(host-autotools-package))
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
