From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 29 Mar 2019 17:03:07 +0100
Subject: [Buildroot] [git commit] package/glibc: bump version for post-2.29
 security fixes
Message-ID: <20190329155930.276BD8833B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=de5ca50cf22257bedf520ac0b20da4dee45985e1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following security vulnerability:

  CVE-2019-9169: Attempted case-insensitive regular-expression match
  via proceed_next_node in posix/regexec.c leads to heap-based buffer
  over-read.  Reported by Hongxu Chen.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../glibc.hash                                                          | 2 +-
 package/glibc/glibc.mk                                                  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/glibc/2.29-6-g067fc32968b601493f4b247a3ac00caeea3f3d61/glibc.hash b/package/glibc/2.29-11-ge28ad442e73b00ae2047d89c8cc7f9b2a0de5436/glibc.hash
similarity index 70%
rename from package/glibc/2.29-6-g067fc32968b601493f4b247a3ac00caeea3f3d61/glibc.hash
rename to package/glibc/2.29-11-ge28ad442e73b00ae2047d89c8cc7f9b2a0de5436/glibc.hash
index 56e4bf1c18..b62487ce19 100644
--- a/package/glibc/2.29-6-g067fc32968b601493f4b247a3ac00caeea3f3d61/glibc.hash
+++ b/package/glibc/2.29-11-ge28ad442e73b00ae2047d89c8cc7f9b2a0de5436/glibc.hash
@@ -1,5 +1,5 @@
 # Locally calculated (fetched from Github)
-sha256  fdc2f7966eac7071ac4d66bc38d9236476d670f042645f9566746a1fd42a6a9d  glibc-2.29-6-g067fc32968b601493f4b247a3ac00caeea3f3d61.tar.gz
+sha256  a5d4cbe7eceaefd8bce1104994379818169961b59346d2f3897966912237b1e6  glibc-2.29-11-ge28ad442e73b00ae2047d89c8cc7f9b2a0de5436.tar.gz
 
 # Hashes for license files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 5ee53df2b2..0345f1f392 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -13,7 +13,7 @@ GLIBC_SITE = $(call github,riscv,riscv-glibc,$(GLIBC_VERSION))
 else
 # Generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
-GLIBC_VERSION = 2.29-6-g067fc32968b601493f4b247a3ac00caeea3f3d61
+GLIBC_VERSION = 2.29-11-ge28ad442e73b00ae2047d89c8cc7f9b2a0de5436
 # Upstream doesn't officially provide an https download link.
 # There is one (https://sourceware.org/git/glibc.git) but it's not reliable,
 # sometimes the connection times out. So use an unofficial github mirror.
