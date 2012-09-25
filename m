From: Francois Perrad <fperrad@gmail.com>
Date: Tue, 25 Sep 2012 19:18:21 +0200
Subject: [Buildroot] [PATCH v8 05/11] gdbm: new package
In-Reply-To: <1348593508-14254-1-git-send-email-francois.perrad@gadz.org>
References: <1348593508-14254-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1348593508-14254-5-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/Config.in      |    1 +
 package/gdbm/Config.in |    8 ++++++++
 package/gdbm/gdbm.mk   |   12 ++++++++++++
 3 files changed, 21 insertions(+)
 create mode 100644 package/gdbm/Config.in
 create mode 100644 package/gdbm/gdbm.mk

diff --git a/package/Config.in b/package/Config.in
index 00a79ab..d9cadf9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -324,6 +324,7 @@ endmenu
 
 menu "Database"
 source "package/berkeleydb/Config.in"
+source "package/gdbm/Config.in"
 source "package/mysql_client/Config.in"
 source "package/sqlcipher/Config.in"
 source "package/sqlite/Config.in"
diff --git a/package/gdbm/Config.in b/package/gdbm/Config.in
new file mode 100644
index 0000000..d5aae83
--- /dev/null
+++ b/package/gdbm/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_GDBM
+	bool "gdbm"
+	help
+	  GNU dbm is a set of database routines that use extensible hashing.
+	  It works similar to the standard UNIX dbm routines.
+
+	  http://www.gnu.org/software/gdbm/gdbm.html
+
diff --git a/package/gdbm/gdbm.mk b/package/gdbm/gdbm.mk
new file mode 100644
index 0000000..4971b12
--- /dev/null
+++ b/package/gdbm/gdbm.mk
@@ -0,0 +1,12 @@
+#############################################################
+#
+# gdbm
+#
+#############################################################
+GDBM_VERSION = 1.10
+GDBM_SITE = $(BR2_GNU_MIRROR)/gdbm
+GDBM_LICENSE = GPLv3
+GDBM_LICENSE_FILES = COPYING
+GDBM_INSTALL_STAGING = YES
+
+$(eval $(autotools-package))
-- 
1.7.9.5
