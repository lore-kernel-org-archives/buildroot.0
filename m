From: Mike Zick <minimod@morethan.org>
Date: Thu, 30 Jan 2014 08:07:02 -0600
Subject: [Buildroot] [PATCH v4 1/1] ljsyscall: new package
In-Reply-To: <CANxTyt72FdGiCJ3zJO8JBB49DzLb4cE=YoiMiY-tBpn+T3azUA@mail.gmail.com>
References: <1389928225-1845-1-git-send-email-danomimanchego123@gmail.com>
 <CAB0FRssiXxvgpOb4xUuCRr+PPQKF4PYvKCHgcPZ0jAF7JLGLqA@mail.gmail.com>
 <CANxTyt72FdGiCJ3zJO8JBB49DzLb4cE=YoiMiY-tBpn+T3azUA@mail.gmail.com>
Message-ID: <20140130080702.12041a96@core2quad.morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 30 Jan 2014 08:34:05 -0500
Danomi Manchego <danomimanchego123@gmail.com> wrote:

> Fran?ois,
> 
> On Thu, Jan 30, 2014 at 6:46 AM, Fran?ois Perrad
> <francois.perrad@gadz.org> wrote:
> >> +LJSYSCALL_TARGET_DIR =
> >> $(TARGET_DIR)/usr/share/luajit-$(LUAJIT_VERSION)  
> >
> > Danomi,
> >
> > I think that the right destination is :
> >     LJSYSCALL_TARGET_DIR =
> > $(TARGET_DIR)/usr/share/lua/$(LUAINTERPRETER_ABIVER)
> >
> > 1) ljsyscall is designed for LuaJIT and PUC Lua + luaffi  
> 
> Looking through the README.md sections that mention Lua, it seems like
> the ability to work with non-LuaJIT is not a priority.  E.g., "It now
> runs again with luaffi under standard Lua 5.2 (and probably 5.1,
> untested)."  ("Runs again" makes it sound like it worked for while,
> lost compatibility, and maybe works again - does not inspire
> confidence.)  Besides, buildroot does not [currently] have luaffi.  So
> I don't think the Lua case is currently an option for a
> buildroot-generated system.
> 

Ah, but it easily could.

I have used Lua Alien with 5.1 -
http://alien.luaforge.net/

Which requires libffi -
https://sourceware.org/libffi/

My particular use-case was to interface with binary blobs.

I have not built them with Buildroot, but outside of Buildroot.
So I do not have a BR patch handy to add them.

They required a bit of tweaking library pathnames to support 
a multi-lib (desktop) layout but it should be possible to deal 
with them inside of BR.

Mike
