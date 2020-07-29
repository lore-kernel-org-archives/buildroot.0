From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Wed, 29 Jul 2020 15:01:00 +0200
Subject: [Buildroot] [PATCH] package/prosody: fix dependency
In-Reply-To: <20200728202511.GA16287@scaer>
References: <20200728062141.2969363-1-francois.perrad@gadz.org>
 <20200728092104.5f811f75@windsurf.home>
 <CAB0FRsvnTHG4=NhXFHYtO_vkC=B_Fvo-YhmhWqFVg4o97ONStQ@mail.gmail.com>
 <20200728202511.GA16287@scaer>
Message-ID: <CAB0FRsuE3LwiXo3z8zq9k0YaDMDku9zN7epZkiSGmsGZ=gVEPw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le mar. 28 juil. 2020 ? 22:25, Yann E. MORIN <yann.morin.1998@free.fr> a
?crit :

> Fran?ois, All,
>
> On 2020-07-28 11:21 +0200, Fran?ois Perrad spake thusly:
> > Le mar. 28 juil. 2020 ? 09:21, Thomas Petazzoni < [1]
> thomas.petazzoni at bootlin.com> a ?crit :
> >   > LuaBitOp is not available with Lua 5.3
> >   The commit log is probably not very clear. Indeed, if LuaBitOp is not
> >   available with Lua 5.3, one would think you would need the external
> >   BR2_PACKAGE_LUABITOP when using something else than 5.1, i.e the
> >   opposite of what your change is doing.
> >
> >   Shouldn't the commit log rather be:
> >
> >     The luabitop functionality is available built-in in Lua 5.3 and
> >     LuaJIT, so only Lua 5.1 needs the additional external luabitop
> >     package.
> >
> >   Could you confirm ?
> >
> > bitwise operators are built-in in Lua 5.3,
> > LuaBitOp is a built-in library in LuaJIT,
> > so only Lua 5.1 needs the additional external LuaBitOp package.
>
> OK, thanks for the explanations.
>
> However, luabitop depends on !lua-5.3, and I see in your latest series
> that you extended the dependency to !lua-5.4. Maybe we should also
> fix that, no?
>
> That is, we should have:
>
>     config BR2_PACKAGE_LUABITOP
>         depends on BR2_PACKAGE_LUA_5_1
>
>
Correct.


> However, you are saying (emphasize mine):
>
>     "only Lua 5.1 **needs** the additional external LuaBitOp"
>
> Does that mean that it can still be used with other versions of Lua?
>
> That is, if we are using lua-5.3, and a package selects luabitop, will
> this fail to build? To run? In other words, is it a problem if a pacakge
> ends up using luabitop on another version of lua?
>
>
LuaBitOp fails to build with Lua 5.3 & 5.4.
LuaBitOp could be built with :
- Lua 5.1
- Lua 5.2 which is now retired of BR
- LuaJIT which uses ABI 5.1, but useless (because already built-in)

Fran?ois

Regards,
> Yann E. MORIN.
>
> --
>
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
> conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___
>      |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is
> no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v
>  conspiracy.  |
>
> '------------------------------^-------^------------------^--------------------'
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200729/91089045/attachment.html>
