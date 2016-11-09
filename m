From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 9 Nov 2016 11:25:50 +0100
Subject: [Buildroot] [PATCH 1/4] configs: atmel: at91sam9260eknf: update
 defconfig
In-Reply-To: <20161109101009.l66iviomyfuit2t5@rfolt0960.corp.atmel.com>
References: <20161109065948.1851-1-ludovic.desroches@atmel.com>
 <20161109065948.1851-2-ludovic.desroches@atmel.com>
 <20161109073638.ozgbr5vy6gglznlx@tarshish>
 <20161109101009.l66iviomyfuit2t5@rfolt0960.corp.atmel.com>
Message-ID: <20161109112550.36c1ec17@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 9 Nov 2016 11:10:09 +0100, Ludovic Desroches wrote:

> > Why enable both U-Boot and Barebox?
> >   
> 
> I don't know why Barebox was selected but the 'official' bootloader is
> U-Boot for all our products that's why I add it. I kept Barebox because
> it was already selected and I don't know if someone is still using it or
> not.

But the end result is a defconfig that doesn't make any sense.

Please provide a defconfig that makes sense, and with an updated
readme.txt if you decide to change the bootloader (and therefore the
flashing instructions).

> > >  # Kernel
> > >  BR2_LINUX_KERNEL=y
> > > -BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> > > -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.9.1"  
> > 
> > For the sake of reproducibility you should set this to the version you tested, 
> > say, 4.8.6. The same goes for other patches in this series.
> 
> As Alexandre said, we don't want to spend time for the maintainance of these
> old boards so sticking to the mainline seems to be the way to go. Giving a
> version is a kind of commitment but we no longer perform tests on these
> boards excepting kernel boot with kernelci.

That's not Buildroot policy. We want defconfigs with fixed kernel and
bootloader versions, so that we know they have been tested.

If you are not able/willing to test those defconfigs, then we could
just as well remove them. But I'm not going to merge a defconfig that
doesn't comply with our policy of having a fixed kernel and a fixed
bootloader version.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
