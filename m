From: Michael Rommel <rommel@layer-7.net>
Date: Sun,  1 Sep 2013 23:33:34 +0200
Subject: [Buildroot] [PATCH 1/3] knock: new package
Message-ID: <1378071216-19697-1-git-send-email-rommel@layer-7.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A port knocking implementation with daemon and user application.

Signed-off-by: Michael Rommel <rommel@layer-7.net>
---
 package/Config.in       |    1 +
 package/knock/Config.in |   13 +++++++++++++
 package/knock/knock.mk  |   13 +++++++++++++
 3 files changed, 27 insertions(+)
 create mode 100644 package/knock/Config.in
 create mode 100644 package/knock/knock.mk

diff --git a/package/Config.in b/package/Config.in
index 6306947..fd98da0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -763,6 +763,7 @@ source "package/ipset/Config.in"
 source "package/iptables/Config.in"
 source "package/iw/Config.in"
 source "package/kismet/Config.in"
+source "package/knock/Config.in"
 source "package/lighttpd/Config.in"
 source "package/linknx/Config.in"
 source "package/links/Config.in"
diff --git a/package/knock/Config.in b/package/knock/Config.in
new file mode 100644
index 0000000..8d80274
--- /dev/null
+++ b/package/knock/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_KNOCK
+	bool "knock"
+	select BR2_PACKAGE_LIBPCAP
+	help
+	  A port knocking implementation.
+	  Provides a daemon and a user application. Port knocking can be
+	  used to run an arbitrary application, once the daemon detects
+	  a predefined sequence of incoming TCP/UDP packets on a network
+	  interface. This can be used, e.g. to open up ports in a
+	  firewall.
+
+	  http://www.zeroflux.org/projects/knock
+
diff --git a/package/knock/knock.mk b/package/knock/knock.mk
new file mode 100644
index 0000000..85dfe62
--- /dev/null
+++ b/package/knock/knock.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# knock
+#
+################################################################################
+
+KNOCK_VERSION = 7666f2e86e
+KNOCK_SITE = https://github.com/jvinet/knock/tarball/master
+KNOCK_LICENSE = GPLv2+
+KNOCK_LICENSE_FILES = COPYING
+KNOCK_AUTORECONF = YES
+
+$(eval $(autotools-package))
-- 
1.7.9.5
