From: MERCADIER Johann <johann.mercadier@imerir.com>
Date: Wed, 7 Mar 2012 23:16:21 +0000
Subject: [Buildroot] BR 2012.rc1 :: DVI not activated on pandaboard?
Message-ID: <CAPEB33z8LrFWaQdwVA1XdSjKFWam9kTH2FO8CvkWdnj9U_7vzA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,
  Now that I try to switch to a graphical output. As the uImage generated
by BR still does work I compile one manually (3.2.7), it works great till
It's used on console mode then I add all options needed to get DVI
activated as explained on the following website:
http://omappedia.org/wiki/Bootargs_for_enabling_display
http://omappedia.org/wiki/DSS_CONFIG_options

modify the boot script in the following way:
___[ BOOT.SCRIPT
]________________________________________________________________________________________
mmc rescan
fatload mmc 0:1 0x80000000 uImage
setenv bootargs vram=32M console=ttyO2,115200n8
mem=456M at 0x80000000mem=512M at 0xA0000000 omapdss.def_disp=dvi
omapfb.mode=dvi:1280x1024MR-24 at 60smsc95xx.macaddr=76:2F:97:85:4F:56
root=/dev/nfs rw
nfsroot=192.168.1.44:/home/johann/rootfs_TEST,nolock,wsize=1024,rsize=1024
ip=192.168.1.235 rootdelay=4 init=/linuxrc
bootm 0x80000000

when booting I get there, the pandaboard probably still continue the boot
process but nothing is displayed on the monitor?...
___[ MINICOM O/P
]________________________________________________________________________________________
...
   Verifying Checksum ... OK
   Loading Kernel Image ... OK
OK

Starting kernel ...

Uncompressing Linux... done, booting the kernel.
??????

If someone can understand why nothing is displayed on monitor, please tell
me or us (probably not the only stuck with it!)

thanks
-- 
Cordialement.

___Johann MERCADIER___

:(){ :|:& };:
"I am the Unknown lead by the Unknowing.
I have done so much with so little for so long
that I am now qualified to do anything with nothing."
HOOSEEK (http://www.hooseek.com/) 1?moteur de recherche solidaire!
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120307/4a3d0bf6/attachment-0001.html>
