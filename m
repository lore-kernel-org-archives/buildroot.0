From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri, 14 Oct 2011 09:59:51 +0200
Subject: [Buildroot] [PATCH v2] package: add libfcgi fast cgi library.
In-Reply-To: <20111014083527.26ceb18f@skate>
References: <20111014083527.26ceb18f@skate>
Message-ID: <1318579191-31778-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Rico Bachmann <bachmann@tofwerk.com>

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Rico Bachmann <bachmann@tofwerk.com>
---
Changes v2: corrected indentation of Config.in, removed redundant
arguments of AUTOTARGETS.
---
 package/Config.in          |    1 +
 package/libfcgi/Config.in  |    6 ++++++
 package/libfcgi/libfcgi.mk |   12 ++++++++++++
 3 files changed, 19 insertions(+), 0 deletions(-)
 create mode 100644 package/libfcgi/Config.in
 create mode 100644 package/libfcgi/libfcgi.mk

diff --git a/package/Config.in b/package/Config.in
index 7dc8887..76c89c7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -327,6 +327,7 @@ source "package/libcgicc/Config.in"
 source "package/libcurl/Config.in"
 source "package/libdnet/Config.in"
 source "package/libeXosip2/Config.in"
+source "package/libfcgi/Config.in"
 source "package/libidn/Config.in"
 source "package/libmicrohttpd/Config.in"
 source "package/neon/Config.in"
diff --git a/package/libfcgi/Config.in b/package/libfcgi/Config.in
new file mode 100644
index 0000000..a2f448b
--- /dev/null
+++ b/package/libfcgi/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_LIBFCGI
+    bool "libfcgi"
+    help
+        This is a fastcgi developer library for C/C++
+        http://www.fastcgi.com/
+
diff --git a/package/libfcgi/libfcgi.mk b/package/libfcgi/libfcgi.mk
new file mode 100644
index 0000000..72bbf9a
--- /dev/null
+++ b/package/libfcgi/libfcgi.mk
@@ -0,0 +1,12 @@
+##############################################################################
+#
+# libfcgi
+#
+##############################################################################
+LIBFCGI_VERSION = 2.4.0
+LIBFCGI_SOURCE = fcgi-$(LIBFCGI_VERSION).tar.gz
+LIBFCGI_SITE = http://www.fastcgi.com/dist
+LIBFCGI_INSTALL_STAGING = YES
+LIBFCGI_CONF_ENV = LDFLAGS="$(TARGET_LDFLAGS) -lm"
+
+$(eval $(call AUTOTARGETS,package,libfcgi))
-- 
1.7.7
