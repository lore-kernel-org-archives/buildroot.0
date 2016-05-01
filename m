From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  1 May 2016 22:15:11 +0200
Subject: [Buildroot] [PATCH v3 0/9] Python3 bump to 3.5.1 and global
	byte-compilation
Message-ID: <1462133720-409-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here is a new version of the series that bumps Python 3 to version
3.5.1, and makes the byte-compilation process a global one. It follows
the review from Samuel.

Compared to v2:

 - Added Reviewed-by from Samuel on:

   python3: bump to 3.5.1
   python: align the target finalize hooks with python3
   python/python3: globalize *.pyc files compilation
   samba4: remove compilation of .pyc files

 - Added new patches, following the review and suggestions from
   Samuel:

   python: remove *.pyo files
   python-crossbar: fix byte-compilation of .pyc files
   python-pyftpdlib: fix byte-compilation with Python 3
   python-pygame: bump version to fix Python 3 byte-compilation issue
   python-pexpect: fix byte-compilation with Python 2

Thanks!

Thomas

Thomas Petazzoni (8):
  python3: bump to 3.5.1
  python: align the target finalize hooks with python3
  python: remove *.pyo files
  python-crossbar: fix byte-compilation of .pyc files
  python-pyftpdlib: fix byte-compilation with Python 3
  python-pygame: bump version to fix Python 3 byte-compilation issue
  python-pexpect: fix byte-compilation with Python 2
  samba4: remove compilation of .pyc files

Yegor Yefremov (1):
  python/python3: globalize *.pyc files compilation

 package/pkg-python.mk                              |  2 +-
 .../0001-Avoid-intentional-syntax-error.patch      | 29 ++++++++
 package/python-pexpect/python-pexpect.mk           | 10 +++
 .../0001-fix-splice-for-python3.patch              | 38 +++++++++++
 package/python-pygame/python-pygame.mk             |  7 +-
 package/python/python.mk                           | 30 +++++++--
 ...up.py-do-not-add-invalid-header-locations.patch |  6 +-
 ...the-install-location-of-_sysconfigdata.py.patch | 18 ++---
 ...he-build-of-pyc-and-pyo-files-conditional.patch | 78 ----------------------
 ...3-Make-the-build-of-pyc-files-conditional.patch | 54 +++++++++++++++
 ...gy_getaddrinfo-configure-test-when-cross-.patch |  6 +-
 ...ructure-to-disable-the-build-of-certain-e.patch | 18 ++---
 ...006-distutils-sysconfig-use-sysconfigdata.patch |  6 +-
 ...ibrary-header-paths-for-cross-compilation.patch | 12 ++--
 ...n-t-look-in-usr-lib-termcap-for-libraries.patch |  6 +-
 .../python3/0009-Don-t-add-multiarch-paths.patch   |  6 +-
 .../0010-Abort-on-failed-module-build.patch        | 10 +--
 package/python3/0011-Serial-ioctl-workaround.patch |  2 +-
 ...st-the-shebang-of-Python-scripts-for-cros.patch |  2 +-
 ...-config.sh.in-ensure-sed-invocations-only.patch |  6 +-
 ...-harcode-invalid-path-to-ncursesw-headers.patch |  6 +-
 ...stem-locale-and-set-to-default-when-addin.patch |  6 +-
 ...0016-Add-importlib-fix-for-PEP-3147-issue.patch | 69 +++++++++++--------
 ...on-to-disable-installation-of-test-module.patch | 16 ++---
 .../0018-Add-an-option-to-disable-pydoc.patch      | 20 +++---
 .../0019-Add-an-option-to-disable-lib2to3.patch    | 22 +++---
 ...-Add-option-to-disable-the-sqlite3-module.patch | 14 ++--
 ...21-Add-an-option-to-disable-the-tk-module.patch | 18 ++---
 ...dd-an-option-to-disable-the-curses-module.patch | 12 ++--
 .../0023-Add-an-option-to-disable-expat.patch      | 16 ++---
 .../0024-Add-an-option-to-disable-CJK-codecs.patch |  6 +-
 .../0025-Add-an-option-to-disable-NIS.patch        |  6 +-
 ...0026-Add-an-option-to-disable-unicodedata.patch |  6 +-
 .../0027-Add-an-option-to-disable-IDLE.patch       | 18 ++---
 .../0028-Add-an-option-to-disable-decimal.patch    | 10 +--
 ...-option-to-disable-the-ossaudiodev-module.patch |  6 +-
 ...N_FOR_BUILD-and-FREEZE_IMPORTLIB_FOR_BUIL.patch | 62 +++++++++++++++++
 package/python3/python3.hash                       |  6 +-
 package/python3/python3.mk                         | 74 +++++++++++---------
 package/samba4/samba4.mk                           | 10 ---
 support/scripts/pycompile.py                       | 24 +++++++
 41 files changed, 480 insertions(+), 293 deletions(-)
 create mode 100644 package/python-crossbar/0001-Avoid-intentional-syntax-error.patch
 create mode 100644 package/python-pyftpdlib/0001-fix-splice-for-python3.patch
 delete mode 100644 package/python3/0003-Make-the-build-of-pyc-and-pyo-files-conditional.patch
 create mode 100644 package/python3/0003-Make-the-build-of-pyc-files-conditional.patch
 create mode 100644 package/python3/0030-Support-PGEN_FOR_BUILD-and-FREEZE_IMPORTLIB_FOR_BUIL.patch
 create mode 100644 support/scripts/pycompile.py

-- 
2.7.4
