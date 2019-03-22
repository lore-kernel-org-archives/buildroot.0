From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 22 Mar 2019 22:15:34 +0100
Subject: [Buildroot] [PATCH 1/2] toolchain-external: add option for
 OpenMP support
In-Reply-To: <20190322165929.14306-2-ed.blake@sondrel.com>
References: <20190322165929.14306-1-ed.blake@sondrel.com>
 <20190322165929.14306-2-ed.blake@sondrel.com>
Message-ID: <20190322211534.GH2660@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ed, All,

On 2019-03-22 16:59 +0000, Ed Blake spake thusly:
> Add new BR2_TOOLCHAIN_HAS_OPENMP option for toolchains with OpenMP
> support.

With your series, there is no user of libgomp in Buildroot, so I
suppose this is for your own local packages, right?

Actually, if we have packages in Buildroot that may use OpenMP, then it
is only optional for them, then. Do you know of such a package? The goal
being to actually add a runtime-test that gomp works.

> Signed-off-by: Ed Blake <ed.blake@sondrel.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  toolchain/Config.in                                    | 3 +++
>  toolchain/toolchain-external/pkg-toolchain-external.mk | 4 ++++
>  2 files changed, 7 insertions(+)
> 
> diff --git a/toolchain/Config.in b/toolchain/Config.in
> index bcbc3cf984..bf42e92e00 100644
> --- a/toolchain/Config.in
> +++ b/toolchain/Config.in
> @@ -168,6 +168,9 @@ config BR2_TOOLCHAIN_HAS_SSP
>  config BR2_TOOLCHAIN_HAS_UCONTEXT
>  	bool
>  
> +config BR2_TOOLCHAIN_HAS_OPENMP
> +	bool
> +
>  config BR2_TOOLCHAIN_SUPPORTS_PIE
>  	bool
>  
> diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
> index db3570d96f..747837fdc6 100644
> --- a/toolchain/toolchain-external/pkg-toolchain-external.mk
> +++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
> @@ -144,6 +144,10 @@ TOOLCHAIN_EXTERNAL_LIBS += libquadmath.so*
>  endif
>  endif
>  
> +ifeq ($(BR2_TOOLCHAIN_HAS_OPENMP),y)
> +TOOLCHAIN_EXTERNAL_LIBS += libgomp.so.*
> +endif
> +
>  TOOLCHAIN_EXTERNAL_LIBS += $(call qstrip,$(BR2_TOOLCHAIN_EXTRA_EXTERNAL_LIBS))
>  
>  
> -- 
> 2.17.1
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
