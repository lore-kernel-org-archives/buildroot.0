From: Sid Bharij <sid.bharij@gmail.com>
Date: Wed, 12 Nov 2014 12:25:45 -0600
Subject: [Buildroot] Buildroot and kernel modules
In-Reply-To: <20141112133418.728a5f52@free-electrons.com>
References: <CAEk40fxcdS-gS9Q8LM-W8pKUP3=PUSkbL9Crq63kvcpG5LBf=Q@mail.gmail.com>
 <20141112110354.1a6bcc98@free-electrons.com>
 <A2A6A18A7161D44FBCA90D5B3AF90A2E5A5C3C97@AMEHLEX02.ehl.pri>
 <20141112133418.728a5f52@free-electrons.com>
Message-ID: <CAEk40fw3Kgtgq=mKdR3ib40tLtD5x4SF0sT0QJrrwKVCO_+BZA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thank you gentlemen!
So I have the driver source file and makefile for it.
Where does this part go into ? Does it go into the Config.in file or some
top level makefile or the same makefile needed for compiling the driver
code?

KERNELMODULE_DEPENDENCIES = linux

define KERNELMODULE_BUILD_CMDS
   $(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) M=$(@D) modules
endef

define KERNELMODULE_INSTALL_TARGET_
CMDS
   $(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) M=$(@D) modules_install
endef

$(eval $(generic-package))


On Wed, Nov 12, 2014 at 6:34 AM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Dear Paassen, Hiram van,
>
> On Wed, 12 Nov 2014 12:21:12 +0000, Paassen, Hiram van wrote:
>
> > As an alternative we use a buildroot package with something like this in
> > it:
> >
> > KERNELMODULE_DEPENDENCIES = linux
> >
> > define KERNELMODULE_BUILD_CMDS
> >    $(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) M=$(@D) modules
> > endef
> >
> > define KERNELMODULE_INSTALL_TARGET_CMDS
> >    $(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) M=$(@D) modules_install
> > endef
> >
> > $(eval $(generic-package))
> >
> >
> > which basically builds a normal out of tree module.
>
> Yes, that's what should be done if your module is out of tree, indeed.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141112/8a0808eb/attachment.html>
