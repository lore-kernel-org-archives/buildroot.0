From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Dec 2011 23:30:22 +0100
Subject: [Buildroot] [PATCH 1/7] liburcu: new package
In-Reply-To: <cover.1324506157.git.thomas.petazzoni@free-electrons.com>
References: <cover.1324506157.git.thomas.petazzoni@free-electrons.com>
Message-ID: <db5f42a42d2fda67c6b0de4edb3ea2fe75aa7f84.1324506157.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in          |    1 +
 package/liburcu/Config.in  |    9 +++++++++
 package/liburcu/liburcu.mk |    8 ++++++++
 3 files changed, 18 insertions(+), 0 deletions(-)
 create mode 100644 package/liburcu/Config.in
 create mode 100644 package/liburcu/liburcu.mk

diff --git a/package/Config.in b/package/Config.in
index b6df18a..e30eac5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -365,6 +365,7 @@ source "package/libffi/Config.in"
 source "package/libglib2/Config.in"
 source "package/libnspr/Config.in"
 source "package/libsigc/Config.in"
+source "package/liburcu/Config.in"
 source "package/orc/Config.in"
 source "package/poco/Config.in"
 source "package/startup-notification/Config.in"
diff --git a/package/liburcu/Config.in b/package/liburcu/Config.in
new file mode 100644
index 0000000..71bec65
--- /dev/null
+++ b/package/liburcu/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_LIBURCU
+	bool "liburcu"
+	help
+	  Userspace implementation of the Read-Copy-Update (RCU)
+	  synchronization mechanism. This library is mainly used by
+	  the LTTng tracing infrastructure, but can be used for other
+	  purposes as well.
+
+	  http://lttng.org/urcu
\ No newline at end of file
diff --git a/package/liburcu/liburcu.mk b/package/liburcu/liburcu.mk
new file mode 100644
index 0000000..5cb6419
--- /dev/null
+++ b/package/liburcu/liburcu.mk
@@ -0,0 +1,8 @@
+LIBURCU_VERSION = 0.6.7
+LIBURCU_SITE    = http://lttng.org/files/bundles/20111214/
+LIBURCU_SOURCE  = userspace-rcu-$(LIBURCU_VERSION).tar.bz2
+
+LIBURCU_INSTALL_STAGING = YES
+
+$(eval $(call AUTOTARGETS))
+
-- 
1.7.4.1
