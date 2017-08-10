From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 10 Aug 2017 14:51:33 +0200
Subject: [Buildroot] [PATCH 2/2] swupdate: support for Lua 5.1 is broken
In-Reply-To: <20170731211800.5888-2-joerg.krause@embedded.rocks>
References: <20170731211800.5888-1-joerg.krause@embedded.rocks>
 <20170731211800.5888-2-joerg.krause@embedded.rocks>
Message-ID: <68d65b93-6f08-07d8-564d-7a6d7af56a75@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 31-07-17 23:18, J?rg Krause wrote:
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
> 
> Reported upstream:
> https://groups.google.com/forum/#!topic/swupdate/WAm8npAOd6o
> 
> Fixes:
> http://autobuild.buildroot.net/results/df2/df2a71efe5af52d7b8721a355c49934b1be197a3/
> http://autobuild.buildroot.net/results/400/4006225c8a47eb0b56399c83bd6d00406a0f62c2/
> http://autobuild.buildroot.net/results/098/098f9d6cd905359adac4fb15e1d54c5022757325/
> http://autobuild.buildroot.net/results/e5f/e5f6f99d96d9c661454335e7f931a03c3ae6a9e2/
> http://autobuild.buildroot.net/results/f3a/f3a0abe8d5e35c85da40d20dab260c28506a0d4c/
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>

 Applied to master after updating the commit message as you suggested, thanks.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
