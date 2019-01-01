From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 1 Jan 2019 22:06:59 +0100
Subject: [Buildroot] [PATCH v3 13/17] package/libvips: use the new
 fftw-double package
In-Reply-To: <20181231133030.25991-14-thomas.petazzoni@bootlin.com>
References: <20181231133030.25991-1-thomas.petazzoni@bootlin.com>
 <20181231133030.25991-14-thomas.petazzoni@bootlin.com>
Message-ID: <20190101210659.GC23435@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Gwenha?l, All,

On 2018-12-31 14:30 +0100, Thomas Petazzoni spake thusly:
> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> 
> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  package/libvips/libvips.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libvips/libvips.mk b/package/libvips/libvips.mk
> index 8078e046d1..7622f32fbc 100644
> --- a/package/libvips/libvips.mk
> +++ b/package/libvips/libvips.mk
> @@ -68,9 +68,9 @@ else
>  LIBVIPS_CONF_OPTS += --without-tiff
>  endif
>  
> -ifeq ($(BR2_PACKAGE_FFTW),y)
> +ifeq ($(BR2_PACKAGE_FFTW_DOUBLE),y)

Once more, why only fftw-double, when it previously could build with any
variant?

Regards,
Yann E. MORIN.

>  LIBVIPS_CONF_OPTS += --with-fftw
> -LIBVIPS_DEPENDENCIES += fftw
> +LIBVIPS_DEPENDENCIES += fftw-double
>  else
>  LIBVIPS_CONF_OPTS += --without-fftw
>  endif
> -- 
> 2.20.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
