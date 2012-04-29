From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 29 Apr 2012 20:37:58 +0200
Subject: [Buildroot] [git commit] package: add libfcgi fast cgi library.
Message-ID: <20120429184038.3FADF96BFF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c34d753008aa174e700413eeaf070ff382efe02b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Rico Bachmann <bachmann@tofwerk.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in          |    1 +
 package/libfcgi/Config.in  |    6 ++++++
 package/libfcgi/libfcgi.mk |   12 ++++++++++++
 3 files changed, 19 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 4dcae53..2ea334a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -359,6 +359,7 @@ source "package/libcurl/Config.in"
 source "package/libdnet/Config.in"
 source "package/libesmtp/Config.in"
 source "package/libeXosip2/Config.in"
+source "package/libfcgi/Config.in"
 source "package/libidn/Config.in"
 source "package/liboauth/Config.in"
 source "package/libmicrohttpd/Config.in"
diff --git a/package/libfcgi/Config.in b/package/libfcgi/Config.in
new file mode 100644
index 0000000..a622ec3
--- /dev/null
+++ b/package/libfcgi/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_LIBFCGI
+	bool "libfcgi"
+	help
+	  FCGI, a fastcgi developer library for C/C++
+
+	  http://www.fastcgi.com/
diff --git a/package/libfcgi/libfcgi.mk b/package/libfcgi/libfcgi.mk
new file mode 100644
index 0000000..4625165
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
+$(eval $(call AUTOTARGETS))
