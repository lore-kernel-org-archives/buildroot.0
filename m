From: Francois Perrad <fperrad@gmail.com>
Date: Wed,  6 Mar 2019 16:24:23 +0100
Subject: [Buildroot] [PATCH 0/3] remove legacy sunxi-mali
Message-ID: <20190306152426.8402-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

see initial discussion: http://lists.busybox.net/pipermail/buildroot/2018-November/236420.html

Francois Perrad (3):
  olimex_a20_olinuxino_lime_legacy_defconfig: remove it
  package/sunxi-mali: remove it
  package/libump: remove it

 Config.in.legacy                              | 16 ++++
 DEVELOPERS                                    |  2 -
 board/olimex/a20_olinuxino/boot-legacy.cmd    |  5 --
 board/olimex/a20_olinuxino/post-build.sh      |  5 --
 board/olimex/a20_olinuxino/readme.txt         |  7 --
 ...olimex_a20_olinuxino_lime_legacy_defconfig | 56 --------------
 package/Config.in                             |  2 -
 package/libump/Config.in                      | 13 ----
 package/libump/libump.hash                    |  2 -
 package/libump/libump.mk                      | 13 ----
 package/qt5/qt5base/qt5base.mk                |  2 +-
 .../0001-Add-missing-GLchar-definitions.patch | 45 ------------
 ...002-linking-of-test-app-needs-libUMP.patch | 18 -----
 ...data-types-between-GLES2-gl2.h-and-G.patch | 57 ---------------
 package/sunxi-mali/Config.in                  | 59 ---------------
 package/sunxi-mali/S80mali                    | 54 --------------
 package/sunxi-mali/egl.pc                     | 12 ---
 package/sunxi-mali/glesv2.pc                  | 12 ---
 package/sunxi-mali/sunxi-mali.hash            |  2 -
 package/sunxi-mali/sunxi-mali.mk              | 73 -------------------
 .../xdriver_xf86-video-fbturbo.mk             |  4 -
 21 files changed, 17 insertions(+), 442 deletions(-)
 delete mode 100644 board/olimex/a20_olinuxino/boot-legacy.cmd
 delete mode 100644 configs/olimex_a20_olinuxino_lime_legacy_defconfig
 delete mode 100644 package/libump/Config.in
 delete mode 100644 package/libump/libump.hash
 delete mode 100644 package/libump/libump.mk
 delete mode 100644 package/sunxi-mali/0001-Add-missing-GLchar-definitions.patch
 delete mode 100644 package/sunxi-mali/0002-linking-of-test-app-needs-libUMP.patch
 delete mode 100644 package/sunxi-mali/0003-fix-conflicting-data-types-between-GLES2-gl2.h-and-G.patch
 delete mode 100644 package/sunxi-mali/Config.in
 delete mode 100644 package/sunxi-mali/S80mali
 delete mode 100644 package/sunxi-mali/egl.pc
 delete mode 100644 package/sunxi-mali/glesv2.pc
 delete mode 100644 package/sunxi-mali/sunxi-mali.hash
 delete mode 100644 package/sunxi-mali/sunxi-mali.mk

-- 
2.17.1
