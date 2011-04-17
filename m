From: Martin Hicks <mort@bork.org>
Date: Sun, 17 Apr 2011 19:49:28 -0400
Subject: [Buildroot] Understanding how jffs2 boots linux
In-Reply-To: <BANLkTi=Oqk0sio+rO9-=L8OEd2Sf7Akb3w@mail.gmail.com>
References: <BANLkTi=Oqk0sio+rO9-=L8OEd2Sf7Akb3w@mail.gmail.com>
Message-ID: <BANLkTim01WZ1Tjc742Ej11yVMU1=NvZqqA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The flash partitions are probably in the Flattened Device tree
(arch/powerpc/boot/dts) and linked into your kernel binary.

mh


On Sun, Apr 17, 2011 at 4:18 PM, Charles Krinke
<charles.krinke@gmail.com> wrote:
> I have a not-quite-buildroot question which I think has a simple answer. I
> just cannot remember the answer.
>
> I have an MPC8323ERDB project with NOR flash that needs to boot a buildroot
> generated rootfs.jffs2 and *somewhere* in the linux kernel, linux parses the
> command line with the "mtdparts=" stuff.
>
> I am trying to understand where in the kernel linux parses the mtdparts= and
> then how the JFFS2 is setup to boot.
>
> Grepping for CONFIG_MTD_PARTS, JFFS2, mtdparts doesnt get me there. It sends
> me all over the kernel in nand stuff and various drivers. I have single
> stepped through "setup_command_line" expecting it to be there.
>
> Can someone give me a clue or two that might let me converge my
> understanding?
>
> --
> Charles Krinke
>
> p.s. I did get the BDI-2000 single stepping through the linux kernel using
> Eclipse and if anyone is interested in the recipe, I am happy to share some
> pointers. Its not that difficult.
>
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>



-- 
Martin Hicks P.Eng. ?? ? | ? ? ? ? mort at bork.org
Bork Consulting Inc. ? ? | ? +1 (613) 266-2296
