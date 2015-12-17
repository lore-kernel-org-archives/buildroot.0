From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Dec 2015 23:17:16 +0100
Subject: [Buildroot] [PATCH v10 01/28] package/efl/libefl: new package
In-Reply-To: <5673329D.4040406@openwide.fr>
References: <1450219240-16938-1-git-send-email-romain.naour@openwide.fr>
 <1450219240-16938-2-git-send-email-romain.naour@openwide.fr>
 <20151216213204.198f5387@free-electrons.com>
 <5673329D.4040406@openwide.fr>
Message-ID: <20151217231716.5b8c9eea@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain,

On Thu, 17 Dec 2015 23:09:33 +0100, Romain Naour wrote:

> > So we really need Lua itself, and not LuaJIT ? If we need only Lua (and
> > not LuaJIT), why don't we select it ? If we can use either Lua or
> > LuaJIT, then we should "depends on BR2_PACKAGE_LUAINTERPRETER.
> > 
> > Also, if I apply just this patch, I get some kconfig warnings:
> > 
> > package/efl/Config.in:1:error: recursive dependency detected!
> > package/efl/Config.in:1:	symbol BR2_PACKAGE_EFL depends on BR2_PACKAGE_LUA
> > package/lua/Config.in:1:	symbol BR2_PACKAGE_LUA is selected by BR2_PACKAGE_LIBEDJE
> > package/efl/libedje/Config.in:4:	symbol BR2_PACKAGE_LIBEDJE is selected by BR2_PACKAGE_LIBETHUMB
> > package/efl/libethumb/Config.in:4:	symbol BR2_PACKAGE_LIBETHUMB depends on BR2_PACKAGE_EFL
> > 
> > But it's true that your series later removes libedje, so maybe I should
> > just not care about this: it's hard to do the big change you're doing
> > without having some intermediate steps that are imperfect.
> 
> Well, I tried to do a smooth update series has much as possible ;-)
> But I didn't want to modify efl packages that are removed at the end of the
> series... I didn't test all intermediate test of this series, only when the
> entire series is applied.

Yes, that's fine with me. The changes are complicated, it's difficult
to do a series that is entirely bisectable.

> > Can you let me know the answer for the Lua/LuaJIT question so that we
> > can move forward with this ?
> 
> I haven't tested all lua interpreter...
> Here is the lua interpreter I used for the runtime test:
> 
> BR2_PACKAGE_LUA=y
> BR2_PACKAGE_PROVIDES_LUAINTERPRETER="lua"
> BR2_PACKAGE_LUA_5_1=y
> 
> If you want to try with LuaJIT, the --enable-lua-old option must be removed.
> IIRC, I had some build issue with it but it was with efl 1.13.2.
> So, I wanted to avoid LuaJIT for now and be sure that one of LUA packages is
> selected.
> 
> I'll check if efl can just depends on BR2_PACKAGE_HAS_LUAINTERPRETER.

No, please stick to just Lua for now. I want to merge this series, so
we should stop doing more and more things on it.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
