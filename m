From: unixmania at gmail.com <unixmania@gmail.com>
Date: Thu, 14 Nov 2019 09:42:10 -0300
Subject: [Buildroot] [PATCH/next v2 0/5] fix beaglebone_qt5
Message-ID: <20191114124215.12985-1-unixmania@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <unixmania@gmail.com>

Fix some issues in Lothar's initial patch.

Add a patch dropping the custom post-image script.

Carlos Santos (1):
  configs/beaglebone_qt5: don't use custom post-image script

Lothar Felten (4):
  package/ti-sgx-libgbm: new package
  package/ti-sgx-{km,um,demos}: bump to latest TI version
  package/qt5/qt5base: support ti-sgx-libgbm
  configs/beaglebone_qt5: bump kernel and U-Boot, add weston

 ...ux-4.1-sgx.fragment => linux-sgx.fragment} |  1 +
 board/beaglebone/post-image.sh                | 29 ---------
 configs/beaglebone_qt5_defconfig              | 27 ++++----
 package/Config.in                             |  1 +
 package/qt5/qt5base/qt5base.mk                |  5 +-
 package/ti-sgx-demos/ti-sgx-demos.hash        |  2 +-
 package/ti-sgx-demos/ti-sgx-demos.mk          |  6 +-
 package/ti-sgx-km/Config.in                   | 37 +----------
 package/ti-sgx-km/ti-sgx-km.hash              |  2 +-
 package/ti-sgx-km/ti-sgx-km.mk                | 22 ++-----
 .../0001_fix_sysmacro_include.patch           | 12 ++++
 package/ti-sgx-libgbm/Config.in               |  5 ++
 package/ti-sgx-libgbm/ti-sgx-libgbm.hash      |  2 +
 package/ti-sgx-libgbm/ti-sgx-libgbm.mk        | 41 ++++++++++++
 ...-Makefile-do-not-install-init-script.patch | 39 +++++++++++
 package/ti-sgx-um/Config.in                   |  3 +
 package/ti-sgx-um/S80ti-sgx                   | 64 +++++++++++++++----
 package/ti-sgx-um/powervr.ini                 |  6 --
 package/ti-sgx-um/ti-sgx-um.hash              |  2 +-
 package/ti-sgx-um/ti-sgx-um.mk                | 19 +++---
 20 files changed, 199 insertions(+), 126 deletions(-)
 rename board/beaglebone/{linux-4.1-sgx.fragment => linux-sgx.fragment} (92%)
 delete mode 100755 board/beaglebone/post-image.sh
 create mode 100644 package/ti-sgx-libgbm/0001_fix_sysmacro_include.patch
 create mode 100644 package/ti-sgx-libgbm/Config.in
 create mode 100644 package/ti-sgx-libgbm/ti-sgx-libgbm.hash
 create mode 100644 package/ti-sgx-libgbm/ti-sgx-libgbm.mk
 create mode 100644 package/ti-sgx-um/0001-Makefile-do-not-install-init-script.patch
 delete mode 100644 package/ti-sgx-um/powervr.ini

-- 
2.18.1
