From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 01 Oct 2013 22:48:26 +0200
Subject: [Buildroot] [PATCH 2/2] gst-fsl-plugins: Bump version and
 change URL to match other i.MX components
In-Reply-To: <1380650790-18097-3-git-send-email-eric.nelson@boundarydevices.com>
References: <1380650790-18097-1-git-send-email-eric.nelson@boundarydevices.com>
 <1380650790-18097-3-git-send-email-eric.nelson@boundarydevices.com>
Message-ID: <524B351A.6000200@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/01/13 20:06, Eric Nelson wrote:
> Signed-off-by: Eric Nelson <eric.nelson@boundarydevices.com>
> ---
>   package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk b/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk
> index ccdb521..00c6acb 100644
> --- a/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk
> +++ b/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk
> @@ -4,9 +4,11 @@
>   #
>   ################################################################################
>
> -GST_FSL_PLUGINS_VERSION = 3.0.1
> -# No official download site from freescale, just this mirror
> -GST_FSL_PLUGINS_SITE = http://download.ossystems.com.br/bsp/freescale/source
> +include package/freescale-imx/freescale-imx.inc

  This is make, not C. You should never include the same file twice 
unless you _really_ know what you're doing.

  It is not a problem to define a variable in one file and use it in a 
completely different file. This is already done for instance with 
LINUX_DIR. The only potential problem is when you want to use the 
variable in a condition. But that is not the case here, so you can use 
FREESCALE_IMX_VERSION etc. below without this include statement, even if 
gst-fsl-plugins.mk is read before freescale-imx.mk.

  Regards,
  Arnout


> +
> +GST_FSL_PLUGINS_VERSION = $(FREESCALE_IMX_VERSION)
> +GST_FSL_PLUGINS_SITE = $(FREESCALE_IMX_SITE)
> +GST_FSL_PLUGINS_SOURCE = gst-fsl-plugins-$(GST_FSL_PLUGINS_VERSION).tar.gz
>
>   # Most is LGPLv2+, but some sources are copied from upstream and are
>   # LGPLv2.1+, which essentially makes it LGPLv2.1+
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
