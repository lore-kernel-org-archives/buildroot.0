From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 11 Oct 2015 22:14:38 +0200
Subject: [Buildroot] [PATCH] sparc64: fix toolchain building when C++ is
 enabled
In-Reply-To: <20151011171727.GA14946@waldemar-brodkorb.de>
References: <20151011171727.GA14946@waldemar-brodkorb.de>
Message-ID: <20151011201438.GB24916@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Waldemar, All,

On 2015-10-11 19:17 +0200, Waldemar Brodkorb spake thusly:
> Disable libsanitizer for sparc64, too. Same problem as for
> sparc, see https://bugs.busybox.net/show_bug.cgi?id=7951
> 
> Reported-By: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/gcc/gcc.mk |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
> index 4def65c..1b30e6d 100644
> --- a/package/gcc/gcc.mk
> +++ b/package/gcc/gcc.mk
> @@ -142,7 +142,7 @@ endif
>  
>  # libsanitizer is broken for SPARC
>  # https://bugs.busybox.net/show_bug.cgi?id=7951
> -ifeq ($(BR2_sparc),y)
> +ifeq ($(BR2_sparc)$(BR2_sparc64),y)
>  HOST_GCC_COMMON_CONF_OPTS += --disable-libsanitizer
>  endif
>  
> -- 
> 1.7.10.4
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
