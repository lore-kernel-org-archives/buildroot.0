From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Mon, 6 Jun 2016 16:34:11 +0200
Subject: [Buildroot] [PATCH 06/10] imx-vpuwrap: rename from
 libfslvpuwrap and bump version to 1.0.65
In-Reply-To: <5e239b5da4241e89e319b28be7aa64737c1c9452.1464958470.git.awebster@arcx.com>
References: <cover.1464958470.git.awebster@arcx.com>
 <5e239b5da4241e89e319b28be7aa64737c1c9452.1464958470.git.awebster@arcx.com>
Message-ID: <CAAMH-yvw2dyrQqLRYdrOS+fYubuEC5ucV30fdY8hrN=EsHn_LA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Andrew, All,

On Fri, Jun 3, 2016 at 3:12 PM, Andrew Webster <awebster@arcx.com> wrote:
> Changelog:
> --Update 'nLastFrameEndPosPhy' in seqinit stage to avoid feed
>   the same SPS to vpu repeatedly.
>
> This patch is based on the Yocto equivalent:
> https://github.com/Freescale/meta-fsl-arm/commit/d6b9490
>
> Signed-off-by: Andrew Webster <awebster@arcx.com>
> ---
>  Config.in.legacy                                    |  7 +++++++
>  package/Config.in                                   |  1 -
>  package/freescale-imx/Config.in                     |  1 +
>  .../imx-vpuwrap}/Config.in                          |  8 ++++----
>  package/freescale-imx/imx-vpuwrap/imx-vpuwrap.hash  |  2 ++
>  package/freescale-imx/imx-vpuwrap/imx-vpuwrap.mk    | 21 +++++++++++++++++++++
>  package/libfslvpuwrap/libfslvpuwrap.hash            |  2 --
>  package/libfslvpuwrap/libfslvpuwrap.mk              | 21 ---------------------
>  8 files changed, 35 insertions(+), 28 deletions(-)
>  rename package/{libfslvpuwrap => freescale-imx/imx-vpuwrap}/Config.in (69%)
>  create mode 100644 package/freescale-imx/imx-vpuwrap/imx-vpuwrap.hash
>  create mode 100644 package/freescale-imx/imx-vpuwrap/imx-vpuwrap.mk
>  delete mode 100644 package/libfslvpuwrap/libfslvpuwrap.hash
>  delete mode 100644 package/libfslvpuwrap/libfslvpuwrap.mk
>
> diff --git a/Config.in.legacy b/Config.in.legacy
> index dab8505..0b0e9e7 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -142,6 +142,13 @@ comment "build, or run, in unpredictable ways.               "
>  comment "----------------------------------------------------"
>  endif
>
> +config BR2_PACKAGE_LIBFSLVPUWRAP
> +       bool "libfslvpuwrap has been renamed to imx-vpuwrap"
> +       select BR2_LEGACY
> +       select BR2_PACKAGE_IMX_VPUWRAP
> +       help
> +         The libfslvpuwrap has been renamed to match the renamed package.
> +

Same as imx-codec and imx-parser, I think this section is misplaced.

Also, it seems that packages depending on this package haven't been
updated (gst-fsl-plugins and kodi).

Regards,
Gary
