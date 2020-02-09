From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 9 Feb 2020 22:34:07 +0100
Subject: [Buildroot] [PATCH] package/uclibc: restore __isctype_l
 definition
In-Reply-To: <20200209200937.25440-1-jcmvbkbc@gmail.com>
References: <20200209200937.25440-1-jcmvbkbc@gmail.com>
Message-ID: <20200209213407.GW23769@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Max, All,

On 2020-02-09 12:09 -0800, Max Filippov spake thusly:
> Recent is*_l fix broke uclibc build because removed __isctype_l
> definition was used in libc/misc/ctype/ctype.c. Restore it.
> 
> Fixes: 8723c5e7a6db ("package/uclibc: fix ctype.h is*_l definitions")
> Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>

Thanks for the quick fix! :-)

I've applied to master, with the folowing changes:

  - add new patch, don't fix existing one
  - add URL to upstream ML post

Regards,
Yann E. MORIN.

> ---
>  .../0001-include-ctype.h-drop-is-_l-macro-definitions.patch   | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/uclibc/0001-include-ctype.h-drop-is-_l-macro-definitions.patch b/package/uclibc/0001-include-ctype.h-drop-is-_l-macro-definitions.patch
> index 5557a9c1e730..41c9d3d2bd81 100644
> --- a/package/uclibc/0001-include-ctype.h-drop-is-_l-macro-definitions.patch
> +++ b/package/uclibc/0001-include-ctype.h-drop-is-_l-macro-definitions.patch
> @@ -20,7 +20,7 @@ diff --git a/include/ctype.h b/include/ctype.h
>  index ecd5e730886a..e934cf3321a6 100644
>  --- a/include/ctype.h
>  +++ b/include/ctype.h
> -@@ -350,46 +350,13 @@ libc_hidden_proto(tolower_l)
> +@@ -350,46 +350,14 @@ libc_hidden_proto(tolower_l)
>   /* Return the uppercase version of C.  */
>   extern int toupper_l (int __c, __locale_t __l) __THROW;
>   
> @@ -30,7 +30,7 @@ index ecd5e730886a..e934cf3321a6 100644
>  -# endif	/* Optimizing gcc */
>  -
>  -
> --# define __isctype_l(c, type, locale) ((locale)->__ctype_b[(int) (c)] & (__ctype_mask_t) type)
> + # define __isctype_l(c, type, locale) ((locale)->__ctype_b[(int) (c)] & (__ctype_mask_t) type)
>   # ifndef __NO_CTYPE
>  -#  define __isalnum_l(c,l)	__isctype_l((c), _ISalnum, (l))
>  -#  define __isalpha_l(c,l)	__isctype_l((c), _ISalpha, (l))
> -- 
> 2.20.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
