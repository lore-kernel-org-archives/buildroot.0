From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 13 Nov 2019 22:26:27 +0100
Subject: [Buildroot] [PATCH 05/11] package/kodi: drop readline dependency
In-Reply-To: <20191113151724.12155-6-peter@korsgaard.com>
References: <20191113151724.12155-1-peter@korsgaard.com>
 <20191113151724.12155-6-peter@korsgaard.com>
Message-ID: <20191113212627.GU3419@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2019-11-13 16:17 +0100, Peter Korsgaard spake thusly:
> {python-,}readline is (no longer) a required dependency of kodi, and
> readline (GPL-3.0+) is not license compatible with kodi (GPL-2.0), so drop
> the dependency.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
[--SNIP--]
> diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
> index 028bf551bc..49728e464b 100644
> --- a/package/kodi/kodi.mk
> +++ b/package/kodi/kodi.mk
> @@ -38,7 +38,6 @@ KODI_DEPENDENCIES = \
>  	openssl \
>  	pcre \
>  	python \
> -	readline \

What does actually prevent kodi from linking with readline, is that
happens to be built before?

I'll kick-start a build here (without your patch) and see what goes
linked with readline, if anything.

In the meantime, I've pondered applying this patch anyway, because it
removes the explicit dependency, so that if kodi still links to
readline, that would be an accident due to another intermediate
dependency, and thus not our fault. But I am not too happy either, so
I refrained eventually...

Regards,
Yann E. MORIN.

>  	sqlite \
>  	taglib \
>  	tinyxml \
> -- 
> 2.20.1
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
