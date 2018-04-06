From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 6 Apr 2018 22:14:18 +0200
Subject: [Buildroot] [PATCH v4 0/7] Add rpi3 b+ support
In-Reply-To: <1521900617-32102-1-git-send-email-martin@barkynet.com>
References: <1521900617-32102-1-git-send-email-martin@barkynet.com>
Message-ID: <20180406221418.49582c2a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Martin,

On Sat, 24 Mar 2018 14:10:10 +0000, Martin Bark wrote:

> Martin Bark (7):
>   package/rpi-firmware: bump version
>   configs/raspberrypi*: bump kernel version
>   board/raspberrypi: add support for rpi3 b+
>   package/rpi-firmware: improve installation of dtb files
>   package/rpi-bt-firmware: change to LibreELEC github repo
>   package/rpi-wifi-firmware: change to LibreELEC github repo
>   DEVELOPERS: add myself for rpi packages

I've applied the entire series. Two comments:

 - Use exactly "---" below your SoB to add the changelog or additional
   comments. If you don't do this, it doesn't get recognized as a
   separator, and the changelog becomes part of the commit log.

 - Use "foreach" make loops instead of "for" shell loops. It is more
   Buildroot-ish, and the "foreach" make loops do the error checking
   automatically at each iteration of the loop. Due to the usage of a
   "for" shell loop, error checking was missing in the rpi-bt-firmware
   change you made. There is a remaining "for" shell loop in the
   rpi-firmware package, it would be good to get rid of it as well.

Thanks a lot for this contribution!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
