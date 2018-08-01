From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 1 Aug 2018 18:57:18 +0200
Subject: [Buildroot] Build not bootable when build with Ubuntu 18.04
In-Reply-To: <1533140393945.36133@stephan-gmbh.com>
References: <1533140393945.36133@stephan-gmbh.com>
Message-ID: <20180801185718.74e1c7bd@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Jedrzej,

On Wed, 1 Aug 2018 16:19:55 +0000, Jedrzej Panek wrote:

> when I build my custom Linux on Ubuntu 16.04 and dd it on my cf-card, my device boots fine.
> Once I changed to Ubuntu 18.04 and did a full rebuild my embedded device cannot boot anymore (disk boot failure).
> I get no errors during the building process itself, and my desktop recognizes the card just fine. Did anyone experience similar issues?
> For me, it seems that the bootloader is failing.

Which bootloader are you using ?

The build process of grub2 and syslinux is a bit convoluted, and at
some point there were using the host (native) compiler to build stuff
for the target. From a quick look at grub2.mk and syslinux.mk, it
doesn't seem to be the case anymore though.

What you could try to do to investigate the problem is to take your
bootloader binaries from the build on Ubuntu 16.04 and put them with
the rest of the Buildroot built under Ubuntu 18.04, just to confirm
that the problem comes from the bootloader.

If you give a bit more details about your bootloader configuration, we
can try to reproduce.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
