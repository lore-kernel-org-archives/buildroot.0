From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 30 May 2013 23:02:54 +0200
Subject: [Buildroot] [git commit] package/snappy: new package
Message-ID: <20130602212116.4234D9A6A7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=164b90649b4f34c3e7cd1b6ded46c921db4fc2f1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: needs C++ support]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in        |    1 +
 package/snappy/Config.in |   13 +++++++++++++
 package/snappy/snappy.mk |   13 +++++++++++++
 3 files changed, 27 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 428aaba..4233ff2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -386,6 +386,7 @@ endmenu
 menu "Compression and decompression"
 source "package/libarchive/Config.in"
 source "package/lzo/Config.in"
+source "package/snappy/Config.in"
 source "package/zlib/Config.in"
 endmenu
 
diff --git a/package/snappy/Config.in b/package/snappy/Config.in
new file mode 100644
index 0000000..36093bc
--- /dev/null
+++ b/package/snappy/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_SNAPPY
+	bool "snappy"
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  Snappy is a compression/decompression library. It does not aim for
+	  maximum compression, or compatibility with any other compression
+	  library; instead, it aims for very high speeds and reasonable
+	  compression.
+
+	  http://code.google.com/p/snappy/
+
+comment "snappy requires a toolchain with C++ support"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/snappy/snappy.mk b/package/snappy/snappy.mk
new file mode 100644
index 0000000..2704b97
--- /dev/null
+++ b/package/snappy/snappy.mk
@@ -0,0 +1,13 @@
+#############################################################
+#
+# snappy
+#
+#############################################################
+
+SNAPPY_VERSION		= 1.1.0
+SNAPPY_SITE		= http://snappy.googlecode.com/files/
+SNAPPY_LICENSE		= BSD-3c
+SNAPPY_LICENSE_FILES	= COPYING
+SNAPPY_INSTALL_STAGING	= YES
+
+$(eval $(autotools-package))
