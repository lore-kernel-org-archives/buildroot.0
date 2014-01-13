From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 13 Jan 2014 08:26:11 +0200
Subject: [Buildroot] [PATCH v2 0/3] uclibc: build fixes for xtensa snapshot
	version
Message-ID: <cover.1389594195.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This series bumps xtensa default uclibc version to add upstream fixes to 
autobuild failures. This series also adds a uclibc patch to fix posix_spawn 
autoconf detection.

The last patch in this series reverts a previous e2fsprogs fix that is both
wrong and is superseded by the xtensa posix_fadvise fix in upstream uclibc.

v2:
   * Bump uclibc version
   * Remove patches applied upstream

Baruch Siach (3):
  uclibc: bump xtensa snapshot version
  uclibc: xtensa: fix posix_spawn autoconf detection
  Revert "e2fsprogs: fix posix_fadvise() signature mismatch"

 ...g-fix-build-when-posix_fadvise-is-missing.patch |  42 ------
 .../0001-spawn-move-from-librt-to-libc.patch       | 142 +++++++++++++++++++++
 package/uclibc/Config.in                           |   2 +-
 3 files changed, 143 insertions(+), 43 deletions(-)
 delete mode 100644 package/e2fsprogs/e2fsprogs-0002-e4defrag-fix-build-when-posix_fadvise-is-missing.patch
 create mode 100644 package/uclibc/7bf35c8b7d4a1f97174eb49f47f33946b282114c/0001-spawn-move-from-librt-to-libc.patch

-- 
1.8.5.2
