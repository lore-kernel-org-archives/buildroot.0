From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 Jun 2014 23:52:18 +0200
Subject: [Buildroot] [PATCH 0/5] Misc updates: libffi, python, gettext
Message-ID: <1403992343-29665-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This set of patches bump libffi to version 3.1, and Python to version
2.7.7, and does a number of small related updates.

Best regards,

Thomas

Thomas Petazzoni (5):
  libffi: bump to 3.1
  libffi: remove some header files installed in /usr/lib in the target
  python: bump to Python 2.7.7
  python: do not install the IDLE editor
  gettext: remove useless ABOUT-NLS file

 package/gettext/gettext.mk                         |   7 +
 package/libffi/libffi-003-fix-typo.patch           |  41 ++
 ...Add-missing-GNU-stack-markings-in-win32.S.patch |  36 ++
 .../libffi-005-Fix-paths-in-libffi.pc.in.patch     |  46 ++
 package/libffi/libffi-arc-01-Add-ARC-support.patch | 560 ---------------------
 .../libffi-arc-02-Rebuild-for-ARC-additions.patch  | 262 ----------
 .../libffi/libffi-arc-03-arc-Fix-build-error.patch |  43 --
 package/libffi/libffi.mk                           |   8 +-
 ...python-004-sysconfigdata-install-location.patch |   6 +-
 .../python/python-005-pyc-pyo-conditional.patch    |   2 +-
 .../python-006-cross-compile-getaddrinfo.patch     |   2 +-
 package/python/python-007-disable-extensions.patch |   4 +-
 package/python/python-010-fix-python-config.patch  |  39 +-
 .../python/python-011-remove-python-symlink.patch  |   9 +-
 package/python/python-013-fix-readline-6.3.patch   |  34 --
 .../python/python-100-optional-test-modules.patch  |  25 +-
 package/python/python-101-optional-pydoc.patch     |  12 +-
 package/python/python-102-optional-2to3.patch      |  16 +-
 package/python/python-103-optional-sqlite.patch    |  14 +-
 package/python/python-104-optional-tk.patch        |  20 +-
 package/python/python-105-optional-curses.patch    |   8 +-
 package/python/python-106-optional-expat.patch     |  12 +-
 .../python/python-107-optional-codecs-cjk.patch    |   2 +-
 package/python/python-108-optional-nis.patch       |   2 +-
 .../python/python-109-optional-unicodedata.patch   |   2 +-
 package/python/python-110-optional-db.patch        |  14 +-
 package/python/python-111-optional-ssl.patch       |   2 +-
 package/python/python-112-optional-bzip2.patch     |   2 +-
 package/python/python-113-optional-zlib.patch      |   2 +-
 package/python/python-114-remove-idle-editor.patch |  43 ++
 package/python/python.mk                           |   3 +-
 31 files changed, 282 insertions(+), 996 deletions(-)
 create mode 100644 package/libffi/libffi-003-fix-typo.patch
 create mode 100644 package/libffi/libffi-004-Add-missing-GNU-stack-markings-in-win32.S.patch
 create mode 100644 package/libffi/libffi-005-Fix-paths-in-libffi.pc.in.patch
 delete mode 100644 package/libffi/libffi-arc-01-Add-ARC-support.patch
 delete mode 100644 package/libffi/libffi-arc-02-Rebuild-for-ARC-additions.patch
 delete mode 100644 package/libffi/libffi-arc-03-arc-Fix-build-error.patch
 delete mode 100644 package/python/python-013-fix-readline-6.3.patch
 create mode 100644 package/python/python-114-remove-idle-editor.patch

-- 
2.0.0
