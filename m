From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Mon, 10 Nov 2014 12:59:05 +0300
Subject: [Buildroot] [PATCH 0/4] rt-tests: patches rename & versoin bump &
	support of non-NPTL tools
Message-ID: <1415613549-2886-1-git-send-email-abrodkin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This series introduces significant changes to "rt-tests" package.

 1. Now patches are named in accordance to new naming scheme (without leading
    package name)

 2. Origin of sources is switched to Debian snapshots FTP to real origin in
    kernel's git repo. So no need to track Debian folders etc, just bump version
    number when required.

 3. As mentioned above version with a simple move version is bumped to the most
    recent one.

 4. Probably the most interesting feature - now even if there's no NTPL-enabled
    toolchain for a given platform user still may build some nice and helpful
    tests. For example "hackbench" etc.

Alexey Brodkin (4):
  rt-tests: rename patch to the new convention
  rt-tests: switch site from Debian snapshot to Linux's git
  rt-tests: bump version to 0.89
  rt-tests: allow building subset of tests with non-NPTL toolchains

 package/rt-tests/01-fix-build-system.patch       |  52 +++++++++++
 package/rt-tests/02-uclibc.patch                 | 109 +++++++++++++++++++++++
 package/rt-tests/03-fix-non-nptl-buil.patch      |  55 ++++++++++++
 package/rt-tests/Config.in                       |   4 -
 package/rt-tests/rt-tests-fix-build-system.patch |  43 ---------
 package/rt-tests/rt-tests-uclibc.patch           | 103 ---------------------
 package/rt-tests/rt-tests.mk                     |  11 ++-
 7 files changed, 224 insertions(+), 153 deletions(-)
 create mode 100644 package/rt-tests/01-fix-build-system.patch
 create mode 100644 package/rt-tests/02-uclibc.patch
 create mode 100644 package/rt-tests/03-fix-non-nptl-buil.patch
 delete mode 100644 package/rt-tests/rt-tests-fix-build-system.patch
 delete mode 100644 package/rt-tests/rt-tests-uclibc.patch

-- 
1.9.3
