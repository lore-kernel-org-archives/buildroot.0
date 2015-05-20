From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 20 May 2015 18:09:53 +0200
Subject: [Buildroot] [PATCH] qt5base: remove never set
	QT5BASE_CONFIGURE_ENV
Message-ID: <trinity-3745c1e4-8e77-41af-b932-958efca7415b-1432138192922@3capp-gmx-bs29>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Baruch,

On Wed, May 20, 2015 at 07:00:30PM +0300, Baruch Siach wrote:
> Since 1b54fbc925f4 (qt5base: fix postgresql plugin compile, 2015-02-19)
> QT5BASE_CONFIGURE_ENV is never set. Remove it.
> 
> Cc: Peter Seiderer <ps.report@gmx.net>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/qt5/qt5base/qt5base.mk | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
> index 3de824f5424b..e2db5d1e029c 100644
> --- a/package/qt5/qt5base/qt5base.mk
> +++ b/package/qt5/qt5base/qt5base.mk
> @@ -174,7 +174,6 @@ define QT5BASE_CONFIGURE_CMDS
>               PKG_CONFIG_LIBDIR="$(STAGING_DIR)/usr/lib/pkgconfig" \
>               PKG_CONFIG_SYSROOT_DIR="$(STAGING_DIR)" \
>               MAKEFLAGS="$(MAKEFLAGS) -j$(PARALLEL_JOBS)" \
> -             $(QT5BASE_CONFIGURE_ENV) \
>               ./configure \
>               -v \
>               -prefix /usr \
> -- 
> 2.1.4
> 

Thanks for spotting this one, you can add my:

Reviewed-by: Peter Seiderer <ps.report@gmx.net>

Regards,
Peter
