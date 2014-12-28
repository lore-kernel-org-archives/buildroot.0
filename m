From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 Dec 2014 21:54:51 +0100
Subject: [Buildroot] [PATCH 0/4] Python and Python 3 version bumps
Message-ID: <1419800095-7808-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This set of four patches bump Python and Python 3 to the latest
available versions, and also rename the Python and Python 3 patches to
follow the new patch naming convention.

Thanks,

Thomas

Thomas Petazzoni (4):
  python3: bump to 3.4.2
  python3: rename patches to the new convention
  python: bump to 2.7.9
  python: rename patches to the new convention

 ...ath.patch => 001-remove-host-header-path.patch} |  2 +-
 ...thon-inc.patch => 002-fix-get-python-inc.patch} |  0
 ...ch => 004-sysconfigdata-install-location.patch} | 22 ++++++++++-----------
 ...itional.patch => 005-pyc-pyo-conditional.patch} |  4 ++--
 ...o.patch => 006-cross-compile-getaddrinfo.patch} |  2 +-
 ...tensions.patch => 007-disable-extensions.patch} |  8 ++++----
 ...atch => 008-distutils-use-python-sysroot.patch} |  0
 ...t-path.patch => 009-no-termcap-host-path.patch} |  2 +-
 ...on-config.patch => 010-fix-python-config.patch} | 20 +++++++++----------
 ...mlink.patch => 011-remove-python-symlink.patch} |  2 +-
 ...> 012-support-library-path-old-compilers.patch} |  6 +++---
 ...ath.patch => 013-dont-add-multiarch-path.patch} |  2 +-
 ...les.patch => 014-abort-on-failed-modules.patch} |  2 +-
 ....patch => 015-fix-sqlite-without-threads.patch} |  7 ++++---
 ...und.patch => 016-serial-ioctl-workaround.patch} |  7 ++++---
 ...17-distutils-scripts-dont-adjust-shebang.patch} |  0
 ...dules.patch => 100-optional-test-modules.patch} | 17 ++++++++--------
 ...tional-pydoc.patch => 101-optional-pydoc.patch} | 12 +++++------
 ...optional-2to3.patch => 102-optional-2to3.patch} | 14 ++++++-------
 ...onal-sqlite.patch => 103-optional-sqlite.patch} | 12 +++++------
 ...104-optional-tk.patch => 104-optional-tk.patch} | 14 ++++++-------
 ...onal-curses.patch => 105-optional-curses.patch} |  8 ++++----
 ...tional-expat.patch => 106-optional-expat.patch} |  8 ++++----
 ...ecs-cjk.patch => 107-optional-codecs-cjk.patch} |  2 +-
 ...8-optional-nis.patch => 108-optional-nis.patch} |  2 +-
 ...dedata.patch => 109-optional-unicodedata.patch} |  2 +-
 ...110-optional-db.patch => 110-optional-db.patch} | 10 +++++-----
 ...1-optional-ssl.patch => 111-optional-ssl.patch} |  2 +-
 ...tional-bzip2.patch => 112-optional-bzip2.patch} |  2 +-
 ...optional-zlib.patch => 113-optional-zlib.patch} |  2 +-
 ...e-editor.patch => 114-remove-idle-editor.patch} |  6 +++---
 ...ython-003-properly-detect-if-python-build.patch | 23 ----------------------
 package/python/python.mk                           |  3 ++-
 ...ath.patch => 001-remove-host-header-path.patch} |  2 +-
 ...h => 002-properly-detect-if-python-build.patch} |  2 +-
 ...ch => 003-sysconfigdata-install-location.patch} | 16 +++++++--------
 ...dlib-cache.patch => 004-old-stdlib-cache.patch} |  6 +++---
 ...itional.patch => 005-pyc-pyo-conditional.patch} |  4 ++--
 ...o.patch => 006-cross-compile-getaddrinfo.patch} |  2 +-
 ...tensions.patch => 007-disable-extensions.patch} | 10 +++++-----
 ...08-distutils-sysconfig-use-sysconfigdata.patch} | 19 +++++-------------
 ...atch => 009-distutils-use-python-sysroot.patch} |  2 +-
 ...t-path.patch => 010-no-termcap-host-path.patch} |  2 +-
 ...> 011-support-library-path-old-compilers.patch} |  6 +++---
 ...ath.patch => 012-dont-add-multiarch-path.patch} |  2 +-
 ...les.patch => 013-abort-on-failed-modules.patch} |  2 +-
 ...und.patch => 014-serial-ioctl-workaround.patch} |  0
 ...15-distutils-scripts-dont-adjust-shebang.patch} |  0
 ...ep3147.patch => 016-distutils-no-pep3147.patch} |  0
 ...atch => 017-python-config-include-libdir.patch} |  0
 ...dules.patch => 100-optional-test-modules.patch} |  6 +++---
 ...tional-pydoc.patch => 101-optional-pydoc.patch} | 12 +++++------
 ...optional-2to3.patch => 102-optional-2to3.patch} | 14 ++++++-------
 ...onal-sqlite.patch => 103-optional-sqlite.patch} |  8 ++++----
 ...104-optional-tk.patch => 104-optional-tk.patch} |  8 ++++----
 ...onal-curses.patch => 105-optional-curses.patch} |  6 +++---
 ...tional-expat.patch => 106-optional-expat.patch} |  8 ++++----
 ...ecs-cjk.patch => 107-optional-codecs-cjk.patch} |  2 +-
 ...8-optional-nis.patch => 108-optional-nis.patch} |  2 +-
 ...dedata.patch => 109-optional-unicodedata.patch} |  2 +-
 ...optional-idle.patch => 110-optional-idle.patch} | 10 +++++-----
 ...al-decimal.patch => 111-optional-decimal.patch} |  4 ++--
 package/python3/python3.mk                         |  9 ++++++++-
 63 files changed, 185 insertions(+), 206 deletions(-)
 rename package/python/{python-001-remove-host-header-path.patch => 001-remove-host-header-path.patch} (98%)
 rename package/python/{python-002-fix-get-python-inc.patch => 002-fix-get-python-inc.patch} (100%)
 rename package/python/{python-004-sysconfigdata-install-location.patch => 004-sysconfigdata-install-location.patch} (87%)
 rename package/python/{python-005-pyc-pyo-conditional.patch => 005-pyc-pyo-conditional.patch} (97%)
 rename package/python/{python-006-cross-compile-getaddrinfo.patch => 006-cross-compile-getaddrinfo.patch} (94%)
 rename package/python/{python-007-disable-extensions.patch => 007-disable-extensions.patch} (95%)
 rename package/python/{python-008-distutils-use-python-sysroot.patch => 008-distutils-use-python-sysroot.patch} (100%)
 rename package/python/{python-009-no-termcap-host-path.patch => 009-no-termcap-host-path.patch} (97%)
 rename package/python/{python-010-fix-python-config.patch => 010-fix-python-config.patch} (96%)
 rename package/python/{python-011-remove-python-symlink.patch => 011-remove-python-symlink.patch} (98%)
 rename package/python/{python-012-support-library-path-old-compilers.patch => 012-support-library-path-old-compilers.patch} (97%)
 rename package/python/{python-013-dont-add-multiarch-path.patch => 013-dont-add-multiarch-path.patch} (98%)
 rename package/python/{python-014-abort-on-failed-modules.patch => 014-abort-on-failed-modules.patch} (97%)
 rename package/python/{python-015-fix-sqlite-without-threads.patch => 015-fix-sqlite-without-threads.patch} (81%)
 rename package/python/{python-016-serial-ioctl-workaround.patch => 016-serial-ioctl-workaround.patch} (74%)
 rename package/python/{python-017-distutils-scripts-dont-adjust-shebang.patch => 017-distutils-scripts-dont-adjust-shebang.patch} (100%)
 rename package/python/{python-100-optional-test-modules.patch => 100-optional-test-modules.patch} (87%)
 rename package/python/{python-101-optional-pydoc.patch => 101-optional-pydoc.patch} (92%)
 rename package/python/{python-102-optional-2to3.patch => 102-optional-2to3.patch} (92%)
 rename package/python/{python-103-optional-sqlite.patch => 103-optional-sqlite.patch} (91%)
 rename package/python/{python-104-optional-tk.patch => 104-optional-tk.patch} (86%)
 rename package/python/{python-105-optional-curses.patch => 105-optional-curses.patch} (91%)
 rename package/python/{python-106-optional-expat.patch => 106-optional-expat.patch} (96%)
 rename package/python/{python-107-optional-codecs-cjk.patch => 107-optional-codecs-cjk.patch} (96%)
 rename package/python/{python-108-optional-nis.patch => 108-optional-nis.patch} (97%)
 rename package/python/{python-109-optional-unicodedata.patch => 109-optional-unicodedata.patch} (96%)
 rename package/python/{python-110-optional-db.patch => 110-optional-db.patch} (94%)
 rename package/python/{python-111-optional-ssl.patch => 111-optional-ssl.patch} (96%)
 rename package/python/{python-112-optional-bzip2.patch => 112-optional-bzip2.patch} (96%)
 rename package/python/{python-113-optional-zlib.patch => 113-optional-zlib.patch} (96%)
 rename package/python/{python-114-remove-idle-editor.patch => 114-remove-idle-editor.patch} (95%)
 delete mode 100644 package/python/python-003-properly-detect-if-python-build.patch
 rename package/python3/{python3-001-remove-host-header-path.patch => 001-remove-host-header-path.patch} (98%)
 rename package/python3/{python3-002-properly-detect-if-python-build.patch => 002-properly-detect-if-python-build.patch} (98%)
 rename package/python3/{python3-003-sysconfigdata-install-location.patch => 003-sysconfigdata-install-location.patch} (92%)
 rename package/python3/{python3-004-old-stdlib-cache.patch => 004-old-stdlib-cache.patch} (97%)
 rename package/python3/{python3-005-pyc-pyo-conditional.patch => 005-pyc-pyo-conditional.patch} (98%)
 rename package/python3/{python3-006-cross-compile-getaddrinfo.patch => 006-cross-compile-getaddrinfo.patch} (96%)
 rename package/python3/{python3-007-disable-extensions.patch => 007-disable-extensions.patch} (97%)
 rename package/python3/{python3-008-distutils-sysconfig-use-sysconfigdata.patch => 008-distutils-sysconfig-use-sysconfigdata.patch} (69%)
 rename package/python3/{python3-009-distutils-use-python-sysroot.patch => 009-distutils-use-python-sysroot.patch} (99%)
 rename package/python3/{python3-010-no-termcap-host-path.patch => 010-no-termcap-host-path.patch} (97%)
 rename package/python3/{python3-011-support-library-path-old-compilers.patch => 011-support-library-path-old-compilers.patch} (97%)
 rename package/python3/{python3-012-dont-add-multiarch-path.patch => 012-dont-add-multiarch-path.patch} (97%)
 rename package/python3/{python3-013-abort-on-failed-modules.patch => 013-abort-on-failed-modules.patch} (97%)
 rename package/python3/{python3-014-serial-ioctl-workaround.patch => 014-serial-ioctl-workaround.patch} (100%)
 rename package/python3/{python3-015-distutils-scripts-dont-adjust-shebang.patch => 015-distutils-scripts-dont-adjust-shebang.patch} (100%)
 rename package/python3/{python3-016-distutils-no-pep3147.patch => 016-distutils-no-pep3147.patch} (100%)
 rename package/python3/{python3-017-python-config-include-libdir.patch => 017-python-config-include-libdir.patch} (100%)
 rename package/python3/{python3-100-optional-test-modules.patch => 100-optional-test-modules.patch} (98%)
 rename package/python3/{python3-101-optional-pydoc.patch => 101-optional-pydoc.patch} (95%)
 rename package/python3/{python3-102-optional-2to3.patch => 102-optional-2to3.patch} (95%)
 rename package/python3/{python3-103-optional-sqlite.patch => 103-optional-sqlite.patch} (94%)
 rename package/python3/{python3-104-optional-tk.patch => 104-optional-tk.patch} (94%)
 rename package/python3/{python3-105-optional-curses.patch => 105-optional-curses.patch} (94%)
 rename package/python3/{python3-106-optional-expat.patch => 106-optional-expat.patch} (96%)
 rename package/python3/{python3-107-optional-codecs-cjk.patch => 107-optional-codecs-cjk.patch} (96%)
 rename package/python3/{python3-108-optional-nis.patch => 108-optional-nis.patch} (97%)
 rename package/python3/{python3-109-optional-unicodedata.patch => 109-optional-unicodedata.patch} (96%)
 rename package/python3/{python3-110-optional-idle.patch => 110-optional-idle.patch} (95%)
 rename package/python3/{python3-111-optional-decimal.patch => 111-optional-decimal.patch} (97%)

-- 
2.1.0
