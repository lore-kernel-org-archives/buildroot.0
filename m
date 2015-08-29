From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 29 Aug 2015 17:43:21 +0200
Subject: [Buildroot] [git commit branch/next] gdb: add support for gdb 7.10
Message-ID: <20150829154406.457B981D8C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=807f642672a9d527741fd5ec3d37f3a11d7e2e29
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This commit adds support for gdb 7.10.

gdb 7.9.1 carries the following patches:

 - 0001-gdbserver-fix-uClibc-whithout-MMU.patch
   merged as 6282837972a5c7b89968319caf821fcbd2a166bb, and part of 7.10

 - 0002-gdbserver-xtensa-drop-xtensa_usrregs_info.patch
   merged as deb44829ecc1dd38275af0fcf91acd319e227a89, and part of 7.10

 - 0003-gdbserver-xtensa-fix-typo-in-XCHAL_HAVE_LOOPS.patch
   merged as a2d5a9d76f2366ed93095fc5a63eafa06b22f808, and part of 7.10

Consequently, none of the three patches we have for 7.9.1 are useful
for 7.10.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gdb/Config.in.host |    4 ++++
 package/gdb/gdb.hash       |    1 +
 2 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index 3207794..7b05796 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -41,6 +41,9 @@ choice
 	config BR2_GDB_VERSION_7_9
 		bool "gdb 7.9.x"
 
+	config BR2_GDB_VERSION_7_10
+		bool "gdb 7.10.x"
+
 endchoice
 
 endif
@@ -54,3 +57,4 @@ config BR2_GDB_VERSION
 	default "7.7.1"    if BR2_GDB_VERSION_7_7
 	default "7.8.2"	   if BR2_GDB_VERSION_7_8 || !BR2_PACKAGE_HOST_GDB
 	default "7.9.1"    if BR2_GDB_VERSION_7_9
+	default "7.10"     if BR2_GDB_VERSION_7_10
diff --git a/package/gdb/gdb.hash b/package/gdb/gdb.hash
index a970f0a..2646a32 100644
--- a/package/gdb/gdb.hash
+++ b/package/gdb/gdb.hash
@@ -2,6 +2,7 @@
 sha512	887b9b726dae8f6e3e5e41574460a67e4f9002b0d47bc985dcf63bdf3518397a90b6a208cb5b19e5ed2341715ad75cfeed4df4fb423f39f74218e36bc87f1cab	gdb-7.7.1.tar.bz2
 sha512	face5bf1b4ce144fc8604fc84620beed956177a11fd632b4e41906fc7f632910b2b43a50e6cfdfd6cbd876ee527c813bddab8df29dc560a6c36694cdb8edc4e4	gdb-7.8.2.tar.xz
 sha512	eebdf88b24e52e792b8a4b89ea85790de72b462a7810b44975fdf4232c068f353b15506071f450102a9d4bcecdde8e93dc3748a10699b7f73f3e04fb2d9d8414	gdb-7.9.1.tar.xz
+sha512	4d9d7b536ad46f881689fca9f3f0b60268ff413c7900115fed5030d81d1d794793cc51d51510584ea1a63fe5891d006a9867ba36981b86b50806d469b717457d	gdb-7.10.tar.xz
 # No hash for the ARC & microblaze variants, comes from the github-helper:
 none	xxx	gdb-arc-2015.06-gdb.tar.gz
 none	xxx	gdb-6be65fb56ea6694a9260733a536a023a1e2d4d57.tar.gz
