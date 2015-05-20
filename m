From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 20 May 2015 20:23:24 +0300
Subject: [Buildroot] [PATCH] qt5base: remove never set
	QT5BASE_CONFIGURE_ENV
In-Reply-To: <68f1652755a14911b5e98255662454f63ddf315f.1432137630.git.baruch@tkos.co.il>
References: <68f1652755a14911b5e98255662454f63ddf315f.1432137630.git.baruch@tkos.co.il>
Message-ID: <20150520172324.GG2586@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Buildroot list,

On Wed, May 20, 2015 at 07:00:30PM +0300, Baruch Siach wrote:
> Since 1b54fbc925f4 (qt5base: fix postgresql plugin compile, 2015-02-19)
> QT5BASE_CONFIGURE_ENV is never set. Remove it.
> 
> Cc: Peter Seiderer <ps.report@gmx.net>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Adding Peter's Reviewed-by tag from the other email with a proper In-Reply-To 
header for patchwork:

Reviewed-by: Peter Seiderer <ps.report@gmx.net>

Thanks,
baruch

> ---
>  package/qt5/qt5base/qt5base.mk | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
> index 3de824f5424b..e2db5d1e029c 100644
> --- a/package/qt5/qt5base/qt5base.mk
> +++ b/package/qt5/qt5base/qt5base.mk
> @@ -174,7 +174,6 @@ define QT5BASE_CONFIGURE_CMDS
>  		PKG_CONFIG_LIBDIR="$(STAGING_DIR)/usr/lib/pkgconfig" \
>  		PKG_CONFIG_SYSROOT_DIR="$(STAGING_DIR)" \
>  		MAKEFLAGS="$(MAKEFLAGS) -j$(PARALLEL_JOBS)" \
> -		$(QT5BASE_CONFIGURE_ENV) \
>  		./configure \
>  		-v \
>  		-prefix /usr \

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
