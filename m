From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Sun, 26 Aug 2018 14:23:05 +0200
Subject: [Buildroot] [PATCH v4 0/3] minicom: update package to use git
 repository
In-Reply-To: <89c54af3-3000-d0c5-ab7f-f6d4f4c092eb@micronovasrl.com>
References: <89c54af3-3000-d0c5-ab7f-f6d4f4c092eb@micronovasrl.com>
Message-ID: <20180826122308.90382-1-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From previous version(2.7-1) to latest git commit lot of patches(103) have
been applied.
Main changes are:
- NLS support
- RS485 support
- various fixes
- minor changes

Bump package using git and add hash file for both tarball and COPYING
license file.

Add also a patch to assure TIOCGRS485 and TIOCSRS485 to be defined.
While make test-pkg it failed because of this with these 2 autobuilders:
- mips64el-ctng_n32-linux-gnu
- mips64el-ctng_n64-linux-gnu

Giulio Benetti (3):
  minicom: update package to use git repository.
  minicom: add hash file for git tarball
  minicom: add license

 .../minicom/0001-musl-libc-compile-fix.patch  | 28 ----------
 ...TIOCGRS485-and-TIOCSRS485-if-not-def.patch | 39 ++++++++++++++
 ...-change-maxnamlen-to-posixs-name-max.patch | 51 -------------------
 package/minicom/Config.in                     |  2 +-
 package/minicom/minicom.hash                  |  3 +-
 package/minicom/minicom.mk                    | 21 ++++++--
 6 files changed, 60 insertions(+), 84 deletions(-)
 delete mode 100644 package/minicom/0001-musl-libc-compile-fix.patch
 create mode 100644 package/minicom/0001-sysdep.h-define-TIOCGRS485-and-TIOCSRS485-if-not-def.patch
 delete mode 100644 package/minicom/0002-change-maxnamlen-to-posixs-name-max.patch

-- 
2.17.1
