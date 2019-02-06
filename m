From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 6 Feb 2019 15:47:13 +0100
Subject: [Buildroot] [git commit] package/qt: remove package
Message-ID: <20190206145217.2DDE1812EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5a8bc8083a5d0e18e34fa70c44c91cbdc5bf0c92
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Qt4 has been marked obsolete for close to 1 year, since commit 3538b5fb10
(qt: mark as obsolete) and is no longer supported upstream since December
2015:

https://blog.qt.io/blog/2015/05/26/qt-4-8-7-released/

So now finally remove it as the in tree users have been removed.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Config.in.legacy                                   |   6 +
 package/Config.in                                  |   3 +-
 ...e-check-to-treat-alsalib-1.1.x-as-correct.patch |  29 -
 package/qt/0002-configure.patch                    |  52 --
 package/qt/0003-eglwsegl-use-system.patch          | 802 ---------------------
 package/qt/0004-fix-const-atomics.patch            |  50 --
 package/qt/0005-pthread_getattr_np.patch           | 107 ---
 package/qt/0006-script-qtdbus-no-gui.patch         |  22 -
 ...7-Add-initial-support-of-ARC-architecture.patch | 183 -----
 .../qt/0008-Prevent-unaligned-access-on-ARC.patch  |  92 ---
 ...ion-constructor-error-for-legacy-c-compil.patch | 163 -----
 ...tform-socklen_t-on-other-C-libraries-than.patch |  43 --
 ...with-ldl-option-only-when-it-is-supported.patch | 116 ---
 ...012-OpenGL-EGL-Avoid-X11-header-collision.patch |  60 --
 ...-arch-qatomic_arm.h-fix-build-on-ARMv8-32.patch |  37 -
 .../qt/0014-Enable-QtWebKit-with-newer-GCC.patch   |  50 --
 ...-configure-fix-build-on-non-x86-platforms.patch | 146 ----
 package/qt/Config.gfx.in                           |  31 -
 package/qt/Config.in                               | 543 --------------
 package/qt/Config.keyboard.in                      |  12 -
 package/qt/Config.mouse.in                         |  26 -
 package/qt/Config.sql.in                           |  64 --
 package/qt/powervr.ini                             |   2 -
 package/qt/qt.hash                                 |   3 -
 package/qt/qt.mk                                   | 725 -------------------
 package/qt5/Config.in                              |   2 -
 26 files changed, 7 insertions(+), 3362 deletions(-)

Patch is too large, so refusing to show it
