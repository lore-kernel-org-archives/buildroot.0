From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 14 Feb 2014 21:41:43 +0100
Subject: [Buildroot] [git commit branch/next] python: bump to 2.7.6
Message-ID: <20140214210327.A3ED89CA1B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7e960dc9da56d4a484b5480746aaf617ca491274
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Even though jumping from 2.7.3 to 2.7.6 looks like a minor version
bump, it is in fact a fairly significant one, because a good number of
changes to help cross-compilation have been merged into Python
upstream. Therefore, most of our patches are affected by this change.

In detail, this commit:

 * Renames all the patches to follow the naming convention of patches
   in Buildroot: the patch file names should not have any version
   number.

 * The patches numbered above 100, that add configuration options to
   disable certain modules of the Python standard library, are only
   renamed and slightly adapted, they didn't change that much.

 * The patches numbered below 100 are almost entirely rewritten: many
   of the cross-compilation problems that used to exist in Python
   2.7.3 no longer exist, and the number of remaining problems is
   smaller, and can be fixed with smaller patches.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../python-001-remove-host-header-path.patch       |   32 ++++
 package/python/python-002-fix-get-python-inc.patch |   36 +++++
 ...ython-003-properly-detect-if-python-build.patch |   23 +++
 ...python-004-sysconfigdata-install-location.patch |   76 ++++++++++
 .../python/python-005-pyc-pyo-conditional.patch    |   59 ++++++++
 .../python-006-cross-compile-getaddrinfo.patch     |   13 ++
 package/python/python-007-disable-extensions.patch |   60 ++++++++
 .../python-008-distutils-use-python-sysroot.patch  |   54 +++++++
 .../python/python-009-no-termcap-host-path.patch   |   23 +++
 ...atch => python-100-optional-test-modules.patch} |   48 ++++---
 ...pydoc.patch => python-101-optional-pydoc.patch} |   36 +++---
 ...l-2to3.patch => python-102-optional-2to3.patch} |   51 +++----
 ...lite.patch => python-103-optional-sqlite.patch} |   49 ++++---
 ...ional-tk.patch => python-104-optional-tk.patch} |   46 +++---
 ...rses.patch => python-105-optional-curses.patch} |   24 ++--
 ...expat.patch => python-106-optional-expat.patch} |   30 ++--
 ....patch => python-107-optional-codecs-cjk.patch} |    8 +-
 ...nal-nis.patch => python-108-optional-nis.patch} |    8 +-
 ...patch => python-109-optional-unicodedata.patch} |    8 +-
 ...ional-db.patch => python-110-optional-db.patch} |   41 +++---
 ...nal-ssl.patch => python-111-optional-ssl.patch} |    8 +-
 ...bzip2.patch => python-112-optional-bzip2.patch} |    8 +-
 ...l-zlib.patch => python-113-optional-zlib.patch} |    8 +-
 .../python/python-2.7-001-support-for-build.patch  |  154 --------------------
 .../python-2.7-002-cross-compile-variable.patch    |   55 -------
 ...on-2.7-003-no-import-when-cross-compiling.patch |   26 ----
 .../python-2.7-004-no-host-headers-libs.patch      |  111 --------------
 .../python-2.7-005-staging-headers-libs.patch      |   38 -----
 .../python/python-2.7-006-disable-extensions.patch |  102 -------------
 .../python-2.7-007-do-not-generate-pyo-files.patch |   40 -----
 .../python/python-2.7-008-reread-environment.patch |   65 --------
 ...python-2.7-010-change-pyconfig-h-location.patch |   76 ----------
 package/python/python-2.7-011-no-rpath.patch       |   75 ----------
 .../python-2.7-012-correct-32bit-64bit-check.patch |   55 -------
 .../python-2.7-013-fix-linux-3-compilation.patch   |   24 ---
 .../python-2.7-014-verbose-module-build.patch      |   19 ---
 ...7-015-distutils-cross-compilation-support.patch |  125 ----------------
 .../python-2.7-016-cross-compile-getaddrinfo.patch |   15 --
 package/python/python.mk                           |   49 +++----
 39 files changed, 589 insertions(+), 1189 deletions(-)

Patch is too large, so refusing to show it
