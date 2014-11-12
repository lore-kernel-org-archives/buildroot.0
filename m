From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 12 Nov 2014 22:03:01 +0100
Subject: [Buildroot] Buildroot and kernel modules
In-Reply-To: <CAJpxd06J7Jo8XnMPZpGN_A9pQ19aDKabzBOeDShn6zaheoTi2A@mail.gmail.com>
References: <CAEk40fxcdS-gS9Q8LM-W8pKUP3=PUSkbL9Crq63kvcpG5LBf=Q@mail.gmail.com>
 <20141112110354.1a6bcc98@free-electrons.com>
 <A2A6A18A7161D44FBCA90D5B3AF90A2E5A5C3C97@AMEHLEX02.ehl.pri>
 <20141112133418.728a5f52@free-electrons.com>
 <CAJpxd06J7Jo8XnMPZpGN_A9pQ19aDKabzBOeDShn6zaheoTi2A@mail.gmail.com>
Message-ID: <20141112220301.59a53a17@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bryce Schober,

On Wed, 12 Nov 2014 11:26:00 -0800, Bryce Schober wrote:

> I reluctantly hijack this thread to ask a very closely related question: Is
> there a way to build an out-of-tree module like this using the
> buildroot-compiled linux headers, instead of the possibly-older
> toolchain-provided linux headers?

A kernel module is never built using the linux headers provided by the
toolchain. The linux headers provided by the toolchain only contain the
userspace part of the kernel headers, and they are therefore
insufficient to build kernel modules (which as their name suggest,
contain kernel code).

Therefore, when you do something like:

> > > define KERNELMODULE_BUILD_CMDS
> > >    $(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) M=$(@D) modules
> > > endef

It uses the kernel code in $(LINUX_DIR), and mainly the kernel headers
+ kernel configuration, to build your kernel modules.

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
