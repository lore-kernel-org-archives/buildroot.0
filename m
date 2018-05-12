From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 12 May 2018 17:01:37 +0200
Subject: [Buildroot] [PATCH 1/1] package/znc: python support depends on
 icu
In-Reply-To: <20180509172553.856-1-bernd.kuhls@t-online.de>
References: <20180509172553.856-1-bernd.kuhls@t-online.de>
Message-ID: <20180512150137.GA27677@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2018-05-09 19:25 +0200, Bernd Kuhls spake thusly:
> Upstream checks for icu when build with python support:
> https://github.com/znc/znc/commit/4fe4a45dd62411ba9ede04750ca44f071e7d6cbb
> 
> Fixes
> http://autobuild.buildroot.net/results/9e4/9e44159820789f1d25efcbd24318b0e05e132371/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/znc/znc.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/znc/znc.mk b/package/znc/znc.mk
> index 33ac266dd3..2a04c66377 100644
> --- a/package/znc/znc.mk
> +++ b/package/znc/znc.mk
> @@ -32,7 +32,8 @@ else
>  ZNC_CONF_OPTS += --disable-zlib
>  endif
>  
> -ifeq ($(BR2_PACKAGE_PYTHON3),y)
> +# python support depends on icu
> +ifeq ($(BR2_PACKAGE_ICU)$(BR2_PACKAGE_PYTHON3),yy)

There is already an ICU conditrional above, so I was wondering if we
could comonalise the code...

In the end, I am not so sure that is important, though, so:

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

>  ZNC_DEPENDENCIES += python3 host-swig
>  ZNC_CONF_OPTS += --enable-python=python3
>  else
> -- 
> 2.14.2
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
