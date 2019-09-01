From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 1 Sep 2019 22:18:54 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/glibc: bump
 version for additional post-2.28 fixes
Message-ID: <20190901203656.F2F0488E4A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=28669fde4ebd1fc25362d6d34b1e5caa5fde3913
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

The following additional bugs are fixed:

  [18035] Fix pldd hang
  [20568] Fix crash in _IO_wfile_sync
  [24228] old x86 applications that use legacy libio crash on exit
  [24476] dlfcn: Guard __dlerror_main_freeres with __libc_once_get (once)
  [24744] io: Remove the copy_file_range emulation.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../glibc.hash                                                          | 2 +-
 package/glibc/glibc.mk                                                  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/glibc/glibc-2.28-94-g4aeff335ca19286ee2382d8eba794ae5fd49281a/glibc.hash b/package/glibc/glibc-2.28-110-g57922433fa038faa6e37798b9655f85a94978d89/glibc.hash
similarity index 69%
rename from package/glibc/glibc-2.28-94-g4aeff335ca19286ee2382d8eba794ae5fd49281a/glibc.hash
rename to package/glibc/glibc-2.28-110-g57922433fa038faa6e37798b9655f85a94978d89/glibc.hash
index 442ef0d7aa..734621d9b1 100644
--- a/package/glibc/glibc-2.28-94-g4aeff335ca19286ee2382d8eba794ae5fd49281a/glibc.hash
+++ b/package/glibc/glibc-2.28-110-g57922433fa038faa6e37798b9655f85a94978d89/glibc.hash
@@ -1,5 +1,5 @@
 # Locally calculated (fetched from Github)
-sha256  295d436aac4dc45afc3b440f85fc4556c03b1140ca0f625ee015c8156d2f52ae  glibc-glibc-2.28-94-g4aeff335ca19286ee2382d8eba794ae5fd49281a.tar.gz
+sha256  8cfd8c4564b20e610b41e24cdab85d5b208453c51b06a64603e9ef3f86d6de0a  glibc-glibc-2.28-110-g57922433fa038faa6e37798b9655f85a94978d89.tar.gz
 
 # Hashes for license files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index cb6f8097dc..94ffe9eb42 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -13,7 +13,7 @@ GLIBC_SITE = $(call github,riscv,riscv-glibc,$(GLIBC_VERSION))
 else
 # Generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master
-GLIBC_VERSION = glibc-2.28-94-g4aeff335ca19286ee2382d8eba794ae5fd49281a
+GLIBC_VERSION = glibc-2.28-110-g57922433fa038faa6e37798b9655f85a94978d89
 # Upstream doesn't officially provide an https download link.
 # There is one (https://sourceware.org/git/glibc.git) but it's not reliable,
 # sometimes the connection times out. So use an unofficial github mirror.
