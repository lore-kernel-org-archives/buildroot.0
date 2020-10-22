From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 22 Oct 2020 19:43:57 +0000
Subject: [Buildroot] [Bug 13281] Raspberry Pi 2: overlays folder missing in
 genimage-raspberrypi2.cfg
In-Reply-To: <bug-13281-163@https.bugs.busybox.net/>
References: <bug-13281-163@https.bugs.busybox.net/>
Message-ID: <bug-13281-163-Hc3lcKhWgg@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13281

--- Comment #1 from Peter Seiderer <ps.report@gmx.net> ---
Sorry, it is by design (note the line '#
BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS is not set' in
configs/raspberrypi2_defconfig)...

Long answer: 

The buildroot defconfigs are about a minimal starting point for own
development, minimal means board startup and at least a serial login, in the
case of RPi2 no device tree overlays needed to achieve this, so config option
RPI_FIRMWARE_INSTALL_DTB_OVERLAYS disabled and no entry in the genimage config
file...

For your own/enhanced project feel free to adjust as needed (and the genimage
config is for sure a minor part of it)...

-- 
You are receiving this mail because:
You are on the CC list for the bug.
