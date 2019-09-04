From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 04 Sep 2019 20:08:07 +0000
Subject: [Buildroot] [Bug 12186] Raspberry Pi Zero-W build fails on newer
 kernel versions
In-Reply-To: <bug-12186-163@https.bugs.busybox.net/>
References: <bug-12186-163@https.bugs.busybox.net/>
Message-ID: <bug-12186-163-ptxim5aNEz@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12186

--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org> ---
But the dts file to use is also part of the defconfig, so simply change

BR2_LINUX_KERNEL_INTREE_DTS_NAME="bcm2708-rpi-0-w"

To

BR2_LINUX_KERNEL_INTREE_DTS_NAME="bcm2708-rpi-zero-w"

But keep in mind that the genimage configuration also refers to the old name:

board/raspberrypi/genimage-raspberrypi0w.cfg:      "bcm2708-rpi-0-w.dtb",

Either we change that when we bump the kernel version or we add some logic to
rename the file if needed.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
