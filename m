From: Jorge S. <jorgesolla@gmail.com>
Date: Fri, 4 Apr 2008 13:52:24 +0200
Subject: [Buildroot] Flash for AT91RM9200
In-Reply-To: <039401c895a7$61f39304$85f0af0a@corp.atmel.com>
References: <039401c895a7$61f39304$85f0af0a@corp.atmel.com>
Message-ID: <6090c5eb0804040452s11dc749m4fb3c1e44c341295@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All:

Regarding to this FLASH/Dataflash stuff...

I'm now facing a new board desing based on the AT91SAM9260 or the AVR32, we
are still on very early stages of the design.

Our big doubts are those concerning the DataFlash and NAND/NOR flash
selection.

Since there are several of erratas on this CPUs,and a little bit confused.
Can you please Ulf clarify what is working and what is not?

I'm planning to use *ONLY* nor/nand flash, and *not* use the Dataflash
because we don't want to
get constrained by storage capacity. So if we can use a BIG flash there's no
need for a spi dataflash.

Is it possible to boot from nand (or nor) flash on the AVR32 and the
AT91SAMxxxx series? if yes, can you please
provide part numbers for known working chips?.

Thanks in advance.


On Thu, Apr 3, 2008 at 2:26 PM, Samuelsson, Ulf <ulf.samuelsson@atmel.com>
wrote:

>
>
> Hi you all!
>
> I'm looking for a NOR-Flash for a RM9200-based board, and i thought
> maybe some of you could give some hints or experiences.
> Basically it should be 128MByte size, with larger drop-in replacements
> as a favorable option. As with all RM9200 parallel flash, must have CFI,
> and must be available in a non-BGA package.
> For a first guess, i found the Spansion S29G128P - any experiences with
> that one? How well is it supported by the kernel, or are there any
> obvious caveats that i overlooked now?
>
> Greetz, Joe
>
> > The AT91RM9200 has
>     26 Adress pins (A0-A5)
>     but A24 is nol  available.
>     (See Errata)
>     This gives you a 16 MB
>     linear adressrange.
>     Since A25 is available
>     you can have 2 x 16 MB
>     spaces with a 16 MB
>     hole in between.
>
>    However, I suspect that
>    you only plan 128 Mbit
>    and not 128 MByte
>    and then this is not
>    a problem
>
>    If you are starting a design
>    now,You should perhaps
>    consider the AT91SAM9260
>    or  the  AT91SAMG20
>
>
> --
> Sepp "ZaP" Holzmayr
>
> please reply to: zentrale.at.work at gmail.com
> "Never underestimate the bandwidth of a freight train full of DAT tapes.
> Only the round-trip is a little suboptimal."
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080404/8534ba04/attachment.htm 
