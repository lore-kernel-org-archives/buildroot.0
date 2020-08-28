From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Aug 2020 22:57:25 +0200
Subject: [Buildroot] [git commit] package/glibc: security bump for
 additional post-2.31.x fixes
Message-ID: <20200828205013.1478681680@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=aa70a16caf534fd93fdd34a4f740357c14764618
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following security issue:

  CVE-2016-10228: An infinite loop has been fixed in the iconv program when
  invoked with the -c option and when processing invalid multi-byte input
  sequences.  Reported by Jan Engelhardt.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../glibc.hash                                                          | 2 +-
 package/glibc/glibc.mk                                                  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/glibc/2.31-49-g6f3459f9859a7b506c64fa1823769ab631072c6e/glibc.hash b/package/glibc/2.31-54-g6fdf971c9dbf7dac9bea552113fe4694015bbc4d/glibc.hash
similarity index 70%
rename from package/glibc/2.31-49-g6f3459f9859a7b506c64fa1823769ab631072c6e/glibc.hash
rename to package/glibc/2.31-54-g6fdf971c9dbf7dac9bea552113fe4694015bbc4d/glibc.hash
index 01c48b74b5..a1b2ae12fd 100644
--- a/package/glibc/2.31-49-g6f3459f9859a7b506c64fa1823769ab631072c6e/glibc.hash
+++ b/package/glibc/2.31-54-g6fdf971c9dbf7dac9bea552113fe4694015bbc4d/glibc.hash
@@ -1,5 +1,5 @@
 # Locally calculated (fetched from Github)
-sha256  a105837271b66e92f1ed4a5f10f3bb9e993842d592f67d352c6637126bd3d58c  glibc-2.31-49-g6f3459f9859a7b506c64fa1823769ab631072c6e.tar.gz
+sha256  e1f2c9b424a4e0c00e7ad123a4204f7bc8afd3c504aeb8c79b1086509fd67176  glibc-2.31-54-g6fdf971c9dbf7dac9bea552113fe4694015bbc4d.tar.gz
 
 # Hashes for license files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index fe27842b07..ed03a6911f 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -17,7 +17,7 @@ else
 # Generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
 # When updating the version, please also update localedef
-GLIBC_VERSION = 2.31-49-g6f3459f9859a7b506c64fa1823769ab631072c6e
+GLIBC_VERSION = 2.31-54-g6fdf971c9dbf7dac9bea552113fe4694015bbc4d
 # Upstream doesn't officially provide an https download link.
 # There is one (https://sourceware.org/git/glibc.git) but it's not reliable,
 # sometimes the connection times out. So use an unofficial github mirror.
