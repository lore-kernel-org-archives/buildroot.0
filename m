From: Daniel Nicoletti <dantti12@gmail.com>
Date: Thu, 6 Sep 2018 09:20:36 -0300
Subject: [Buildroot] [PATCH v2] package/cutelyst: Fix build dependencies
In-Reply-To: <20180906113202.18749-1-dantti12@gmail.com>
References: <20180906113202.18749-1-dantti12@gmail.com>
Message-ID: <CACo8zOeQYepMaFdvt-4Xsw7-x3-+R5_LTHBV7A5uVZwFtYNR8Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

hmm I think I push the wrong commit... sorry
Em qui, 6 de set de 2018 ?s 08:32, Daniel Nicoletti
<dantti12@gmail.com> escreveu:
>
> Add missing optional dependencies need when
> the dependency was available, disabling Grantlee
> plugin for now as it failed to build.
>
> Fixes:
>
> http://autobuild.buildroot.net/results/90c56e4e001daa71efd92c926fe3a5dc5ec759e7/
>
> Signed-off-by: Daniel Nicoletti <dantti12@gmail.com>
> ---
>  package/cutelyst/cutelyst.mk | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/package/cutelyst/cutelyst.mk b/package/cutelyst/cutelyst.mk
> index 438ac091c6..2d1c9b1532 100644
> --- a/package/cutelyst/cutelyst.mk
> +++ b/package/cutelyst/cutelyst.mk
> @@ -15,20 +15,16 @@ CUTELYST_DEPENDENCIES = qt5base
>  CUTELYST_CONF_OPTS += \
>         -DPLUGIN_CSRFPROTECTION=ON
>
> -ifeq ($(BR2_PACKAGE_GRANTLEE),y)
> -CUTELYST_CONF_OPTS += -DPLUGIN_VIEW_GRANTLEE=ON
> -else
> -CUTELYST_CONF_OPTS += -DPLUGIN_VIEW_GRANTLEE=OFF
> -endif
> -
>  ifeq ($(BR2_PACKAGE_LIBPWQUALITY),y)
>  CUTELYST_CONF_OPTS += -DPLUGIN_VALIDATOR_PWQUALITY=ON
> +CUTELYST_DEPENDENCIES += libpwquality
>  else
>  CUTELYST_CONF_OPTS += -DPLUGIN_VALIDATOR_PWQUALITY=OFF
>  endif
>
>  ifeq ($(BR2_PACKAGE_JEMALLOC),y)
>  CUTELYST_CONF_OPTS += -DUSE_JEMALLOC=ON
> +CUTELYST_DEPENDENCIES += jemalloc
>  else
>  CUTELYST_CONF_OPTS += -DUSE_JEMALLOC=OFF
>  endif
> --
> 2.17.1
>


-- 
Daniel Nicoletti

KDE Developer - http://dantti.wordpress.com
