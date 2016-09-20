From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 20 Sep 2016 20:47:44 +0000
Subject: [Buildroot] [Bug 9196] raspberry pi 3 default build seem broken
In-Reply-To: <bug-9196-163@https.bugs.busybox.net/>
References: <bug-9196-163@https.bugs.busybox.net/>
Message-ID: <bug-9196-163-pXLXgVb1sw@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9196

--- Comment #6 from Peter Seiderer <ps.report@gmx.net> ---
Tested with buildroot git d4db4277ffbd1fae478ba748c626eddc7c220e67 (including
[1]).

With bare raspberrypi3_defconfig login via serial and login via
hdmi/usb-keyboard
is possible.

With raspberrypi3_defconfig with change to glibc/systemd serial login works out
of the box.

For hdmi/usb-keyboard (tty1) login the following link was necessary (as advised
in [2]):

ln -sf /usr/lib/systemd/system/getty at .service
/etc/systemd/system/getty.target.wants/getty at tty1.service

Additional he file /etc/systemd/system/getty at .service.d/nodisallocate.conf to
avoid clearing the console.

[1]
https://git.buildroot.net/buildroot/commit/?id=1e03cc2290f98fc7434254d2abd9afd504de8360

[2] https://wiki.archlinux.org/index.php/Systemd_FAQ

-- 
You are receiving this mail because:
You are on the CC list for the bug.
