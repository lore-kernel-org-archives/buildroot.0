From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Jan 2014 10:34:58 +0800
Subject: [Buildroot] [pkg-luarocks infra V4 02/10] luajit: allow to
 build Lua extensions without lua
In-Reply-To: <CAB0FRsvz8TZAm3NUkf6nsR12uB1ypVYnwiq+ZDpD--xo0uG64w@mail.gmail.com>
References: <1384520859-3189-1-git-send-email-francois.perrad@gadz.org>
 <1384520859-3189-2-git-send-email-francois.perrad@gadz.org>
 <20131222182356.6ab0d7ed@skate>
 <CAB0FRsvz8TZAm3NUkf6nsR12uB1ypVYnwiq+ZDpD--xo0uG64w@mail.gmail.com>
Message-ID: <20140110103458.4dad7279@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fran?ois Perrad,

On Tue, 7 Jan 2014 15:11:16 +0100, Fran?ois Perrad wrote:

> A Lua native module, like LuaFileSystem, needs the Lua includes at compile time.
> Both lua package and luajit package supply these files.
> The lua package installs them in /usr/include, and luafilesystem, like
> other Lua modules, expects them at this place.
> In LuaJIT upstream, these files are installed
> /usr/include/luajit-2.0.2 in order to not override the Lua ones if
> they are already installed.
> Before the introduction of virtual package luainterpreter,
> luafilesystem depends on lua package.
> Now, it depends on luainterpreter. When luainterpreter is supplied by
> luajit, the include from LuaJIT must be installed in the same place as
> Lua one's.

Ok, now it makes a lot of sense.

> So, the patch luajit-05-install-inc.patch contains the comment :
> "Install includes like lua's ones"

I think your patch description would have been immensely better if you
had included an explanation like you did above!

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
