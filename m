From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 14 Oct 2013 23:26:34 +0200
Subject: [Buildroot] [pull request v2] Pull request for branch
	yem/wayland-bump
Message-ID: <cover.1381785903.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Hello All!

This series bumps the couple wayland/weston to the latest released
version 1.3.0.

Changes v1 -> v2:
  - don't build tests, they fail with no EGL  (Peter)
  - drop Arnout's fixes, they've been applied  (Peter)

Regards,
Yann E. MORIN.


The following changes since commit 4b1eba735e03ee6ad2147325f0a73408454d960a:

  noip: add license information (2013-10-14 23:03:10 +0200)

are available in the git repository at:

  git://gitorious.org/buildroot/buildroot.git yem/wayland-bump

for you to fetch changes up to 801b3c42bed982f8296db2f8227dfcbbdecf5f48:

  package/weston: bump to 1.3.0 (2013-10-14 23:18:19 +0200)

----------------------------------------------------------------
Tag base for branch "yem/wayland-egl"

----------------------------------------------------------------
Yann E. MORIN (2):
      package/wayland: bump to 1.3.0
      package/weston: bump to 1.3.0

 package/wayland/wayland.mk                         |  2 +-
 ...eston-0000-dont-leak-fd-on-launcher-error.patch | 77 ++++++++++++++++++++++
 ...pendent-code-only-when-the-DRM-compositor.patch | 47 -------------
 .../weston-0001-enable-build-without-libdrm.patch  | 45 +++++++++++++
 ...on-0002-fbdev-fix-compilation-without-EGL.patch | 29 ++++++++
 ...02-fix-configure.ac-check-wayland-scanner.patch | 26 --------
 ...ompositor-fbdev-drop-dependency-on-libdrm.patch | 22 -------
 package/weston/weston-0003-dont-build-tests.patch  | 18 +++++
 package/weston/weston.mk                           |  4 +-
 9 files changed, 172 insertions(+), 98 deletions(-)
 create mode 100644 package/weston/weston-0000-dont-leak-fd-on-launcher-error.patch
 delete mode 100644 package/weston/weston-0001-Pull-DRM-dependent-code-only-when-the-DRM-compositor.patch
 create mode 100644 package/weston/weston-0001-enable-build-without-libdrm.patch
 create mode 100644 package/weston/weston-0002-fbdev-fix-compilation-without-EGL.patch
 delete mode 100644 package/weston/weston-0002-fix-configure.ac-check-wayland-scanner.patch
 delete mode 100644 package/weston/weston-0003-compositor-fbdev-drop-dependency-on-libdrm.patch
 create mode 100644 package/weston/weston-0003-dont-build-tests.patch

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
