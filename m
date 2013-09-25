From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Wed, 25 Sep 2013 09:06:45 -0400
Subject: [Buildroot] [PATCH] ljsyscall: new package
In-Reply-To: <3acdaea5-ea9d-4bf6-9865-08a310c8fde9@email.android.com>
References: <1380070732-1834-1-git-send-email-danomimanchego123@gmail.com>
 <b1ff0935-bab9-4aa5-8aa7-9fdfd59dab7b@email.android.com>
 <CANxTyt4t2nNe4__3DZNvrsM3_k55d9A+LPfFJtaPVsjiSG2rHw@mail.gmail.com>
 <3acdaea5-ea9d-4bf6-9865-08a310c8fde9@email.android.com>
Message-ID: <CANxTyt7_Vet9D=trCbpPkajq0LTm+sh_Oc3EpDp9aF6HziRu=Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Wed, Sep 25, 2013 at 9:01 AM, Thomas De Schampheleire
<patrickdepinguin@gmail.com> wrote:
> Danomi Manchego <danomimanchego123@gmail.com> wrote:
>>Thomas,
>>
>>On Wed, Sep 25, 2013 at 2:04 AM, Thomas De Schampheleire
>><patrickdepinguin@gmail.com> wrote:
>>>>+define LJSYSCALL_INSTALL_TARGET_CMDS
>>>>+      $(INSTALL) -d $(TARGET_DIR)/usr/share/luajit-$(LUAJIT_VERSION)/syscall
>>>>+      $(INSTALL) -t $(TARGET_DIR)/usr/share/luajit-$(LUAJIT_VERSION)/ $(@D)/syscall.lua
>>>>+      $(INSTALL) -t $(TARGET_DIR)/usr/share/luajit-$(LUAJIT_VERSION)/syscall $(@D)/syscall/*.lua
>>>>+
>>>>+      $(INSTALL) -d $(TARGET_DIR)/usr/share/luajit-$(LUAJIT_VERSION)/syscall/linux/$(LJSYSCALL_ARCH)
>>>>+      $(INSTALL) -t $(TARGET_DIR)/usr/share/luajit-$(LUAJIT_VERSION)/syscall/linux/ $(@D)/syscall/linux/*.lua
>>>>+      $(INSTALL) -t $(TARGET_DIR)/usr/share/luajit-$(LUAJIT_VERSION)/syscall/linux/$(LJSYSCALL_ARCH) $(@D)/syscall/linux/$(LJSYSCALL_ARCH)/*.lua
>>>>+endef
>>>
>>> Any specific reason why the standard install rule doesn't work?
>>
>>By "standard install rule", do you mean "$(INSTALL) -D srcfile
>>dstfile"?  I couldn't get the directory creation to work while using
>>wildcards, just single files.  So I just left it as-is.
>>
>>Is it the -t that offends?
>
> What I meant was 'make install' in the package directory (I'm assuming make is used)

No, this is a pure lua package, no compilation, and no makefile.  You
just put all the *.lua files some place where LuaJIT will find them.

Danomi -
