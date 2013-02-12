From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Tue, 12 Feb 2013 12:21:26 +0100
Subject: [Buildroot] [PATCH] lxc: new package
Message-ID: <1360668086-9853-1-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Linux Containers (LXC), provides the ability to group and isolate
of a set of processes in a jail by virtualizing and accounting the
kernel resources. It is similar to Linux-Vserver or Openvz.

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 package/Config.in     |    1 +
 package/lxc/Config.in |    9 +++++++++
 package/lxc/lxc.mk    |   15 +++++++++++++++
 3 files changed, 25 insertions(+)
 create mode 100644 package/lxc/Config.in
 create mode 100644 package/lxc/lxc.mk

diff --git a/package/Config.in b/package/Config.in
index 383a0e0..dfa8bb3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -776,6 +776,7 @@ source "package/cpuload/Config.in"
 source "package/htop/Config.in"
 source "package/keyutils/Config.in"
 source "package/kmod/Config.in"
+source "package/lxc/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/module-init-tools/Config.in"
 endif
diff --git a/package/lxc/Config.in b/package/lxc/Config.in
new file mode 100644
index 0000000..d563b99
--- /dev/null
+++ b/package/lxc/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_LXC
+	bool "lxc"
+	select BR2_PACKAGE_LIBCAP
+	help
+	  Linux Containers (LXC), provides the ability to group and isolate
+	  of a set of processes in a jail by virtualizing and accounting the
+	  kernel resources. It is similar to Linux-Vserver or Openvz.
+
+	  http://lxc.sourceforge.net/
diff --git a/package/lxc/lxc.mk b/package/lxc/lxc.mk
new file mode 100644
index 0000000..d29a622
--- /dev/null
+++ b/package/lxc/lxc.mk
@@ -0,0 +1,15 @@
+#############################################################
+#
+# lxc
+#
+#############################################################
+
+LXC_VERSION = 0.8.0
+LXC_SOURCE = lxc-$(LXC_VERSION).tar.gz
+LXC_SITE = http://downloads.sourceforge.net/project/lxc/lxc/lxc-$(LXC_VERSION)
+LXC_LICENSE = LGPLv2.1+
+LXC_LICENSE_FILES = COPYING
+LXC_DEPENDENCIES = libcap
+LXC_CONF_OPT = --disable-apparmor
+
+$(eval $(autotools-package))
-- 
1.7.9.5
