From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 27 Jul 2020 21:44:23 +0200
Subject: [Buildroot] [PATCH v3 7/9] package/efl: depend on lua ABI
 version 5.1
In-Reply-To: <CADvTj4o66HR7fSs4YxUbK9b=2Xy47PVZa01TK=tBN2WDj6Dy1Q@mail.gmail.com>
References: <20200525004845.3019642-1-james.hilliard1@gmail.com>
 <20200525004845.3019642-7-james.hilliard1@gmail.com>
 <20200727191940.GI19818@scaer>
 <CADvTj4rK80BS4Bf+rU-hYpxbWhemH5XvCR9RUM3MGX2XDG-sgA@mail.gmail.com>
 <20200727192934.GJ19818@scaer>
 <CADvTj4o66HR7fSs4YxUbK9b=2Xy47PVZa01TK=tBN2WDj6Dy1Q@mail.gmail.com>
Message-ID: <20200727194423.GL19818@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

James, All,

On 2020-07-27 13:36 -0600, James Hilliard spake thusly:
> On Mon, Jul 27, 2020 at 1:29 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
[--SNIP--]
> > The provider for the host-luainterpreter is always host-lua, never
> > host-luajit::
> Hmm, I thought there was something in the infrastructure that was supposed
> to handle that automatically based on the target lua provider.

There is no reason the host and target providers be the same, no. For
example, for zlib, the host provider is also a constant, host-libzlib.

> > So, must ELF target and host variants be built with thwe same Lua
> > interpreter?
> I recall they were supposed to but it has been a while and I don't really
> remember the reason.

OK, so I take it back: I;ll change this patch to have ELF depend on
LuaJIT, rather than select it.

Thanks.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
