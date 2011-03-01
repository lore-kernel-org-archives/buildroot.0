From: Martin Hicks <mort@bork.org>
Date: Tue,  1 Mar 2011 09:34:23 -0500
Subject: [Buildroot] [PATCH] Add package libnfsidmap
In-Reply-To: <1298990065-648-1-git-send-email-mort@bork.org>
References: <1298990065-648-1-git-send-email-mort@bork.org>
Message-ID: <1298990065-648-2-git-send-email-mort@bork.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Needed for NFSv4 support in nfs-utils

Signed-off-by: Martin Hicks <mort@bork.org>
---
 package/Config.in                  |    1 +
 package/libnfsidmap/Config.in      |    6 ++++++
 package/libnfsidmap/libnfsidmap.mk |   11 +++++++++++
 3 files changed, 18 insertions(+), 0 deletions(-)
 create mode 100644 package/libnfsidmap/Config.in
 create mode 100644 package/libnfsidmap/libnfsidmap.mk

diff --git a/package/Config.in b/package/Config.in
index 1b8eace..8690d95 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -314,6 +314,7 @@ source "package/libeXosip2/Config.in"
 source "package/libidn/Config.in"
 source "package/libmicrohttpd/Config.in"
 source "package/neon/Config.in"
+source "package/libnfsidmap/Config.in"
 source "package/libnl/Config.in"
 source "package/libpcap/Config.in"
 source "package/libosip2/Config.in"
diff --git a/package/libnfsidmap/Config.in b/package/libnfsidmap/Config.in
new file mode 100644
index 0000000..686401e
--- /dev/null
+++ b/package/libnfsidmap/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_LIBNFSIDMAP
+	bool "libnfsidmap"
+	help
+	  Library used by the NFSv4 server to do userid mapping.
+
+	  http://www.citi.umich.edu/projects/nfsv4/linux/libnfsidmap/
diff --git a/package/libnfsidmap/libnfsidmap.mk b/package/libnfsidmap/libnfsidmap.mk
new file mode 100644
index 0000000..bbdd65d
--- /dev/null
+++ b/package/libnfsidmap/libnfsidmap.mk
@@ -0,0 +1,11 @@
+#
+# libnfsidmap
+#
+LIBNFSIDMAP_VERSION = 0.24
+LIBNFSIDMAP_SOURCE = libnfsidmap-$(LIBNFSIDMAP_VERSION).tar.gz
+LIBNFSIDMAP_SITE = http://www.citi.umich.edu/projects/nfsv4/linux/libnfsidmap
+
+LIBNFSIDMAP_INSTALL_TARGET = YES
+LIBNFSIDMAP_INSTALL_STAGING = YES
+
+$(eval $(call AUTOTARGETS,package,libnfsidmap))
-- 
1.5.6.5
