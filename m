From: Andreas Ziegler <br015@umbiko.net>
Date: Fri, 23 Feb 2018 10:58:04 +0100
Subject: [Buildroot] Noob with a Beaglebone black wireless
In-Reply-To: <mailman.6421.1519293794.17521.buildroot@busybox.net>
References: <mailman.6421.1519293794.17521.buildroot@busybox.net>
Message-ID: <aade92827a4546a07b06ccd61ce49f4d@umbiko.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Rick,

> I am new to all this.  I found a tutorial for the BBB on the net.  I 
> built
> and put it on my BBBWireless.  Naturally it booted the operating system 
> ,
> but how would I get wireless to work?  Could I take the def config for 
> the
> BBB and modify it?  Do I need a dts file?

If you use a configuration for BBB, it will probably not include the 
modules for BT and wireless. Check if appropriate kernel modules are 
included in your kernel config.

I'm not familiar with TI hardware, but you may also need a firmware file 
to be copied to your target /lib/firmware directory, the build system 
does not handle this automatically. Buildroot uses pre-configured 
settings in 'Target packages' -> 'Hardware handling' -> 'Firmware' for 
this purpose, but they are just a subset of all available firmwares.

To be able to configure and use wireless you need at least 
wpa_supplicant and crda for a scripted minimum configuration.

I found having a working mainline distribution available for examining 
hardware setup on unfamiliar hardware a very useful tool. You can easily 
examine kernel logs and loaded modules to see what else is missing for 
your own build configuration.

Kind regards,
Andreas
