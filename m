From: John Voltz <john.voltz@gmail.com>
Date: Thu, 20 Mar 2008 13:05:20 -0400
Subject: [Buildroot] Shell-Weirdness
In-Reply-To: <1206018367.6470.7.camel@luder>
References: <1206018367.6470.7.camel@luder>
Message-ID: <46a136670803201005o355c88a0jf50936b9a27fd36f@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Christof,

I have also seen some very weird stuff happen with the latest buildroot
running in a qemu virtual machine. Things like mount requiring -v to work
properly and command line parameters not being passed and other really
strange stuff. I wish someone with a little more experience would try
building for x86 and see how it goes. I had nothing but trouble and finally
gave up. Everything works pretty well on my AVR32 target, so it imust be
something specific to x86 or maybe qemu causing the problems.

John

On Thu, Mar 20, 2008 at 9:06 AM, Christof Klaiber <
christof.klaiber@merath-maschinen.de> wrote:

> I built buildroot from svn for i486 and try to run it in qemu.
>
> ~/qemu/bin/qemu -hda binaries/uclibc/rootfs.i686.ext2 -kernel
> project_build_i686/uclibc/linux-2.6.24.3/arch/i386/boot/bzImage -append
> root=/dev/hda
>
> After booting the kernel, it complains about not finding /etc/init.d/rcS
> - where did it go? It used to be there in earlier times.
>
> Then I can activate a shell by hitting Enter.
>
> The shell works fine, but whenever I try to enter a command which
> contains a "-", I get an error message or the shell blocks.
>
> e.g.
>
> / # ls -l
> -> terminal blocks
>
> somtimes I can use <ctrl>-c to escape, sometimes I have to quit qemu.
>
> Any suggestions, why this can happen?
>
> Regards,
>  Christof
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080320/ebd1a916/attachment-0001.htm 
