From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 3 May 2014 19:01:04 +0200
Subject: [Buildroot] [PATCH v2 02/24] opencv: fix qt selection when
 highgui is enable
In-Reply-To: <1398208556-4195-3-git-send-email-s.martin49@gmail.com>
References: <1398208556-4195-1-git-send-email-s.martin49@gmail.com>
 <1398208556-4195-3-git-send-email-s.martin49@gmail.com>
Message-ID: <20140503170104.GB10671@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel, All,

On 2014-04-23 01:15 +0200, Samuel Martin spake thusly:
> The OpenCV highgui module links against QtGui and QtTest.
> The latter is built by default but was never installed.
> Thanks to the previous patch on Qt, this can be rectified.
> 
> So, update the OpenCV Config.in with the missing Qt module selection.
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
> changes v1 -> v2:
> - rebase
> ---
>  package/opencv/Config.in | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/package/opencv/Config.in b/package/opencv/Config.in
> index b40e141..49ada5d 100644
> --- a/package/opencv/Config.in
> +++ b/package/opencv/Config.in
> @@ -173,9 +173,11 @@ config BR2_PACKAGE_OPENCV_WITH_QT
>  	depends on BR2_USE_MMU # qt
>  	select BR2_PACKAGE_QT
>  	select BR2_PACKAGE_QT_STL
> +	select BR2_PACKAGE_QT_GUI_MODULE if BR2_PACKAGE_OPENCV_LIB_HIGHGUI
> +	select BR2_PACKAGE_QT_TEST       if BR2_PACKAGE_OPENCV_LIB_HIGHGUI
>  	default y
>  	help
> -	  Use Qt with STL support
> +	  Use Qt with QtTest module and STL support
>  
>  config BR2_PACKAGE_OPENCV_WITH_TIFF
>  	bool "tiff support"
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
