From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 26 Nov 2009 07:18:03 +0100
Subject: [Buildroot] Help Booting Kernel on an ml507
In-Reply-To: <4B2CB099CF3D4F40B1B1442281CA94FFC4C8E3@EXCHANGEVS01.appsig.com>
	(RYAN NEAL's message of "Wed\, 25 Nov 2009 15\:28\:26 -0800")
References: <4B2CB099CF3D4F40B1B1442281CA94FFC4C8E2@EXCHANGEVS01.appsig.com>
	<87r5rm9oz7.fsf@macbook.be.48ers.dk>
	<4B2CB099CF3D4F40B1B1442281CA94FFC4C8E3@EXCHANGEVS01.appsig.com>
Message-ID: <87k4xdajxg.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ryan" == NEAL, RYAN <RYAN_NEAL@appsig.com> writes:

 Ryan> Peter, 
 Ryan> That is a good point.  I was intending on using the initramfs because I
 Ryan> hadn't thought of other options.  I'll look into the squashfs.  

 Ryan> My cpio.gz image is 543K.  
 Ryan> I am building for the powerpc 440 (no FPU).

Then this is probably wrong (unless you have FPU emulation enabled in
the kernel, which you shouldn't):

 Ryan> # BR2_SOFT_FLOAT is not set

You can find it under toolchain options.

Once you change this you need to rebuild everything (rm -rf *build_*;
make).

-- 
Bye, Peter Korsgaard
