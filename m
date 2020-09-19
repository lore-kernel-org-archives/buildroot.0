From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 19 Sep 2020 21:54:49 +0200
Subject: [Buildroot] [git commit] package/libcap: bump to version 2.43
Message-ID: <20200919194742.3DF1A82B49@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=89d5020cd64004fceca152c5923f30b76ae4c58a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Retrieve first patch from upstream

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-Support-dynamic-test-compilation-and-execution.patch | 16 +++++++++-------
 package/libcap/libcap.hash                               |  2 +-
 package/libcap/libcap.mk                                 |  2 +-
 3 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/package/libcap/0001-Support-dynamic-test-compilation-and-execution.patch b/package/libcap/0001-Support-dynamic-test-compilation-and-execution.patch
index 66813ccf89..a456ea55d9 100644
--- a/package/libcap/0001-Support-dynamic-test-compilation-and-execution.patch
+++ b/package/libcap/0001-Support-dynamic-test-compilation-and-execution.patch
@@ -1,7 +1,7 @@
-From 3613927310c4b46df1d558f6f2c0b1cdf8878dd3 Mon Sep 17 00:00:00 2001
+From 307e7f5744b7c84af4c07091c5310cf4f9514694 Mon Sep 17 00:00:00 2001
 From: "Andrew G. Morgan" <morgan@kernel.org>
 Date: Mon, 7 Sep 2020 12:24:43 -0700
-Subject: [PATCH] Support dynamic test compilation and execution.
+Subject: Support dynamic test compilation and execution.
 
   make DYNAMIC=yes test sudotest
 
@@ -11,7 +11,9 @@ make the above command line work against the uninstalled
 library builds.
 
 Signed-off-by: Andrew G. Morgan <morgan@kernel.org>
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+[Retrieved from:
+https://git.kernel.org/pub/scm/libs/libcap/libcap.git/commit/?id=307e7f5744b7c84af4c07091c5310cf4f9514694]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 ---
  Make.Rules          |  2 +-
  go/Makefile         |  6 +++---
@@ -23,7 +25,7 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
  7 files changed, 35 insertions(+), 22 deletions(-)
 
 diff --git a/Make.Rules b/Make.Rules
-index 8440e18..9a77607 100644
+index c62f541..8c3f9b3 100644
 --- a/Make.Rules
 +++ b/Make.Rules
 @@ -69,7 +69,7 @@ WARNINGS=-Wall -Wwrite-strings \
@@ -161,7 +163,7 @@ index fbe98a6..5873317 100755
  if [ $? -eq 0 ]; then
      ./getcap -n ./nsprivileged | fgrep "[rootid=1]"
 diff --git a/tests/Makefile b/tests/Makefile
-index bfedbc2..d85d019 100644
+index 0c86ee8..a555887 100644
 --- a/tests/Makefile
 +++ b/tests/Makefile
 @@ -7,6 +7,12 @@ include ../Make.Rules
@@ -174,7 +176,7 @@ index bfedbc2..d85d019 100644
 +LDFLAGS += --static
 +endif
 +
- all: psx_test psx_test_wrap libcap_psx_test libcap_launch_test
+ all: psx_test libcap_psx_test libcap_launch_test
  
  $(DEPS):
 @@ -19,30 +25,31 @@ sudotest: test run_libcap_launch_test run_libcap_launch_test
@@ -218,5 +220,5 @@ index bfedbc2..d85d019 100644
  	$(CC) $(CFLAGS) $< -o $@ --static
  
 -- 
-2.26.2
+cgit 1.2.3-1.el7
 
diff --git a/package/libcap/libcap.hash b/package/libcap/libcap.hash
index 19044cab01..6af96f7764 100644
--- a/package/libcap/libcap.hash
+++ b/package/libcap/libcap.hash
@@ -1,5 +1,5 @@
 # https://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2/sha256sums.asc
-sha256  3605a9cb60076547ea9f64989e0ba576da9508e4653e8dc40ae54c0d6f443dfd  libcap-2.42.tar.xz
+sha256  512a0e5fc4c1e06d472a20da26aa96a9b9bf2a26b23f094f77f1b8da56cc427f  libcap-2.43.tar.xz
 
 # Hash for license file:
 sha256  088cabde4662b4121258d298b0b2967bc1abffa134457ed9bc4a359685ab92bc  License
diff --git a/package/libcap/libcap.mk b/package/libcap/libcap.mk
index 6f1bb8a07f..3992efeeae 100644
--- a/package/libcap/libcap.mk
+++ b/package/libcap/libcap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCAP_VERSION = 2.42
+LIBCAP_VERSION = 2.43
 LIBCAP_SITE = https://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2
 LIBCAP_SOURCE = libcap-$(LIBCAP_VERSION).tar.xz
 LIBCAP_LICENSE = GPL-2.0 or BSD-3-Clause
