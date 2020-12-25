From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 25 Dec 2020 17:03:14 +0100
Subject: [Buildroot] [PATCH 1/1] pkg-meson: Force-disable binary
 stripping
In-Reply-To: <20201225121600.2805074-1-glex.spb@gmail.com>
References: <20201225121600.2805074-1-glex.spb@gmail.com>
Message-ID: <20201225160314.GB1640183@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gleb, All,

On 2020-12-25 12:15 +0000, Gleb Mazovetskiy spake thusly:
> In buildroot, stripping is configured and implemented globally via `BR2_STRIP_strip`.
> 
> Signed-off-by: Gleb Mazovetskiy <glex.spb@gmail.com>

Applied to master, after expanding the commit log, and switching the
host variant to stripping.

Regards,
Yann E. MORIN.

> ---
>  package/pkg-meson.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
> index 3a34ba703b..e134885d74 100644
> --- a/package/pkg-meson.mk
> +++ b/package/pkg-meson.mk
> @@ -87,6 +87,7 @@ define $(2)_CONFIGURE_CMDS
>  		--default-library=$(if $(BR2_STATIC_LIBS),static,shared) \
>  		--buildtype=$(if $(BR2_ENABLE_DEBUG),debug,release) \
>  		--cross-file=$$($$(PKG)_SRCDIR)/build/cross-compilation.conf \
> +		-Dstrip=false \
>  		-Dbuild.pkg_config_path=$$(HOST_DIR)/lib/pkgconfig \
>  		$$($$(PKG)_CONF_OPTS) \
>  		$$($$(PKG)_SRCDIR) $$($$(PKG)_SRCDIR)/build
> @@ -105,6 +106,7 @@ define $(2)_CONFIGURE_CMDS
>  		--localstatedir=$$(HOST_DIR)/var \
>  		--default-library=shared \
>  		--buildtype=release \
> +		-Dstrip=false \
>  		$$($$(PKG)_CONF_OPTS) \
>  		$$($$(PKG)_SRCDIR) $$($$(PKG)_SRCDIR)/build
>  endef
> -- 
> 2.27.0
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
