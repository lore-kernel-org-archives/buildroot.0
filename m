From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 26 May 2020 22:28:49 +0200
Subject: [Buildroot] [PATCH 1/1] package/prosody: use correct bit32
 package
In-Reply-To: <20200525025053.3354588-1-james.hilliard1@gmail.com>
References: <20200525025053.3354588-1-james.hilliard1@gmail.com>
Message-ID: <20200526202849.GD8737@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

James, All,

On 2020-05-24 20:50 -0600, James Hilliard spake thusly:
> According to https://prosody.im/doc/depends#bitop the correct bitop
> package to use with prosody for Lua 5.1 is:
> https://luarocks.org/modules/siffiejoe/bit32
> 
> As such replace BR2_PACKAGE_LUABITOP with BR2_PACKAGE_LUA_BIT32
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/prosody/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/prosody/Config.in b/package/prosody/Config.in
> index c32ca20e23..0b01547103 100644
> --- a/package/prosody/Config.in
> +++ b/package/prosody/Config.in
> @@ -4,7 +4,7 @@ config BR2_PACKAGE_PROSODY
>  	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
>  	depends on !BR2_PACKAGE_LUA_5_3
>  	depends on !BR2_STATIC_LIBS # luaexpat, luasec, luasocket, luafilesystem
> -	select BR2_PACKAGE_LUABITOP if !BR2_PACKAGE_LUAJIT # runtime
> +	select BR2_PACKAGE_LUA_BIT32 if BR2_PACKAGE_LUA_5_1 # runtime
>  	select BR2_PACKAGE_LUAEXPAT # runtime
>  	select BR2_PACKAGE_LUASEC # runtime
>  	select BR2_PACKAGE_LUASOCKET # runtime
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
