From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Apr 2017 18:57:39 +0200
Subject: [Buildroot] Qt5 build failure (beaglebone_qt5_defconfig)
In-Reply-To: <20170406183218.66cab07e@free-electrons.com>
References: <87f293c7-8aef-14e9-23e4-195a16b564e3@mind.be>
 <trinity-0603182d-d77d-4e0a-bdd1-589503badbe3-1491479231018@3capp-gmx-bs68>
 <CAOf5uwkL9FX3Fq2Dou1jnixat2CWxtWSbXG+Q=RQ=y3pSyjRzA@mail.gmail.com>
 <20170406183218.66cab07e@free-electrons.com>
Message-ID: <20170406185739.3caf46f6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Adding Matthias in Cc here.

On Thu, 6 Apr 2017 18:32:18 +0200, Thomas Petazzoni wrote:

> On Thu, 6 Apr 2017 18:12:15 +0200, Michael Nazzareno Trimarchi wrote:
> 
> > '/home/michael/work/amarula/bticino/buildroot/output/build/linux-52c4aa7cdb93d61f8008f380135beaf7b8fa6593'
> >   DTC     arch/arm/boot/dts/am335x-bone.dtb
> >   DTC     arch/arm/boot/dts/am335x-evm.dtb
> > make[2]: *** No rule to make target
> > 'arch/arm/boot/dts/am335x-bonegreen.dtb'.  Stop.
> > arch/arm/Makefile:314: recipe for target 'am335x-bonegreen.dtb' failed  
> 
> This is caused by the recent commit
> https://git.buildroot.org/buildroot/commit/configs?id=4b2440b7dcc68369548c0f2be6984fe645fc6bb0
> from Matthias Fritzsche. Matthias, are you sure you tested the
> beaglebone_qt5_defconfig ?
> 
> Indeed, beaglebone_defconfig and beaglebone_qt5_defconfig don't use the
> same kernel version, and the one used in beaglebone_qt5_defconfig
> doesn't have the Beagle Bone Green Device Tree.
> 
> So either we should revert Matthias patch on beaglebone_qt5_defconfig,
> or someone tests upgrading beaglebone_qt5_defconfig to the same kernel
> version as the one used in beaglebone_defconfig.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
