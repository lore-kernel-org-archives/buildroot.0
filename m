From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 11 Dec 2018 21:54:39 +0000
Subject: [Buildroot] =?utf-8?q?=5BBug_11556=5D_Can_not_build_qt5base_5=2E?=
 =?utf-8?q?11=2E2_with_weston_3=2E0=2E0_and_vivante_GPU=2E_error=3A_invali?=
 =?utf-8?b?ZCBjb252ZXJzaW9uIGZyb20g4oCYdm9pZCrigJkgdG8g4oCYRUdMTmF0aXZl?=
 =?utf-8?q?DisplayType_=7Baka_wl=5Fdisplay*=7D=E2=80=99_=5B-fpermissive=5D?=
In-Reply-To: <bug-11556-163@https.bugs.busybox.net/>
References: <bug-11556-163@https.bugs.busybox.net/>
Message-ID: <bug-11556-163-SYPOnOPEKb@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11556

--- Comment #1 from Peter Seiderer <ps.report@gmx.net> ---
(In reply to Patrick Koller from comment #0)

Hello Patrick,

no actual experience with the imx-gpu-viv package and qt/wayland, but
a quick test with your provided polytab_defconfig showed the same error.

Second test was without qt, only wayland/weston, did not compile out of the
box, a quick fix was to upgrade to a buildroot toolchain instead of the given
gcc-linaro-4.9.4 toolchain (did not investigate further).

You can try to fix the eglfs_viv_wl errors (by adding the needed pointer casts)
or disabling qt eglfs support (with wayland/weston your want to run your
application with '-platform wayland' instead '-platform eglfs'), or try to
run wayland/weston only first (without Qt)...

And last but not least you can try to run the open source etnaviv support (see
e.g. imx6-sabresd_qt5_defconfig, your need to enable etnaviv support in librm,
mesa3d and linux mainline kernel)...

Regards,
Peter

-- 
You are receiving this mail because:
You are on the CC list for the bug.
