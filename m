From: Baruch Siach <baruch@tkos.co.il>
Date: Wed,  8 Jan 2014 12:16:31 +0200
Subject: [Buildroot] [PATCH 0/4] uclibc: build fixes for xtensa snapshot
	version
Message-ID: <cover.1389168903.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This series adds fixes to the xtensa default uclibc version. The first patch is
not xtensa specific, but the rest are. All patches fix autobuild failures, and
all were sent upstream.

The last patch in this series reverts a previous e2fsprogs fix that is both
wrong and superseded by the xtensa posix_fadvise fix.

Baruch Siach (4):
  uclibc: xtensa: fix posix_spawn autoconf detection
  uclibc: xtensa: restore posix_fadvise
  uclibc: xtensa: update ptrace.h
  Revert "e2fsprogs: fix posix_fadvise() signature mismatch"

 ...g-fix-build-when-posix_fadvise-is-missing.patch |  42 -----
 .../0001-spawn-move-from-librt-to-libc.patch       | 142 ++++++++++++++++
 ..._fadvise-restore-implementation-for-xtens.patch |  68 ++++++++
 .../0003-xtensa-use-common-ptrace.h.patch          | 184 +++++++++++++++++++++
 4 files changed, 394 insertions(+), 42 deletions(-)
 delete mode 100644 package/e2fsprogs/e2fsprogs-0002-e4defrag-fix-build-when-posix_fadvise-is-missing.patch
 create mode 100644 package/uclibc/3a3ad3dfc10876b3648369f22df8fc06661ddef0/0001-spawn-move-from-librt-to-libc.patch
 create mode 100644 package/uclibc/3a3ad3dfc10876b3648369f22df8fc06661ddef0/0002-linux-posix_fadvise-restore-implementation-for-xtens.patch
 create mode 100644 package/uclibc/3a3ad3dfc10876b3648369f22df8fc06661ddef0/0003-xtensa-use-common-ptrace.h.patch

-- 
1.8.5.2
