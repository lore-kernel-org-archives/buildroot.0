From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 11 Apr 2015 13:32:45 +0200
Subject: [Buildroot] [PATCH 1/1] fftw: fix build failure with old gcc
In-Reply-To: <1428748907-3319-1-git-send-email-gwenj@trabucayre.com>
References: <1428748907-3319-1-git-send-email-gwenj@trabucayre.com>
Message-ID: <20150411113245.GE4221@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gwenhael, All,

On 2015-04-11 12:41 +0200, Gwenhael Goavec-Merou spake thusly:
> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> 
> -Ofast is not available on gcc <2.6. This option is equivalent to 

You probably meant gcc<4.6 ? gcc-2.6 is, well, quite old... The latest
2.6.x was released in 2002... ;-)

> -O3 -ffast-math.
> 
> Fixes:
> http://autobuild.buildroot.org/results/207/207a20a3ca5e62029823b1361479d5cd38fefeb0/
> http://autobuild.buildroot.net/results/871/871b29c9bbf94aa05034c442f35c8771f83abe1e/
> 
> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Otherwise, I did not SoB this patch for real. A post-commit note would
have been quite enough, in fact.

Regards,
Yann E. MORIN.

> ---
>  package/fftw/fftw.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/fftw/fftw.mk b/package/fftw/fftw.mk
> index 1148909..5045ab6 100644
> --- a/package/fftw/fftw.mk
> +++ b/package/fftw/fftw.mk
> @@ -18,7 +18,7 @@ FFTW_CONF_OPTS += $(if $(BR2_PACKAGE_FFTW_PRECISION_QUAD),--enable,--disable)-qu
>  
>  FFTW_CFLAGS = $(TARGET_CFLAGS)
>  ifeq ($(BR2_PACKAGE_FFTW_FAST),y)
> -FFTW_CFLAGS += -Ofast
> +FFTW_CFLAGS += -O3 -ffast-math
>  endif
>  
>  # x86 optimisations
> -- 
> 2.0.5
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
