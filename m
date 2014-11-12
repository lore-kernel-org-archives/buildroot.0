From: Bryce Schober <bryce.schober@gmail.com>
Date: Wed, 12 Nov 2014 11:26:00 -0800
Subject: [Buildroot] Buildroot and kernel modules
In-Reply-To: <20141112133418.728a5f52@free-electrons.com>
References: <CAEk40fxcdS-gS9Q8LM-W8pKUP3=PUSkbL9Crq63kvcpG5LBf=Q@mail.gmail.com>
 <20141112110354.1a6bcc98@free-electrons.com>
 <A2A6A18A7161D44FBCA90D5B3AF90A2E5A5C3C97@AMEHLEX02.ehl.pri>
 <20141112133418.728a5f52@free-electrons.com>
Message-ID: <CAJpxd06J7Jo8XnMPZpGN_A9pQ19aDKabzBOeDShn6zaheoTi2A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I reluctantly hijack this thread to ask a very closely related question: Is
there a way to build an out-of-tree module like this using the
buildroot-compiled linux headers, instead of the possibly-older
toolchain-provided linux headers?


<><  <><  <><
Bryce Schober

On Wed, Nov 12, 2014 at 4:34 AM, Thomas Petazzoni <
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
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141112/6c98aabe/attachment.html>
