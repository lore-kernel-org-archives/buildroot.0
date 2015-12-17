From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 17 Dec 2015 23:21:51 +0100
Subject: [Buildroot] [PATCH v10 01/28] package/efl/libefl: new package
In-Reply-To: <5673329D.4040406@openwide.fr>
References: <1450219240-16938-1-git-send-email-romain.naour@openwide.fr>
 <1450219240-16938-2-git-send-email-romain.naour@openwide.fr>
 <20151216213204.198f5387@free-electrons.com>
 <5673329D.4040406@openwide.fr>
Message-ID: <20151217222151.GG3653@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, Thomas, All,

On 2015-12-17 23:09 +0100, Romain Naour spake thusly:
> Le 16/12/2015 21:32, Thomas Petazzoni a ?crit :
> > On Tue, 15 Dec 2015 23:40:13 +0100, Romain Naour wrote:
[--SNIP--]
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

For what it's worth, I just sent a series actually fixing that very
issue.

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

I would say: don't.

If you manage to make it work with the 'full' Lua, just keep it as is.
Checking for luajit can be done is a followup series.

But please, no more feature changes in that series. Let's get it
appplied asap now. Let's just fix the obvious, new features can be added
*later*.

Thanks!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
