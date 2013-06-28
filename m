From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 28 Jun 2013 22:02:44 +0200
Subject: [Buildroot] [git commit] python3: Port python2 patches to reduce
	the interpreter size
Message-ID: <20130629190817.1B21D9B2CF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f1c092da8ba4d03125387a337ab45c9b5a1315dc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some of the python2 patches were left behind when doing the python3
package. This was because the python build system can now autodetect
what packages can be built in the system.

However, some of these patches are actually useful to reduce drastically
the size of the interpreter.

This patch ports the relevant patches to the python3 package, and adds a
new patch to remove the idle3 IDE as well from the interpreter.

Fixes #5696

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/python3/Config.in                          |   11 ++
 ...thon3-000-generate-sysconfigdata-buildir.patch} |    0
 ...d.patch => python3-001-support-for-build.patch} |    0
 ...atch => python3-002-no-host-headers-libs.patch} |    0
 ...patch => python3-003-staging-header-libs.patch} |    0
 ...thon3-004-no-import-when-cross-compiling.patch} |    0
 ...=> python3-005-do-not-generate-pyo-files.patch} |    0
 ....patch => python3-006-reread-environment.patch} |    0
 ...> python3-007-change-pyconfig-h-location.patch} |    0
 ...8-no-rpath.patch => python3-008-no-rpath.patch} |    0
 ...atch => python3-009-verbose-module-build.patch} |    0
 ...-010-distutils-cross-compilation-support.patch} |    0
 ...=> python3-011-cross-compile-getaddrinfo.patch} |    0
 .../python3/python3-012-disable-extensions.patch   |   98 +++++++++++++++++
 .../python3-100-optional-test-modules.patch        |  102 ++++++++++++++++++
 package/python3/python3-101-optional-pydoc.patch   |   91 ++++++++++++++++
 package/python3/python3-102-optional-2to3.patch    |  111 ++++++++++++++++++++
 package/python3/python3-103-optional-sqlite.patch  |   64 +++++++++++
 package/python3/python3-104-optional-tk.patch      |   69 ++++++++++++
 package/python3/python3-105-optional-curses.patch  |   54 ++++++++++
 package/python3/python3-106-optional-expat.patch   |   85 +++++++++++++++
 .../python3/python3-107-optional-codecs-cjk.patch  |   25 +++++
 package/python3/python3-108-optional-nis.patch     |   28 +++++
 .../python3/python3-109-optional-unicodedata.patch |   25 +++++
 package/python3/python3-110-optional-idle.patch    |   83 +++++++++++++++
 package/python3/python3.mk                         |   25 +++--
 26 files changed, 862 insertions(+), 9 deletions(-)

Patch is too large, so refusing to show it
