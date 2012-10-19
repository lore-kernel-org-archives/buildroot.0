From: Will Newton <will.newton@gmail.com>
Date: Fri, 19 Oct 2012 14:05:17 +0100
Subject: [Buildroot] [PATCH] package/time: New package for GNU time.
Message-ID: <CAFbHwiRDGH0W+eRMGGui4gA+_iRhSYtHc2dhHwPDYf9uvqF5-w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Will Newton <will.newton@imgtec.com>
---
 package/Config.in      |    1 +
 package/time/Config.in |    6 ++++++
 package/time/time.mk   |   17 +++++++++++++++++
 3 files changed, 24 insertions(+), 0 deletions(-)
 create mode 100644 package/time/Config.in
 create mode 100644 package/time/time.mk

diff --git a/package/Config.in b/package/Config.in
index d7b3db6..dd4c97e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -672,6 +672,7 @@ source "package/logsurfer/Config.in"
 source "package/screen/Config.in"
 source "package/sudo/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+source "package/time/Config.in"
 source "package/which/Config.in"
 endif
 source "package/xmlstarlet/Config.in"
diff --git a/package/time/Config.in b/package/time/Config.in
new file mode 100644
index 0000000..634d41a
--- /dev/null
+++ b/package/time/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_TIME
+	bool "time"
+	help
+	  The GNU time utility.
+
+	  http://savannah.gnu.org/projects/time/
diff --git a/package/time/time.mk b/package/time/time.mk
new file mode 100644
index 0000000..7b53286
--- /dev/null
+++ b/package/time/time.mk
@@ -0,0 +1,17 @@
+#############################################################
+#
+# time
+#
+#############################################################
+
+TIME_VERSION = 1.7
+TIME_SITE = $(BR2_GNU_MIRROR)/time
+TIME_CONF_ENV = ac_cv_func_wait3=yes
+
+# time uses an old version of automake that does not support
+# installing in DESTDIR.
+define TIME_INSTALL_TARGET_CMDS
+	install -D -m 755  $(@D)/time $(TARGET_DIR)/usr/bin/time
+endef
+
+$(eval $(autotools-package))
-- 
1.7.1
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001-package-time-New-package-for-GNU-time.patch
Type: application/octet-stream
Size: 1834 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121019/6da76e07/attachment-0001.obj>
