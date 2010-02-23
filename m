From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Feb 2010 21:27:28 +0100
Subject: [Buildroot] [git commit master] intltool: new package
Message-ID: <20100223202928.F09B7776A1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=570e1b77c285be7b19d0be3dda27853b06b58ae8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This XML internationalization set of tools is required to build
several of our packages, and may not be available on the host machine.

Only the host variant has been tested.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in            |    1 +
 package/intltool/Config.in   |    6 ++++++
 package/intltool/intltook.mk |   16 ++++++++++++++++
 3 files changed, 23 insertions(+), 0 deletions(-)
 create mode 100644 package/intltool/Config.in
 create mode 100644 package/intltool/intltook.mk

diff --git a/package/Config.in b/package/Config.in
index 00f3401..37cae2e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -46,6 +46,7 @@ source "package/pkg-config/Config.in"
 source "package/readline/Config.in"
 source "package/valgrind/Config.in"
 source "package/pcre/Config.in"
+source "package/intltool/Config.in"
 
 comment "Other stuff"
 source "package/at/Config.in"
diff --git a/package/intltool/Config.in b/package/intltool/Config.in
new file mode 100644
index 0000000..94b34f7
--- /dev/null
+++ b/package/intltool/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_INTLTOOL
+       bool "intltool"
+       help
+         Utility scripts for internationalizing XML
+
+	 http://www.freedesktop.org/wiki/Software/intltool
\ No newline at end of file
diff --git a/package/intltool/intltook.mk b/package/intltool/intltook.mk
new file mode 100644
index 0000000..746ebb1
--- /dev/null
+++ b/package/intltool/intltook.mk
@@ -0,0 +1,16 @@
+#############################################################
+#
+# intltool
+#
+#############################################################
+INTLTOOL_VERSION:=0.40.6
+INTLTOOL_SOURCE:=intltool-$(INTLTOOL_VERSION).tar.bz2
+INTLTOOL_SITE:=http://ftp.acc.umu.se/pub/GNOME/sources/intltool/0.40/
+
+HOST_INTLTOOL_DEPENDENCIES = host-libxml-parser-perl
+HOST_INTLTOOL_CONF_OPT = \
+  PERLLIB=$(HOST_DIR)/usr/lib/perl
+
+$(eval $(call AUTOTARGETS,package,intltool))
+$(eval $(call AUTOTARGETS,package,intltool,host))
+
-- 
1.6.3.3
