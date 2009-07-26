From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 27 Jul 2009 00:15:55 +0200
Subject: [Buildroot] [git commit] netstat-nat: new package
Message-ID: <20090726221821.11078777FE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=c2dbefd86f9480ba6ca3dc7b5b097401bf6bfbbd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #3597.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                            |    1 +
 package/Config.in                  |    1 +
 package/netstat-nat/Config.in      |    6 ++++++
 package/netstat-nat/netstat-nat.mk |   12 ++++++++++++
 4 files changed, 20 insertions(+), 0 deletions(-)
 create mode 100644 package/netstat-nat/Config.in
 create mode 100644 package/netstat-nat/netstat-nat.mk

diff --git a/CHANGES b/CHANGES
index 7111e91..17072ee 100644
--- a/CHANGES
+++ b/CHANGES
@@ -9,6 +9,7 @@
 	#287: New package libnl
 	#333: Bump sqlite package to 3.6.15
 	#349: update libsoup to version 2.26.2
+	#357: New package netstat-nat
 	#359,#413: Upgrade openvpn to Makefile.autotools.in
 	#367: linux kernel compile error for arm926t
 	#369: Add SDL_gfx package
diff --git a/package/Config.in b/package/Config.in
index c4cad8d..d86eb6f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -182,6 +182,7 @@ source "package/netkitbase/Config.in"
 source "package/netkittelnet/Config.in"
 source "package/netplug/Config.in"
 source "package/netsnmp/Config.in"
+source "package/netstat-nat/Config.in"
 source "package/nfs-utils/Config.in"
 source "package/ntp/Config.in"
 source "package/olsr/Config.in"
diff --git a/package/netstat-nat/Config.in b/package/netstat-nat/Config.in
new file mode 100644
index 0000000..6afcf89
--- /dev/null
+++ b/package/netstat-nat/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_NETSTAT_NAT
+	bool "netstat-nat"
+	help
+	  Displays NAT connections
+
+	  http://tweegy.nl/projects/netstat-nat/
diff --git a/package/netstat-nat/netstat-nat.mk b/package/netstat-nat/netstat-nat.mk
new file mode 100644
index 0000000..4847283
--- /dev/null
+++ b/package/netstat-nat/netstat-nat.mk
@@ -0,0 +1,12 @@
+#############################################################
+#
+# netstat-nat
+#
+#############################################################
+
+NETSTAT_NAT_VERSION = 1.4.9
+NETSTAT_NAT_SOURCE = netstat-nat-$(NETSTAT_NAT_VERSION).tar.gz
+NETSTAT_NAT_SITE = http://tweegy.nl/download
+NETSTAT_NAT_DEPENDENCIES = uclibc
+
+$(eval $(call AUTOTARGETS,package,netstat-nat))
-- 
1.6.3.3
