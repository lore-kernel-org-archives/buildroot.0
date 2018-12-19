From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 19 Dec 2018 17:17:35 +0000
Subject: [Buildroot] =?utf-8?q?=5BBug_11556=5D_Can_not_build_qt5base_5=2E?=
 =?utf-8?q?11=2E2_with_weston_3=2E0=2E0_and_vivante_GPU=2E_error=3A_invali?=
 =?utf-8?b?ZCBjb252ZXJzaW9uIGZyb20g4oCYdm9pZCrigJkgdG8g4oCYRUdMTmF0aXZl?=
 =?utf-8?q?DisplayType_=7Baka_wl=5Fdisplay*=7D=E2=80=99_=5B-fpermissive=5D?=
In-Reply-To: <bug-11556-163@https.bugs.busybox.net/>
References: <bug-11556-163@https.bugs.busybox.net/>
Message-ID: <bug-11556-163-2kTx9guHnP@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11556

--- Comment #11 from Peter Seiderer <ps.report@gmx.net> ---
(In reply to Patrick Koller from comment #10)

> Thanks for your hint. Now, I am able to build wayland/weston (without qt)
> sucessfully (With both toolchains). As soon as I try to build qt5, the
> previous mentioned error (qwaylanddisplay.cpp:315:35: error: could not
> convert ?{listener, data}? from ?<brace-enclosed initializer list>? to
> ?QtWaylandClient::QWaylandDisplay::Listener?) occurs. Do you have a
> hint to solve this problem?

Please do not mix toolchains, I doubt wayland/weston builds with the linaro
toolchain (see comment #1), please re-build complete (make clean; make) (the
complete buildroot build, not only a single package)  after changing to the
buildroot toolchain (used buildroot git latest, gcc-7.4.0, qt-5.11.3)...

In case of failure post your .config/defconfig

-- 
You are receiving this mail because:
You are on the CC list for the bug.
