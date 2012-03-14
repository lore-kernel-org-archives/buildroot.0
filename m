From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 14 Mar 2012 17:38:16 +0100
Subject: [Buildroot] [PATCH resend] new package: zeromq
Message-ID: <7cbcbbf3191cf0d5fab5.1331743096@beantl019720>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
I hope the ? symbol in Config.in is not a problem.

 package/Config.in        |   1 +
 package/zeromq/Config.in |  22 ++++++++++++++++++++++
 package/zeromq/zeromq.mk |  12 ++++++++++++
 3 files changed, 35 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
--- a/package/Config.in
+++ b/package/Config.in
@@ -366,6 +366,7 @@ source "package/librsync/Config.in"
 source "package/libsoup/Config.in"
 source "package/libupnp/Config.in"
 source "package/libvncserver/Config.in"
+source "package/zeromq/Config.in"
 endmenu
 
 menu "Other"
diff --git a/package/zeromq/Config.in b/package/zeromq/Config.in
new file mode 100644
--- /dev/null
+++ b/package/zeromq/Config.in
@@ -0,0 +1,22 @@
+comment "zeromq requires a toolchain with WCHAR support"
+	depends on !BR2_USE_WCHAR
+
+config BR2_PACKAGE_ZEROMQ
+	bool "zeromq"
+	depends on BR2_USE_WCHAR # util-linux
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	help
+	  ?MQ (ZeroMQ, 0MQ, zmq) looks like an embeddable networking library but
+	  acts like a concurrency framework. It gives you sockets that carry
+	  whole messages across various transports like in-process, inter-
+	  process, TCP, and multicast. You can connect sockets N-to-N with
+	  patterns like fanout, pub-sub, task distribution, and request-reply.
+	  It's fast enough to be the fabric for clustered products. Its
+	  asynchronous I/O model gives you scalable multicore applications,
+	  built as asynchronous message-processing tasks. It has a score of
+	  language APIs and runs on most operating systems.
+
+	  ?MQ is from iMatix and is LGPL open source.
+
+	  http://www.zeromq.org/
diff --git a/package/zeromq/zeromq.mk b/package/zeromq/zeromq.mk
new file mode 100644
--- /dev/null
+++ b/package/zeromq/zeromq.mk
@@ -0,0 +1,12 @@
+#############################################################
+#
+# zeromq
+#
+#############################################################
+
+ZEROMQ_VERSION = 2.1.11
+ZEROMQ_SITE = http://download.zeromq.org/
+
+ZEROMQ_DEPENDENCIES = util-linux
+
+$(eval $(call AUTOTARGETS))
