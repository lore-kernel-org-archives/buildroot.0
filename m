From: Francisco Gonzalez <gzmorell@gmail.com>
Date: Wed, 16 Dec 2009 17:40:23 +0100
Subject: [Buildroot] New package ser2net request
Message-ID: <fffd86390912160840v71e07dfta2d23e1cab805012@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

diff --git a/package/Config.in b/package/Config.in
index 6adf913..e673631 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -197,6 +197,7 @@ source "package/proftpd/Config.in"
 source "package/quagga/Config.in"
 source "package/rsync/Config.in"
 source "package/samba/Config.in"
+source "package/ser2net/Config.in"
 source "package/socat/Config.in"
 source "package/spawn-fcgi/Config.in"
 source "package/stunnel/Config.in"
diff --git a/package/ser2net/Config.in b/package/ser2net/Config.in
new file mode 100644
index 0000000..6e61893
--- /dev/null
+++ b/package/ser2net/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_SER2NET
+ bool "ser2net"
+ help
+  ser2net provides a way for a user to connect from a network connection
+  to a serial port..
+
+  http://ser2net.sourceforge.net
+
diff --git a/package/ser2net/ser2net.mk b/package/ser2net/ser2net.mk
new file mode 100644
index 0000000..c51b2d2
--- /dev/null
+++ b/package/ser2net/ser2net.mk
@@ -0,0 +1,16 @@
+#############################################################
+#
+# ser2net
+#
+#############################################################
+
+SER2NET_VERSION:=2.6
+SER2NET_SOURCE:=ser2net-$(SER2NET_VERSION).tar.gz
+SER2NET_SITE=http://$(BR2_SOURCEFORGE_MIRROR).
dl.sourceforge.net/sourceforge/ser2net
+SER2NET_AUTORECONF:=NO
+SER2NET_INSTALL_STAGING:=NO
+SER2NET_INSTALL_TARGET:=YES
+
+SER2NET_DEPENDENCIES = uclibc
+
+$(eval $(call AUTOTARGETS,package,ser2net))
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20091216/160807eb/attachment-0001.htm>
