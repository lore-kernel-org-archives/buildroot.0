From: Dirk Vermaak <dirk.vermaak@ntlworld.com>
Date: Thu, 24 Jul 2008 09:20:26 +0100
Subject: [Buildroot] Cannot build a worling alsactl or alsamixer using
	buildroot
Message-ID: <200807240920.26295.dirk.vermaak@ntlworld.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
For over a week now we have been trying to build alsa-utils to work on our 
sam9269-ek development board with a 2.6.24.4 kernel patched with the AT91 
patch, and the first experimental patch. We use the buildroot environment and 
have everything else working fine. I have scoured these lists and found a few 
threads that discuss having to change the make file for alsa-utils. So far 
nothing we do appears to change the behaviour.

with alsa lib and utils we have tried

1.0.14a 
1.014a with the  -mabi=aapcs-linux option
1.014a with the  -mabi=aapcs-linux and --with-versioned=no
(both of these changes I found here on the site)

Folllowing this I tried the latest Alsa stuff (1.0.16)  including patching 
both the lib and utils make files with the patch from Daniel Laird and Matt 
Dombroski. 

All of this appears to be of no avail. 

alsactl always returns : Cannot read control '2,0,0,Master Playback Volume,0': 
Inappropriate ioctl for device

alsamixer returns 

ioctl(3, USBDEVFS_IOCTL, 0xbeae7188)    = -1 ENOTTY (Inappropriate ioctl for 
device)
write(1, "\n", 1
)                       = 1
write(2, "alsamixer: function ", 20alsamixer: function )    = 20
write(2, "snd_mixer_load", 14snd_mixer_load)          = 14
write(2, " failed: ", 9 failed: )                = 9
write(2, "Inappropriate ioctl for device", 30Inappropriate ioctl for device) = 
30
write(2, "\n", 1

Does anyone have any ideas as to how to get a working build of Alsa. Any help 
would be greatly appreciated.

Thanks,

Dirk.
