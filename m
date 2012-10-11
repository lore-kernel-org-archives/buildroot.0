From: Alexander Varnin <fenixk19@mail.ru>
Date: Thu, 11 Oct 2012 13:34:26 +0400
Subject: [Buildroot] [PATCH] New package liblog4c-localtime
Message-ID: <1349948066-12255-1-git-send-email-fenixk19@mail.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Alexander Varnin <fenixk19@mail.ru>
---
 package/Config.in                                |    1 +
 package/liblog4c-localtime/Config.in             |   10 ++++++++++
 package/liblog4c-localtime/liblog4c-localtime.mk |   18 ++++++++++++++++++
 3 files changed, 29 insertions(+), 0 deletions(-)
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
index 0000000..5e9b863
--- /dev/null
+++ b/package/liblog4c-localtime/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_LIBLOG4C_LOCALTIME
+	bool "liblog4c-localtime"
+	help
+	  Log4c is a library of C for flexible logging to files, syslog 
+	  and other destinations.
+	  This version is with localtime patch, to make lib show times in
+	  local timezone.
+
+	  https://github.com/rcmadruga/log4c-localtime
+          http://log4c.sourceforge.net/
diff --git a/package/liblog4c-localtime/liblog4c-localtime.mk b/package/liblog4c-localtime/liblog4c-localtime.mk
new file mode 100644
index 0000000..0aedec8
--- /dev/null
+++ b/package/liblog4c-localtime/liblog4c-localtime.mk
@@ -0,0 +1,18 @@
+ #############################################################
+ #
+ # liblog4c
+ #
+ #############################################################
+ LIBLOG4C_LOCALTIME_VERSION = 1.0
+ LIBLOG4C_LOCALTIME_SITE    = https://github.com/rcmadruga/log4c-localtime/tarball/v$(LIBLOG4C_LOCALTIME_VERSION) 
+ LIBLOG4C_LOCALTIME_INSTALL_STAGING = YES
+ LIBLOG4C_LOCALTIME_CONF_OPT = --disable-expattest
+ LIBLOG4C_LOCALTIME_DEPENDENCIES = expat
+
+ define LIBLOG4C_LOCALTIME_HOOK
+   chmod +x $(@D)/configure
+ endef
+
+ LIBLOG4C_LOCALTIME_PRE_CONFIGURE_HOOKS += LIBLOG4C_LOCALTIME_HOOK
+
+ $(eval $(autotools-package))
-- 
1.7.2.5
