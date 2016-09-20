From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 20 Sep 2016 21:44:15 +0000
Subject: [Buildroot] [Bug 9196] raspberry pi 3 default build seem broken
In-Reply-To: <bug-9196-163@https.bugs.busybox.net/>
References: <bug-9196-163@https.bugs.busybox.net/>
Message-ID: <bug-9196-163-v3qLyhUc9v@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9196

--- Comment #7 from Floris Bos <bos@je-eigen-domein.nl> ---
>With raspberrypi3_defconfig with change to glibc/systemd serial login works out of 
>the box.

That could be thanks to systemd's behavior of auto-magically spawning getty's
on serial consoles though.

https://www.freedesktop.org/software/systemd/man/systemd-getty-generator.html

Rather than the symlink buildroot created working correctly.


>For hdmi/usb-keyboard (tty1) login the following link was necessary (as advised in 
>[2]):
>
>ln -sf /usr/lib/systemd/system/getty at .service  >/etc/systemd/system/getty.target.wants/getty at tty1.service

Alternative fix: https://patchwork.ozlabs.org/patch/668134/

-- 
You are receiving this mail because:
You are on the CC list for the bug.
