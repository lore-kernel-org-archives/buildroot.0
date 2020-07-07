From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 7 Jul 2020 22:08:48 +0200
Subject: [Buildroot] [PATCH] package/luaposix: bump to version 35.0
In-Reply-To: <20200707080644.1643879-1-francois.perrad@gadz.org>
References: <20200707080644.1643879-1-francois.perrad@gadz.org>
Message-ID: <20200707200848.GS2273@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fran?ois, All,

On 2020-07-07 10:06 +0200, Francois Perrad spake thusly:
> LICENSE diff:
> - Copyright (C) 2006-2019 luaposix authors
> + Copyright (C) 2006-2020 luaposix authors
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Applied to master, thanks.

But see below for a small nit...

> ---
>  package/luaposix/Config.in     | 2 +-
>  package/luaposix/luaposix.hash | 4 ++--
>  package/luaposix/luaposix.mk   | 2 +-
>  3 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/luaposix/Config.in b/package/luaposix/Config.in
> index 1e2291b3f..fb346429c 100644
> --- a/package/luaposix/Config.in
> +++ b/package/luaposix/Config.in
> @@ -5,7 +5,7 @@ config BR2_PACKAGE_LUAPOSIX
>  	# doesn't find it.
>  	select BR2_PACKAGE_LUA_BIT32 if BR2_PACKAGE_LUA_5_1 || BR2_PACKAGE_LUAJIT # runtime
>  	help
> -	  This is a POSIX binding for LuaJIT, Lua 5.1, 5.2 and 5.3;
> +	  This is a POSIX binding for LuaJIT, Lua 5.1, 5.2, 5.3 and 5.4;

I've simplified this to 'Lua 5.1 through 5.4' so that we can avoid
listing all the versions in-between, when the list grows in the future.

Regards,
Yann E. MORIN.

>  	  like most libraries it simply binds to C APIs on the
>  	  underlying system, so it won't work on non-POSIX systems.
>  	  However, it does try to detect the level of POSIX conformance
> diff --git a/package/luaposix/luaposix.hash b/package/luaposix/luaposix.hash
> index ee72bfe32..54617853a 100644
> --- a/package/luaposix/luaposix.hash
> +++ b/package/luaposix/luaposix.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  7948f4ac8b953172e928753632e37ad97cc3014df74b524fe7839f71216a7e90  luaposix-34.1.1.tar.gz
> -sha256  a868e95dd14f832eb63c4580c5fed42d78a6bd11785e3605211f446b05904a18  LICENSE
> +sha256  a4edf2f715feff65acb009e8d1689e57ec665eb79bc36a6649fae55eafd56809  luaposix-35.0.tar.gz
> +sha256  e5d496c903dc3989bb2f6f175cda52d26e3494ad1fdd67ae1c3b3e5f76ffb86f  LICENSE
> diff --git a/package/luaposix/luaposix.mk b/package/luaposix/luaposix.mk
> index ab6b030fc..d04881dfd 100644
> --- a/package/luaposix/luaposix.mk
> +++ b/package/luaposix/luaposix.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LUAPOSIX_VERSION = 34.1.1
> +LUAPOSIX_VERSION = 35.0
>  LUAPOSIX_SITE = $(call github,luaposix,luaposix,v$(LUAPOSIX_VERSION))
>  LUAPOSIX_LICENSE = MIT
>  LUAPOSIX_LICENSE_FILES = LICENSE
> -- 
> 2.25.1
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
