From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Mon, 6 Jun 2016 16:33:57 +0200
Subject: [Buildroot] [PATCH 05/10] imx-parser: rename from libfslparser
 and bump version to 4.0.9
In-Reply-To: <0fe32c7569197b516c0f6cae32bafc5be5ba1031.1464958470.git.awebster@arcx.com>
References: <cover.1464958470.git.awebster@arcx.com>
 <0fe32c7569197b516c0f6cae32bafc5be5ba1031.1464958470.git.awebster@arcx.com>
Message-ID: <CAAMH-ysWFtMpkEGddhPV7QLe2KEPYb6SKfVRPSBcZFJOt7RxQQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Andrew, All,

On Fri, Jun 3, 2016 at 3:12 PM, Andrew Webster <awebster@arcx.com> wrote:
> Changelog:
> --Add aac latm parser in parser_libs, support aac latm in mpeg2 parser
>
> This patch is based on the Yocto equivalent:
> https://github.com/Freescale/meta-fsl-arm/commit/e2c6f10
>
> Signed-off-by: Andrew Webster <awebster@arcx.com>
> ---
>  Config.in.legacy                                   |  7 +++++++
>  package/Config.in                                  |  1 -
>  package/freescale-imx/Config.in                    |  1 +
>  .../imx-parser}/Config.in                          |  4 ++--
>  package/freescale-imx/imx-parser/imx-parser.hash   |  2 ++
>  package/freescale-imx/imx-parser/imx-parser.mk     | 23 ++++++++++++++++++++++
>  package/gstreamer/gst-fsl-plugins/Config.in        |  2 +-
>  .../gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk   |  2 +-
>  package/libfslparser/libfslparser.hash             |  2 --
>  package/libfslparser/libfslparser.mk               | 23 ----------------------
>  10 files changed, 37 insertions(+), 30 deletions(-)
>  rename package/{libfslparser => freescale-imx/imx-parser}/Config.in (78%)
>  create mode 100644 package/freescale-imx/imx-parser/imx-parser.hash
>  create mode 100644 package/freescale-imx/imx-parser/imx-parser.mk
>  delete mode 100644 package/libfslparser/libfslparser.hash
>  delete mode 100644 package/libfslparser/libfslparser.mk
>
> diff --git a/Config.in.legacy b/Config.in.legacy
> index 54d43f1..dab8505 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -142,6 +142,13 @@ comment "build, or run, in unpredictable ways.               "
>  comment "----------------------------------------------------"
>  endif
>
> +config BR2_PACKAGE_LIBFSLPARSER
> +       bool "libfslparser has been renamed to imx-parser"
> +       select BR2_LEGACY
> +       select BR2_PACKAGE_IMX_PARSER
> +       help
> +         The libfslparser has been renamed to match the renamed package.
> +

Same as imx-codec, I believe this should be under the 2016.08 section.

>  config BR2_PACKAGE_LIBFSLCODEC
>         bool "libfslcodec has been renamed to imx-codec"
>         select BR2_LEGACY
> diff --git a/package/Config.in b/package/Config.in
> index c41e4f6..8c3c6b8 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1089,7 +1089,6 @@ menu "Multimedia"
>         source "package/libdvdnav/Config.in"
>         source "package/libdvdread/Config.in"
>         source "package/libebml/Config.in"
> -       source "package/libfslparser/Config.in"
>         source "package/libfslvpuwrap/Config.in"
>         source "package/libhdhomerun/Config.in"
>         source "package/libimxvpuapi/Config.in"
> diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Config.in
> index 052de5a..868e51c 100644
> --- a/package/freescale-imx/Config.in
> +++ b/package/freescale-imx/Config.in
> @@ -52,6 +52,7 @@ config BR2_PACKAGE_FREESCALE_IMX_HAS_VPU
>  source "package/freescale-imx/imx-codec/Config.in"
>  source "package/freescale-imx/imx-kobs/Config.in"
>  source "package/freescale-imx/imx-lib/Config.in"
> +source "package/freescale-imx/imx-parser/Config.in"
>  source "package/freescale-imx/imx-uuc/Config.in"
>  source "package/freescale-imx/imx-vpu/Config.in"
>  source "package/freescale-imx/firmware-imx/Config.in"
> diff --git a/package/libfslparser/Config.in b/package/freescale-imx/imx-parser/Config.in
> similarity index 78%
> rename from package/libfslparser/Config.in
> rename to package/freescale-imx/imx-parser/Config.in
> index e3ab980..d7048a7 100644
> --- a/package/libfslparser/Config.in
> +++ b/package/freescale-imx/imx-parser/Config.in
> @@ -1,5 +1,5 @@
> -config BR2_PACKAGE_LIBFSLPARSER
> -       bool "libfslparser"
> +config BR2_PACKAGE_IMX_PARSER
> +       bool "imx-parser"
>         depends on BR2_arm # Only relevant for i.MX
>         help
>           Binary parser libraries for the Freescale i.MX SoCs.

Same as imx-codec, I think we should get rid of those Freescale
references right now for the packages that get renamed.

Other than that it looks good.

Regards,
Gary
