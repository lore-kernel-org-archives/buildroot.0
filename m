From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 10 Jul 2013 21:06:08 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2013-07-01
In-Reply-To: <CALR4fEJeSBdCoAd=AKw6h6TnfZvw4P-XbR2tFHGtbaHtqpSDXw@mail.gmail.com>
 (Diego Iastrubni's message of "Wed, 10 Jul 2013 22:00:55 +0300")
References: <20130702063005.2F3D352C121@lolut.humanoidz.org>
 <20130702093852.123fdc11@skate>
 <CALR4fEL=6vPWnZTxRzcY-1tmYNjkbn2K=oVauCxAee1bKhZ0eA@mail.gmail.com>
 <20130702151651.02aeda7e@skate>
 <CALR4fEJeSBdCoAd=AKw6h6TnfZvw4P-XbR2tFHGtbaHtqpSDXw@mail.gmail.com>
Message-ID: <87txk2fd5r.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Diego" == Diego Iastrubni <diegoiast@gmail.com> writes:

 Diego> OK, I can reproduce this again. I think I am doing something wrong.
 Diego> Can anyone tell me if I am messing something up?

 Diego> elcuco at stimpy:~/src/buildroot$ make qemu_arm_versatile_defconfig
 Diego> elcuco at stimpy:~/src/buildroot$ qemu-system-arm -kernel output/images/zImage
 Diego> qemu: hardware error: integratorcm_read: Unimplemented offset 0x1f1018

 Diego> CPU #0:
 Diego> R00=003d7dc4 R01=00000055 R02=101f1000 R03=00000113
 Diego> R04=005c6e74 R05=005c6ea8 R06=005c6ea0 R07=00000113
 Diego> R08=00000100 R09=003d3bb0 R10=003d3320 R11=005c6e98
 Diego> R12=0000000d R13=005c7ea8 R14=003d43a0 R15=003d42c0
 Diego> PSR=200001d3 --C- A svc32
 Diego> Aborted

You forgot to specify what machine qemu should emulate.

% cat board/qemu/arm-versatile/readme.txt
Run the emulation with:

  qemu-system-arm -M versatilepb -kernel output/images/zImage -drive file=output/images/rootfs.ext2,if=scsi -append "root=/dev/sda console=ttyAMA0,115200" -serial stdio -net nic,model=smc91c111 -net user

The login prompt will appear in the terminal that started Qemu. The
graphical window is the framebuffer.

Tested with QEMU 1.4.2

-- 
Bye, Peter Korsgaard
