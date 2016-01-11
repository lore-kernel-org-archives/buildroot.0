From: gwenhael.goavec <gwenj@trabucayre.com>
Date: Mon, 11 Jan 2016 08:42:11 +0100
Subject: [Buildroot] [PATCH 65/84 RFC] package/gnuradio: split long
 omment
In-Reply-To: <f020ad988a84c95b108db63d7e82e312faa7dae1.1451076704.git.yann.morin.1998@free.fr>
References: <cover.1451076704.git.yann.morin.1998@free.fr>
 <f020ad988a84c95b108db63d7e82e312faa7dae1.1451076704.git.yann.morin.1998@free.fr>
Message-ID: <20160111084211.2a15c714@x230.trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Any news?

Gwen

On Fri, 25 Dec 2015 22:25:34 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> It does not fit even is a wider-than-normal terminal.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/gnuradio/Config.in | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/package/gnuradio/Config.in b/package/gnuradio/Config.in
> index f2c884b..d502b06 100644
> --- a/package/gnuradio/Config.in
> +++ b/package/gnuradio/Config.in
> @@ -58,8 +58,11 @@ config BR2_PACKAGE_GNURADIO_UTILS
>  	help
>  	  Misc python utilities
>  
> -comment "gr-fft, -filter, -analog, -channels, -digital, -trellis,
> -pager depends fftw's single precision"
> -	depends on !BR2_PACKAGE_FFTW_PRECISION_SINGLE
> +if !BR2_PACKAGE_FFTW_PRECISION_SINGLE
> +comment "gr-fft, gr-filter, gr-analog, gr-channels,"
> +comment "gr-digital, gr-trellis and gr-pager all"
> +comment "depend on fftw's single precision"
> +endif
>  
>  if BR2_PACKAGE_FFTW_PRECISION_SINGLE
>  
> -- 
> 1.9.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
