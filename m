From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 4 Mar 2013 10:30:23 +0100
Subject: [Buildroot] [git commit] ltp-testsuite: bump version to 20130109
Message-ID: <20130304093035.C03FC9AE7A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=acc1939be3ac6b0dc67acf78f10afe46065e634c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: drop version number in patches]
Signed-off-by: Jerin Jacob <jerinjacobk@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 ...tp-testsuite-20101031-disable-controllers.patch |   25 -----------------
 .../ltp-testsuite-disable-controllers.patch        |   29 ++++++++++++++++++++
 ... ltp-testsuite-fix-build-on-uClibc-exp10.patch} |    0
 package/ltp-testsuite/ltp-testsuite.mk             |    2 +-
 4 files changed, 30 insertions(+), 26 deletions(-)

diff --git a/package/ltp-testsuite/ltp-testsuite-20101031-disable-controllers.patch b/package/ltp-testsuite/ltp-testsuite-20101031-disable-controllers.patch
deleted file mode 100644
index 57d6038..0000000
--- a/package/ltp-testsuite/ltp-testsuite-20101031-disable-controllers.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-Disable controllers testcases
-
-The cpuset controllers testcases do not build due to bug
-https://sourceforge.net/tracker/?func=detail&aid=3126942&group_id=3382&atid=103382. Disabling
-just the cpuset controllers do not seem to be easily possible, and
-those controller features are rarely used on embedded systems anyway.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- testcases/kernel/Makefile |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-Index: ltp-testsuite-20101031/testcases/kernel/Makefile
-===================================================================
---- ltp-testsuite-20101031.orig/testcases/kernel/Makefile
-+++ ltp-testsuite-20101031/testcases/kernel/Makefile
-@@ -28,7 +28,7 @@
- #
- # KEEP THIS LIST ALPHABETIZED PLEASE!
- ifneq ($(UCLINUX),1)
--SUBDIRS		:= containers connectors controllers fs hotplug io ipc mem \
-+SUBDIRS		:= containers connectors fs hotplug io ipc mem \
- 		   numa performance_counters power_management pty sched \
- 		   security syscalls timers tracing
- else
diff --git a/package/ltp-testsuite/ltp-testsuite-disable-controllers.patch b/package/ltp-testsuite/ltp-testsuite-disable-controllers.patch
new file mode 100644
index 0000000..85ef262
--- /dev/null
+++ b/package/ltp-testsuite/ltp-testsuite-disable-controllers.patch
@@ -0,0 +1,29 @@
+Disable controllers testcases.
+This fix is carried over from 20101031 version.
+
+The cpuset controllers testcases do not build due to bug
+https://sourceforge.net/tracker/?func=detail&aid=3126942&group_id=3382&atid=103382.
+Disabling just the cpuset controllers do not seem to be easily possible, and
+those controller features are rarely used on embedded systems anyway.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Signed-off-by: Jerin Jacob  <jerinjacobk@gmail.com>
+---
+ testcases/kernel/Makefile |    1 -
+ 1 files changed, 0 insertions(+), 1 deletions(-)
+
+diff --git a/testcases/kernel/Makefile b/testcases/kernel/Makefile
+index 4b4800d..d6ab7b6 100644
+--- a/testcases/kernel/Makefile
++++ b/testcases/kernel/Makefile
+@@ -37,7 +37,6 @@ ifneq ($(UCLINUX),1)
+ # KEEP THIS LIST ALPHABETIZED PLEASE!
+ SUBDIRS			+= connectors \
+ 			   containers \
+-			   controllers \
+ 			   fs \
+ 			   hotplug \
+ 			   io \
+-- 
+1.7.6.5
+
diff --git a/package/ltp-testsuite/ltp-testsuite-20101031-fix-build-on-uClibc-exp10.patch b/package/ltp-testsuite/ltp-testsuite-fix-build-on-uClibc-exp10.patch
similarity index 100%
rename from package/ltp-testsuite/ltp-testsuite-20101031-fix-build-on-uClibc-exp10.patch
rename to package/ltp-testsuite/ltp-testsuite-fix-build-on-uClibc-exp10.patch
diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
index d0276f2..caed4b3 100644
--- a/package/ltp-testsuite/ltp-testsuite.mk
+++ b/package/ltp-testsuite/ltp-testsuite.mk
@@ -3,7 +3,7 @@
 # ltp-testsuite
 #
 #############################################################
-LTP_TESTSUITE_VERSION = 20101031
+LTP_TESTSUITE_VERSION = 20130109
 LTP_TESTSUITE_SOURCE  = ltp-full-$(LTP_TESTSUITE_VERSION).bz2
 LTP_TESTSUITE_SITE    = http://downloads.sourceforge.net/project/ltp/LTP%20Source/ltp-$(LTP_TESTSUITE_VERSION)
 LTP_TESTSUITE_LICENSE = GPLv2 GPLv2+
