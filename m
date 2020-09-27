From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 27 Sep 2020 09:34:57 +0200
Subject: [Buildroot] [PATCH v2 1/3] package/pkg-meson.mk: fix generation
 of pkg_config_static prop
In-Reply-To: <20200915100546.806157-1-nolange79@gmail.com>
References: <20200915100546.806157-1-nolange79@gmail.com>
Message-ID: <20200927073457.GH11621@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Norbert, All,

On 2020-09-15 12:05 +0200, Norbert Lange spake thusly:
> fixes following in the generated cross-complation.conf file:
> pkg_config_static = '$(if $(BR2_STATIC_LIBS),true,false)'
> 
> Signed-off-by: Norbert Lange <nolange79@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> v1->v2:
> -   truly fix the issue, missed one double $
> ---
>  package/pkg-meson.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
> index c3fe6df5d0..3a34ba703b 100644
> --- a/package/pkg-meson.mk
> +++ b/package/pkg-meson.mk
> @@ -195,7 +195,7 @@ define PKG_MESON_INSTALL_CROSS_CONF
>  	    -e "s%@TARGET_CXXFLAGS@%$(call make-sq-comma-list,$(TARGET_CXXFLAGS))@PKG_TARGET_CFLAGS@%g" \
>  	    -e 's%@HOST_DIR@%$(HOST_DIR)%g' \
>  	    -e 's%@STAGING_DIR@%$(STAGING_DIR)%g' \
> -	    -e 's%@STATIC@%$$(if $$(BR2_STATIC_LIBS),true,false)%g' \
> +	    -e 's%@STATIC@%$(if $(BR2_STATIC_LIBS),true,false)%g' \
>  	    $(HOST_MESON_PKGDIR)/cross-compilation.conf.in \
>  	    > $(HOST_DIR)/etc/meson/cross-compilation.conf.in
>  	sed -e 's%@PKG_TARGET_CFLAGS@%%g' \
> -- 
> 2.28.0
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
