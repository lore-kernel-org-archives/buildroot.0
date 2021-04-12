From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 12 Apr 2021 12:06:01 +0000
Subject: [Buildroot] [Bug 13756] New: SDL2_KMSDRM depends on gbm and egl
Message-ID: <bug-13756-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13756

            Bug ID: 13756
           Summary: SDL2_KMSDRM depends on gbm and egl
           Product: buildroot
           Version: 2021.02.1
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: stsp2 at yandex.ru
                CC: buildroot at uclibc.org
  Target Milestone: ---

Created attachment 8901
  --> https://bugs.busybox.net/attachment.cgi?id=8901&action=edit
the patch

BR2_PACKAGE_SDL2_KMSDRM option is
currently broken. Enabling it doesn't
do anything useful because kmsdrm driver
in sdl2 have more deps.
Namely, it needs BR2_PACKAGE_MESA3D_GBM
and BR2_PACKAGE_MESA3D_OPENGL_EGL.
Additionally it needs the patch that I
extracted from sdl git, to even build
successfully. See "hg diff -r 14526..14527"
in sdl sources.
That patch is attached.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
