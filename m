From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 Jun 2015 16:33:30 +0200
Subject: [Buildroot] [PATCH 5/6] gdb: bump 7.9 series to 7.9.1
In-Reply-To: <1434292411-5003-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1434292411-5003-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1434292411-5003-6-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Note that both gdb 7.9 and 7.9.1 fail to build in a chroot without
texinfo, due to the infamous makeinfo issue. This should be fixed
separately.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gdb/{7.9 => 7.9.1}/0001-gdbserver-fix-uClibc-whithout-MMU.patch | 0
 .../{7.9 => 7.9.1}/0002-gdbserver-xtensa-drop-xtensa_usrregs_info.patch | 0
 .../0003-gdbserver-xtensa-fix-typo-in-XCHAL_HAVE_LOOPS.patch            | 0
 package/gdb/Config.in.host                                              | 2 +-
 package/gdb/gdb.hash                                                    | 2 +-
 5 files changed, 2 insertions(+), 2 deletions(-)
 rename package/gdb/{7.9 => 7.9.1}/0001-gdbserver-fix-uClibc-whithout-MMU.patch (100%)
 rename package/gdb/{7.9 => 7.9.1}/0002-gdbserver-xtensa-drop-xtensa_usrregs_info.patch (100%)
 rename package/gdb/{7.9 => 7.9.1}/0003-gdbserver-xtensa-fix-typo-in-XCHAL_HAVE_LOOPS.patch (100%)

diff --git a/package/gdb/7.9/0001-gdbserver-fix-uClibc-whithout-MMU.patch b/package/gdb/7.9.1/0001-gdbserver-fix-uClibc-whithout-MMU.patch
similarity index 100%
rename from package/gdb/7.9/0001-gdbserver-fix-uClibc-whithout-MMU.patch
rename to package/gdb/7.9.1/0001-gdbserver-fix-uClibc-whithout-MMU.patch
diff --git a/package/gdb/7.9/0002-gdbserver-xtensa-drop-xtensa_usrregs_info.patch b/package/gdb/7.9.1/0002-gdbserver-xtensa-drop-xtensa_usrregs_info.patch
similarity index 100%
rename from package/gdb/7.9/0002-gdbserver-xtensa-drop-xtensa_usrregs_info.patch
rename to package/gdb/7.9.1/0002-gdbserver-xtensa-drop-xtensa_usrregs_info.patch
diff --git a/package/gdb/7.9/0003-gdbserver-xtensa-fix-typo-in-XCHAL_HAVE_LOOPS.patch b/package/gdb/7.9.1/0003-gdbserver-xtensa-fix-typo-in-XCHAL_HAVE_LOOPS.patch
similarity index 100%
rename from package/gdb/7.9/0003-gdbserver-xtensa-fix-typo-in-XCHAL_HAVE_LOOPS.patch
rename to package/gdb/7.9.1/0003-gdbserver-xtensa-fix-typo-in-XCHAL_HAVE_LOOPS.patch
diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index 6b0ca9b..b0046b5 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -53,4 +53,4 @@ config BR2_GDB_VERSION
 	default "6be65fb56ea6694a9260733a536a023a1e2d4d57" if BR2_microblaze
 	default "7.7.1"    if BR2_GDB_VERSION_7_7
 	default "7.8.2"	   if BR2_GDB_VERSION_7_8 || !BR2_PACKAGE_HOST_GDB
-	default "7.9"      if BR2_GDB_VERSION_7_9
+	default "7.9.1"      if BR2_GDB_VERSION_7_9
diff --git a/package/gdb/gdb.hash b/package/gdb/gdb.hash
index f489f64..0130935 100644
--- a/package/gdb/gdb.hash
+++ b/package/gdb/gdb.hash
@@ -1,7 +1,7 @@
 # From ftp://gcc.gnu.org/pub/gdb/releases/sha512.sum
 sha512	887b9b726dae8f6e3e5e41574460a67e4f9002b0d47bc985dcf63bdf3518397a90b6a208cb5b19e5ed2341715ad75cfeed4df4fb423f39f74218e36bc87f1cab	gdb-7.7.1.tar.bz2
 sha512	face5bf1b4ce144fc8604fc84620beed956177a11fd632b4e41906fc7f632910b2b43a50e6cfdfd6cbd876ee527c813bddab8df29dc560a6c36694cdb8edc4e4	gdb-7.8.2.tar.xz
-sha512	850202a477b486a75dc8196efead79c95bc675e348064a5eefee2a50215d40f62e9e052e9b8df29f997f91430f6e7454883652c701f5b1e688d9e2c575876c83	gdb-7.9.tar.xz
+sha512	eebdf88b24e52e792b8a4b89ea85790de72b462a7810b44975fdf4232c068f353b15506071f450102a9d4bcecdde8e93dc3748a10699b7f73f3e04fb2d9d8414	gdb-7.9.1.tar.xz
 # No hash for the ARC & microblaze variants, comes from the github-helper:
 none	xxx	gdb-arc-2014.12-gdb.tar.gz
 none	xxx	gdb-6be65fb56ea6694a9260733a536a023a1e2d4d57.tar.gz
-- 
2.1.0
