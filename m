From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Mar 2017 15:18:49 +0100
Subject: [Buildroot] [git commit] python3: Bump version to 3.6.1
Message-ID: <20170325142735.12B9A7FAE2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d2afa01f76ce2c7610286103340048d953b27e45
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update all appropriate version numbers as well as SHAs and MD5s as well
as repbasing BR's patches on top of 3.6.1 codebase (new github repo
tree, v3.6.1 tag was used). Note that patch:

   [PATCH] Change the install location of _sysconfigdata.py

was dropped due to the fact taht build system now adds platform
specific suffix to sysconfigdata's name, so each platform's file
should have a unique name and distutils now allows to specify which
sysconfigdata is used via _PYTHON_SYSCONFIGDATA_NAME

see:

    https://github.com/python/cpython/commit/c4b53afce491142b80b228a21a05de5dcfd8d36f
    https://github.com/python/cpython/commit/92dec548ff1494b86f08bd3753ca91a9330b4ea9

and patches:

    [PATCH] distutils/sysconfig: use sysconfigdata
    [PATCH] setup.py: do not add invalid header locations
    [PATCH] Do not harcode invalid path to ncursesw headers

was dropped since it looks like it made it's way upstream, see:

    https://github.com/python/cpython/commit/409482251b06fe75c4ee56e85ffbb4b23d934159
    https://github.com/python/cpython/commit/1351c31aa9651b278d7ef8ec79af3b646a520235
    https://github.com/python/cpython/commit/e13c3201fb66c4c211b4ebb7604d1435bedc1015

respectively.

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-python.mk                              |  6 ++
 ...-Make-the-build-of-pyc-files-conditional.patch} | 18 +++--
 ...up.py-do-not-add-invalid-header-locations.patch | 46 ------------
 ...the-install-location-of-_sysconfigdata.py.patch | 86 ----------------------
 ...y_getaddrinfo-configure-test-when-cross-.patch} |  8 +-
 ...ucture-to-disable-the-build-of-certain-e.patch} | 31 ++++----
 ...brary-header-paths-for-cross-compilation.patch} | 10 +--
 ...-t-look-in-usr-lib-termcap-for-libraries.patch} |  8 +-
 ....patch => 0006-Don-t-add-multiarch-paths.patch} |  6 +-
 ...006-distutils-sysconfig-use-sysconfigdata.patch | 65 ----------------
 ...tch => 0007-Abort-on-failed-module-build.patch} |  6 +-
 ...nd.patch => 0008-Serial-ioctl-workaround.patch} |  4 +-
 ...t-the-shebang-of-Python-scripts-for-cros.patch} |  6 +-
 ...config.sh.in-ensure-sed-invocations-only.patch} |  4 +-
 ...tem-locale-and-set-to-default-when-addin.patch} |  6 +-
 ...012-Add-importlib-fix-for-PEP-3147-issue.patch} | 23 +++---
 ...n-to-disable-installation-of-test-module.patch} | 58 ++++++++-------
 ...h => 0014-Add-an-option-to-disable-pydoc.patch} | 55 +++++++-------
 ...-harcode-invalid-path-to-ncursesw-headers.patch | 30 --------
 ...=> 0015-Add-an-option-to-disable-lib2to3.patch} | 38 +++++-----
 ...Add-option-to-disable-the-sqlite3-module.patch} | 26 ++++---
 ...7-Add-an-option-to-disable-the-tk-module.patch} | 52 ++++++-------
 ...d-an-option-to-disable-the-curses-module.patch} | 39 +++++-----
 ...h => 0019-Add-an-option-to-disable-expat.patch} | 28 +++----
 ...0020-Add-an-option-to-disable-CJK-codecs.patch} |  8 +-
 ...tch => 0021-Add-an-option-to-disable-NIS.patch} |  8 +-
 ...022-Add-an-option-to-disable-unicodedata.patch} |  8 +-
 ...ch => 0023-Add-an-option-to-disable-IDLE.patch} | 32 ++++----
 ...=> 0024-Add-an-option-to-disable-decimal.patch} | 12 +--
 ...option-to-disable-the-ossaudiodev-module.patch} |  8 +-
 ..._FOR_BUILD-and-FREEZE_IMPORTLIB_FOR_BUIL.patch} | 26 ++++---
 ...Add-an-option-to-disable-openssl-support.patch} | 10 +--
 ...an-option-to-disable-the-readline-module.patch} |  8 +-
 ...ons-to-disable-zlib-bzip2-and-xz-modules.patch} |  8 +-
 package/python3/python3.hash                       |  7 +-
 package/python3/python3.mk                         |  6 +-
 36 files changed, 304 insertions(+), 496 deletions(-)

Patch is too large, so refusing to show it
