From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 27 Oct 2020 12:52:39 +0100
Subject: [Buildroot] [PATCH 1/1] package/gst-omx: fix gstomx.conf
 installation for raspberry
In-Reply-To: <AM0PR04MB4083CF2D34FB9C1B4C787DF5FB160@AM0PR04MB4083.eurprd04.prod.outlook.com>
References: <AM0PR04MB4083CF2D34FB9C1B4C787DF5FB160@AM0PR04MB4083.eurprd04.prod.outlook.com>
Message-ID: <trinity-c4434912-f40c-45ef-b642-a390f774d3ba-1603799559177@3c-app-gmx-bs28>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Augustin,

> Gesendet: Dienstag, 27. Oktober 2020 um 12:30 Uhr
> Von: "Augustin Thiercelin" <augustin.thiercelin@outlook.com>
> An: buildroot at buildroot.org
> Cc: "Augustin Thiercelin" <augustin.thiercelin@outlook.com>
> Betreff: [Buildroot] [PATCH 1/1] package/gst-omx: fix gstomx.conf installation for raspberry
>
> The commit 7e6f4e5 introduces a new bug when building the gst-omx package
> for the raspberry.
>
> GST_OMX_VARIANT variable in gst-omx.mk was shadowed to 'generic' after being
> set well for raspberry. It results having the gstomx.conf not being installed,
> and thus having gst-omx installed but none of its features available.
>
> Signed-off-by: Augustin Thiercelin <augustin.thiercelin@outlook.com>
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

Thanks for the patch iteration:

Reviewed-by: Peter Seiderer <ps.report@gmx.net>

Regards,
Peter

> --
> 2.29.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
