From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 24 Sep 2011 17:48:25 +0200
Subject: [Buildroot] libgcc build fails on Fedora15
In-Reply-To: <7290940beabd3.4e7df687@home.nl>
References: <7290940beabd3.4e7df687@home.nl>
Message-ID: <20110924174825.131f8fee@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Marcel,

Le Sat, 24 Sep 2011 15:25:59 +0200,
"MARCEL JANSSEN" <korgull@home.nl> a ?crit :

> I'm stuck with the following issue when building buildroot on Fedora
> 15. I'm building for an ARM platform (Atmel G45).
> 
> /bin/sh: error while loading shared
> libraries: /home/marcel/g45/toolchain_build_arm/gcc-4.3.2-final/./gcc/libgcc_s.so.1:
> ELF file OS ABI invalid

This is the result of a build with a very old Buildroot, and definitely
don't support such version.

> I use two different versions of buildroot, one very old and one quite
> new (2011-5).

Ok.

> Both show a similar issue (libgcc_s.so.1: ELF file OS
> ABI invalid) on Fedora15 which I don't have on fedora 14. So,
> Fedora14 works fine, unfortunately Fedora 14 is not an option, so I
> need to get a fix for this.
> 
> On fedora15 I got it fixed for the newer buildroot by disabling large
> file support (not a real fix as I may need large file support later
> on). That unfortunately doesn't work for the older buildroot.
> 
> Fedora 15 's gcc shows : gcc version 4.6.0 20110603 (Red Hat
> 4.6.0-10) (GCC)
> 
> Any ideas on how to solve this or even look for the root cause ?

Can you please put online (don't send it by e-mail) your
Buildroot .config and the complete build log ?

I have just started a build in a Fedora 15 VM, but the last time I
tried Fedora 15, Buildroot 2011.08 was working fine. So some more
details about your Buildroot configuration are needed.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
