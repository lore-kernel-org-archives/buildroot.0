From: gwenhael.goavec <gwenj@trabucayre.com>
Date: Mon, 16 Mar 2015 16:48:05 +0100
Subject: [Buildroot] [PATCH 5/7 v6] package/fftw: enable threads when
 the tooclhain has them
In-Reply-To: <3f663be2974698062d8c1b01f865ddfba05583a2.1426513949.git.yann.morin.1998@free.fr>
References: <cover.1426513949.git.yann.morin.1998@free.fr>
 <3f663be2974698062d8c1b01f865ddfba05583a2.1426513949.git.yann.morin.1998@free.fr>
Message-ID: <20150316164805.3a125d31@x230.trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 16 Mar 2015 14:54:03 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> [based on a patch by Guillaume]
> Cc: guillaume william brs <guillaume.bressaix@gmail.com>
> Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Tested-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Reviewed-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> ---
>  package/fftw/fftw.mk | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/fftw/fftw.mk b/package/fftw/fftw.mk
> index 333e13b..a82fca3 100644
> --- a/package/fftw/fftw.mk
> +++ b/package/fftw/fftw.mk
> @@ -23,4 +23,7 @@ FFTW_CONF_OPTS += $(if $(BR2_PACKAGE_FFTW_USE_SSE2),--enable,--disable)-sse2
>  # ARM optimisations
>  FFTW_CONF_OPTS += $(if $(BR2_PACKAGE_FFTW_USE_NEON),--enable,--disable)-neon
>  
> +# Generic optimisations
> +FFTW_CONF_OPTS += $(if $(BR2_TOOLCHAIN_HAS_THREADS),--enable,--disable)-threads
> +
>  $(eval $(autotools-package))
> -- 
> 1.9.1
> 
