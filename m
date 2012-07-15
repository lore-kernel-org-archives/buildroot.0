From: =?ISO-8859-1?Q?Fran=E7ois_Perrad?= <francois.perrad@gadz.org>
Date: Sun, 15 Jul 2012 11:17:41 +0200
Subject: [Buildroot] [PATCH] New package: LuaExpat
In-Reply-To: <CANxTyt5uMPs3u5gMh51jMAhJkERMPLyZ4559uw3ffvehBFM2Bg@mail.gmail.com>
References: <1338857115-4148-1-git-send-email-danomimanchego123@gmail.com>
 <CAB0FRssTdf-1nYWsrZ-P2Yr+hEJb8-xu8CqkMYsLR6TWa3JTiw@mail.gmail.com>
 <CANxTyt5uMPs3u5gMh51jMAhJkERMPLyZ4559uw3ffvehBFM2Bg@mail.gmail.com>
Message-ID: <CAB0FRst-8UEcYMy_gpza_w8MwKcamCJVctXMev-E__Gm5KcB_A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2012/7/14 Danomi Manchego <danomimanchego123@gmail.com>:
> Fran?ois,
>
>> but Config.in contains an useless line :
>>    depends on BR2_PACKAGE_LUA_SHARED_LIBRARY
>
> To be honest, I was just following the example of most of the other
> lua-related packages.  Currently, the same depends-on is listed in
> luafilesystem, luasocket, cgilua, rings, xavante, and copas (with comment
> indicating that this is due to luasocket).  How is usefulness determined in
> these cases?
>

Well, Lua module packages need some clean up, see
http://patchwork.ozlabs.org/patch/162294/

The dependency of a Lua module (like LuaExpat) against Lua is
implicit, because in package/Config.in
    source "package/lua/Config.in"
    if BR2_PACKAGE_LUA
    menu "LUA libraries/modules"
    ...
    source "package/luaexpat/Config.in"
    ...
    endmenu
    endif
So, don't add explicit things in package/luaexpat/Config.in like :
    depends on BR2_PACKAGE_LUA_SHARED_LIBRARY
or
    depends on BR2_PACKAGE_LUA

By this way, your module could work with Lua or LuaJIT.
(BR2_PACKAGE_LUA_SHARED_LIBRARY is an internal of Lua package)

Fran?ois

> Danomi -
>
>
