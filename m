From: gwenhael.goavec <gwenj@trabucayre.com>
Date: Mon, 16 Mar 2015 17:16:42 +0100
Subject: [Buildroot] [PATCH 6/7 v6] package/fftw: enable OpenMP if the
 compiler has that
In-Reply-To: <554e816b7c47a2e6a0a0790b5be0cecba5324eac.1426513949.git.yann.morin.1998@free.fr>
References: <cover.1426513949.git.yann.morin.1998@free.fr>
 <554e816b7c47a2e6a0a0790b5be0cecba5324eac.1426513949.git.yann.morin.1998@free.fr>
Message-ID: <20150316171642.61419a7e@x230.trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 16 Mar 2015 14:54:04 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Unfortunately, this is limited to internal toolchains; we currently have
> no way to know if an external toolchain has support for OpenMP.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: guillaume william brs <guillaume.bressaix@gmail.com>
> Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Tested-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Reviewed-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> ---
>  package/fftw/fftw.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/fftw/fftw.mk b/package/fftw/fftw.mk
> index a82fca3..c6fe6f0 100644
> --- a/package/fftw/fftw.mk
> +++ b/package/fftw/fftw.mk
> @@ -25,5 +25,6 @@ FFTW_CONF_OPTS += $(if $(BR2_PACKAGE_FFTW_USE_NEON),--enable,--disable)-neon
>  
>  # Generic optimisations
>  FFTW_CONF_OPTS += $(if $(BR2_TOOLCHAIN_HAS_THREADS),--enable,--disable)-threads
> +FFTW_CONF_OPTS += $(if $(BR2_GCC_ENABLE_OPENMP),--enable-openmp,--disable-openmp)
>  
>  $(eval $(autotools-package))
> -- 
> 1.9.1
> 
