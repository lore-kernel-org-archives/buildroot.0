From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 16 Sep 2015 17:36:35 +0000 (UTC)
Subject: [Buildroot] [Bug 8341] Getting EGL Error: Could not create the egl
 surface: error = 0x300b on RPI-2b board.
In-Reply-To: <bug-8341-163@https.bugs.busybox.net/>
References: <bug-8341-163@https.bugs.busybox.net/>
Message-ID: <20150916173636.134FA81ED7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8341

--- Comment #5 from Beno?t Th?baudeau <benoit.thebaudeau.dev@gmail.com> 2015-09-16 17:36:35 UTC ---
Just in case, test again after selecting BR2_PACKAGE_RPI_FIRMWARE_X and setting
the following in package/rpi-firmware/config.txt (or using a post-build script,
or directly on your SD card):

  gpu_mem_256=128
  gpu_mem_512=256
  gpu_mem_1024=512

Make sure that rpi-firmware has been rebuilt after these configuration changes
before testing.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
