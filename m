From: Aseem Sharma <aseem.sharma19@gmail.com>
Date: Thu, 10 Aug 2017 12:19:33 +0530
Subject: [Buildroot] Compiling buildroot for Arm "Armada 166E" Target
In-Reply-To: <20170810063631.e3jc22lsdjuchpbk@tarshish>
References: <CANK3ZEdaEdw6YuyN-offP1M4F88zdgy_Eg7qikQ5uzUDC2-XKQ@mail.gmail.com>
 <20170809154918.tthy3t2p6d3hsqon@tarshish>
 <CANK3ZEe9uvSZx-=iG-gLkUPV98vTUxtsF8fC+wTAt+HovNDoVw@mail.gmail.com>
 <20170809171757.itid3fvz6462r2no@tarshish>
 <CANK3ZEctYdAA8B=w2=DqKqsQ=Sf_1B=Uj-SRsN+HdY35mvQSDw@mail.gmail.com>
 <CANK3ZEfZZ1y=JNkXQfbtrRMSSPB5HxbjGu-fef=DacR9pNsRAw@mail.gmail.com>
 <20170810063631.e3jc22lsdjuchpbk@tarshish>
Message-ID: <CANK3ZEeLMHhNYvt6dN45zf6QV5sTcw12FEyGf7h=CmQFqtX_4A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yes Baruch. I tried a couple of times with "make clean" & even "make
distclean". However, the error is consistent.
Found a similar issue here: https://gcc.gnu.org/bugzilla/
show_bug.cgi?id=40836

Best Regards,
Aseem

On Thu, Aug 10, 2017 at 12:06 PM, Baruch Siach <baruch@tkos.co.il> wrote:

> Hi Aseem,
>
> On Thu, Aug 10, 2017 at 11:56:56AM +0530, Aseem Sharma wrote:
> > *A follow-up question:*
> > I selected 'iwmmxt' as per Baruch's suggestion and tried to run "make".
> > The build seems to be failing with following error message in
> > "busybox-1.26.2" compilation:
> >
> > util-linux/mkfs_ext2.c: In function ?mkfs_ext2_main?:
> > util-linux/mkfs_ext2.c:715:1: error: insn does not satisfy its
> constraints:
> >  }
> >  ^
> > (insn 1169 286 287 31 (set (reg:SI 0 r0)
> >         (reg:SI 80 wr0)) util-linux/mkfs_ext2.c:344 426
> {*iwmmxt_movsi_insn}
> >      (nil))
> > util-linux/mkfs_ext2.c:715:1: internal compiler error: in
> > reload_cse_simplify_operands, at postreload.c:411
> > Please submit a full bug report,
> > with preprocessed source if appropriate.
> > See <http://bugs.buildroot.net/> for instructions.
> > scripts/Makefile.build:197: recipe for target 'util-linux/mkfs_ext2.o'
> > failed
> > make[2]: *** [util-linux/mkfs_ext2.o] Error 1
> > Makefile:742: recipe for target 'util-linux' failed
> > make[1]: *** [util-linux] Error 2
> > make[1]: Leaving directory '/home/administrator/
> Downloads/buildroot_2017/
> > buildroot-2017.02.5/output/build/busybox-1.26.2'
> > package/pkg-generic.mk:216: recipe for target '/home/administrator/
> > Downloads/buildroot_2017/buildroot-2017.02.5/output/
> > build/busybox-1.26.2/.stamp_built' failed
> > make: *** [/home/administrator/Downloads/buildroot_2017/
> > buildroot-2017.02.5/output/build/busybox-1.26.2/.stamp_built] Error 2
> >
> > It would be really helpful is you can provide some insight and possibly a
> > fix/workaround.
>
> Have you done a clean rebuild, i.e., 'make clean; make'? See
> http://nightly.buildroot.org/manual.html#full-rebuild .
>
> baruch
>
> > On Thu, Aug 10, 2017 at 8:55 AM, Aseem Sharma <aseem.sharma19@gmail.com>
> > wrote:
> >
> > > Thanks Baruch & Arnout. Will give a try.
> > >
> > > Best Regards,
> > > Aseem
> > >
> > > On Wed, Aug 9, 2017 at 10:47 PM, Baruch Siach <baruch@tkos.co.il>
> wrote:
> > >
> > >> Hi Aseem,
> > >>
> > >> On Wed, Aug 09, 2017 at 10:03:24PM +0530, Aseem Sharma wrote:
> > >> > Hello Baruch & Arnout,
> > >> >
> > >> > Thanks for your responses.
> > >> > The board that I have is quite old with limited RAM and Flash.
> > >> >
> > >> > Baruch,
> > >> > Could you please provide more details as to how do I select "iwmmxt"
> > >> using
> > >> > menuconfig. As far as I remember, I do not seem to have that option
> in
> > >> my
> > >> > current buildroot release.
> > >>
> > >> Go to 'Target options' -> 'Target Architecture Variant', and select
> > >> 'iwmmxt'
> > >> (last option).
> > >>
> > >> > Also, as per Arnout's response to my query, I should be using ARM
> little
> > >> > endian with arm926tARM.
> > >>
> > >> As far as I know arm926t code is compatible with iwmmxt, but not the
> > >> other way
> > >> around. Look for Sheeva PJ1 at [1]. See also [2].
> > >>
> > >> [1] https://en.wikipedia.org/wiki/List_of_ARM_microarchitectures
> > >>
> > >> [2] https://en.wikipedia.org/wiki/MMX_(instruction_set)#MMX_in_e
> > >> mbedded_applications
> > >>
> > >> > Are these two options one and the same?
> > >>
> > >> I don't think so.
> > >>
> > >> baruch
> > >>
> > >> > Thanks in advance.
> > >> >
> > >> > Best Regards,
> > >> > Aseem
> > >> >
> > >> > Sent via really tiny keyboard. Expect random auto corrects, fat
> finger
> > >> > typos and weirdness!!
> > >> >
> > >> >
> > >> > On 09-Aug-2017 21:19, "Baruch Siach" <baruch@tkos.co.il> wrote:
> > >> >
> > >> > Hi Aweem,
> > >> >
> > >> > On Wed, Aug 09, 2017 at 06:00:55PM +0530, Aseem Sharma wrote:
> > >> > > I am naive to buildroot & processor world trying to compile
> > >> > > "buildroot-2017.02.5" for "Marvell ARM Armada 166E processor
> > >> (compatible
> > >> > to
> > >> > > ARMv5TE instruction-set)" based old system. However, I do not
> > >> understand
> > >> > > the options to be selected in "make menuconfig" for
> > >> > > 1. Target options->Target Architecture {think should be ARM -
> little
> > >> > endian}
> > >> > > 2. Target options->Target Architecture variant
> > >> > >
> > >> > > Thanks in advance for your help.
> > >> >
> > >> > Based on the Armada 16x Datasheet[1], the mainline kernel
> > >> > arch/arm/mach-mmp/Kconfig (CONFIG_CPU_PXA168) and arch/arm/Kconfig
> > >> > (CONFIG_IWMMXT), it seems like you need the iwmmxt ARM variant for
> your
> > >> > Armada
> > >> > 166E processor.
> > >> >
> > >> > [1] http://www.marvell.com.cn/application-processors/armada-100/
> > >> > assets/armada_16x_datasheet.pdf
>
> --
>      http://baruch.siach.name/blog/                  ~. .~   Tk Open
> Systems
> =}------------------------------------------------ooO--U--
> Ooo------------{=
>    - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170810/f306cf7c/attachment.html>
