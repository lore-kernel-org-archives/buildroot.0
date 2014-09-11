From: David Bachelart <david.bachelart@bbright.com>
Date: Thu, 11 Sep 2014 09:43:57 +0200
Subject: [Buildroot] [v2 1/1] dos2unix: new package
Message-ID: <1410421438-9694-1-git-send-email-david.bachelart@bbright.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: David Bachelart <david.bachelart@bbright.com>
---
 package/Config.in.host          |    1 +
 package/dos2unix/Config.in.host |    6 ++++++
 package/dos2unix/dos2unix.mk    |   23 +++++++++++++++++++++++
 3 files changed, 30 insertions(+)
 create mode 100644 package/dos2unix/Config.in.host
 create mode 100644 package/dos2unix/dos2unix.mk

diff --git a/package/Config.in.host b/package/Config.in.host
index e05bbfa..2c88c0b 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -1,6 +1,7 @@
 menu "Host utilities"
 
 	source "package/dfu-util/Config.in.host"
+	source "package/dos2unix/Config.in.host"
 	source "package/dosfstools/Config.in.host"
 	source "package/e2fsprogs/Config.in.host"
 	source "package/e2tools/Config.in.host"
diff --git a/package/dos2unix/Config.in.host b/package/dos2unix/Config.in.host
new file mode 100644
index 0000000..946271b
--- /dev/null
+++ b/package/dos2unix/Config.in.host
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_HOST_DOS2UNIX
+  bool "host dos2unix"
+  help
+    dos2unix converts text file line endings between CRLF and LF
+
+    http://freshmeat.net/projects/dos2unix
diff --git a/package/dos2unix/dos2unix.mk b/package/dos2unix/dos2unix.mk
new file mode 100644
index 0000000..ad47e61
--- /dev/null
+++ b/package/dos2unix/dos2unix.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# dos2unix
+#
+################################################################################
+
+DOS2UNIX_VERSION = 6.0.6
+DOS2UNIX_SITE = http://waterlan.home.xs4all.nl/dos2unix/
+
+DOS2UNIX_LICENSE = BSD-2c
+DOS2UNIX_LICENSE_FILES = COPYING.txt
+
+define HOST_DOS2UNIX_BUILD_CMDS
+  $(HOST_CONFIGURE_OPTS) \
+	make -C $(@D)
+endef
+
+define HOST_DOS2UNIX_INSTALL_CMDS
+  $(HOST_CONFIGURE_OPTS) \
+	make -C $(@D) install DESTDIR=$(HOST_DIR)
+endef
+
+$(eval $(host-generic-package))
-- 
1.7.10.4
