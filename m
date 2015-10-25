From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 25 Oct 2015 13:31:45 +0100
Subject: [Buildroot] [PATCH v5 11/36] package/efl/libefl: add frame
 buffer config option
In-Reply-To: <1445720476-21517-12-git-send-email-romain.naour@openwide.fr>
References: <1445720476-21517-1-git-send-email-romain.naour@openwide.fr>
 <1445720476-21517-12-git-send-email-romain.naour@openwide.fr>
Message-ID: <20151025123145.GA3665@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2015-10-24 23:00 +0200, Romain Naour spake thusly:
> Add an config option to enable frame buffer support
> in the efl libraries.
> 
> From the README [1]:
> This requires linux frame-buffer support, headers etc. This supports
> basic frame-buffers like /dev/fb as well as input via /dev/input for
> keyboards and mice in a basic way.
> 
> [1] https://git.enlightenment.org/core/efl.git/tree/README?id=v1.15.2#n521
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
> v4: rename to libefl
>     improve commit log
> ---
>  package/efl/libefl/Config.in | 5 +++++
>  package/efl/libefl/libefl.mk | 6 ++++++
>  2 files changed, 11 insertions(+)
> 
> diff --git a/package/efl/libefl/Config.in b/package/efl/libefl/Config.in
> index c72ea7e..e25911f 100644
> --- a/package/efl/libefl/Config.in
> +++ b/package/efl/libefl/Config.in
> @@ -37,6 +37,11 @@ config BR2_PACKAGE_LIBEFL_RECOMMENDED_CONFIG
>  	  otherwise we need to add a very long and obscure option
>  	  to start the build.
>  
> +comment "libecore video support"
> +
> +config BR2_PACKAGE_LIBEFL_FB
> +	bool "libecore framebuffer support"
> +
>  comment "libevas loaders"
>  
>  config BR2_PACKAGE_LIBEFL_PNG
> diff --git a/package/efl/libefl/libefl.mk b/package/efl/libefl/libefl.mk
> index 9633630..3a4aab1 100644
> --- a/package/efl/libefl/libefl.mk
> +++ b/package/efl/libefl/libefl.mk
> @@ -166,6 +166,12 @@ else
>  LIBEFL_CONF_OPTS += --enable-wayland=no
>  endif
>  
> +ifeq ($(BR2_PACKAGE_LIBEFL_FB),y)
> +LIBEFL_CONF_OPTS += --enable-fb=yes
> +else
> +LIBEFL_CONF_OPTS += --enable-fb=no
> +endif
> +
>  # image loader: handle only loaders that requires dependencies.
>  # All other loaders are builded by default statically.
>  ifeq ($(BR2_PACKAGE_LIBEFL_PNG),y)
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
