From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 11 Mar 2020 22:31:24 +0100
Subject: [Buildroot] [PATCH 1/1] package/pkg-meson.mk: Fix
 cross-compilation.conf
In-Reply-To: <20200311191141.16295-1-glex.spb@gmail.com>
References: <20200311105930.21564-1-glex.spb@gmail.com>
 <20200311191141.16295-1-glex.spb@gmail.com>
Message-ID: <20200311213124.GC705@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gleb, All,

On 2020-03-11 19:11 +0000, Gleb Mazovetskiy spake thusly:
> $$(STAGING_DIR) -> $(STAGING_DIR) in PKG_MESON_INSTALL_CROSS_CONF.
> 
> $$ resulted in `$(STAGING_DIR)` in the file instead of the expanded
> value.
> 
> Note that this change only affects the etc config at:
> host/etc/meson/cross-compilation.conf
> 
> Per-package cross-compilation.conf files are already correct.
> 
> Reviewed-by: Peter Seiderer <ps.report@gmx.net>
> Signed-off-by: Gleb Mazovetskiy <glex.spb@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/pkg-meson.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
> index 642b715938..416129f6fe 100644
> --- a/package/pkg-meson.mk
> +++ b/package/pkg-meson.mk
> @@ -193,7 +193,7 @@ define PKG_MESON_INSTALL_CROSS_CONF
>  	    -e 's%@TARGET_LDFLAGS@%$(call make-comma-list,$(TARGET_LDFLAGS))@PKG_TARGET_CFLAGS@%g' \
>  	    -e 's%@TARGET_CXXFLAGS@%$(call make-comma-list,$(TARGET_CXXFLAGS))@PKG_TARGET_CFLAGS@%g' \
>  	    -e 's%@HOST_DIR@%$(HOST_DIR)%g' \
> -	    -e 's%@STAGING_DIR@%$$(STAGING_DIR)%g' \
> +	    -e 's%@STAGING_DIR@%$(STAGING_DIR)%g' \
>  	    $(HOST_MESON_PKGDIR)/cross-compilation.conf.in \
>  	    > $(HOST_DIR)/etc/meson/cross-compilation.conf.in
>  	sed -e 's%@PKG_TARGET_CFLAGS@%%g' \
> -- 
> 2.20.1
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
