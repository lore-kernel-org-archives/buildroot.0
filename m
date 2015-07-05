From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 5 Jul 2015 17:03:35 +0200
Subject: [Buildroot] Hash checking infrastructure
In-Reply-To: <20150705095425.174bde89@core2quad.morethan.org>
References: <20150704140142.3aa5c982@core2quad.morethan.org>
 <20150704214734.GC3634@free.fr>
 <20150704213628.21ff7e6e@core2quad.morethan.org>
 <20150705000050.7c2be969@core2quad.morethan.org>
 <20150705111007.63ff239b@free-electrons.com>
 <20150705083253.1bfaefa5@core2quad.morethan.org>
 <20150705142725.GN3647@free.fr>
 <20150705095425.174bde89@core2quad.morethan.org>
Message-ID: <20150705150335.GQ3647@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mike, all,

[Please, keep the list in Cc]

On 2015-07-05 09:54 -0500, Mike spake thusly:
> On Sun, 5 Jul 2015 16:27:27 +0200
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> 
> > And infact, I already reproduced *that* error and already sent a
> > patch: https://patchwork.ozlabs.org/patch/491307/
> 
> Tested, same set-up as previous, with this result:
> 
> ==== Successfully installed LuaJIT 2.0.4 to /usr ====
> make[1]: Leaving directory `/var1/arm/new-i386/build/host-luajit-custom'
> >>> host-luainterpreter virtual Extracting
> >>> host-luainterpreter virtual Patching
> >>> host-luainterpreter virtual Configuring
> >>> host-luainterpreter virtual Building
> >>> host-luainterpreter virtual Installing to host directory
> WARNING: no hash file for luarocks-2.2.2.tar.gz
> >>> host-luarocks 2.2.2 Extracting
> gzip -d -c /var1/arm/buildroot.git/dl/luarocks-2.2.2.tar.gz | tar --strip-components=1 -C /var1/arm/new-i386/build/host-luarocks-2.2.2  -xf -
> >>> host-luarocks 2.2.2 Patching
> >>> host-luarocks 2.2.2 Configuring
> cd /var1/arm/new-i386/build/host-luarocks-2.2.2 && ./configure --prefix=/var1/arm/new-i386/host/usr --sysconfdir=/var1/arm/new-i386/host/usr/etc/luarocks --with-lua=/var1/arm/new-i386/host/usr --lua-suffix=jit
> Checking Lua interpreter... luajit found in /var1/arm/new-i386/host/usr/bin
> Checking Lua includes... lua.h not found (looked in /var1/arm/new-i386/host/usr/include, /var1/arm/new-i386/host/usr/include/lua/5.1, /var1/arm/new-i386/host/usr/include/lua5.1)
> You may want to use the flag --with-lua or --with-lua-include. See --help.
> 
> configure failed.
> 
> make: *** [/var1/arm/new-i386/build/host-luarocks-2.2.2/.stamp_configured] Error 1
> make: Leaving directory `/var1/arm/buildroot.git'

This is expected behaviour, because the patches fronm Buildroot are
*not* applied when using an override-srcdir. This is done on-purpose, on
the assumption that the content of override-srcdir is entirely managed
by the user, and because there is *no* way for Buildroot to know if the
patches we have would still apply.

So, the new "error" you reported is totally expected.

Thanks for testing! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
