From: Nicolas Adenis-Lamarre <nicolas.adenis.lamarre@gmail.com>
Date: Fri, 5 May 2017 15:12:01 +0200
Subject: [Buildroot] Kodi 17.1 - segfault - arm - gcc 5.x
Message-ID: <CACPGbctoBjhuJ8PVCziKzJpN8j5KnPTKOkX6Sk9OZtniQVvVhw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

buildroot version : f7e7bf72a7ddbd72041090ae6ba97778f7b96948 (Apr 29,
2017) + custom packages
kodi version : 17.1
gcc version : 5.4
def_config : https://github.com/nadenislamarre/batocera.linux/blob/master/configs/batocera-rpi2_defconfig
tested architecture : rpi2 (arm), odroid xu4 (arm)

Some times ago (~1year), i built kodi 16.1 with gcc 4.9. fine.
i upgraded gcc to 5.x, and kodi 16.1 became unstable (mainly when
adding musics or films directories)
and it results in segfaults.
i have kept gcc 4.9 since this time.

Kodi 17.1 won't compile with gcc 4.9.
I've upgraded to 5.4, but the segfaults came back.

I've reproduced on rpi2 and odroid xu4. i've not managed to reproduce on x86.
It may be this problem : https://archlinuxarm.org/forum/viewtopic.php?f=9&t=9600

i've found no way to fix for the moment.
i've tried to add "--disable-optimisations" in kodi config, no success.

For information, the kodi-joystick package should be added in
buildroot while it's usefull on embeded devices :
https://github.com/nadenislamarre/batocera.linux/tree/master/package/batocera/kodi-joystick
