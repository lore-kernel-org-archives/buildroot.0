From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Oct 2016 17:57:08 +0200
Subject: [Buildroot] [git commit] liburcu: bump to version 0.9.2
Message-ID: <20161019155725.394DF81E59@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6820b555afc911ec7032277b66418ba50dd00f9c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop aarch64 support patch; no longer needed.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/liburcu/0002-support-aarch64.patch | 21 ---------------------
 package/liburcu/liburcu.hash               |  6 +++---
 package/liburcu/liburcu.mk                 |  3 +--
 3 files changed, 4 insertions(+), 26 deletions(-)

diff --git a/package/liburcu/0002-support-aarch64.patch b/package/liburcu/0002-support-aarch64.patch
deleted file mode 100644
index 6830e25..0000000
--- a/package/liburcu/0002-support-aarch64.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-libucru: recognize aarch64
-
-Make the same as "arm" internally.
-
-Upstream-Status: Pending
-
-Signed-off-by: joe.slater at windriver.com
-[moved to buildroot from openembedded-core]
-Signed-off-by: Ben Shelton <benjamin.h.shelton@intel.com>
-
-
---- a/configure.ac
-+++ b/configure.ac
-@@ -77,6 +77,7 @@ AS_CASE([$host_cpu],
- 	[alpha*], [ARCHTYPE="alpha"],
- 	[ia64], [ARCHTYPE="gcc"],
- 	[arm*], [ARCHTYPE="arm"],
-+	[aarch64], [ARCHTYPE="arm"],
- 	[mips*], [ARCHTYPE="mips"],
- 	[tile*], [ARCHTYPE="gcc"],
- 	[ARCHTYPE="unknown"]
diff --git a/package/liburcu/liburcu.hash b/package/liburcu/liburcu.hash
index 64ba901..5866d80 100644
--- a/package/liburcu/liburcu.hash
+++ b/package/liburcu/liburcu.hash
@@ -1,4 +1,4 @@
-# http://www.lttng.org/files/urcu/userspace-rcu-0.8.7.tar.bz2.sha1
-sha1  5306999b8a3296f3dea91246d92e0a993d732898  userspace-rcu-0.8.7.tar.bz2
+# http://www.lttng.org/files/urcu/userspace-rcu-0.9.2.tar.bz2.sha1
+sha1  61d1d0d1b955c7a67a7253317647304d04b400a0  userspace-rcu-0.9.2.tar.bz2
 # Locally generated
-sha256 b523f22c4726ca6bb77a77d258e76d8c33c89724433bd65313024b98e55c4295 userspace-rcu-0.8.7.tar.bz2
+sha256 8f7fa313b1e0a3f742cea24ce63a39c0efe63e615a769e2961e55bd2663ecaa3 userspace-rcu-0.9.2.tar.bz2
diff --git a/package/liburcu/liburcu.mk b/package/liburcu/liburcu.mk
index c886a1c..33a301d 100644
--- a/package/liburcu/liburcu.mk
+++ b/package/liburcu/liburcu.mk
@@ -4,13 +4,12 @@
 #
 ################################################################################
 
-LIBURCU_VERSION = 0.8.7
+LIBURCU_VERSION = 0.9.2
 LIBURCU_SITE = http://lttng.org/files/urcu
 LIBURCU_SOURCE = userspace-rcu-$(LIBURCU_VERSION).tar.bz2
 LIBURCU_LICENSE = LGPLv2.1+ for the library; MIT-like license for few source files listed in LICENSE; GPLv2+ for test; GPLv3 for few *.m4 files
 LIBURCU_LICENSE_FILES = lgpl-2.1.txt lgpl-relicensing.txt gpl-2.0.txt LICENSE
 
-LIBURCU_AUTORECONF = YES
 LIBURCU_INSTALL_STAGING = YES
 
 $(eval $(autotools-package))
