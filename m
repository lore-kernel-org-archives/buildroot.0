From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 30 Dec 2012 22:33:24 +0100
Subject: [Buildroot] [pull request] Pull request for branch
	for-master/misc-fixes
Message-ID: <cover.1356903063.git.s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here are few random fixes, some of them are related to python handling
from the host system.

The patches handling the python binary provided by the host system are
also an RFC that summarize few discussions on the IRC channel.

The following changes since commit 8850c522172acc6586c32a30f2dee79501293636:

  docs/manual: do not suggest to create a symlink for shared download directory (2012-12-29 22:42:41 +0100)

are available in the git repository at:

  git at github.com:tSed/buildroot.git for-master/misc-fixes

for you to fetch changes up to 92a1a6fcc94a58f445133e8e4cf1ae47c73e0eae:

  manual: add host python2 dependency section (2012-12-30 20:44:12 +0100)

----------------------------------------------------------------
Samuel Martin (8):
      matchbox-lib: fix license info
      fluxbox: fix build against imlib2
      package/Makefile.in: update/fix HOST_PATH variable
      package/pkg-cmake.mk: make sure $(HOST_PATH) is in the PATH at configure time
      dependencies: build a host python2 if no suitable one can be found
      scons: add host-python2-if-needed dependency
      scons: ensure $(HOST_DIR)/usr/bin is in the PATH when invoking $(SCONS)
      manual: add host python2 dependency section

 docs/manual/adding-packages-tips.txt              | 38 +++++++++++++++++++++++
 package/Makefile.in                               |  2 +-
 package/fluxbox/fluxbox-1.3.2-fix-configure.patch | 19 ++++++++++++
 package/fluxbox/fluxbox.mk                        | 10 +++++-
 package/matchbox/matchbox-lib/matchbox-lib.mk     |  2 +-
 package/pkg-cmake.mk                              |  5 +--
 package/scons/scons.mk                            | 10 ++++--
 support/dependencies/check-host-python2.mk        | 18 +++++++++++
 support/dependencies/check-host-python2.sh        | 13 ++++++++
 support/dependencies/dependencies.sh              |  2 +-
 10 files changed, 110 insertions(+), 9 deletions(-)
 create mode 100644 package/fluxbox/fluxbox-1.3.2-fix-configure.patch
 create mode 100644 support/dependencies/check-host-python2.mk
 create mode 100755 support/dependencies/check-host-python2.sh

Yours,

--

Samuel
