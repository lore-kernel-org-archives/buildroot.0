From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 31 Jan 2012 23:35:58 +0100
Subject: [Buildroot] [git commit] liburcu: new package
Message-ID: <20120131232309.9D7D890953@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=971e0b0c5faa579b6d07c39bdfacf6c7d8a9b176
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in          |    1 +
 package/liburcu/Config.in  |    9 +++++++++
 package/liburcu/liburcu.mk |    7 +++++++
 3 files changed, 17 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index f5c7601..d15e934 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -376,6 +376,7 @@ source "package/libglib2/Config.in"
 source "package/libical/Config.in"
 source "package/libnspr/Config.in"
 source "package/libsigc/Config.in"
+source "package/liburcu/Config.in"
 source "package/orc/Config.in"
 source "package/poco/Config.in"
 source "package/startup-notification/Config.in"
diff --git a/package/liburcu/Config.in b/package/liburcu/Config.in
new file mode 100644
index 0000000..5a6e4b2
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
diff --git a/package/liburcu/liburcu.mk b/package/liburcu/liburcu.mk
new file mode 100644
index 0000000..a34079d
--- /dev/null
+++ b/package/liburcu/liburcu.mk
@@ -0,0 +1,7 @@
+LIBURCU_VERSION = 0.6.7
+LIBURCU_SITE    = http://lttng.org/files/bundles/20111214/
+LIBURCU_SOURCE  = userspace-rcu-$(LIBURCU_VERSION).tar.bz2
+
+LIBURCU_INSTALL_STAGING = YES
+
+$(eval $(call AUTOTARGETS))
