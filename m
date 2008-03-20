From: Nigel Kukard <nkukard@lbsd.net>
Date: Thu, 20 Mar 2008 17:10:01 +0000
Subject: [Buildroot] Shell-Weirdness
In-Reply-To: <46a136670803201005o355c88a0jf50936b9a27fd36f@mail.gmail.com>
References: <1206018367.6470.7.camel@luder>
	<46a136670803201005o355c88a0jf50936b9a27fd36f@mail.gmail.com>
Message-ID: <1206033001.2562.45.camel@nigel-x60>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The problem is the avr32 patch against GCC.

It took me the past 3 days with Jacmet to track it down.

900-avr32-atmel.1.3.2.patch   <= THAT patch.

I'm still investigating how to fix it.

-N

On Thu, 2008-03-20@13:05 -0400, John Voltz wrote:
> Hi Christof,
> 
> I have also seen some very weird stuff happen with the latest
> buildroot running in a qemu virtual machine. Things like mount
> requiring -v to work properly and command line parameters not being
> passed and other really strange stuff. I wish someone with a little
> more experience would try building for x86 and see how it goes. I had
> nothing but trouble and finally gave up. Everything works pretty well
> on my AVR32 target, so it imust be something specific to x86 or maybe
> qemu causing the problems.
> 
> John
> 
> On Thu, Mar 20, 2008 at 9:06 AM, Christof Klaiber
> <christof.klaiber@merath-maschinen.de> wrote:
>         I built buildroot from svn for i486 and try to run it in qemu.
>         
>         ~/qemu/bin/qemu -hda binaries/uclibc/rootfs.i686.ext2 -kernel
>         project_build_i686/uclibc/linux-2.6.24.3/arch/i386/boot/bzImage -append
>         root=/dev/hda
>         
>         After booting the kernel, it complains about not
>         finding /etc/init.d/rcS
>         - where did it go? It used to be there in earlier times.
>         
>         Then I can activate a shell by hitting Enter.
>         
>         The shell works fine, but whenever I try to enter a command
>         which
>         contains a "-", I get an error message or the shell blocks.
>         
>         e.g.
>         
>         / # ls -l
>         -> terminal blocks
>         
>         somtimes I can use <ctrl>-c to escape, sometimes I have to
>         quit qemu.
>         
>         Any suggestions, why this can happen?
>         
>         Regards,
>          Christof
>         
>         
>         _______________________________________________
>         buildroot mailing list
>         buildroot at uclibc.org
>         http://busybox.net/mailman/listinfo/buildroot
> 
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
-- 
Regards
Nigel Kukard, PhD CompSc
Linux Based Systems Design

Support: 086 747 7600 (premium 24/7/365)
Fax: 086 601 7884

Quote: The best language to use is the language that was designed for
what you want to use it for.

*** The attachment to my email signature.asc is a digital PGP
signature, if your mail client supports digital signatures it will
allow you to verify I am the sender of this email and that it has not
been tampered with along the way ***
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 189 bytes
Desc: This is a digitally signed message part
Url : http://busybox.net/lists/buildroot/attachments/20080320/092b9fbb/attachment.pgp 
