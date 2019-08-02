From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 2 Aug 2019 16:41:12 +0200
Subject: [Buildroot] [PATCH] package/imagemagick: fix host build for old
 distributions
In-Reply-To: <20190802134044.22094-1-peter@korsgaard.com>
References: <20190802134044.22094-1-peter@korsgaard.com>
Message-ID: <20190802144112.GA18760@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2019-08-02 15:40 +0200, Peter Korsgaard spake thusly:
> Fixes:
> http://autobuild.buildroot.net/results/5f0/5f0b85033e800c9eebc46812592966ec6826bb5d/
> 
> imagemagick uses clock_gettime, which was provided by librt rather than libc
> in glibc < 2.17 - Causing link errors.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Reviewed-by: Yann E. MORIN <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/imagemagick/imagemagick.mk | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
> index fff00fcfb1..3a37371e7b 100644
> --- a/package/imagemagick/imagemagick.mk
> +++ b/package/imagemagick/imagemagick.mk
> @@ -176,6 +176,9 @@ HOST_IMAGEMAGICK_CONF_OPTS = \
>  	--with-png \
>  	--with-zlib
>  
> +# uses clock_gettime, which was provided by librt in glibc < 2.17
> +HOST_IMAGEMAGICK_CONF_ENV = LIBS="-lrt"
> +
>  HOST_IMAGEMAGICK_DEPENDENCIES = \
>  	host-libjpeg \
>  	host-libpng \
> -- 
> 2.11.0
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
