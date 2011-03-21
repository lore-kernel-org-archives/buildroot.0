From: Torsten Mohr <tmohr@s.netic.de>
Date: Mon, 21 Mar 2011 22:43:38 +0100
Subject: [Buildroot] 2011.02, BeagleBoard-xM, linux-2.6.37 does not boot
In-Reply-To: <AANLkTi=t3L2WbrJXY0QRejbZTVKfNPbeSLjBazO3+E8T@mail.gmail.com>
References: <201103202325.39993.tmohr@s.netic.de>
	<AANLkTi=t3L2WbrJXY0QRejbZTVKfNPbeSLjBazO3+E8T@mail.gmail.com>
Message-ID: <201103212243.38429.tmohr@s.netic.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

thank you for your hints,

> > Not sure if i missed something, some questions came up:
> > 
> > - does buildroot use the correct kernel for BeagleBoard-xM?
> > - do i need to apply patches?
> > - what configuration file do i need to chose?
> > - does u-boot need special options to boot that kernel?
> > 
> > It would be great if anybody had some hints for me.
> 
> Maybe you need setenv console=/dev/ttyO2

When configuring the kernel i found out that this is actually set as the 
internal CMDLINE.

Also (other hint), the kernel debugging options in the kernel are set.

I compiled a kernel today and i can boot it, it does not boot using the 
standard scripts that came with the Angstroem distro.

When interrupting standard boot and giving:

mmc init
mmc rescan 0
loaduimage
bootm 0x82000000

Then the kernel starts to boot.


Thanks for your hints,
Torsten.
