From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 26 Nov 2009 00:14:20 +0100
Subject: [Buildroot] Help Booting Kernel on an ml507
In-Reply-To: <4B2CB099CF3D4F40B1B1442281CA94FFC4C8E2@EXCHANGEVS01.appsig.com>
	(RYAN NEAL's message of "Wed\, 25 Nov 2009 14\:49\:41 -0800")
References: <4B2CB099CF3D4F40B1B1442281CA94FFC4C8E2@EXCHANGEVS01.appsig.com>
Message-ID: <87r5rm9oz7.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ryan" == NEAL, RYAN <RYAN_NEAL@appsig.com> writes:

 Ryan> Hello,

 Ryan> I am trying to use buildroot to create a rootfs (specifically a
 Ryan> initramfs) that I can incorporate with the Xilinx linux kernel
 Ryan> (2.6?).

Why would you btw want to use an initramfs instead of a real flash file
system? Initramfs uses more RAM and typically boots slower than
E.G. squashfs.

 Ryan> When I run this I get the following problems:


 Ryan> Bootline:              Linux/PowerPC load: console=ttyS0 ip=on

 Ryan>                 Bad trap at PC: 4801f1b4, SR: 2d000, vector=2010

 Ryan> Bootline:              Linux/PowerPC load: console=ttyS0 ip=on root=/dev/ram

 Ryan>                 Bad trap at PC: 4801f1b4, SR: 2d000, vector=2010


How big is your cpio.gz / zImage?


 Ryan> I then tried to just get to a shell by doing the following:

 Ryan> Bootline:              Linux/PowerPC load: console=ttyS0 ip=on rdinit=/bin/sh

 Ryan> Bootline:              Linux/PowerPC load: console=ttyS0 ip=on root=/dev/ram
 Ryan> rdinit=/bin/sh

  Ryan> Bad trap at PC: 4801f1b4, SR: 2d000, vector=2010

 Ryan> init has generated signal 5 but has no handler for it

So it gets all the way to init? Please paste the complete serial output.

Are you using hardware or software floating point in buildroot? please
paste your buildroot .config.

 Ryan> Kernel panic - not syncing: Attempted to kill init!

 Ryan> Call Trace:

 Ryan> [cf831d80] [c0005f88] show_stack+0x48/0x15c (unreliable)

 Ryan> [cf831db0] [c0220c80] panic+0x94/0x174

 Ryan> [cf831e00] [c0038490] do_group_exit+0x0/0xb8

 Ryan> [cf831e50] [c000bf68] _exception+0x19c/0x1a4

 Ryan> [cf831f40] [c000e8c0] ret_from_except_full+0x0/0x4c

Enable CONFIG_KALLSYMS so you get a proper symbolic backtrace.

-- 
Bye, Peter Korsgaard
