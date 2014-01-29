From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 29 Jan 2014 23:07:58 +0100
Subject: [Buildroot] [PATCH 0/3 v2] wayland+weston: bump to 1.4.0
Message-ID: <cover.1391033178.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Hello All!

Here is a small series that bumps wayland and weston to the latest and
greatest 1.4.0

Note that the weston's rpi-backend is currently broken, so it is marked
accordingly.

Changes v1 -> v2:
  - remove wayland's DTD from target/  (Thomas)

Regards,
Yann E. MORIN.


----------------------------------------------------------------
Yann E. MORIN (3):
      package/wayland: bump to 1.4.0
      package/wayland: build a host variant
      package/weston: bump to 1.4.0

 package/wayland/wayland.mk                         | 27 +++++---
 package/weston/Config.in                           |  1 +
 ...eston-0000-dont-leak-fd-on-launcher-error.patch | 77 ----------------------
 .../weston-0001-enable-build-without-libdrm.patch  | 45 -------------
 ...on-0002-fbdev-fix-compilation-without-EGL.patch | 29 --------
 package/weston/weston-0003-dont-build-tests.patch  | 15 ++---
 ...weston-0004-fbdev-open-launcher-only-once.patch | 46 -------------
 package/weston/weston.mk                           |  3 +-
 8 files changed, 28 insertions(+), 215 deletions(-)
 delete mode 100644 package/weston/weston-0000-dont-leak-fd-on-launcher-error.patch
 delete mode 100644 package/weston/weston-0001-enable-build-without-libdrm.patch
 delete mode 100644 package/weston/weston-0002-fbdev-fix-compilation-without-EGL.patch
 delete mode 100644 package/weston/weston-0004-fbdev-open-launcher-only-once.patch

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
