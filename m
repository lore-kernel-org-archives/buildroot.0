From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 13 Dec 2018 20:02:35 +0000
Subject: [Buildroot] =?utf-8?q?=5BBug_11556=5D_Can_not_build_qt5base_5=2E?=
 =?utf-8?q?11=2E2_with_weston_3=2E0=2E0_and_vivante_GPU=2E_error=3A_invali?=
 =?utf-8?b?ZCBjb252ZXJzaW9uIGZyb20g4oCYdm9pZCrigJkgdG8g4oCYRUdMTmF0aXZl?=
 =?utf-8?q?DisplayType_=7Baka_wl=5Fdisplay*=7D=E2=80=99_=5B-fpermissive=5D?=
In-Reply-To: <bug-11556-163@https.bugs.busybox.net/>
References: <bug-11556-163@https.bugs.busybox.net/>
Message-ID: <bug-11556-163-SZVNl84660@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11556

--- Comment #5 from Peter Seiderer <ps.report@gmx.net> ---
(In reply to Patrick Koller from comment #3)

Try the following patch:

diff --git a/package/qt5/qt5webengine/Config.in
b/package/qt5/qt5webengine/Config.in
index 744d659567..c29c239342 100644
--- a/package/qt5/qt5webengine/Config.in
+++ b/package/qt5/qt5webengine/Config.in
@@ -50,7 +50,7 @@ config BR2_PACKAGE_QT5WEBENGINE
        select BR2_PACKAGE_WEBP
        select BR2_PACKAGE_WEBP_DEMUX
        select BR2_PACKAGE_QT5BASE_DBUS
-       select BR2_PACKAGE_QT5BASE_EGLFS
+       select BR2_PACKAGE_QT5BASE_EGLFS if !BR2_PACKAGE_QT5WAYLAND=y
        select BR2_PACKAGE_QT5BASE_FONTCONFIG
        select BR2_PACKAGE_QT5BASE_ICU
        select BR2_PACKAGE_QT5BASE_GUI

And try to enable/build qt5webengine (and keep qt eglfs support disabled),
builds fine here, not run time tested...

The imx-gpu-viv/qt eglfs compile problem (if there is no easy/quick fix) is
better addressed at a qt mailing list/qt bugtracker (if you do so, please
link it from here)...

-- 
You are receiving this mail because:
You are on the CC list for the bug.
