From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 9 Mar 2016 00:14:33 +0100
Subject: [Buildroot] [PATCH] gcc: drop gcc 4.5 specific code
In-Reply-To: <1457476243-9401-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1457476243-9401-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20160308231433.GE14289@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

thomas, All,

On 2016-03-08 23:30 +0100, Thomas Petazzoni spake thusly:
> We have removed gcc 4.5 support since a long time, so this commit
> removes dead code that was only used when building a toolchain based
> on gcc 4.5.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/gcc/gcc.mk | 9 ---------
>  1 file changed, 9 deletions(-)
> 
> diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
> index 07883d0..0fb73c9 100644
> --- a/package/gcc/gcc.mk
> +++ b/package/gcc/gcc.mk
> @@ -97,15 +97,6 @@ HOST_GCC_COMMON_CONF_ENV = \
>  GCC_COMMON_TARGET_CFLAGS = $(TARGET_CFLAGS)
>  GCC_COMMON_TARGET_CXXFLAGS = $(TARGET_CXXFLAGS)
>  
> -# http://gcc.gnu.org/bugzilla/show_bug.cgi?id=43810
> -# Workaround until it's fixed in 4.5.4 or later
> -ifeq ($(ARCH),powerpc)
> -ifeq ($(findstring x4.5.,x$(GCC_VERSION)),x4.5.)
> -GCC_COMMON_TARGET_CFLAGS = $(filter-out -Os,$(GCC_COMMON_TARGET_CFLAGS))
> -GCC_COMMON_TARGET_CXXFLAGS = $(filter-out -Os,$(GCC_COMMON_TARGET_CXXFLAGS))
> -endif
> -endif
> -
>  # Xtensa libgcc can't be built with -mauto-litpools
>  # because of the trick used to generate .init/.fini sections.
>  ifeq ($(BR2_xtensa),y)
> -- 
> 2.6.4
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
