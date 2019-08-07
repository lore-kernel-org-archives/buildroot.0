From: Adrian Perez de Castro <aperez@igalia.com>
Date: Thu, 8 Aug 2019 01:24:25 +0300
Subject: [Buildroot] [PATCH 1/1] package/gstreamer1/gst1-plugins-bad:
 fix opengl dependency
In-Reply-To: <20190807215804.100437-1-james.hilliard1@gmail.com>
References: <20190807215804.100437-1-james.hilliard1@gmail.com>
Message-ID: <20190808012425.GB18126@momiji>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Wed,  7 Aug 2019 15:58:04 -0600, James Hilliard <james.hilliard1@gmail.com> wrote:
> Fixes:
> WPEThreadedView.h:24:10: fatal error: gst/gl/gl.h: No such file or directory
>  #include <gst/gl/gl.h>
>           ^~~~~~~~~~~~~
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Reviewed-by: Adrian Perez de Castro <aperez@igalia.com>

Thanks for the patch :)
?Adri?n

> ---
>  package/gstreamer1/gst1-plugins-bad/Config.in | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
> index f00f3edb7c..79acd83a63 100644
> --- a/package/gstreamer1/gst1-plugins-bad/Config.in
> +++ b/package/gstreamer1/gst1-plugins-bad/Config.in
> @@ -595,11 +595,11 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WPE
>  	bool "wpe"
>  	default y
>  	depends on BR2_PACKAGE_WPEWEBKIT
> -	depends on BR2_PACKAGE_GST1_PLUGINS_BASE_HAS_LIB_OPENGL
> +	depends on BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_OPENGL
>  
>  comment "wpe needs the gst1-plugins-base opengl library and wpewebkit"
>  	depends on !BR2_PACKAGE_WPEWEBKIT \
> -		|| !BR2_PACKAGE_GST1_PLUGINS_BASE_HAS_LIB_OPENGL
> +		|| !BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_OPENGL
>  
>  config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_X265
>  	bool "x265"
> -- 
> 2.20.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 195 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190808/5c631240/attachment.asc>
