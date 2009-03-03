From: Olaf Rempel <razzor@kopf-tisch.de>
Date: Tue,  3 Mar 2009 11:58:28 +0100
Subject: [Buildroot] ctorrent: new package
In-Reply-To: <1236077910-15674-6-git-send-email-razzor@kopf-tisch.de>
References: <> <1236077910-15674-1-git-send-email-razzor@kopf-tisch.de>
	<1236077910-15674-2-git-send-email-razzor@kopf-tisch.de>
	<1236077910-15674-3-git-send-email-razzor@kopf-tisch.de>
	<1236077910-15674-4-git-send-email-razzor@kopf-tisch.de>
	<1236077910-15674-5-git-send-email-razzor@kopf-tisch.de>
	<1236077910-15674-6-git-send-email-razzor@kopf-tisch.de>
Message-ID: <1236077910-15674-7-git-send-email-razzor@kopf-tisch.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

CTorrent is a BitTorrent client implemented in C++
to be lightweight and quick.
This is the enhanced version from
http://www.rahul.net/dholmes/ctorrent/
---
 package/Config.in            |    1 +
 package/ctorrent/Config.in   |   14 ++++++++++++++
 package/ctorrent/ctorrent.mk |   11 +++++++++++
 3 files changed, 26 insertions(+), 0 deletions(-)
 create mode 100644 package/ctorrent/Config.in
 create mode 100644 package/ctorrent/ctorrent.mk

diff --git a/package/Config.in b/package/Config.in
index 59d2a43..6f566f4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -132,6 +132,7 @@ source "package/boa/Config.in"
 endif
 source "package/bind/Config.in"
 source "package/bridge-utils/Config.in"
+source "package/ctorrent/Config.in"
 if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
 source "package/dhcp/Config.in"
 endif
diff --git a/package/ctorrent/Config.in b/package/ctorrent/Config.in
new file mode 100644
index 0000000..9a99c5a
--- /dev/null
+++ b/package/ctorrent/Config.in
@@ -0,0 +1,14 @@
+comment "ctorrent requires a toolchain with C++ support enabled"
+	depends on !BR2_GCC_CROSS_CXX
+
+config BR2_PACKAGE_CTORRENT
+	bool "ctorrent"
+	depends on BR2_GCC_CROSS_CXX
+	default n
+	help
+	  CTorrent is a BitTorrent client implemented in C++
+	  to be lightweight and quick.
+	  http://ctorrent.sourceforge.net/
+
+	  This is the enhanced version from
+	  http://www.rahul.net/dholmes/ctorrent/
diff --git a/package/ctorrent/ctorrent.mk b/package/ctorrent/ctorrent.mk
new file mode 100644
index 0000000..2560881
--- /dev/null
+++ b/package/ctorrent/ctorrent.mk
@@ -0,0 +1,11 @@
+#############################################################
+#
+# enhanced ctorrent
+#
+#############################################################
+CTORRENT_VERSION:=dnh3.3.2
+CTORRENT_SOURCE:=ctorrent-$(CTORRENT_VERSION).tar.gz
+CTORRENT_SITE:=http://www.rahul.net/dholmes/ctorrent/
+CTORRENT_CONF_OPT:=--with-ssl=no
+
+$(eval $(call AUTOTARGETS,package,ctorrent))
-- 
1.5.4.3
