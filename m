From: Kent <kent@zydax.com>
Date: Tue, 24 Jul 2007 11:06:58 -0700
Subject: [Buildroot] Error Building Linux - Board Support Options:
	at91sam9260ek, at91sam9260dfc, etc
Message-ID: <000001c7ce1d$6d9cbb30$6b01a8c0@RANDY>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I'm trying to set up Linux-2.6.21.5 to boot off of the NAND Flash on an
at91sam9260ek. I chose the board support options of:

[*] Atmel Device Support  --->
	[*] Board support for the Atmel AT91 range of microprocessors
	  AT91 device (AT91SAM9260 Microprocessor)  --->
	  Development Board support (Atmel AT91SAM9260EK)  --->
	[*] Remove work in progress
	.
	.
	.
	[*] Build AT91 Bootstrap for selected chip
		Boot Memory (NAND Flash)

The console log looks like:

.
.
.
You should create a .config for your kernel
and install it as
target/device/Atmel/at91sam9260ek/at91sam9260ek-limux-.config

cp -dpf target/device/Atmel/at91sam9260ek-linux-.config
....../buildroot/build_arm/linux-2.6.21.5/.config
cp: cannot stat 'target/device/Atmel/at91sam9260ek-linux-.config': No such
file or directory
make: *** [....../buildroot/build_arm/linux-2.6.21.5/.configured] Error 1

I've checked the contents of 'target/device/Atmel/ and I don't find an
at91sam9260ek directory. There are only ...9260dfc, ...9261ek, and ...9263ek
directories and they all have linux-2.6.21.5.config files in them.

I'm really just trying to figure out how everything works so I tried
changing over to the Dataflash options (dfc) to see if since their directory
is there they might work a little better. I get the same log as above just
with all the ek's changed to dfc's. I think the "linux-.config" is supposed
to have the kernel version after the dash. Maybe that's all it is?

I'd appreciate any help anyone can give.

Thanks a lot,
Kent

No virus found in this outgoing message.
Checked by AVG Free Edition. 
Version: 7.5.476 / Virus Database: 269.10.14/912 - Release Date: 7/22/2007
7:02 PM
 
