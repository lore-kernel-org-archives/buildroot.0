From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Fri, 11 Sep 2020 07:43:38 -0500
Subject: [Buildroot] Toolchain issues on multiple architectures
In-Reply-To: <CANQCQpamRBQ9hWrRDH3Ts7r3WoF7EKzKmvdNT4OQi=czz2sQyw@mail.gmail.com>
References: <20200910120536.2431494d@windsurf.hq.k.grp>
 <CANQCQparV9FCnOCT=arB7zK0rvhWN4n6tJXTcLLNpZjCJfHcaQ@mail.gmail.com>
 <CANQCQpbtpt-_pDFk0oBXiCqXDVfVcUCubBDq7kCdh+vbmWeVdg@mail.gmail.com>
 <CANQCQpamRBQ9hWrRDH3Ts7r3WoF7EKzKmvdNT4OQi=czz2sQyw@mail.gmail.com>
Message-ID: <CANQCQpafykTM49-hOe4M_oe9gTq3jB+CCXk2TwNafGcPgpWPtA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Sep 10, 2020 at 11:55 AM Matthew Weber
<matthew.weber@rockwellcollins.com> wrote:
>
> On Thu, Sep 10, 2020 at 10:43 AM Matthew Weber
> <matthew.weber@rockwellcollins.com> wrote:
> >
> > On Thu, Sep 10, 2020 at 9:43 AM Matthew Weber
> > <matthew.weber@rockwellcollins.com> wrote:
> > >
> > > On Thu, Sep 10, 2020 at 5:06 AM Thomas Petazzoni
> > > <thomas.petazzoni@bootlin.com> wrote:
> > > >
> > > > Hello,
> > > >
> > > > As part of the https://toolchains.bootlin.com project, I've tried to
> > > > rebuild 175 toolchains on top of Buildroot 2020.08, and encountered a
> > > > number of failures, which are summarized below.
> > > >
> > > > Damien, Alistair: there is an issue with the RISC-V 32-bit toolchain.
> > > > Could you have a look, and tell us if you have some suggestions?
> > > >
> > > > ARC maintainers: all ARC toolchains are failing to build due to the use
> > > > of a recent gdb where gdbserver was moved to the top-level. However, it
> > > > doesn't seem to be that easy to build just gdbserver in those recent
> > > > gcc versions. I have posted a question about this on the gdb@ mailing
> > > > list: https://sourceware.org/pipermail/gdb/2020-September/048888.html.
> > > >
> > > > Matt, there are some PowerPC64 build issues as well. Have you ever seen
> > > > them, do you have any hints?
> > > >
> > [snip]
> > > > PowerPC64 (big and little endian) Power 8
> > > > =========================================
> > > >
> > > > Both the glibc stable and bleeding edge are failing to build libstdc++
> > > > in host-gcc-final. Interesingly, the musl configurations work fine.
> > > >
> > > > - https://gitlab.com/bootlin/toolchains-builder/-/jobs/729359625
> > > > - https://gitlab.com/bootlin/toolchains-builder/-/jobs/729359626
> > > > - https://gitlab.com/bootlin/toolchains-builder/-/jobs/729359621
> > > > - https://gitlab.com/bootlin/toolchains-builder/-/jobs/729359622
> > >

http://patchwork.ozlabs.org/project/buildroot/patch/20200911124131.8549-1-matthew.weber at rockwellcollins.com/

Regards,
Matt
