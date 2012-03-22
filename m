From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Thu, 22 Mar 2012 16:00:59 +0100
Subject: [Buildroot] [PATCH 1/2] New package: socketcand
Message-ID: <1332428460-28459-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/Config.in                |    1 +
 package/socketcand/Config.in     |    9 +++++++++
 package/socketcand/socketcand.mk |   12 ++++++++++++
 3 files changed, 22 insertions(+), 0 deletions(-)
 create mode 100644 package/socketcand/Config.in
 create mode 100644 package/socketcand/socketcand.mk

diff --git a/package/Config.in b/package/Config.in
index 85583c6..b394f18 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -504,6 +504,7 @@ source "package/rsync/Config.in"
 source "package/samba/Config.in"
 source "package/ser2net/Config.in"
 source "package/socat/Config.in"
+source "package/socketcand/Config.in"
 source "package/spawn-fcgi/Config.in"
 source "package/squid/Config.in"
 source "package/stunnel/Config.in"
diff --git a/package/socketcand/Config.in b/package/socketcand/Config.in
new file mode 100644
index 0000000..ed973b7
--- /dev/null
+++ b/package/socketcand/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_SOCKETCAND
+	bool "socketcand"
+	select BR2_PACKAGE_LIBCONFIG
+	help
+	  Socketcand is a daemon that provides access to CAN interfaces
+	  on a machine via a network interface.
+
+	  https://github.com/dschanoeh/socketcand
+
diff --git a/package/socketcand/socketcand.mk b/package/socketcand/socketcand.mk
new file mode 100644
index 0000000..8677520
--- /dev/null
+++ b/package/socketcand/socketcand.mk
@@ -0,0 +1,12 @@
+#############################################################
+#
+# socketcand
+#
+#############################################################
+SOCKETCAND_VERSION = 7d06986fa4b5fd2c210ec4e248dab41107be1ccd
+SOCKETCAND_SITE = git://github.com/dschanoeh/socketcand.git
+SOCKETCAND_AUTORECONF = YES
+SOCKETCAND_DEPENDENCIES = libconfig
+
+$(eval $(call AUTOTARGETS))
+
-- 
1.7.7
