From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 7 Apr 2020 12:00:04 +0200
Subject: [Buildroot] [PATCH] package/libarchive: make optional zstd
 dependency explicit
In-Reply-To: <20200407094949.23467-1-patrickdepinguin@gmail.com>
References: <20200407094949.23467-1-patrickdepinguin@gmail.com>
Message-ID: <CAAXf6LXgmyhCM0YLXYTjpkNtwHM8Rf-rA5Wbd5bRLVdxOFk4sw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

El mar., 7 abr. 2020 a las 11:49, Thomas De Schampheleire
(<patrickdepinguin@gmail.com>) escribi?:
>
> From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
>
> Otherwise, the presence of zstd support in libarchive will depend on build
> order.
>
> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> ---
>  package/libarchive/libarchive.mk | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
> index 60838eea0a..94f974e7d1 100644
> --- a/package/libarchive/libarchive.mk
> +++ b/package/libarchive/libarchive.mk
> @@ -112,6 +112,13 @@ else
>  LIBARCHIVE_CONF_OPTS += --without-lzma
>  endif
>
> +ifeq ($(BR2_PACKAGE_ZSTD),y)
> +LIBARCHIVE_DEPENDENCIES += zstd
> +LIBARCHIVE_CONF_OPTS += --with-zstd
> +else
> +LIBARCHIVE_CONF_OPTS += --without-zstd
> +endif
> +
>  # The only user of host-libarchive needs zlib support
>  HOST_LIBARCHIVE_DEPENDENCIES = host-zlib
>  HOST_LIBARCHIVE_CONF_OPTS = \
> --
> 2.24.1

In my view this should be applied on both master and 2020.02.y.
