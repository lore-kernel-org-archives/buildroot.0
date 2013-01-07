From: Anthony Viallard <viallard@syscom-instruments.com>
Date: Mon,  7 Jan 2013 14:30:13 +0100
Subject: [Buildroot] [PATCH 1/5] gnuplot : new package
Message-ID: <1357565417-16782-1-git-send-email-viallard@syscom-instruments.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Create a package for gnuplot (a portable command-line driven graphing utility)

Signed-off-by: Anthony Viallard <viallard@syscom-instruments.com>
---
 package/Config.in             |    1 +
 package/gnuplot/Config.in     |    7 +++++++
 package/gnuplot/gnuplot.mk    |   13 +++++++++++++
 3 files changed, 21 insertions(+), 0 deletion(-)
 create mode 100644 package/gnuplot/Config.in
 create mode 100644 package/gnuplot/gnuplot.mk

diff --git a/package/Config.in b/package/Config.in
index b312a3e..2633997 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -70,6 +70,7 @@ endif
 source "toolchain/gcc/Config.in.2"
 source "package/gettext/Config.in"
 source "package/gmp/Config.in"
+source "package/gnuplot/Config.in"
 source "package/gperf/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/grep/Config.in"
diff --git a/package/gnuplot/Config.in b/package/gnuplot/Config.in
new file mode 100644
index 0000000..281bb65
--- /dev/null
+++ b/package/gnuplot/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_GNUPLOT
+	bool "gnuplot"
+	help
+	  A portable command-line driven graphing utility.
+
+	  http://www.gnuplot.info/
+
diff --git a/package/gnuplot/gnuplot.mk b/package/gnuplot/gnuplot.mk
new file mode 100644
index 0000000..2f05624
--- /dev/null
+++ b/package/gnuplot/gnuplot.mk
@@ -0,0 +1,13 @@
+#############################################################
+#
+# gnuplot
+#
+#############################################################
+GNUPLOT_VERSION = 4.6.0
+GNUPLOT_SOURCE = gnuplot-$(GNUPLOT_VERSION).tar.gz
+GNUPLOT_SITE = http://superb-dca2.dl.sourceforge.net/project/gnuplot/gnuplot/$(GNUPLOT_VERSION)
+GNUPLOT_INSTALL_STAGING = YES
+GNUPLOT_INSTALL_TARGET = YES
+GNUPLOT_CONF_OPT = 
+
+$(eval $(autotools-package))
-- 
1.7.10.4
