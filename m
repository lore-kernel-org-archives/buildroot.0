From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Mar 2017 23:28:26 +0100
Subject: [Buildroot] [PATCH 15/25] luaposix: fix runtime by selecting
 "bit32" instead of "bitop"
In-Reply-To: <20170223170047.24417-16-arnout@mind.be>
References: <20170223170047.24417-1-arnout@mind.be>
 <20170223170047.24417-16-arnout@mind.be>
Message-ID: <20170302232826.55b1db07@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 23 Feb 2017 18:00:37 +0100, Arnout Vandecappelle
(Essensium/Mind) wrote:
> Since the bump of luaposix to 33.4.0, it doesn't work anymore at
> runtime with LuaJIT or Lua 5.1. This can be tested with the following
> defconfig:
> 
> BR2_x86_64=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_PACKAGE_LUA=y
> BR2_PACKAGE_LUA_5_1=y
> BR2_PACKAGE_LUAPOSIX=y
> 
> /usr/bin/lua: /usr/share/lua/5.1/posix/init.lua:17: module 'bit32' not found:
> ...
> 
> In older luaposix versions, it would try to load the 'bit' instead of
> 'bit32' module if LUAVER == 5.1. However, this feature was removed in
> 33.4.0.
> 
> So instead of adding a runtime dependency on luabitop, depend on
> lua-bit32.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Now that I think more about this, I believe PATCH 14/25 and 15/25
should be merged into the LTS branch, since they fix a runtime issue
with Lua.

I believe even though they show up as patches 14 and 15 in the series,
they don't depend on any of the previous patches.

Peter, what do you think?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
