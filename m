From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 02 May 2020 13:20:55 +0000
Subject: [Buildroot] [Bug 12831] RPI-firmware package: DTB-overlay dependency
In-Reply-To: <bug-12831-163@https.bugs.busybox.net/>
References: <bug-12831-163@https.bugs.busybox.net/>
Message-ID: <bug-12831-163-To7uKyQF1N@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12831

--- Comment #1 from Peter Seiderer <ps.report@gmx.net> ---
Right and wrong at the same time, in principle your are right, but the
raspberrypi linux-kernel 32-bit seems to enable the overlay support
auto-magical,
only for the 64-bit versions an explicit BR2_LINUX_KERNEL_DTB_OVERLAY_SUPPORT
is needed (did not test with mainline kernels)..., see e.g. [1], [2] and [3]

[1] http://lists.busybox.net/pipermail/buildroot/2019-November/265550.html
[2] http://lists.busybox.net/pipermail/buildroot/2019-November/265772.html
[3]
https://git.buildroot.net/buildroot/commit/?id=2aa92335cdc5f71c2d09391dc49fcf3c7627d6f0

-- 
You are receiving this mail because:
You are on the CC list for the bug.
