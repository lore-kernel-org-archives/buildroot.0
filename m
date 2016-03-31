From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 31 Mar 2016 21:17:41 +0200
Subject: [Buildroot] [git commit] nload: new package
Message-ID: <20160331192315.9E4ED81D87@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=46594d59aba5fe8e861b22b1e364bd246e8361e3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in        |  1 +
 package/nload/Config.in  | 16 ++++++++++++++++
 package/nload/nload.hash |  3 +++
 package/nload/nload.mk   | 13 +++++++++++++
 4 files changed, 33 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 234d105..7b23519 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1449,6 +1449,7 @@ endif
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
