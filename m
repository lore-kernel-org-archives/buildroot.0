From: Diego Iastrubni <diegoiast@gmail.com>
Date: Wed, 10 Jul 2013 22:00:55 +0300
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2013-07-01
In-Reply-To: <20130702151651.02aeda7e@skate>
References: <20130702063005.2F3D352C121@lolut.humanoidz.org>
 <20130702093852.123fdc11@skate>
 <CALR4fEL=6vPWnZTxRzcY-1tmYNjkbn2K=oVauCxAee1bKhZ0eA@mail.gmail.com>
 <20130702151651.02aeda7e@skate>
Message-ID: <CALR4fEJeSBdCoAd=AKw6h6TnfZvw4P-XbR2tFHGtbaHtqpSDXw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

OK, I can reproduce this again. I think I am doing something wrong.
Can anyone tell me if I am messing something up?

elcuco at stimpy:~/src/buildroot$ make qemu_arm_versatile_defconfig
elcuco at stimpy:~/src/buildroot$ qemu-system-arm -kernel output/images/zImage
qemu: hardware error: integratorcm_read: Unimplemented offset 0x1f1018

CPU #0:
R00=003d7dc4 R01=00000055 R02=101f1000 R03=00000113
R04=005c6e74 R05=005c6ea8 R06=005c6ea0 R07=00000113
R08=00000100 R09=003d3bb0 R10=003d3320 R11=005c6e98
R12=0000000d R13=005c7ea8 R14=003d43a0 R15=003d42c0
PSR=200001d3 --C- A svc32
Aborted

On Tue, Jul 2, 2013 at 4:16 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Diego Iastrubni,
>
> On Tue, 2 Jul 2013 15:21:45 +0300, Diego Iastrubni wrote:
>
>> BTW, do we test that the images run? I was unable to test the default arm
>> versatile image on QEmu (qemu fails loading).
>
> No, at this point there is no automated runtime testing of the builds.
> It would be a nice thing to have, but isn't very easy to setup. If you
> have issues, please report specific problems, as Gustavo asked.
>
> Thanks for your report!
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
