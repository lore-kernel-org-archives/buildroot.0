From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 15 Mar 2014 23:21:43 +0100
Subject: [Buildroot] [git commit] liblogging: new package
Message-ID: <20140315225330.C05EA9BF9F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3bb6a3667b1b3a04a5e91073071d5cf60a01d63f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Clayton Shotwell <clshotwe@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in                |    1 +
 package/liblogging/Config.in     |    8 ++++++++
 package/liblogging/liblogging.mk |   20 ++++++++++++++++++++
 3 files changed, 29 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index f73a558..f9c1b0b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -773,6 +773,7 @@ source "package/libffi/Config.in"
 source "package/libglib2/Config.in"
 source "package/libical/Config.in"
 source "package/liblog4c-localtime/Config.in"
+source "package/liblogging/Config.in"
 source "package/libnspr/Config.in"
 source "package/libpfm4/Config.in"
 source "package/libplist/Config.in"
diff --git a/package/liblogging/Config.in b/package/liblogging/Config.in
new file mode 100644
index 0000000..23c3c1a
--- /dev/null
+++ b/package/liblogging/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_LIBLOGGING
+	bool "liblogging"
+	help
+	  Liblogging is an easy to use library for
+	  logging. It offers an enhanced replacement
+	  for the syslog() call, but retains its ease of use.
+
+	  http://www.liblogging.org/
diff --git a/package/liblogging/liblogging.mk b/package/liblogging/liblogging.mk
new file mode 100644
index 0000000..fa181fb
--- /dev/null
+++ b/package/liblogging/liblogging.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# liblogging
+#
+################################################################################
+
+LIBLOGGING_VERSION = 1.0.2
+LIBLOGGING_SITE = http://download.rsyslog.com/liblogging
+LIBLOGGING_LICENSE = BSD-2c
+LIBLOGGING_LICENSE_FILES = COPYING
+LIBLOGGING_INSTALL_STAGING = YES
+LIBLOGGING_CONF_OPT = --enable-cached-man-pages
+
+ifeq ($(BR2_INIT_SYSTEMD),y)
+LIBLOGGING_CONF_OPT += --enable-journal
+else
+LIBLOGGING_CONF_OPT += --disable-journal
+endif
+
+$(eval $(autotools-package))
