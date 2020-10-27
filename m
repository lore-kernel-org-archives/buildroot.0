From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 27 Oct 2020 13:10:11 +0100
Subject: [Buildroot] [PATCH 1/1] package/gst-omx: fix gstomx.conf
 installation for raspberry
In-Reply-To: <AM0PR04MB4083CF2D34FB9C1B4C787DF5FB160@AM0PR04MB4083.eurprd04.prod.outlook.com>
References: <AM0PR04MB4083CF2D34FB9C1B4C787DF5FB160@AM0PR04MB4083.eurprd04.prod.outlook.com>
Message-ID: <20201027121011.GG2805@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Augustin, All,

On 2020-10-27 12:30 +0100, Augustin Thiercelin spake thusly:
> The commit 7e6f4e5 introduces a new bug when building the gst-omx package
> for the raspberry.
> 
> GST_OMX_VARIANT variable in gst-omx.mk was shadowed to 'generic' after being
> set well for raspberry. It results having the gstomx.conf not being installed,
> and thus having gst-omx installed but none of its features available.
> 
> Signed-off-by: Augustin Thiercelin <augustin.thiercelin@outlook.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/gstreamer1/gst-omx/gst-omx.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/gstreamer1/gst-omx/gst-omx.mk b/package/gstreamer1/gst-omx/gst-omx.mk
> index cdd0e86b04..9e35ff3d04 100644
> --- a/package/gstreamer1/gst-omx/gst-omx.mk
> +++ b/package/gstreamer1/gst-omx/gst-omx.mk
> @@ -20,6 +20,7 @@ GST_OMX_CONF_OPTS = \
>  ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
>  GST_OMX_VARIANT = rpi
>  GST_OMX_CONF_OPTS += -Dheader_path=$(STAGING_DIR)/usr/include/IL
> +else
>  GST_OMX_VARIANT = generic
>  endif
>  
> -- 
> 2.29.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
