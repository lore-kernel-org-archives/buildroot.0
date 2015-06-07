From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 7 Jun 2015 15:18:04 +0200
Subject: [Buildroot] [PATCH v5 13/13]
 package/gstreamer1/gst1-plugins-bad: disable opencv plugin with opencv-3
In-Reply-To: <1433672799-21387-14-git-send-email-s.martin49@gmail.com>
References: <1433672799-21387-1-git-send-email-s.martin49@gmail.com>
 <1433672799-21387-14-git-send-email-s.martin49@gmail.com>
Message-ID: <20150607131804.GN3545@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel, All,

On 2015-06-07 12:26 +0200, Samuel Martin spake thusly:
> The opencv plugin uses stuff from the now removed opencv's legacy module.
> Note that the configure script already correctly check the opencv version
> and disable the opencv plugin with opencv-3.x.

So, this patch should right after you bump the OpenCV version, not late
in the series.

Note: it needs not be part of the bump-patch, because the build does not
break, so it is OK to keep it as a separate patch.

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> 
> ---
> changes v4->v5:
> - new patch
> ---
>  package/gstreamer1/gst1-plugins-bad/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
> index 44fcdfb..51c6232 100644
> --- a/package/gstreamer1/gst1-plugins-bad/Config.in
> +++ b/package/gstreamer1/gst1-plugins-bad/Config.in
> @@ -432,6 +432,7 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_OPENCV
>  	bool "opencv"
>  	depends on BR2_INSTALL_LIBSTDCPP
>  	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
> +	depends on BROKEN # gst1-plugin-opencv does not (yet) support opencv >=3.x
>  	select BR2_PACKAGE_OPENCV
>  	# Remove the following opencv modules when gstreamer fixes the
>  	# problem of including the old "cv.h" header
> -- 
> 2.4.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
