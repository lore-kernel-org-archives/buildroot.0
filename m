From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 14 Mar 2008 14:19:29 +0100
Subject: [Buildroot] [PATCH] Add thumb support to buildroot for the ARM
 architecture
In-Reply-To: <47DA7E94.2070302@promwad.com>
References: <20080312090846.2cfecec8@crazy> <20080314090331.11f1bddc@crazy>
	<47DA7E94.2070302@promwad.com>
Message-ID: <20080314141929.006a424d@crazy>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 14 Mar 2008 15:33:08 +0200,
Ivan Kuten <ivan.kuten@promwad.com> a ?crit :

> Thanks for your excellent work! Before committing your patch I have a
> question: have you tested it? on which CPU? which buildroot configs?

Yes, I tested it using Qemu versatilepb emulation. Enclosed is the
buildroot configuration I used.

> I'm asking this because for almost half of year I did not managed to
> build a good ARM EABI toolchain with buildroot. Toolchain seems emit
> invalid instructions when building busybox. So I managed only to run
> very simple hello-world when set in cmdline init=hello-world, but not
> a busybox binary with shell, etc. Boot process just hangs when
> busybox running. Magic-SysRq key shows that illegal instruction trap
> was involved. What is surprising that rootfs can be launched ok on
> qemu with versatilepb machine emulation, but as I told fails to run
> on real hardware S3C2440 CPU - 920T target.

I have not tested on real hardware, so I can't say. There might be
remaining issues.

However, there is quite a big difference between your S3C2440 real
hardware and the Qemu versatilepb emulation. S3C2440 is based on 920T
as you say, which supports the ARMv4T ISA. But the versatilepb
emulation of Qemu emulates an ARM926EJ-S CPU, which supports the
ARMv5TEJ ISA. And as far as I understood, there are some differences in
the ARM <-> Thumb switch capabilities between ARMv4T and ARMv5T.

For what exact CPU did you configure your buildroot ? What was the
exact instruction causing the "Illegal instruction" exception ?

Sincerly,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Free Embedded Linux Training Materials
on http://free-electrons.com/training
(More than 1500 pages!)
-------------- next part --------------
A non-text attachment was scrubbed...
Name: buildroot-config-with-interworking-and-thumb-applications
Type: application/octet-stream
Size: 9648 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20080314/2a9ee424/attachment.obj 
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 189 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20080314/2a9ee424/attachment.pgp 
