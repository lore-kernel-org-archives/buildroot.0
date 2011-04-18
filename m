From: Charles Krinke <charles.krinke@gmail.com>
Date: Sun, 17 Apr 2011 19:24:53 -0700
Subject: [Buildroot] Understanding how jffs2 boots linux
In-Reply-To: <BANLkTim01WZ1Tjc742Ej11yVMU1=NvZqqA@mail.gmail.com>
References: <BANLkTi=Oqk0sio+rO9-=L8OEd2Sf7Akb3w@mail.gmail.com>
	<BANLkTim01WZ1Tjc742Ej11yVMU1=NvZqqA@mail.gmail.com>
Message-ID: <BANLkTi==nuXSFQ=c6ONyd2wa4afGcPfDww@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Well, shoot, if they were in the device tree, then I would be done. But,
since they are not, I need to dig into how the kernel actually works when
trying to mount a NOR flash.

Or perhaps find the right google term. Googling things like "mtdparts",
"rootfstype=jffs2" doesnt glean enough or the right knowledge.

It *almost* mounts. There appears to be a change in syntax in more recent
linux kernels. The previous "root-/dev/mtdblockx" doesnt work anymore. It
appears to need to be something like "root=mtd:<something>" now. I think
this may be a side effect of all the NAND checkins to u-boot and the kernel
over the last year or so.


On Sun, Apr 17, 2011 at 4:49 PM, Martin Hicks <mort@bork.org> wrote:

> The flash partitions are probably in the Flattened Device tree
> (arch/powerpc/boot/dts) and linked into your kernel binary.
>
> mh
>
>
> On Sun, Apr 17, 2011 at 4:18 PM, Charles Krinke
> <charles.krinke@gmail.com> wrote:
> > I have a not-quite-buildroot question which I think has a simple answer.
> I
> > just cannot remember the answer.
> >
> > I have an MPC8323ERDB project with NOR flash that needs to boot a
> buildroot
> > generated rootfs.jffs2 and *somewhere* in the linux kernel, linux parses
> the
> > command line with the "mtdparts=" stuff.
> >
> > I am trying to understand where in the kernel linux parses the mtdparts=
> and
> > then how the JFFS2 is setup to boot.
> >
> > Grepping for CONFIG_MTD_PARTS, JFFS2, mtdparts doesnt get me there. It
> sends
> > me all over the kernel in nand stuff and various drivers. I have single
> > stepped through "setup_command_line" expecting it to be there.
> >
> > Can someone give me a clue or two that might let me converge my
> > understanding?
> >
> > --
> > Charles Krinke
> >
> > p.s. I did get the BDI-2000 single stepping through the linux kernel
> using
> > Eclipse and if anyone is interested in the recipe, I am happy to share
> some
> > pointers. Its not that difficult.
> >
> >
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
> >
>
>
>
> --
> Martin Hicks P.Eng.      |         mort at bork.org
> Bork Consulting Inc.     |   +1 (613) 266-2296
>



-- 
Charles Krinke
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110417/c18ac7fc/attachment.html>
