From: gwenhael.goavec <gwenj@trabucayre.com>
Date: Mon, 16 Mar 2015 15:30:50 +0100
Subject: [Buildroot] [PATCH 3/7 v6] package/fftw: add ARM optimisations
In-Reply-To: <930765fdc259da928cc44c19eb191f71d5132eef.1426513949.git.yann.morin.1998@free.fr>
References: <cover.1426513949.git.yann.morin.1998@free.fr>
 <930765fdc259da928cc44c19eb191f71d5132eef.1426513949.git.yann.morin.1998@free.fr>
Message-ID: <20150316153050.68ab2d76@x230.trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN
On Mon, 16 Mar 2015 14:54:01 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
[SNIP]
>  choice
>  	prompt "fftw precision"
>  	default BR2_PACKAGE_FFTW_PRECISION_NONE
> @@ -33,6 +36,7 @@ config BR2_PACKAGE_FFTW_PRECISION_SINGLE
>  	bool "single precision"
>  	select BR2_PACKAGE_FFTW_USE_SSE if BR2_X86_CPU_HAS_SSE
>  	select BR2_PACKAGE_FFTW_USE_SSE2 if BR2_X86_CPU_HAS_SSE2
> +	select BR2_PACKAGE_FFTW_USE_NEON if BR2_ARM_FPU_NEON
>  	help
[SNIP]
s/BR2_ARM_FPU_NEON/BR2_ARM_CPU_HAS_NEON/

Regards

Gwen
