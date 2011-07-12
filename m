From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 12 Jul 2011 22:49:07 +0200
Subject: [Buildroot] [git commit] package: add libargtable2
Message-ID: <20110712205024.6237C8A483@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=f1ebbb3df9d6ec1405e19244c81ca4c852bf3c34
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The argtable2 sourceforge project provides easy parsing of command line
options and file contents.

[Peter: Misc cleanup/fixes]
Signed-off-by: Robin Holt <holt@sgi.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                    |    1 +
 package/libargtable2/Config.in       |    7 +++++++
 package/libargtable2/libargtable2.mk |   17 +++++++++++++++++
 3 files changed, 25 insertions(+), 0 deletions(-)
 create mode 100644 package/libargtable2/Config.in
 create mode 100644 package/libargtable2/libargtable2.mk

diff --git a/package/Config.in b/package/Config.in
index aef701d..55ea343 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -333,6 +333,7 @@ source "package/libupnp/Config.in"
 endmenu
 
 menu "Other"
+source "package/libargtable2/Config.in"
 source "package/argp-standalone/Config.in"
 source "package/libatomic_ops/Config.in"
 source "package/libcap/Config.in"
diff --git a/package/libargtable2/Config.in b/package/libargtable2/Config.in
new file mode 100644
index 0000000..42d067b
--- /dev/null
+++ b/package/libargtable2/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LIBARGTABLE2
+	bool "libargtable2"
+	help
+	  A greatly simplified and yet quite robust argument parsing
+	  set of library calls.
+
+	  http://argtable.sourceforge.net/
diff --git a/package/libargtable2/libargtable2.mk b/package/libargtable2/libargtable2.mk
new file mode 100644
index 0000000..57eb629
--- /dev/null
+++ b/package/libargtable2/libargtable2.mk
@@ -0,0 +1,17 @@
+#############################################################
+#
+# libargtable2
+#
+#############################################################
+
+LIBARGTABLE2_VERSION = 13
+LIBARGTABLE2_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/argtable/
+
+LIBARGTABLE2_INSTALL_STAGING = YES
+LIBARGTABLE2_CONF_OPT= --program-prefix="" \
+		--disable-example \
+		--disable-kernel-module \
+		--enable-lib \
+		--enable-util
+
+$(eval $(call AUTOTARGETS,package,libargtable2))
-- 
1.7.3.4
