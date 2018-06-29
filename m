From: =?utf-8?B?R2HDq2w=?= PORTAY <gael.portay@savoirfairelinux.com>
Date: Fri, 29 Jun 2018 00:23:50 -0400
Subject: [Buildroot] [PATCH] qt5webengine: propagate parallel flag to
 ninja
In-Reply-To: <20180628213328.32550-1-gael.portay@savoirfairelinux.com>
References: <20180628213328.32550-1-gael.portay@savoirfairelinux.com>
Message-ID: <20180629042350.y64gse3y6oh2wdmi@archlinux>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'am responding to myself...

On Thu, Jun 28, 2018 at 05:33:28PM -0400, Ga?l PORTAY wrote:
> (...)
>
> This commit sets the NINJAFLAGS using the variable BR2_JLEVEL to limits
> the number of cores used by ninja.
> 

Use PARALLEL_JOBS.

> Fixes:
> 	virtual memory exhausted: Cannot allocate memory
> 
> [1]: https://ninja-build.org/manual.html#_comparison_to_make
> [2]: https://github.com/qt/qtwebengine/blob/v5.11.1/src/core/gn_run.pro#L49-L53
> 
> Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
> ---
>  package/qt5/qt5webengine/qt5webengine.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/qt5/qt5webengine/qt5webengine.mk b/package/qt5/qt5webengine/qt5webengine.mk
> index e527e6bc36..efdb6e49ec 100644
> --- a/package/qt5/qt5webengine/qt5webengine.mk
> +++ b/package/qt5/qt5webengine/qt5webengine.mk
> @@ -48,6 +48,8 @@ define QT5WEBENGINE_PYTHON2_SYMLINK
>  endef
>  QT5WEBENGINE_PRE_CONFIGURE_HOOKS += QT5WEBENGINE_PYTHON2_SYMLINK
>  
> +QT5WEBENGINE_ENV += NINJAFLAGS="-j$(BR2_JLEVEL)"
> +

Use PARALLEL_JOBS.

>  ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
>  define QT5WEBENGINE_CREATE_HOST_PKG_CONFIG
>  	sed s%@HOST_DIR@%$(HOST_DIR)%g $(QT5WEBENGINE_PKGDIR)/host-pkg-config.in > $(@D)/host-bin/host-pkg-config
> -- 
> 2.11.0
> 
