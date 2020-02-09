From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Sun, 9 Feb 2020 20:09:52 +0100
Subject: [Buildroot] [PATCH 3/3] package/sdbusplus: drop broken
 autoreconf include directive
In-Reply-To: <d829177dd62464e09391482db381f7eb5416b6ac.1581261155.git.yann.morin.1998@free.fr>
References: <cover.1581261155.git.yann.morin.1998@free.fr>
 <d829177dd62464e09391482db381f7eb5416b6ac.1581261155.git.yann.morin.1998@free.fr>
Message-ID: <CAEyMn7bAEqyzDTZ2pc1moA+iM1Ue0W0Fq4Vt-gVz0igann=uBw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,


Am So., 9. Feb. 2020 um 16:12 Uhr schrieb Yann E. MORIN
<yann.morin.1998@free.fr>:
>
> Since d255b67972 (autotools: do not overwrite first include path),
> specifying an include directive as autoreconf options will break the
> build, as this would change the ordering of include directories (the
> first one is treated specially by aclocal).
>
> Now that the infra takes care of adding the autoconf archive macro
> directory to the glocal search path, we can remove the offending
> include directive from sdbusplus autoreconf options (dropping the
> whole variable now that it is unused).
>
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Michael Walle <michael@walle.cc>
> Cc: Heiko Thiery <heiko.thiery@gmail.com>
> Cc: John Faith <jfaith@impinj.com>

Tested-by: Heiko Thiery <heiko.thiery@gmail.com>


> ---
>  package/sdbusplus/sdbusplus.mk | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/package/sdbusplus/sdbusplus.mk b/package/sdbusplus/sdbusplus.mk
> index 9d3d1e8cf4..2bb7a30cfd 100644
> --- a/package/sdbusplus/sdbusplus.mk
> +++ b/package/sdbusplus/sdbusplus.mk
> @@ -17,7 +17,6 @@ HOST_SDBUSPLUS_DEPENDENCIES = \
>  SDBUSPLUS_CONF_OPTS = --disable-sdbuspp
>  HOST_SDBUSPLUS_CONF_OPTS = --disable-libsdbusplus
>  SDBUSPLUS_AUTORECONF = YES
> -SDBUSPLUS_AUTORECONF_OPTS = --include=$(HOST_DIR)/share/autoconf-archive
>  SDBUSPLUS_INSTALL_STAGING = YES
>  SDBUSPLUS_LICENSE = Apache-2.0
>  SDBUSPLUS_LICENSE_FILES = LICENSE
> --
> 2.20.1
>
