From: Jerry Richards <jerryr@tonecommander.com>
Date: Mon, 16 Jul 2007 09:36:51 -0700
Subject: [Buildroot] Building debug version of kernel
In-Reply-To: <20070713174844.GA16025@real.realitydiluted.com>
Message-ID: <001c01c7c7c7$83f8d2d0$2c48a8c0@greyhawk.tonecommander.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


I did enable the "make menuconfig" option for
Kernel_Hacking-->Compile_the_kernel_with_debug_info", but I do not see any
symbols/source-code in my debugger.  I am using a Lauterbach TRACE32
in-circuit debugger that operates on the vmlinux ELF file containing
symbol/source-code information.

Is there any other options that might cause symbols to be stripped from the
vmlinux file?

Also, could you confirm the following build procedure for a cross-compiled
platform?

	1) In <>/buildroot, execute "make".
	2) In <>/buildroot/build_m*/lin*, execute "make".
	3) In <>/Apps, execute "make".
	4) Copy application(s) to <>/buildroot/build_m*/root/...
	5) In <>/buildroot, execute "make" again (to get apps into
	   compressed CRAMFS/SQUASHFS).
	6) Done.

Jerry


-----Original Message-----
From: Steven J. Hill [mailto:sjhill at realitydiluted.com]
Sent: Friday, July 13, 2007 10:49 AM
To: Jerry Richards
Cc: buildroot at uclibc.org
Subject: Re: [Buildroot] Building debug version of kernel


> Is editing the top-level Linux Makefile the standard method for my host
> machine to build a debug version (i.e. with "-g -O0" CFLAGS) of the Linux
> 2.6 kernel?  If so, should I make these flag changes to CFLAGS_KERNEL or
> HOSTCFLAGS or both?
>
There is a configuration option under 'Kernel hacking' in the Linux
configuration system to turn on debugging symbols. Was there some
reason this does not work?

> The build output only shows the format "CC <object-file-name>" without
> flags, so I can't see what it's actually doing.
>
If you add 'V=1' to your 'make vmlinux' target area in the makefile, you
can see the verbose output of the compiling, linking, etc.

-Steve
