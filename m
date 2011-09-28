From: Rico Bachmann <bachmann@tofwerk.com>
Date: Wed, 28 Sep 2011 16:13:20 +0200
Subject: [Buildroot] [PATCH] add libfcgi to buildroot it will have compiling
	errors as long as -lm isnt added to the buildsystem of libfcgi
In-Reply-To: <add fcgi-2.4.0 package to buildroot>
References: <add fcgi-2.4.0 package to buildroot>
Message-ID: <1317219200-4655-1-git-send-email-bachmann@tofwerk.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Rico Bachmann <bachmann@tofwerk.com>
---
 package/Config.in          |    1 +
 package/libfcgi/Config.in  |    5 +++++
 package/libfcgi/libfcgi.mk |   13 +++++++++++++
 3 files changed, 19 insertions(+), 0 deletions(-)
 create mode 100755 package/libfcgi/Config.in
 create mode 100755 package/libfcgi/libfcgi.mk

diff --git a/package/Config.in b/package/Config.in
index 3d04056..56bb992 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -325,6 +325,7 @@ source "package/libcgicc/Config.in"
 source "package/libcurl/Config.in"
 source "package/libdnet/Config.in"
 source "package/libeXosip2/Config.in"
+source "package/libfcgi/Config.in"
 source "package/libidn/Config.in"
 source "package/libmicrohttpd/Config.in"
 source "package/neon/Config.in"
diff --git a/package/libfcgi/Config.in b/package/libfcgi/Config.in
new file mode 100755
index 0000000..169c6f2
--- /dev/null
+++ b/package/libfcgi/Config.in
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_LIBFCGI
+    bool "libfcgi"
+    help
+        fastcgi developerslibrary
+        http://www.fastcgi.com/
diff --git a/package/libfcgi/libfcgi.mk b/package/libfcgi/libfcgi.mk
new file mode 100755
index 0000000..e338f29
--- /dev/null
+++ b/package/libfcgi/libfcgi.mk
@@ -0,0 +1,13 @@
+##############################################################################
+#
+# libfcgi
+#
+##############################################################################
+LIBFCGI_VERSION = 2.4.0
+LIBFCGI_SOURCE = fcgi-$(LIBFCGI_VERSION).tar.gz
+LIBFCGI_SITE = http://www.fastcgi.com/dist
+LIBFCGI_INSTALL_STAGING = YES
+LIBFCGI_INSTALL_TARGET = YES
+LIBFCGI_CONF_OPT = --enable-shared
+
+$(eval $(call AUTOTARGETS,package,libfcgi))
-- 
1.7.2.5
