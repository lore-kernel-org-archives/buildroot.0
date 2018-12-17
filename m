From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 17 Dec 2018 17:38:02 +0000
Subject: [Buildroot] =?utf-8?q?=5BBug_11556=5D_Can_not_build_qt5base_5=2E?=
 =?utf-8?q?11=2E2_with_weston_3=2E0=2E0_and_vivante_GPU=2E_error=3A_invali?=
 =?utf-8?b?ZCBjb252ZXJzaW9uIGZyb20g4oCYdm9pZCrigJkgdG8g4oCYRUdMTmF0aXZl?=
 =?utf-8?q?DisplayType_=7Baka_wl=5Fdisplay*=7D=E2=80=99_=5B-fpermissive=5D?=
In-Reply-To: <bug-11556-163@https.bugs.busybox.net/>
References: <bug-11556-163@https.bugs.busybox.net/>
Message-ID: <bug-11556-163-NQNMP26dkC@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11556

--- Comment #7 from Peter Seiderer <ps.report@gmx.net> ---
(In reply to Patrick Koller from comment #6)

Strange, the copy source paths should be

/home/patrickk/tmp/buildroot/eglfs_patch/output/staging/usr/lib/libQt5WebEngine*.so.*

...but should not matter, because staging is a symlink to
host/arm-buildroot-linux-gnueabihf/sysroot...


Can you find the libs somewhere else (e.g. the build directory)?

Do you use ccache and hit by [1] (you need a buildroot git update or [2])?

Try a complete re-build (make clean; make)?

Any errors in the qt5webengine unpack/configure steps?

Regards,
Peter

[1] http://lists.busybox.net/pipermail/buildroot/2018-December/238290.html
[2] http://lists.busybox.net/pipermail/buildroot/2018-December/238339.html

-- 
You are receiving this mail because:
You are on the CC list for the bug.
