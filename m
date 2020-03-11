From: Gleb Mazovetskiy <glex.spb@gmail.com>
Date: Wed, 11 Mar 2020 19:15:55 +0000
Subject: [Buildroot] [PATCH 1/1] package/pkg-meson.mk: Fix
 cross-compilation.conf
In-Reply-To: <20200311191141.16295-1-glex.spb@gmail.com>
References: <20200311105930.21564-1-glex.spb@gmail.com>
 <20200311191141.16295-1-glex.spb@gmail.com>
Message-ID: <CADjhFRCDBmdm6Cf_xfyqWSZefL3e_zw5_8dqn+45V2+q6WjaTQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I've sent the updated patch using the following command but it appeared as
an independent patch in patchwork:

git send-email --to buildroot at buildroot.org --cc "Eric Le Bihan <
eric.le.bihan.dev@free.fr>"
outgoing/0001-package-pkg-meson.mk-Fix-cross-compilation.conf.patch
*--in-reply-to
20200311105930.21564-1-glex.spb at gmail.com
<20200311105930.21564-1-glex.spb@gmail.com>*

What am I doing wrong?


On Wed, Mar 11, 2020 at 7:11 PM Gleb Mazovetskiy <glex.spb@gmail.com> wrote:

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
> ---
>  package/pkg-meson.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
> index 642b715938..416129f6fe 100644
> --- a/package/pkg-meson.mk
> +++ b/package/pkg-meson.mk
> @@ -193,7 +193,7 @@ define PKG_MESON_INSTALL_CROSS_CONF
>             -e 's%@TARGET_LDFLAGS@%$(call
> make-comma-list,$(TARGET_LDFLAGS))@PKG_TARGET_CFLAGS@%g' \
>             -e 's%@TARGET_CXXFLAGS@%$(call
> make-comma-list,$(TARGET_CXXFLAGS))@PKG_TARGET_CFLAGS@%g' \
>             -e 's%@HOST_DIR@%$(HOST_DIR)%g' \
> -           -e 's%@STAGING_DIR@%$$(STAGING_DIR)%g' \
> +           -e 's%@STAGING_DIR@%$(STAGING_DIR)%g' \
>             $(HOST_MESON_PKGDIR)/cross-compilation.conf.in \
>             > $(HOST_DIR)/etc/meson/cross-compilation.conf.in
>         sed -e 's%@PKG_TARGET_CFLAGS@%%g' \
> --
> 2.20.1
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200311/0f21c8c1/attachment.html>
