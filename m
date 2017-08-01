From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Aug 2017 19:10:32 +0200
Subject: [Buildroot] [PATCH 2/2] swupdate: support for Lua 5.1 is broken
In-Reply-To: <20170731211800.5888-2-joerg.krause@embedded.rocks>
References: <20170731211800.5888-1-joerg.krause@embedded.rocks>
 <20170731211800.5888-2-joerg.krause@embedded.rocks>
Message-ID: <20170801191032.6c2ca207@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 31 Jul 2017 23:18:00 +0200, J?rg Krause wrote:
> Before commit 87b6ac1478821351c92f7ca1c3154550e4713b28 support for Lua
> was always disabled by the default config file:
> 
> ```
> CONFIG_LUA is not set
> ```
> 
> The commit removed this setting and Lua support is now enabled if a Lua
> interpreter is enabled. As the swupdate build system uses pkg-config to check
> for the lua library by default (LUAPKG="lua") this throws a lot of
> undefined referenced in case LuaJIT is uses as Lua interpreter, e.g.:
> 
> ```
> corelib/lib.a(lua_interface.o): In function `l_info':
> lua_interface.c:(.text.l_info+0x14): undefined reference to `luaL_checklstring'
> ```
> 
> However, since version 2017.07 support for Lua 5.1 is broken in swupdate. Therefore,
> remove support for Lua 5.1 and LuaJIT in the swupdate package for now
> until upstream might fix this issue.

Isn't it better to revert the bump to 2017.07 instead of removing
functionality that people could be relying on ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
