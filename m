From: Jerin Jacob <jerinjacobk@gmail.com>
Date: Thu, 28 Feb 2013 20:25:40 +0530
Subject: [Buildroot] [PATCH] ltp-testsuite: bump version to 20130109
Message-ID: <1362063340-2106-1-git-send-email-jerinjacobk@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerin Jacob <jerinjacobk@gmail.com>
---
 ...tp-testsuite-20101031-disable-controllers.patch |   25 -----------------
 ...tp-testsuite-20130109-disable-controllers.patch |   29 ++++++++++++++++++++
 package/ltp-testsuite/ltp-testsuite.mk             |    2 +-
 3 files changed, 30 insertions(+), 26 deletions(-)
 delete mode 100644 package/ltp-testsuite/ltp-testsuite-20101031-disable-controllers.patch
 create mode 100644 package/ltp-testsuite/ltp-testsuite-20130109-disable-controllers.patch

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
diff --git a/package/ltp-testsuite/ltp-testsuite-20130109-disable-controllers.patch b/package/ltp-testsuite/ltp-testsuite-20130109-disable-controllers.patch
new file mode 100644
index 0000000..85ef262
--- /dev/null
+++ b/package/ltp-testsuite/ltp-testsuite-20130109-disable-controllers.patch
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
-- 
1.7.6.5
