From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 10 Aug 2019 10:51:28 +0200
Subject: [Buildroot] Buildroot solidrun_clearfog_defconfig no longer builds
Message-ID: <20190810105128.26f1a09c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Jan and Baruch,

The solidrun_clearfog_defconfig in Buildroot no longer builds:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/269139293

The issue is:

  /builds/buildroot.org/buildroot/output/host/bin/arm-buildroot-linux-uclibcgnueabihf-ld.bfd: SPL image too big

So the U-Boot SPL is now too big. Maybe it is due to our switch to gcc
8.x as the default compiler version, which has caused the image to be
slightly bigger than it used to be.

Could you have a look into this and send a patch ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
