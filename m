From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 4 May 2014 00:28:28 +0200
Subject: [Buildroot] [PATCH v2 13/24] opencv: disable apps module
In-Reply-To: <1398208556-4195-14-git-send-email-s.martin49@gmail.com>
References: <1398208556-4195-1-git-send-email-s.martin49@gmail.com>
 <1398208556-4195-14-git-send-email-s.martin49@gmail.com>
Message-ID: <20140503222828.GG13170@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel, All,

On 2014-04-23 01:15 +0200, Samuel Martin spake thusly:
> This module is used to build programs for training classifiers.
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
> changes v1 -> v2:
> - new patch (split suggested by Yann)
> ---
>  package/opencv/opencv.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/opencv/opencv.mk b/package/opencv/opencv.mk
> index f129dc3..b87eddc 100644
> --- a/package/opencv/opencv.mk
> +++ b/package/opencv/opencv.mk
> @@ -44,6 +44,7 @@ OPENCV_CONF_OPT += \
>  # OpenCV module selection
>  OPENCV_CONF_OPT += \
>  	-DBUILD_opencv_androidcamera=OFF                                        \
> +	-DBUILD_opencv_apps=OFF                                                 \
>  	-DBUILD_opencv_calib3d=$(if $(BR2_PACKAGE_OPENCV_LIB_CALIB3D),ON,OFF)   \
>  	-DBUILD_opencv_contrib=$(if $(BR2_PACKAGE_OPENCV_LIB_CONTRIB),ON,OFF)   \
>  	-DBUILD_opencv_core=ON                                                  \
> -- 
> 1.9.2
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
