From: Romain Perier <romain.perier@free-electrons.com>
Date: Tue, 23 Aug 2016 14:19:43 +0200
Subject: [Buildroot] [PATCH v5 0/7] Add support for AMD Catalyst graphics
	driver
Message-ID: <20160823121950.16826-1-romain.perier@free-electrons.com>
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

Romain Perier (7):
  support/download: Add support to pass options directly to downloaders
  pkg-download: Allow packages to pass generic options to download
    methods
  docs/manual: Document the variable $(PKG)_DL_OPTS
  package/amd-catalyst: Add AMD proprietary graphic stack support
  package/amd-catalyst: Add AMD cmdline tools
  package/amd-catalyst: Add support AMD CCCLE
  package/amd-catalyst: Add support for OpenCL

 docs/manual/adding-packages-generic.txt            |   7 +
 package/Config.in                                  |   1 +
 .../0001-Add-support-for-Linux-4.0.patch           |  45 ++++++
 .../0002-Add-support-for-Linux-4.1.patch           |  31 ++++
 .../0003-Add-support-for-Linux-4.2.patch           | 121 +++++++++++++++
 ...0004-Use-fpregs_active-instead-of-has_fpu.patch |  33 ++++
 ...-Use-a-local-copy-of-copy_xregs_to_kernel.patch |  79 ++++++++++
 .../0006-Add-support-for-Linux-4.4.patch           |  78 ++++++++++
 package/amd-catalyst/0007-remove-gpl-symbols.patch |  54 +++++++
 package/amd-catalyst/20-fglrx.conf                 |   4 +
 package/amd-catalyst/Config.in                     |  73 +++++++++
 package/amd-catalyst/amd-catalyst.hash             |   2 +
 package/amd-catalyst/amd-catalyst.mk               | 168 +++++++++++++++++++++
 package/amd-catalyst/gl.pc                         |  12 ++
 package/pkg-download.mk                            |  24 ++-
 support/download/bzr                               |   4 +-
 support/download/cp                                |   4 +-
 support/download/cvs                               |   4 +-
 support/download/git                               |   6 +-
 support/download/hg                                |   4 +-
 support/download/scp                               |   4 +-
 support/download/svn                               |   4 +-
 support/download/wget                              |   4 +-
 23 files changed, 749 insertions(+), 17 deletions(-)
 create mode 100644 package/amd-catalyst/0001-Add-support-for-Linux-4.0.patch
 create mode 100644 package/amd-catalyst/0002-Add-support-for-Linux-4.1.patch
 create mode 100644 package/amd-catalyst/0003-Add-support-for-Linux-4.2.patch
 create mode 100644 package/amd-catalyst/0004-Use-fpregs_active-instead-of-has_fpu.patch
 create mode 100644 package/amd-catalyst/0005-Use-a-local-copy-of-copy_xregs_to_kernel.patch
 create mode 100644 package/amd-catalyst/0006-Add-support-for-Linux-4.4.patch
 create mode 100644 package/amd-catalyst/0007-remove-gpl-symbols.patch
 create mode 100644 package/amd-catalyst/20-fglrx.conf
 create mode 100644 package/amd-catalyst/Config.in
 create mode 100644 package/amd-catalyst/amd-catalyst.hash
 create mode 100644 package/amd-catalyst/amd-catalyst.mk
 create mode 100644 package/amd-catalyst/gl.pc

-- 
2.8.1
