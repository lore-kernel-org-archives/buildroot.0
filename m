From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 2 Jan 2016 22:44:52 +0100
Subject: [Buildroot] [PATCH 65/84 RFC] package/gnuradio: split long
	omment
In-Reply-To: <f020ad988a84c95b108db63d7e82e312faa7dae1.1451076704.git.yann.morin.1998@free.fr>
References: <cover.1451076704.git.yann.morin.1998@free.fr>
 <f020ad988a84c95b108db63d7e82e312faa7dae1.1451076704.git.yann.morin.1998@free.fr>
Message-ID: <568844D4.2060805@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 25-12-15 22:25, Yann E. MORIN wrote:
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
> -comment "gr-fft, -filter, -analog, -channels, -digital, -trellis, -pager depends fftw's single precision"
> -	depends on !BR2_PACKAGE_FFTW_PRECISION_SINGLE
> +if !BR2_PACKAGE_FFTW_PRECISION_SINGLE
> +comment "gr-fft, gr-filter, gr-analog, gr-channels,"
> +comment "gr-digital, gr-trellis and gr-pager all"
> +comment "depend on fftw's single precision"

 This would perhaps be a good occasion to also correct the sentence into
something like "single precision implementation".

 Also, it would be prettier if the excess space were filled up with spaces so
the *** lines up, like we do in Config.in.legacy.

 Regards,
 Arnout

> +endif
>  
>  if BR2_PACKAGE_FFTW_PRECISION_SINGLE
>  
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
