From: =?utf-8?Q?Pongr=C3=A1cz_Istv=C3=A1n?= <pongracz.istvan@gmail.com>
Date: Sat, 25 Apr 2015 01:08:45 +0200
Subject: [Buildroot] Kernel panic - unable to mount root fs on
	unknown-block(0, 0) - i486
In-Reply-To: <20150424214951.GJ4244@free.fr>
Message-ID: <236977f34e6d4035f5212cbba3baa244@www.startit.hu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 
 
----------------eredeti ?zenet-----------------
Felad?: "Yann E. MORIN" yann.morin.1998 at free.fr 
C?mzett: "Pongr?cz Istv?n" 
CC: "buildroot busybox.net" buildroot at busybox.net 
D?tum: Fri, 24 Apr 2015 23:49:51 +0200
-------------------------------------------------
 
 
> Pongr?cz, All,
> 
> [Please, wrap lines at aronf ~72 chars, it's easier to read]
> 
> On 2015-04-24 22:34 +0200, Pongr?cz Istv?n spake thusly:
>> I have a problem with booting kernel built by buildroot on i486. The
>> kernel (3.18.x) panicked: Kernel panic - not syncing: VFS:
>> Unable to mount root fs on unknown-block(0,0)
> [--SNIP--]
>> I tried to boot from usb. There is no initramfs (initrd).
> 
> For the record so it gets archived on the list, after our discussion
> on IRC:
> 
> - add 'rootwait' to the kernel command line, as USB can be pretty slow
> to enumerate the devices on the bus
> 
> Kernel seems to wait forever, so:
> 
> - check that all is built-in: USB driver, USB mass-storage, SCSI
> support, SCSI disk support (maybe a few things else...)
> 
> Regards,
> Yann E. MORIN.
> 
> -- 

Follow up.
I just created a new kernel from an "older" and proven working kernel.
3.16.7 - with initramfs. this kernel built outside of buildroot several months ago.
-> .config copied to the 3.18.6 for buildroot, make oldconfig
3.18.6 - new kernel based on 3.16.7, without initrd

kernel parameters are identical in both cases.

The system built, the result is the following:
- with kernel 3.18.6 - kernel panic (same as the original problem)
- with 3.16.7 - the system boots up as expected. lsmod shows nothing (no module loaded...)

So, I am working on fixing this issue.

It should be something trivial, what I simply missed.
I guess an initrd would be handy.

Bye,
Istv?n
