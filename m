From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 4 May 2014 11:24:02 +0200
Subject: [Buildroot] [PATCH v2 15/24] opencv: disable OpenMP support
In-Reply-To: <1398208556-4195-16-git-send-email-s.martin49@gmail.com>
References: <1398208556-4195-1-git-send-email-s.martin49@gmail.com>
 <1398208556-4195-16-git-send-email-s.martin49@gmail.com>
Message-ID: <20140504092402.GB3211@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel, All,

On 2014-04-23 01:15 +0200, Samuel Martin spake thusly:
> Since there is currently no easy way to know if the current Buildroot
> configuration has a toolchain supporting OpenMP (especially for external
> toolchains), then just disable it.
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

A solution to that would be to add a config knob to enable/disable
building openmp for the internal toolchain, and to state whether the
external toolchain has/lacks openmp.

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
> index a4bdd39..eed5338 100644
> --- a/package/opencv/opencv.mk
> +++ b/package/opencv/opencv.mk
> @@ -155,6 +155,7 @@ OPENCV_CONF_OPT += \
>  	-DWITH_OPENCL=OFF  \
>  	-DWITH_OPENEXR=OFF \
>  	-DWITH_OPENGL=OFF  \
> +	-DWITH_OPENMP=OFF  \
>  	-DWITH_OPENNI=OFF  \
>  	-DWITH_UNICAP=OFF  \
>  	-DWITH_XINE=OFF
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
