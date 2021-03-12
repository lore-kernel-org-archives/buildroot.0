From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 12 Mar 2021 22:02:47 +0100
Subject: [Buildroot] [PATCH 1/1] package/bash: fix seventh patch
In-Reply-To: <20210312070803.768698-1-fontaine.fabrice@gmail.com>
References: <20210312070803.768698-1-fontaine.fabrice@gmail.com>
Message-ID: <20210312210247.GA2737665@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-03-12 08:08 +0100, Fabrice Fontaine spake thusly:
> Since bump to version 5.1 in commit
> 9e778b044c949d165207150cc9e79fdcfbafcb9d, seventh patch wrongly defines
> wcdequote_pathname as static which will result in the following build
> failure:
> 
> smatch.c:(.text+0x22f0): undefined reference to `wcdequote_pathname'
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/d83f5d260dccd38984ec6fdb340835ca928bb687
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...-glob-fix-dequote_pathname-vs.-udequote_pathname.patch | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/package/bash/0007-glob-fix-dequote_pathname-vs.-udequote_pathname.patch b/package/bash/0007-glob-fix-dequote_pathname-vs.-udequote_pathname.patch
> index b769dc296e..a801f68236 100644
> --- a/package/bash/0007-glob-fix-dequote_pathname-vs.-udequote_pathname.patch
> +++ b/package/bash/0007-glob-fix-dequote_pathname-vs.-udequote_pathname.patch
> @@ -27,13 +27,7 @@ diff --git a/lib/glob/glob.c b/lib/glob/glob.c
>  index eb6277f..c903b15 100644
>  --- a/lib/glob/glob.c
>  +++ b/lib/glob/glob.c
> -@@ -117,12 +117,11 @@ static int mbskipname PARAMS((char *, char *, int));
> - #endif
> - void udequote_pathname PARAMS((char *));
> - #if HANDLE_MULTIBYTE
> --void wcdequote_pathname PARAMS((wchar_t *));
> -+static void wcdequote_pathname PARAMS((wchar_t *));
> - static void wdequote_pathname PARAMS((char *));
> +@@ -117,6 +117,5 @@ static int mbskipname PARAMS((char *, char *, int));
>   #else
>   #  define dequote_pathname udequote_pathname
>   #endif
> -- 
> 2.30.0
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
