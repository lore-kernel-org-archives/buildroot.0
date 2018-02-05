From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 5 Feb 2018 22:27:18 +0100
Subject: [Buildroot] [PATCH 4/5] package/glibc: remove GLIBC_SRC_SUBDIR
In-Reply-To: <20180205205716.4279-4-romain.naour@gmail.com>
References: <20180205205716.4279-1-romain.naour@gmail.com>
 <20180205205716.4279-4-romain.naour@gmail.com>
Message-ID: <20180205212718.GB2806@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2018-02-05 21:57 +0100, Romain Naour spake thusly:
> GLIBC_SRC_SUBDIR was needed when Buildroot supported
> eglibc which stored all sources in a sub-directory.
> It was not removed by the commit removing eglibc support [1].
> 
> [1] 500de2598a4902a0e9ec53f7b475046ff17c6681
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

This can also be applied to master, probably...

Regards,
Yann E. MORIN.

> ---
>  package/glibc/glibc.mk | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
> index fd79d84f15..cf4bdec065 100644
> --- a/package/glibc/glibc.mk
> +++ b/package/glibc/glibc.mk
> @@ -20,10 +20,8 @@ GLIBC_VERSION = glibc-2.26-107-g73a92363619e52c458146e903dfb9b1ba823aa40
>  GLIBC_SITE = $(call github,bminor,glibc,$(GLIBC_VERSION))
>  endif
>  
> -GLIBC_SRC_SUBDIR = .
> -
>  GLIBC_LICENSE = GPL-2.0+ (programs), LGPL-2.1+, BSD-3-Clause, MIT (library)
> -GLIBC_LICENSE_FILES = $(addprefix $(GLIBC_SRC_SUBDIR)/,COPYING COPYING.LIB LICENSES)
> +GLIBC_LICENSE_FILES = COPYING COPYING.LIB LICENSES
>  
>  # glibc is part of the toolchain so disable the toolchain dependency
>  GLIBC_ADD_TOOLCHAIN_DEPENDENCY = NO
> @@ -86,7 +84,7 @@ define GLIBC_CONFIGURE_CMDS
>  		$(TARGET_CONFIGURE_OPTS) \
>  		CFLAGS="-O2 $(GLIBC_EXTRA_CFLAGS)" CPPFLAGS="" \
>  		CXXFLAGS="-O2 $(GLIBC_EXTRA_CFLAGS)" \
> -		$(SHELL) $(@D)/$(GLIBC_SRC_SUBDIR)/configure \
> +		$(SHELL) $(@D)/configure \
>  		ac_cv_path_BASH_SHELL=/bin/bash \
>  		libc_cv_forced_unwind=yes \
>  		libc_cv_ssp=no \
> -- 
> 2.14.3
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
