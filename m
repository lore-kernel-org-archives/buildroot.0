From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 3 Feb 2015 22:53:55 +0100
Subject: [Buildroot] Driver for C-Media Electronics,
 Inc. CM106 based usb audio device?
Message-ID: <trinity-3d9e988c-a025-4f55-9551-a7087a8e5c6e-1423000435337@3capp-gmx-bs32>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Lou,

On Mon, Feb 02, 2015 at 08:18:02PM -0600, Lou Crittenden wrote:
> Hello again all, does anyone know where I can get the driver/kernel modules
> for the c-media electronics CM-106 usb sound card and how to set up fader,
> , balance, and volume controls and whatnot on it in buildroot? I will be
> running this card on a raspberry pi b+, which as we all know the built in
> audio is just plain DREADFUL sounding with all those hisses and pops, and
> this card sounds MUCH better (I'm listening to my tunes through it on my
> main Ubuntu-based box as I type!), and is inexpensive.
> 
> the output of lsusb is here:
> Bus 005 Device 002: ID 0d8c:0102 C-Media Electronics, Inc. CM106 Like Sound.
> 
> According to this link,
> https://github.com/Pivosgroup/buildroot-linux-kernel-m3/blob/master/sound/usb/usbaudio.c
> the device has four 16 bit registers or something like that.
> 
> Does this link btw contain the driver, and if yes, how is it compiled?

Not much safe hints from my side, just guessing, but your android link related CM106
is sound/usb/quirks.c in normal/rpi linux kernel and enabled by CONFIG_SND_USB in the
linux kernel config (not enabled by the default buildroot rpi kernel config)...

After enabling this option, take a look at dmesg output and search for USB Sound Device
or try 'aplay -L' for listing all possible/found alsa sound devices...

Regards,
Peter
