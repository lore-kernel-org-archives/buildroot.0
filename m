From: Michel Benoit <murpme@gmail.com>
Date: Mon, 5 Feb 2007 10:26:55 +0100
Subject: [Buildroot] building ARM toolchain with nofpu
In-Reply-To: <007e01c74652$d9c41f40$01c4af0a@atmel.com>
References: <c88e466f0701311609u4896b81ehb99cb2eb01f78886@mail.gmail.com>
	<200702012015.55089.yann.morin.1998@anciens.enib.fr>
	<c88e466f0702011251g65a604a0ja8e9fd4ca9389f4e@mail.gmail.com>
	<007e01c74652$d9c41f40$01c4af0a@atmel.com>
Message-ID: <c88e466f0702050126p997c485g97a29bc99d5d7348@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hej Ulf

I don't think that the NWFPE stuff is linked into the u-boot code
automatically.  The build instructions in the u-boot tree are very
explicit about using -msoft-float.

When I build u-boot with a buildroot toolchain based on gcc 3.4.3 with
no fpu support the bootloader works as it should.

When I build u-boot with fpu support in the toolchain and I remove the
-msfot-float option according to your suggestion, the bootloader
crashes almost immediately.  It may be related to NAND access but
could also be due to the printouts (printf can use float ops).

On 2/1/07, Ulf Samuelsson <ulf@atmel.com> wrote:
> Michel Benoit wrote:
> > Thanks that worked!
> >
> > On 2/1/07, Yann E. MORIN <yann.morin.1998@anciens.enib.fr> wrote:
> >> Hello all!
> >> Michel, Carl.
> >>
> >> On Thursday 01 February 2007 010, Michel Benoit wrote:
> >>> I'm trying to build a toolchain with soft floating point enabled for
> >>> ARM arm26t target platform.  I'm doing this in order to build u-boot
> >>> for my target.
> >> [--SNIP--]
>
> You can build u-boot with a NWFPE compiler
> if you just remove the "-msoft-float" from cpu/arm926ejs/config.mk and
> from cpu/arm926ejs/at91sam926x/config.mk
> That is what I do in my buildroot (That part yet to be submitted).
>
>
> Best Regards,
> Ulf Samuelsson
> ulf at atmel.com
> GSM:  +46 (706) 22 44 57
> Tel:     +46  (8) 441 54 22
> Fax:     +46 (8) 441 54 29
> Mail: Box 2033  174 02 Sundbyberg
> Visit: Kavalleriv?gen 24
>           174 58 Sundbyberg'
> Sweden
>
>
