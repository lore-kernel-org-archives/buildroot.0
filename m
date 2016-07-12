From: Romain Perier <romain.perier@free-electrons.com>
Date: Tue, 12 Jul 2016 11:30:14 +0200
Subject: [Buildroot] [PATCH v2 0/6] Add support for AMD Catalyst graphics
	driver
Message-ID: <1468315820-9341-1-git-send-email-romain.perier@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The AMD Catalyst Proprietary Linux Graphics Driver 15.9 supports GPUs
AMD Radeon HD 5xxx and newer graphics. It requires at least glibc 2.2
or 2.3 and is compatible up to Xorg 1.17. This serie adds the required
changes to support this driver.

The fglrx kernel module is compatible up to Linux kernel 4.4 LTS.
All the graphical stack has been tested on a x86_64 system with an
AMD-GT40N (w/ Radeon HD 6290 GPU).

Romain Perier (6):
  support/download: Add support for the referer option to wget
  pkg-download: Allow packages to pass an URL referer to the wget method
  docs/manual: Document the variable $(PKG)_DL_REFERER
  package/xserver_xorg-server: add version 1.17.4
  qt: Add option for enabling the accessibility support
  package/amd-catalyst-driver: Add AMD proprietary graphic stack support

 docs/manual/adding-packages-generic.txt            |  75 +++++----
 package/Config.in                                  |   1 +
 .../0001-Add-support-for-Linux-4.0.patch           |  45 ++++++
 .../0002-Add-support-for-Linux-4.1.patch           |  31 ++++
 .../0003-Add-support-for-Linux-4.2.patch           | 121 ++++++++++++++
 ...0004-Use-fpregs_active-instead-of-has_fpu.patch |  33 ++++
 ...-Use-a-local-copy-of-copy_xregs_to_kernel.patch |  79 ++++++++++
 .../0006-Add-support-for-Linux-4.4.patch           |  78 +++++++++
 package/amd-catalyst-driver/20-fglrx.conf          |   4 +
 package/amd-catalyst-driver/Config.in              |  89 +++++++++++
 .../amd-catalyst-driver/amd-catalyst-driver.hash   |   2 +
 package/amd-catalyst-driver/amd-catalyst-driver.mk | 175 +++++++++++++++++++++
 package/amd-catalyst-driver/gl.pc                  |  12 ++
 package/pkg-download.mk                            |   3 +-
 package/qt/Config.in                               |   5 +
 package/qt/qt.mk                                   |   7 +-
 package/x11r7/xserver_xorg-server/Config.in        |  10 ++
 .../xserver_xorg-server/xserver_xorg-server.hash   |   2 +
 support/download/wget                              |  10 +-
 19 files changed, 744 insertions(+), 38 deletions(-)
 create mode 100644 package/amd-catalyst-driver/0001-Add-support-for-Linux-4.0.patch
 create mode 100644 package/amd-catalyst-driver/0002-Add-support-for-Linux-4.1.patch
 create mode 100644 package/amd-catalyst-driver/0003-Add-support-for-Linux-4.2.patch
 create mode 100644 package/amd-catalyst-driver/0004-Use-fpregs_active-instead-of-has_fpu.patch
 create mode 100644 package/amd-catalyst-driver/0005-Use-a-local-copy-of-copy_xregs_to_kernel.patch
 create mode 100644 package/amd-catalyst-driver/0006-Add-support-for-Linux-4.4.patch
 create mode 100644 package/amd-catalyst-driver/20-fglrx.conf
 create mode 100644 package/amd-catalyst-driver/Config.in
 create mode 100644 package/amd-catalyst-driver/amd-catalyst-driver.hash
 create mode 100644 package/amd-catalyst-driver/amd-catalyst-driver.mk
 create mode 100644 package/amd-catalyst-driver/gl.pc

-- 
2.8.1
