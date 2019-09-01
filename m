From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 1 Sep 2019 22:10:15 +0200
Subject: [Buildroot] [git commit branch/2019.05.x] package/glibc: bump
 version for additional post-2.29 fixes
Message-ID: <20190901200714.BA04C88DBC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fb64b438206cff954760678fa3e77e9990174f9f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.05.x

The following additional bugs are fixed:

  [16573] malloc: Set and reset all hooks for tracing
  [18035] Fix pldd hang
  [20568] Fix crash in _IO_wfile_sync
  [24228] old x86 applications that use legacy libio crash on exit
  [24476] dlfcn: Guard __dlerror_main_freeres with __libc_once_get (once)
  [24744] io: Remove the copy_file_range emulation

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Reviewed-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 840ecb29f50cd1a9b9d71b51a87af8841035aae5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../glibc.hash                                                          | 2 +-
 package/glibc/glibc.mk                                                  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/glibc/2.29-11-ge28ad442e73b00ae2047d89c8cc7f9b2a0de5436/glibc.hash b/package/glibc/2.29-30-g2d3fefd7ce64ac1015701c96916fffacc073a877/glibc.hash
similarity index 70%
rename from package/glibc/2.29-11-ge28ad442e73b00ae2047d89c8cc7f9b2a0de5436/glibc.hash
rename to package/glibc/2.29-30-g2d3fefd7ce64ac1015701c96916fffacc073a877/glibc.hash
index b62487ce19..6273151471 100644
--- a/package/glibc/2.29-11-ge28ad442e73b00ae2047d89c8cc7f9b2a0de5436/glibc.hash
+++ b/package/glibc/2.29-30-g2d3fefd7ce64ac1015701c96916fffacc073a877/glibc.hash
@@ -1,5 +1,5 @@
 # Locally calculated (fetched from Github)
-sha256  a5d4cbe7eceaefd8bce1104994379818169961b59346d2f3897966912237b1e6  glibc-2.29-11-ge28ad442e73b00ae2047d89c8cc7f9b2a0de5436.tar.gz
+sha256  bd9fa9932c374b5256a976b543992c20de23338d08879df70a0a2502d17e671d  glibc-2.29-30-g2d3fefd7ce64ac1015701c96916fffacc073a877.tar.gz
 
 # Hashes for license files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 0345f1f392..a042e77017 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -13,7 +13,7 @@ GLIBC_SITE = $(call github,riscv,riscv-glibc,$(GLIBC_VERSION))
 else
 # Generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
-GLIBC_VERSION = 2.29-11-ge28ad442e73b00ae2047d89c8cc7f9b2a0de5436
+GLIBC_VERSION = 2.29-30-g2d3fefd7ce64ac1015701c96916fffacc073a877
 # Upstream doesn't officially provide an https download link.
 # There is one (https://sourceware.org/git/glibc.git) but it's not reliable,
 # sometimes the connection times out. So use an unofficial github mirror.
