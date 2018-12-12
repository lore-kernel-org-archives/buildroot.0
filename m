From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 12 Dec 2018 16:29:15 +0000
Subject: [Buildroot] =?utf-8?q?=5BBug_11556=5D_Can_not_build_qt5base_5=2E?=
 =?utf-8?q?11=2E2_with_weston_3=2E0=2E0_and_vivante_GPU=2E_error=3A_invali?=
 =?utf-8?b?ZCBjb252ZXJzaW9uIGZyb20g4oCYdm9pZCrigJkgdG8g4oCYRUdMTmF0aXZl?=
 =?utf-8?q?DisplayType_=7Baka_wl=5Fdisplay*=7D=E2=80=99_=5B-fpermissive=5D?=
In-Reply-To: <bug-11556-163@https.bugs.busybox.net/>
References: <bug-11556-163@https.bugs.busybox.net/>
Message-ID: <bug-11556-163-xwrm64Bfn2@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11556

Patrick Koller <koller@stettbacher.ch> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
   Attachment #7896|0                           |1
        is obsolete|                            |

--- Comment #2 from Patrick Koller <koller@stettbacher.ch> ---
Created attachment 7901
  --> https://bugs.busybox.net/attachment.cgi?id=7901&action=edit
Patch to reproduce the problem

This patch provides the configuration to build my project with weston-imx
successfully without Qt5. As soon as Qt5 is selected, the build fails as
follows:

*** Reproduce the Qt5 build error ***
- Apply the attached patch to buildroot-2018.11
- make polytab_defconfig
- make
- Get the error:
qeglfsvivintegration.cpp:68:60: error: invalid conversion from ?void*? to
?EGLNativeDisplayType {aka wl_display*}? [-fpermissive]

*** Reproduce a successful build ***
- Apply the attached patch to buildroot-2018.11
- make polytab_defconfig
- make xconfig
- uncheck Qt5
- make

-- 
You are receiving this mail because:
You are on the CC list for the bug.
