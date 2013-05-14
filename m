From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 14 May 2013 23:45:59 +0200
Subject: [Buildroot] [PATCH 3/3] package/snappy: new package
In-Reply-To: <cover.1368567696.git.yann.morin.1998@free.fr>
References: <cover.1368567696.git.yann.morin.1998@free.fr>
Message-ID: <593d227bcb531b484e9a613baee53d3acaf9370b.1368567696.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/Config.in        |  1 +
 package/snappy/Config.in |  9 +++++++++
 package/snappy/snappy.mk | 13 +++++++++++++
 3 files changed, 23 insertions(+)
 create mode 100644 package/snappy/Config.in
 create mode 100644 package/snappy/snappy.mk

diff --git a/package/Config.in b/package/Config.in
index 828b5b5..51e9f93 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -383,6 +383,7 @@ endmenu
 menu "Compression and decompression"
 source "package/libarchive/Config.in"
 source "package/lzo/Config.in"
+source "package/snappy/Config.in"
 source "package/zlib/Config.in"
 endmenu
 
diff --git a/package/snappy/Config.in b/package/snappy/Config.in
new file mode 100644
index 0000000..62136ca
--- /dev/null
+++ b/package/snappy/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_SNAPPY
+	bool "snappy"
+	help
+	  Snappy is a compression/decompression library. It does not aim for
+	  maximum compression, or compatibility with any other compression
+	  library; instead, it aims for very high speeds and reasonable
+	  compression.
+
+	  http://code.google.com/p/snappy/
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
-- 
1.8.1.2
