From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 19 Mar 2012 00:31:51 +0100
Subject: [Buildroot] [PATCH] stress: new package
Message-ID: <1332113511-20889-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

---
 package/Config.in        |    1 +
 package/stress/Config.in |    8 ++++++++
 package/stress/stress.mk |   13 +++++++++++++
 3 files changed, 22 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index f0ce963..857413d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -34,6 +34,7 @@ source "package/netperf/Config.in"
 source "package/oprofile/Config.in"
 source "package/rt-tests/Config.in"
 source "package/strace/Config.in"
+source "package/stress/Config.in"
 source "package/whetstone/Config.in"
 source "package/valgrind/Config.in"
 source "package/pv/Config.in"
diff --git a/package/stress/Config.in b/package/stress/Config.in
new file mode 100644
index 0000000..b092b03
--- /dev/null
+++ b/package/stress/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_STRESS
+	bool "stress"
+	help
+	  A deliberately simple workload generator for POSIX systems.
+	  It imposes a configurable amount of CPU, memory, I/O, and
+	  disk stress on the system.
+
+	  http://weather.ou.edu/~apw/projects/stress/
diff --git a/package/stress/stress.mk b/package/stress/stress.mk
new file mode 100644
index 0000000..a64a0d4
--- /dev/null
+++ b/package/stress/stress.mk
@@ -0,0 +1,13 @@
+#############################################################
+#
+# stress - a workload generator
+#
+# http://weather.ou.edu/~apw/projects/stress/
+#
+#############################################################
+
+STRESS_VERSION = 1.0.4
+STRESS_SITE    = http://weather.ou.edu/~apw/projects/stress
+STRESS_SOURCE  = stress-$(STRESS_VERSION).tar.gz
+
+$(eval $(call AUTOTARGETS))
\ No newline at end of file
-- 
tg: (b6a507c..) t/stress (depends on: master)
