From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 26 Mar 2019 13:19:52 +0100
Subject: [Buildroot] [git commit] package/liburcu: bump version to 0.10.2
Message-ID: <20190326121702.455DD81D5D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f63dd851297ceb4f7065a9bd48f019819de042c3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This includes a fix that might delay application startup
considerably (11486a15008b9).

Adapted the patch to point to the correct file.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../liburcu/0001-Only-blacklist-ARM-gcc-4.8.0-and-4.8.1.patch  | 10 +++++-----
 package/liburcu/liburcu.hash                                   |  6 +++---
 package/liburcu/liburcu.mk                                     |  2 +-
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/package/liburcu/0001-Only-blacklist-ARM-gcc-4.8.0-and-4.8.1.patch b/package/liburcu/0001-Only-blacklist-ARM-gcc-4.8.0-and-4.8.1.patch
index 585abc0322..658e1721f0 100644
--- a/package/liburcu/0001-Only-blacklist-ARM-gcc-4.8.0-and-4.8.1.patch
+++ b/package/liburcu/0001-Only-blacklist-ARM-gcc-4.8.0-and-4.8.1.patch
@@ -12,13 +12,13 @@ Signed-off-by: Samuel Martin <s.martin49@gmail.com>
  urcu/compiler.h | 9 ++++++++-
  1 file changed, 8 insertions(+), 1 deletion(-)
 
-diff --git a/urcu/compiler.h b/urcu/compiler.h
+diff --git a/include/urcu/compiler.h b/include/urcu/compiler.h
 index 1e30903..56115f1 100644
---- a/urcu/compiler.h
-+++ b/urcu/compiler.h
+--- a/include/urcu/compiler.h
++++ b/include/urcu/compiler.h
 @@ -118,10 +118,17 @@
  				+ __GNUC_PATCHLEVEL__)
- 
+
  /*
 + * Official gcc releases from 4.8.0 to 4.8.2 have the following bug,
 + * however, many arm toolchain providers have the included the fix for
@@ -35,6 +35,6 @@ index 1e30903..56115f1 100644
  #   error Your gcc version produces clobbered frame accesses
  #  endif
  # endif
--- 
+--
 1.9.0
 
diff --git a/package/liburcu/liburcu.hash b/package/liburcu/liburcu.hash
index 5866d805ca..01ce51aabd 100644
--- a/package/liburcu/liburcu.hash
+++ b/package/liburcu/liburcu.hash
@@ -1,4 +1,4 @@
-# http://www.lttng.org/files/urcu/userspace-rcu-0.9.2.tar.bz2.sha1
-sha1  61d1d0d1b955c7a67a7253317647304d04b400a0  userspace-rcu-0.9.2.tar.bz2
+# http://www.lttng.org/files/urcu/userspace-rcu-0.10.2.tar.bz2.sha1
+sha1  70ac938acdc738bee7e2e1f462a7991a25ba2439  userspace-rcu-0.10.2.tar.bz2
 # Locally generated
-sha256 8f7fa313b1e0a3f742cea24ce63a39c0efe63e615a769e2961e55bd2663ecaa3 userspace-rcu-0.9.2.tar.bz2
+sha256 b3f6888daf6fe02c1f8097f4a0898e41b5fe9975e121dc792b9ddef4b17261cc  userspace-rcu-0.10.2.tar.bz2
diff --git a/package/liburcu/liburcu.mk b/package/liburcu/liburcu.mk
index d8579f6c28..8ddfb3fb84 100644
--- a/package/liburcu/liburcu.mk
+++ b/package/liburcu/liburcu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBURCU_VERSION = 0.9.2
+LIBURCU_VERSION = 0.10.2
 LIBURCU_SITE = http://lttng.org/files/urcu
 LIBURCU_SOURCE = userspace-rcu-$(LIBURCU_VERSION).tar.bz2
 LIBURCU_LICENSE = LGPL-2.1+ (library), MIT-like (few source files listed in LICENSE), GPL-2.0+ (test), GPL-3.0 (few *.m4 files)
