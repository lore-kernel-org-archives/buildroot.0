From: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
Date: Mon, 29 Jun 2020 10:32:48 +0200
Subject: [Buildroot] [PATCH 1/2] package/freescale-imx: Add option for
 all i.MX FW needs
In-Reply-To: <DB8PR04MB5755C99B335ACE9AFC7552CDA7920@DB8PR04MB5755.eurprd04.prod.outlook.com>
References: <1593012228-18959-1-git-send-email-stephane.viau@oss.nxp.com>
 <1593012228-18959-2-git-send-email-stephane.viau@oss.nxp.com>
 <20200624225831.2183d1b0@windsurf>
 <DB8PR04MB5755C99B335ACE9AFC7552CDA7920@DB8PR04MB5755.eurprd04.prod.outlook.com>
Message-ID: <20200629083248.GD30275@x1.vandijck-laurijssen.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On do, 25 jun 2020 06:33:59 +0000, Stephane Viau (OSS) wrote:
> Date: Thu, 25 Jun 2020 06:33:59 +0000
> From: "Stephane Viau (OSS)" <stephane.viau@oss.nxp.com>
> To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, "Yann E. MORIN"
>  <yann.morin.1998@free.fr>, Gary Bisson <bisson.gary@gmail.com>
> Cc: Refik Tuzakli <tuzakli.refik@gmail.com>, "buildroot at buildroot.org"
>  <buildroot@buildroot.org>
> Subject: Re: [Buildroot] [PATCH 1/2] package/freescale-imx: Add option for
>  all i.MX FW needs
> 
> 
> >Hello,
> 
> Hello Thomas, Yann/Gary,
> 
> >
> >Thanks for doing this work! It's definitely bringing some good sanity
> >into this firmware-imx mess! See below some comments.
> 
> Glad you like it & thank you for your comments.
> 
> >
> >> diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Config.in
> >> index 0be37ce..2cac650 100644
> >> --- a/package/freescale-imx/Config.in
> >> +++ b/package/freescale-imx/Config.in
> >> @@ -12,40 +12,63 @@ choice
> >>  
> >>  config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX25_3STACK
> >>        bool "imx25-3stack"
> >> +     select BR2_PACKAGE_FREESCALE_IMX_NEED_SDMA_FW
> >>  
> >>  config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX27ADS
> >>        bool "imx27ads"
> >> +     select BR2_PACKAGE_FREESCALE_IMX_NEED_SDMA_FW
> >> +     select BR2_PACKAGE_FREESCALE_IMX_NEED_VPU_FW_LEGACY
> >>  
> >>  config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX37_3STACK
> >>        bool "imx37-3stack"
> >> +     select BR2_PACKAGE_FREESCALE_IMX_NEED_SDMA_FW
> >> +     select BR2_PACKAGE_FREESCALE_IMX_NEED_VPU_FW_LEGACY
> >>  
> >>  config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX50
> >>        bool "imx50"
> >> +     select BR2_PACKAGE_FREESCALE_IMX_NEED_SDMA_FW
> >> +     select BR2_PACKAGE_FREESCALE_IMX_NEED_VPU_FW_LEGACY
> >>  
> >>  config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX51
> >>        bool "imx51"
> >> +     select BR2_PACKAGE_FREESCALE_IMX_NEED_SDMA_FW
> >> +     select BR2_PACKAGE_FREESCALE_IMX_NEED_VPU_FW_LEGACY
> >>  
> >>  config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX53
> >>        bool "imx53"
> >> +     select BR2_PACKAGE_FREESCALE_IMX_NEED_SDMA_FW
> >> +     select BR2_PACKAGE_FREESCALE_IMX_NEED_VPU_FW_LEGACY
> >>  
> >>  config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q
> >>        bool "imx6q/imx6dl"
> >> +     select BR2_PACKAGE_FREESCALE_IMX_NEED_EPDC_FW
> >> +     select BR2_PACKAGE_FREESCALE_IMX_NEED_SDMA_FW
> >> +     select BR2_PACKAGE_FREESCALE_IMX_NEED_VPU_FW_LEGACY
> >>  
> >>  config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6S
> >>        bool "imx6sl/imx6sx"
> >> +     select BR2_PACKAGE_FREESCALE_IMX_NEED_EPDC_FW
> >> +     select BR2_PACKAGE_FREESCALE_IMX_NEED_SDMA_FW
> >> +     select BR2_PACKAGE_FREESCALE_IMX_NEED_VPU_FW_LEGACY
> >>  
> >>  config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6UL
> >>        bool "imx6ul/imx6ull"
> >> +     select BR2_PACKAGE_FREESCALE_IMX_NEED_SDMA_FW
> >> +     select BR2_PACKAGE_FREESCALE_IMX_NEED_VPU_FW_LEGACY
> >>  
> >>  config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX7
> >>        bool "imx7d/imx7ulp"
> >> +     select BR2_PACKAGE_FREESCALE_IMX_NEED_SDMA_FW
> >> +     select BR2_PACKAGE_FREESCALE_IMX_NEED_VPU_FW_LEGACY
> >>  
> >>  config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8
> >>        bool "imx8"
> >> +     select BR2_PACKAGE_FREESCALE_IMX_NEED_VPU_FW_IMX8_IMX8X
> >>  
> >>  config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M
> >>        bool "imx8m"
> >>        select BR2_PACKAGE_FREESCALE_IMX_NEED_DDR_FW
> >> +     select BR2_PACKAGE_FREESCALE_IMX_NEED_HDMI_FW
> >>  
> >>  config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM
> >>        bool "imx8mm"
> >> @@ -57,6 +80,7 @@ config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MN
> >>  
> >>  config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X
> >>        bool "imx8x"
> >> +     select BR2_PACKAGE_FREESCALE_IMX_NEED_VPU_FW_IMX8_IMX8X
> >>  endchoice
> >>  
> >>  config BR2_PACKAGE_FREESCALE_IMX_PLATFORM
> >> @@ -102,6 +126,21 @@ config BR2_PACKAGE_FREESCALE_IMX_HAS_VIV_GPU
> >>  config BR2_PACKAGE_FREESCALE_IMX_NEED_DDR_FW
> >>        bool
> >>  
> >> +config BR2_PACKAGE_FREESCALE_IMX_NEED_EPDC_FW
> >> +     bool
> >> +
> >> +config BR2_PACKAGE_FREESCALE_IMX_NEED_HDMI_FW
> >> +     bool
> >> +
> >> +config BR2_PACKAGE_FREESCALE_IMX_NEED_SDMA_FW
> >> +     bool
> >> +
> >> +config BR2_PACKAGE_FREESCALE_IMX_NEED_VPU_FW_LEGACY
> >> +     bool
> >> +
> >> +config BR2_PACKAGE_FREESCALE_IMX_NEED_VPU_FW_IMX8_IMX8X
> >> +     bool
> >
> >It would be nicer to use "NEEDS" instead of "NEED". That would require
> >a preparation patch that renames BR2_PACKAGE_FREESCALE_IMX_NEED_DDR_FW
> >to BR2_PACKAGE_FREESCALE_IMX_NEEDS_DDR_FW.
> 
> Agreed.
> 
> >
> >However, I am wondering if package/freescale-imx/Config.in is the right
> >place for all this logic. After all, this is only related to the
> >firmware-imx package.
> >
> >Shouldn't we instead move that to
> >package/freescale-imx/firmware-imx/Config.in, with the following form:
> >
> >config BR2_PACKAGE_FREESCALE_IMX_NEEDS_DDR_FW
> >        bool
> >        default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M
> >        default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM
> >        default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MN
> >
> >and ditto the other options ? Here as well, it would require a
> >preparation patch to take care of the NEEDS_DDR_FW case, and then your
> >patch that handles all other FW files.
> 
> I'd like to have Yann's and/or Gary's feedback on this. I'm using 'select' based on this comment:
> "
>   As Yann mentioned on IRC:
>   "Usually, when we introduce such option, it does not 'default y' based
>   on some other options. Instead, the other options 'select' it."
> "
> from http://lists.busybox.net/pipermail/buildroot/2020-May/283180.html

If you insert a prompt statement, then that allows to NOT include the
firmware if explicitely turned off.
I'm currently working on an imx8 platform without VPU needs.
I don't like shipping firmware that I don't need.

Kurt
