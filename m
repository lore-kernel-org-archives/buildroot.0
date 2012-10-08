From: Alexander Varnin <fenixk19@mail.ru>
Date: Mon,  8 Oct 2012 10:56:54 +0400
Subject: [Buildroot] [PATCH] New package liblog4c-localtime
Message-ID: <1349679414-2967-1-git-send-email-fenixk19@mail.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/Config.in                                |    1 +
 package/liblog4c-localtime/Config.in             |    9 +++++++++
 package/liblog4c-localtime/liblog4c-localtime.mk |   17 +++++++++++++++++
 3 files changed, 27 insertions(+), 0 deletions(-)
 create mode 100644 package/liblog4c-localtime/Config.in
 create mode 100644 package/liblog4c-localtime/liblog4c-localtime.mk

diff --git a/package/Config.in b/package/Config.in
index 8a7c9c4..25752e5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -387,6 +387,7 @@ source "package/lttng-libust/Config.in"
 source "package/orc/Config.in"
 source "package/poco/Config.in"
 source "package/startup-notification/Config.in"
+source "package/liblog4c-localtime/Config.in"
 endmenu
 
 menu "Text and terminal handling"
diff --git a/package/liblog4c-localtime/Config.in b/package/liblog4c-localtime/Config.in
new file mode 100644
index 0000000..68feab5
--- /dev/null
+++ b/package/liblog4c-localtime/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_LIBLOG4C_LOCALTIME
+	bool "liblog4c-localtime"
+	help
+	  Log4c is a library of C for flexible logging to files, syslog 
+	  and other destinations.
+	  This version is with localtime patch, to make lib show times in
+	  local timezone.
+
+	  https://github.com/rcmadruga/log4c-localtime
diff --git a/package/liblog4c-localtime/liblog4c-localtime.mk b/package/liblog4c-localtime/liblog4c-localtime.mk
new file mode 100644
index 0000000..9936759
--- /dev/null
+++ b/package/liblog4c-localtime/liblog4c-localtime.mk
@@ -0,0 +1,17 @@
+ #############################################################
+ #
+ # liblog4c
+ #
+ #############################################################
+ LIBLOG4C_LOCALTIME_VERSION = 6b92bb84dad6f3f1a7cb97035e45f87bce5fa158
+ LIBLOG4C_LOCALTIME_SITE = git://github.com/rcmadruga/log4c-localtime.git
+ LIBLOG4C_LOCALTIME_INSTALL_STAGING = YES 
+
+ define LIBLOG4C_LOCALTIME_HOOK
+   chmod +x $(@D)/configure
+ endef
+
+ LIBLOG4C_LOCALTIME_PRE_CONFIGURE_HOOKS += LIBLOG4C_LOCALTIME_HOOK
+
+ $(eval $(autotools-package))
+
-- 
1.7.2.5
