From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 Dec 2014 21:54:53 +0100
Subject: [Buildroot] [PATCH 2/4] python3: rename patches to the new
	convention
In-Reply-To: <1419800095-7808-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1419800095-7808-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1419800095-7808-3-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that we don't use completely sequential numbers, because patches
below 100 are used to address cross-compilation issues in Python 3,
while patches above 100 are used to make more Python 3 modules
configurable.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...01-remove-host-header-path.patch => 001-remove-host-header-path.patch} | 0
 ...ct-if-python-build.patch => 002-properly-detect-if-python-build.patch} | 0
 ...ta-install-location.patch => 003-sysconfigdata-install-location.patch} | 0
 .../{python3-004-old-stdlib-cache.patch => 004-old-stdlib-cache.patch}    | 0
 ...ython3-005-pyc-pyo-conditional.patch => 005-pyc-pyo-conditional.patch} | 0
 ...ross-compile-getaddrinfo.patch => 006-cross-compile-getaddrinfo.patch} | 0
 ...{python3-007-disable-extensions.patch => 007-disable-extensions.patch} | 0
 ...ysconfigdata.patch => 008-distutils-sysconfig-use-sysconfigdata.patch} | 0
 ...ls-use-python-sysroot.patch => 009-distutils-use-python-sysroot.patch} | 0
 ...hon3-010-no-termcap-host-path.patch => 010-no-termcap-host-path.patch} | 0
 ...h-old-compilers.patch => 011-support-library-path-old-compilers.patch} | 0
 ...12-dont-add-multiarch-path.patch => 012-dont-add-multiarch-path.patch} | 0
 ...13-abort-on-failed-modules.patch => 013-abort-on-failed-modules.patch} | 0
 ...14-serial-ioctl-workaround.patch => 014-serial-ioctl-workaround.patch} | 0
 ...just-shebang.patch => 015-distutils-scripts-dont-adjust-shebang.patch} | 0
 ...hon3-016-distutils-no-pep3147.patch => 016-distutils-no-pep3147.patch} | 0
 ...config-include-libdir.patch => 017-python-config-include-libdir.patch} | 0
 ...n3-100-optional-test-modules.patch => 100-optional-test-modules.patch} | 0
 .../{python3-101-optional-pydoc.patch => 101-optional-pydoc.patch}        | 0
 .../python3/{python3-102-optional-2to3.patch => 102-optional-2to3.patch}  | 0
 .../{python3-103-optional-sqlite.patch => 103-optional-sqlite.patch}      | 0
 package/python3/{python3-104-optional-tk.patch => 104-optional-tk.patch}  | 0
 .../{python3-105-optional-curses.patch => 105-optional-curses.patch}      | 0
 .../{python3-106-optional-expat.patch => 106-optional-expat.patch}        | 0
 ...ython3-107-optional-codecs-cjk.patch => 107-optional-codecs-cjk.patch} | 0
 .../python3/{python3-108-optional-nis.patch => 108-optional-nis.patch}    | 0
 ...hon3-109-optional-unicodedata.patch => 109-optional-unicodedata.patch} | 0
 .../python3/{python3-110-optional-idle.patch => 110-optional-idle.patch}  | 0
 .../{python3-111-optional-decimal.patch => 111-optional-decimal.patch}    | 0
 29 files changed, 0 insertions(+), 0 deletions(-)
 rename package/python3/{python3-001-remove-host-header-path.patch => 001-remove-host-header-path.patch} (100%)
 rename package/python3/{python3-002-properly-detect-if-python-build.patch => 002-properly-detect-if-python-build.patch} (100%)
 rename package/python3/{python3-003-sysconfigdata-install-location.patch => 003-sysconfigdata-install-location.patch} (100%)
 rename package/python3/{python3-004-old-stdlib-cache.patch => 004-old-stdlib-cache.patch} (100%)
 rename package/python3/{python3-005-pyc-pyo-conditional.patch => 005-pyc-pyo-conditional.patch} (100%)
 rename package/python3/{python3-006-cross-compile-getaddrinfo.patch => 006-cross-compile-getaddrinfo.patch} (100%)
 rename package/python3/{python3-007-disable-extensions.patch => 007-disable-extensions.patch} (100%)
 rename package/python3/{python3-008-distutils-sysconfig-use-sysconfigdata.patch => 008-distutils-sysconfig-use-sysconfigdata.patch} (100%)
 rename package/python3/{python3-009-distutils-use-python-sysroot.patch => 009-distutils-use-python-sysroot.patch} (100%)
 rename package/python3/{python3-010-no-termcap-host-path.patch => 010-no-termcap-host-path.patch} (100%)
 rename package/python3/{python3-011-support-library-path-old-compilers.patch => 011-support-library-path-old-compilers.patch} (100%)
 rename package/python3/{python3-012-dont-add-multiarch-path.patch => 012-dont-add-multiarch-path.patch} (100%)
 rename package/python3/{python3-013-abort-on-failed-modules.patch => 013-abort-on-failed-modules.patch} (100%)
 rename package/python3/{python3-014-serial-ioctl-workaround.patch => 014-serial-ioctl-workaround.patch} (100%)
 rename package/python3/{python3-015-distutils-scripts-dont-adjust-shebang.patch => 015-distutils-scripts-dont-adjust-shebang.patch} (100%)
 rename package/python3/{python3-016-distutils-no-pep3147.patch => 016-distutils-no-pep3147.patch} (100%)
 rename package/python3/{python3-017-python-config-include-libdir.patch => 017-python-config-include-libdir.patch} (100%)
 rename package/python3/{python3-100-optional-test-modules.patch => 100-optional-test-modules.patch} (100%)
 rename package/python3/{python3-101-optional-pydoc.patch => 101-optional-pydoc.patch} (100%)
 rename package/python3/{python3-102-optional-2to3.patch => 102-optional-2to3.patch} (100%)
 rename package/python3/{python3-103-optional-sqlite.patch => 103-optional-sqlite.patch} (100%)
 rename package/python3/{python3-104-optional-tk.patch => 104-optional-tk.patch} (100%)
 rename package/python3/{python3-105-optional-curses.patch => 105-optional-curses.patch} (100%)
 rename package/python3/{python3-106-optional-expat.patch => 106-optional-expat.patch} (100%)
 rename package/python3/{python3-107-optional-codecs-cjk.patch => 107-optional-codecs-cjk.patch} (100%)
 rename package/python3/{python3-108-optional-nis.patch => 108-optional-nis.patch} (100%)
 rename package/python3/{python3-109-optional-unicodedata.patch => 109-optional-unicodedata.patch} (100%)
 rename package/python3/{python3-110-optional-idle.patch => 110-optional-idle.patch} (100%)
 rename package/python3/{python3-111-optional-decimal.patch => 111-optional-decimal.patch} (100%)

diff --git a/package/python3/python3-001-remove-host-header-path.patch b/package/python3/001-remove-host-header-path.patch
similarity index 100%
rename from package/python3/python3-001-remove-host-header-path.patch
rename to package/python3/001-remove-host-header-path.patch
diff --git a/package/python3/python3-002-properly-detect-if-python-build.patch b/package/python3/002-properly-detect-if-python-build.patch
similarity index 100%
rename from package/python3/python3-002-properly-detect-if-python-build.patch
rename to package/python3/002-properly-detect-if-python-build.patch
diff --git a/package/python3/python3-003-sysconfigdata-install-location.patch b/package/python3/003-sysconfigdata-install-location.patch
similarity index 100%
rename from package/python3/python3-003-sysconfigdata-install-location.patch
rename to package/python3/003-sysconfigdata-install-location.patch
diff --git a/package/python3/python3-004-old-stdlib-cache.patch b/package/python3/004-old-stdlib-cache.patch
similarity index 100%
rename from package/python3/python3-004-old-stdlib-cache.patch
rename to package/python3/004-old-stdlib-cache.patch
diff --git a/package/python3/python3-005-pyc-pyo-conditional.patch b/package/python3/005-pyc-pyo-conditional.patch
similarity index 100%
rename from package/python3/python3-005-pyc-pyo-conditional.patch
rename to package/python3/005-pyc-pyo-conditional.patch
diff --git a/package/python3/python3-006-cross-compile-getaddrinfo.patch b/package/python3/006-cross-compile-getaddrinfo.patch
similarity index 100%
rename from package/python3/python3-006-cross-compile-getaddrinfo.patch
rename to package/python3/006-cross-compile-getaddrinfo.patch
diff --git a/package/python3/python3-007-disable-extensions.patch b/package/python3/007-disable-extensions.patch
similarity index 100%
rename from package/python3/python3-007-disable-extensions.patch
rename to package/python3/007-disable-extensions.patch
diff --git a/package/python3/python3-008-distutils-sysconfig-use-sysconfigdata.patch b/package/python3/008-distutils-sysconfig-use-sysconfigdata.patch
similarity index 100%
rename from package/python3/python3-008-distutils-sysconfig-use-sysconfigdata.patch
rename to package/python3/008-distutils-sysconfig-use-sysconfigdata.patch
diff --git a/package/python3/python3-009-distutils-use-python-sysroot.patch b/package/python3/009-distutils-use-python-sysroot.patch
similarity index 100%
rename from package/python3/python3-009-distutils-use-python-sysroot.patch
rename to package/python3/009-distutils-use-python-sysroot.patch
diff --git a/package/python3/python3-010-no-termcap-host-path.patch b/package/python3/010-no-termcap-host-path.patch
similarity index 100%
rename from package/python3/python3-010-no-termcap-host-path.patch
rename to package/python3/010-no-termcap-host-path.patch
diff --git a/package/python3/python3-011-support-library-path-old-compilers.patch b/package/python3/011-support-library-path-old-compilers.patch
similarity index 100%
rename from package/python3/python3-011-support-library-path-old-compilers.patch
rename to package/python3/011-support-library-path-old-compilers.patch
diff --git a/package/python3/python3-012-dont-add-multiarch-path.patch b/package/python3/012-dont-add-multiarch-path.patch
similarity index 100%
rename from package/python3/python3-012-dont-add-multiarch-path.patch
rename to package/python3/012-dont-add-multiarch-path.patch
diff --git a/package/python3/python3-013-abort-on-failed-modules.patch b/package/python3/013-abort-on-failed-modules.patch
similarity index 100%
rename from package/python3/python3-013-abort-on-failed-modules.patch
rename to package/python3/013-abort-on-failed-modules.patch
diff --git a/package/python3/python3-014-serial-ioctl-workaround.patch b/package/python3/014-serial-ioctl-workaround.patch
similarity index 100%
rename from package/python3/python3-014-serial-ioctl-workaround.patch
rename to package/python3/014-serial-ioctl-workaround.patch
diff --git a/package/python3/python3-015-distutils-scripts-dont-adjust-shebang.patch b/package/python3/015-distutils-scripts-dont-adjust-shebang.patch
similarity index 100%
rename from package/python3/python3-015-distutils-scripts-dont-adjust-shebang.patch
rename to package/python3/015-distutils-scripts-dont-adjust-shebang.patch
diff --git a/package/python3/python3-016-distutils-no-pep3147.patch b/package/python3/016-distutils-no-pep3147.patch
similarity index 100%
rename from package/python3/python3-016-distutils-no-pep3147.patch
rename to package/python3/016-distutils-no-pep3147.patch
diff --git a/package/python3/python3-017-python-config-include-libdir.patch b/package/python3/017-python-config-include-libdir.patch
similarity index 100%
rename from package/python3/python3-017-python-config-include-libdir.patch
rename to package/python3/017-python-config-include-libdir.patch
diff --git a/package/python3/python3-100-optional-test-modules.patch b/package/python3/100-optional-test-modules.patch
similarity index 100%
rename from package/python3/python3-100-optional-test-modules.patch
rename to package/python3/100-optional-test-modules.patch
diff --git a/package/python3/python3-101-optional-pydoc.patch b/package/python3/101-optional-pydoc.patch
similarity index 100%
rename from package/python3/python3-101-optional-pydoc.patch
rename to package/python3/101-optional-pydoc.patch
diff --git a/package/python3/python3-102-optional-2to3.patch b/package/python3/102-optional-2to3.patch
similarity index 100%
rename from package/python3/python3-102-optional-2to3.patch
rename to package/python3/102-optional-2to3.patch
diff --git a/package/python3/python3-103-optional-sqlite.patch b/package/python3/103-optional-sqlite.patch
similarity index 100%
rename from package/python3/python3-103-optional-sqlite.patch
rename to package/python3/103-optional-sqlite.patch
diff --git a/package/python3/python3-104-optional-tk.patch b/package/python3/104-optional-tk.patch
similarity index 100%
rename from package/python3/python3-104-optional-tk.patch
rename to package/python3/104-optional-tk.patch
diff --git a/package/python3/python3-105-optional-curses.patch b/package/python3/105-optional-curses.patch
similarity index 100%
rename from package/python3/python3-105-optional-curses.patch
rename to package/python3/105-optional-curses.patch
diff --git a/package/python3/python3-106-optional-expat.patch b/package/python3/106-optional-expat.patch
similarity index 100%
rename from package/python3/python3-106-optional-expat.patch
rename to package/python3/106-optional-expat.patch
diff --git a/package/python3/python3-107-optional-codecs-cjk.patch b/package/python3/107-optional-codecs-cjk.patch
similarity index 100%
rename from package/python3/python3-107-optional-codecs-cjk.patch
rename to package/python3/107-optional-codecs-cjk.patch
diff --git a/package/python3/python3-108-optional-nis.patch b/package/python3/108-optional-nis.patch
similarity index 100%
rename from package/python3/python3-108-optional-nis.patch
rename to package/python3/108-optional-nis.patch
diff --git a/package/python3/python3-109-optional-unicodedata.patch b/package/python3/109-optional-unicodedata.patch
similarity index 100%
rename from package/python3/python3-109-optional-unicodedata.patch
rename to package/python3/109-optional-unicodedata.patch
diff --git a/package/python3/python3-110-optional-idle.patch b/package/python3/110-optional-idle.patch
similarity index 100%
rename from package/python3/python3-110-optional-idle.patch
rename to package/python3/110-optional-idle.patch
diff --git a/package/python3/python3-111-optional-decimal.patch b/package/python3/111-optional-decimal.patch
similarity index 100%
rename from package/python3/python3-111-optional-decimal.patch
rename to package/python3/111-optional-decimal.patch
-- 
2.1.0
