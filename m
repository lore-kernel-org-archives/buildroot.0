From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 27 Jul 2020 21:19:40 +0200
Subject: [Buildroot] [PATCH v3 7/9] package/efl: depend on lua ABI
 version 5.1
In-Reply-To: <20200525004845.3019642-7-james.hilliard1@gmail.com>
References: <20200525004845.3019642-1-james.hilliard1@gmail.com>
 <20200525004845.3019642-7-james.hilliard1@gmail.com>
Message-ID: <20200727191940.GI19818@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

James, All,

On 2020-05-24 18:48 -0600, James Hilliard spake thusly:
> Since efl is compatible with lua interpreters that provide the
> version 5.1 ABI we should depend on that instead of unconditionally
> selecting luajit.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
[--SNIP--]
> @@ -379,6 +385,14 @@ else
>  HOST_EFL_CONF_OPTS += --disable-cxx-bindings
>  endif
>  
> +ifeq ($(BR2_PACKAGE_LUAJIT),y)
> +HOST_EFL_CONF_OPTS += --disable-lua-old
> +HOST_EFL_DEPENDENCIES += host-luajit
> +else ifeq ($(BR2_PACKAGE_LUA),y)
> +HOST_EFL_CONF_OPTS += --enable-lua-old
> +HOST_EFL_DEPENDENCIES += host-lua
> +endif

Why does the host variant need to build against the same as the target
variant?

It is very unusual that a target option (here, the target Lua
interpreter) drives the compilation and dependencies of a host package,
so this warrants a bit of explanations.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
