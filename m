From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 10 Jul 2013 16:04:29 -0300
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2013-07-01
In-Reply-To: <CALR4fEJeSBdCoAd=AKw6h6TnfZvw4P-XbR2tFHGtbaHtqpSDXw@mail.gmail.com>
References: <20130702063005.2F3D352C121@lolut.humanoidz.org>
 <20130702093852.123fdc11@skate>
 <CALR4fEL=6vPWnZTxRzcY-1tmYNjkbn2K=oVauCxAee1bKhZ0eA@mail.gmail.com>
 <20130702151651.02aeda7e@skate>
 <CALR4fEJeSBdCoAd=AKw6h6TnfZvw4P-XbR2tFHGtbaHtqpSDXw@mail.gmail.com>
Message-ID: <51DDB03D.8000906@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/10/2013 04:00 PM, Diego Iastrubni wrote:

> OK, I can reproduce this again. I think I am doing something wrong.
> Can anyone tell me if I am messing something up?
> 
> elcuco at stimpy:~/src/buildroot$ make qemu_arm_versatile_defconfig
> elcuco at stimpy:~/src/buildroot$ qemu-system-arm -kernel output/images/zImage

If that's your invocation line you'll surely have issues, it should be:

qemu-system-arm -M versatilepb -kernel output/images/zImage -drive
file=output/images/rootfs.ext2,if=scsi -append "root=/dev/sda
console=ttyAMA0,115200" -serial stdio -net nic,model=smc91c111 -net user

Regards.
