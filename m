From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 21 Apr 2011 11:52:33 +0200
Subject: [Buildroot] [git commit] New package: bwm-ng
Message-ID: <20110421095712.5224082908@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=c5aee2a346d27ab8197ab3f7fb37e1b18a9868d1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add new package: bwm-ng

Bandwidth Monitor NG is a small and console-based live network and
disk-io bandwidth monitor for Linux, BSD, Solaris, Mac OS X and others.

[Peter: move to net, fix Config.in line length, remove unused make var]
Signed-off-by: Kelvin Cheung <keguang.zhang@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in        |    1 +
 package/bwm-ng/Config.in |    8 ++++++++
 package/bwm-ng/bwm-ng.mk |   16 ++++++++++++++++
 3 files changed, 25 insertions(+), 0 deletions(-)
 create mode 100644 package/bwm-ng/Config.in
 create mode 100644 package/bwm-ng/bwm-ng.mk

diff --git a/package/Config.in b/package/Config.in
index ce39edd..76b2076 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -373,6 +373,7 @@ endif
 source "package/bind/Config.in"
 source "package/bmon/Config.in"
 source "package/bridge-utils/Config.in"
+source "package/bwm-ng/Config.in"
 source "package/can-utils/Config.in"
 source "package/ctorrent/Config.in"
 source "package/cups/Config.in"
diff --git a/package/bwm-ng/Config.in b/package/bwm-ng/Config.in
new file mode 100644
index 0000000..25e7cbe
--- /dev/null
+++ b/package/bwm-ng/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_BWM_NG
+	bool "bwm-ng"
+	help
+	  Bandwidth Monitor NG is a small and console-based live
+	  network and disk-io bandwidth monitor for Linux, BSD,
+	  Solaris, Mac OS X and others.
+
+	  http://sourceforge.net/projects/bwmng/
diff --git a/package/bwm-ng/bwm-ng.mk b/package/bwm-ng/bwm-ng.mk
new file mode 100644
index 0000000..a33f4f2
--- /dev/null
+++ b/package/bwm-ng/bwm-ng.mk
@@ -0,0 +1,16 @@
+#############################################################
+#
+# bwm-ng
+#
+#############################################################
+
+BWM_NG_VERSION = 0.6
+BWM_NG_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/bwmng/bwmng/$(BWM_NG_VERSION)/
+BWM_NG_CONF_OPT = --with-procnetdev --with-diskstats
+
+ifeq ($(BR2_PACKAGE_NCURSES),y)
+BWM_NG_CONF_OPT += --with-ncurses
+BWM_NG_DEPENDENCIES += ncurses
+endif
+
+$(eval $(call AUTOTARGETS,package,bwm-ng))
-- 
1.7.3.4
