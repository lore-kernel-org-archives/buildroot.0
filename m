From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 25 Oct 2015 15:22:50 +0100
Subject: [Buildroot] [PATCH v5 06/36] package/efl/libefl: add harfbuzz
 dependency
In-Reply-To: <1445720476-21517-7-git-send-email-romain.naour@openwide.fr>
References: <1445720476-21517-1-git-send-email-romain.naour@openwide.fr>
 <1445720476-21517-7-git-send-email-romain.naour@openwide.fr>
Message-ID: <20151025142250.GC11692@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2015-10-24 23:00 +0200, Romain Naour spake thusly:
> Harfbuzz allow to enable complex text shaping and layouting
> support in efl libraries.
> 
> Also, it one of the "highly recommended" dependecies
> according to the README but disabling it doesn't need
> the --enable-i-really-know-what-i-am-doing... option.
> That's why harfbuzz is not added to
> BR2_PACKAGE_LIBEFL_RECOMMENDED_CONFIG.
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
> v4: rename to libefl
>     improve commit log.
> ---
>  package/efl/libefl/libefl.mk | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/package/efl/libefl/libefl.mk b/package/efl/libefl/libefl.mk
> index 609ae6a..2e42bb7 100644
> --- a/package/efl/libefl/libefl.mk
> +++ b/package/efl/libefl/libefl.mk
> @@ -117,6 +117,13 @@ endif
>  # There is no alsa support yet in Ecore_Audio.
>  # configure will disable alsa support even if alsa-lib is selected.
>  
> +ifeq ($(BR2_PACKAGE_HARFBUZZ),y)
> +LIBEFL_DEPENDENCIES += harfbuzz
> +LIBEFL_CONF_OPTS += --enable-harfbuzz=yes
> +else
> +LIBEFL_CONF_OPTS += --enable-harfbuzz=no
> +endif
> +
>  ifeq ($(BR2_PACKAGE_TSLIB),y)
>  LIBEFL_DEPENDENCIES += tslib
>  LIBEFL_CONF_OPTS += --enable-tslib
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
