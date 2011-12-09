From: Vellemans, Noel <Noel.Vellemans@visionBMS.com>
Date: Fri, 9 Dec 2011 11:14:23 +0100
Subject: [Buildroot] Buildroot - udev : undefined reference to `accept4'
In-Reply-To: <878vmmaz0o.fsf@macbook.be.48ers.dk>
References: <1531E53627F1F749B4FE809BF2A4EB6702D56EBD@WETMEX10.loepfe.com>
 <878vmmaz0o.fsf@macbook.be.48ers.dk>
Message-ID: <1531E53627F1F749B4FE809BF2A4EB6702D56FCE@WETMEX10.loepfe.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

You are right, uclibc-patch did not solve, and indeed newer ARM-kernel
solves the problem. 

Thanks,
Noel



-----Original Message-----
From: Peter Korsgaard [mailto:jacmet at gmail.com] On Behalf Of Peter
Korsgaard
Sent: 9Dec11 10:13
To: Vellemans, Noel
Cc: buildroot at busybox.net
Subject: Re: Buildroot - udev : undefined reference to `accept4'

>>>>> "Noel" == Vellemans, Noel <Noel.Vellemans@visionBMS.com> writes:

 Noel> Hi All,
 Noel> When compiling udev-173 with uClibc 0.9.32 for ARM you get the
following error:

 Noel> udev/udev-ctrl.o: In function `udev_ctrl_get_connection':
 Noel> udev-ctrl.c:(.text.udev_ctrl_get_connection+0x44): undefined
reference to  Noel> `accept4'
 Noel> collect2: ld returned 1 exit status  Noel> make[3]: ***
[udev/udevd] Error 1  Noel> make[3]: *** Waiting for unfinished jobs....

Your kernel headers (and runtime kernel) are too old. Udev needs
accept4() which was added to the kernel relatively recently (2.6.36 for
ARM).

 Noel> A patch is already available
 Noel> Ref to https://bugs.busybox.net/show_bug.cgi?id=4195

That doesn't help as udev NEEDS accept4.

--
Bye, Peter Korsgaard
