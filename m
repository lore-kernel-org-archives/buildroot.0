From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Thu, 30 Jan 2014 08:34:05 -0500
Subject: [Buildroot] [PATCH v4 1/1] ljsyscall: new package
In-Reply-To: <CAB0FRssiXxvgpOb4xUuCRr+PPQKF4PYvKCHgcPZ0jAF7JLGLqA@mail.gmail.com>
References: <1389928225-1845-1-git-send-email-danomimanchego123@gmail.com>
 <CAB0FRssiXxvgpOb4xUuCRr+PPQKF4PYvKCHgcPZ0jAF7JLGLqA@mail.gmail.com>
Message-ID: <CANxTyt72FdGiCJ3zJO8JBB49DzLb4cE=YoiMiY-tBpn+T3azUA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fran?ois,

On Thu, Jan 30, 2014 at 6:46 AM, Fran?ois Perrad
<francois.perrad@gadz.org> wrote:
>> +LJSYSCALL_TARGET_DIR = $(TARGET_DIR)/usr/share/luajit-$(LUAJIT_VERSION)
>
> Danomi,
>
> I think that the right destination is :
>     LJSYSCALL_TARGET_DIR = $(TARGET_DIR)/usr/share/lua/$(LUAINTERPRETER_ABIVER)
>
> 1) ljsyscall is designed for LuaJIT and PUC Lua + luaffi

Looking through the README.md sections that mention Lua, it seems like
the ability to work with non-LuaJIT is not a priority.  E.g., "It now
runs again with luaffi under standard Lua 5.2 (and probably 5.1,
untested)."  ("Runs again" makes it sound like it worked for while,
lost compatibility, and maybe works again - does not inspire
confidence.)  Besides, buildroot does not [currently] have luaffi.  So
I don't think the Lua case is currently an option for a
buildroot-generated system.

but regardless ...

> 2) the directory usr/share/luajit-2.0.2 seems to be reserved for
> LuaJIT itself (see INSTALL_LMOD in luajit.pc)

I wasn't aware of that - but the INSTALL_LMOD value does seem to imply
that.  Changing the path to /usr/share/lua wouldn't hurt, as the files
can go any place that luajit will search for them at run time.  So,
okay, I'll test locally and then submit a patch to change this.

Thanks,
Danomi -
