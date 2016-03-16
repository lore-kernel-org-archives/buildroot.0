From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 16 Mar 2016 21:13:04 +0000
Subject: [Buildroot] [Bug 8806] Buildroot 2016.2 for Raspberry Pi requires
 that ext4 rootfs is selected. Otherwise the error is reported
In-Reply-To: <bug-8806-163@https.bugs.busybox.net/>
References: <bug-8806-163@https.bugs.busybox.net/>
Message-ID: <bug-8806-163-D2GhrIvULN@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8806

--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org> ---
What do you suggest we do? If you change the defconfig (E.G. to use initramfs
instead of ext4) then it is also your responsibility to ensure it makes sense.
The raspberrypi post-image script creates as sdcard image with the ext4
filesystem the defconfig enables, so if you don't want that - Then just remove
the post-image script from the .config.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
