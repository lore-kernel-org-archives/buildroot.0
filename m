From: Markos Chandras <Markos.Chandras@imgtec.com>
Date: Wed, 5 Feb 2014 11:12:00 +0000
Subject: [Buildroot] Undo [PATCH v2] Mark MIPS I, II,
	III and IV as deprecated
In-Reply-To: <52F1B282.1040106@gentoo.org>
References: <52F1B282.1040106@gentoo.org>
Message-ID: <52F21C80.6040508@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/05/2014 03:39 AM, Joshua Kinard wrote:
> Per this thread/patch here:
> http://lists.busybox.net/pipermail/buildroot/2013-November/082976.html
>
> I'd like to point out that these CPU ISAs are not completely "deprecated"
> nor rare.  Well, MIPS-I and MIPS-II might be "rare", but MIPS-III and
> MIPS-IV are the minimum required ISAs for old SGI systems, which are most
> plentiful on eBay.  Gentoo and Debian support Indy, Indigo2, and O2-based
> systems, most of which need MIPS-IV (the R4x00 Indy's and I2's need MIPS-III
> at a minimum).
>
> I've been looking at buildroot as a way to quickly generate a working root
> filesystem for netboot images, but I ran into a side-effect of this patch
> when building 'attr':
>
> /usr/space/buildroot/buildroot-2013.11/output/host/usr/lib/gcc/mips-buildroot-linux-uclibc/4.8.2/../../../../mips-buildroot-linux-uclibc/bin/ld:
> /tmp/ccHuCGCg.o: linking mips:8000 module with previous mips:isa32 modules
>
> /usr/space/buildroot/buildroot-2013.11/output/host/usr/lib/gcc/mips-buildroot-linux-uclibc/4.8.2/../../../../mips-buildroot-linux-uclibc/bin/ld:
> failed to merge target specific data of file /tmp/ccHuCGCg.o
>
> I was passing '-march=mips4' to the build, which resulted in the error.
> After finding this patch, activating BR2_DEPRECATED, and selecting "mips
> iv", the build completed fine.
>
> Does deprecation imply removal at some point in the future?  I'd argue in
> favour of keeping them around, but either restricting them to a
> machine-specific build (such as creating a sub-family for SGI systems and
> setting them there), and keeping the new defaults for mips/mipsel at
> mips32/mips64 ISAs.
>
> Thanks!,
>
>
Hi Joshua,

I know they are still supported in Linux distribution. I build the 
Gentoo stages myself :)
The point of this patch is that, as buildroot is moving forwards, more 
and more packages fail to build if you happen to select an old MIPS ISA 
and this situation is unlikely to be improved in the future.
The deprecation indeed means that this support will go away in a year.
Or maybe we can keep them for longer period? Or maybe change 
BR2_DEPRECATED to BR2_UNSUPPORTED or something? Would that be better?
Thomas, do you think this would be acceptable?

-- 
markos
