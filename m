From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 26 Apr 2013 22:12:13 +0200
Subject: [Buildroot] [git commit] jansson: new package
Message-ID: <20130426201846.EB3C39B86B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5cae3e8af0fe62e51e4fc675c566501f2bfd1cc2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in          |    1 +
 package/jansson/Config.in  |    7 +++++++
 package/jansson/jansson.mk |   12 ++++++++++++
 3 files changed, 20 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index ede0ba0..0b095d4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -618,6 +618,7 @@ menu "JSON/XML"
 source "package/cjson/Config.in"
 source "package/expat/Config.in"
 source "package/ezxml/Config.in"
+source "package/jansson/Config.in"
 source "package/json-c/Config.in"
 source "package/json-glib/Config.in"
 source "package/libroxml/Config.in"
diff --git a/package/jansson/Config.in b/package/jansson/Config.in
new file mode 100644
index 0000000..960a7c4
--- /dev/null
+++ b/package/jansson/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_JANSSON
+	bool "jansson"
+	help
+	  Jansson is a C library for encoding, decoding and manipulating JSON
+	  data.
+
+	  http://www.digip.org/jansson/
diff --git a/package/jansson/jansson.mk b/package/jansson/jansson.mk
new file mode 100644
index 0000000..c7183df
--- /dev/null
+++ b/package/jansson/jansson.mk
@@ -0,0 +1,12 @@
+#############################################################
+#
+# jansson
+#
+#############################################################
+JANSSON_VERSION = 2.4
+JANSSON_SITE = http://www.digip.org/jansson/releases
+JANSSON_LICENSE = MIT
+JANSSON_LICENSE_FILES = LICENSE
+JANSSON_INSTALL_STAGING = YES
+
+$(eval $(autotools-package))
