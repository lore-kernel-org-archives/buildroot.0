From: bruce bushby <bruce.bushby@gmail.com>
Date: Sun, 14 Jun 2015 22:10:03 +0100
Subject: [Buildroot] strange issue with gcc 4.9.2
In-Reply-To: <20150613195458.19a66470@free-electrons.com>
References: <CAHvj1qa+QLFcJ6==FJEyWhYFgQXd9-ZQcB9tQv5=waiaPsvC1g@mail.gmail.com>
 <20150613195458.19a66470@free-electrons.com>
Message-ID: <CAHvj1qYbXDuov3JWw-Nt7OBpWd0E3xR0c2-UPes2zqsX3D+mmQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas

It appears I inadvertently sent a somewhat mistake ridden "half email" to
the list while meaning to delete it :)

Today I went through everything and prepared some simple examples
demonstrating the problem and while doing so appear to have resolved the
issue.

I switched boards from an AllWinner A20 to an A13 .... and like an idiot I
never thought to update the defconfig:
BR2_cortex_a7=y  (AllWinner A20)   to   BR2_cortex_a8=y (AllWinner A13)

The issue was obscured by the fact that "buildroot-2014.08" produced a
working "u-boot-sunxi-with-spl.bin" and everything else ....even with the
incorrect "BR2_cortex_a7=y" defconfig  ... however from 2014.11 onwards,
the resulting u-boot, although compiled as normal, would not execute on the
A13 processor .....correcting "BR2_cortex_a7" fixes the issue.

So far today, buildroot-2015.05 is behaving as expected, including
systemd....although systemd resets the board unless I disable
networking....but thats a topic for another time.

Thanks for the quick response btw, much appreciated.




On Sat, Jun 13, 2015 at 6:54 PM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Hello,
>
> On Sat, 13 Jun 2015 15:52:10 +0100, bruce bushby wrote:
>
> > I'm struggling with an strange problem when building with any of the
> last 3
> > versions of buildroot and more specifically gcc 4.9.2
> >
> > Perhaps this doesn't have anything to do with buildroot, but I thought I
> > would mention in case other are having the a similar issue.
> >
> > I'm running on an AllWinner A13 processor.
> >
> > When I use buildroot 2014.08 (gcc 4.9.1) ....everything is 100%, I am
> able
> > to compile my uboot and the resulting "u-boot-sunxi-with-spl.bin"
> executes
> > without any problems.
> >
> > However, from buildroot 2014.11 (gcc 4.9.2) onwards, the uboot appears to
> > compile cleanly and is even the same size ...but it will not boot, after
> > powering on the board I don't see anything, nothing written to the
> console
> > etc. My builds are all scripted using the exact same defconfig, but any
> > spl-uboot compiled with gcc4.9.2 cd ou
>
> Weird. Can you provide the u-boot-sunxi-with-spl and
> u-boot-sunxi-with-spl.bin files for both situations (i.e working and
> non-working) ?
>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150614/15f16451/attachment.html>
