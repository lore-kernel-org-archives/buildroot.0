From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Tue,  8 Mar 2016 10:14:24 -0300
Subject: [Buildroot] [PATCH] nload: new package
Message-ID: <1457442864-32020-1-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
---
 package/Config.in        |  1 +
 package/nload/Config.in  | 16 ++++++++++++++++
 package/nload/nload.hash |  3 +++
 package/nload/nload.mk   | 13 +++++++++++++
 4 files changed, 33 insertions(+)
 create mode 100644 package/nload/Config.in
 create mode 100644 package/nload/nload.hash
 create mode 100644 package/nload/nload.mk

diff --git a/package/Config.in b/package/Config.in
index cd46c36..4d7b18c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1440,6 +1440,7 @@ endif
 	source "package/nginx/Config.in"
 	source "package/ngircd/Config.in"
 	source "package/ngrep/Config.in"
+	source "package/nload/Config.in"
 	source "package/nmap/Config.in"
 	source "package/noip/Config.in"
 	source "package/ntp/Config.in"
diff --git a/package/nload/Config.in b/package/nload/Config.in
new file mode 100644
index 0000000..68ddbe6
--- /dev/null
+++ b/package/nload/Config.in
@@ -0,0 +1,16 @@
+comment "nload needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
+
+config BR2_PACKAGE_NLOAD
+	bool "nload"
+	depends on BR2_INSTALL_LIBSTDCPP
+	select BR2_PACKAGE_NCURSES
+	select BR2_PACKAGE_NCURSES_TARGET_FORM
+	help
+	  nload is a console application which monitors network traffic
+	  and bandwidth usage in real time. It visualizes the in- and
+	  outgoing traffic using two graphs and provides additional info
+	  like total amount of transfered data and min/max network
+	  usage.
+
+	  http://www.roland-riegel.de/nload/
diff --git a/package/nload/nload.hash b/package/nload/nload.hash
new file mode 100644
index 0000000..4a8a09d
--- /dev/null
+++ b/package/nload/nload.hash
@@ -0,0 +1,3 @@
+# From https://sourceforge.net/projects/nload/files/nload/0.7.4/
+md5	3c733c528f244ca5a4f76bf185729c39	nload-0.7.4.tar.gz
+sha1	bb0a168c93c588ad4fd5e3a653b3620b79ada1e8	nload-0.7.4.tar.gz
diff --git a/package/nload/nload.mk b/package/nload/nload.mk
new file mode 100644
index 0000000..1ead61c
--- /dev/null
+++ b/package/nload/nload.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# nload
+#
+################################################################################
+
+NLOAD_VERSION = 0.7.4
+NLOAD_SITE = http://www.roland-riegel.de/nload
+NLOAD_DEPENDENCIES = ncurses
+NLOAD_LICENSE = GPLv2+
+NLOAD_LICENSE_FILES = COPYING
+
+$(eval $(autotools-package))
-- 
2.4.10
