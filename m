From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 3 Nov 2012 11:48:34 +0100
Subject: [Buildroot] [git commit] gdbm: new package
Message-ID: <20121103161143.EF55499A31@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e0cf9e86b92a831adfadb97baa3919039a3e5669
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in      |    1 +
 package/gdbm/Config.in |    8 ++++++++
 package/gdbm/gdbm.mk   |   12 ++++++++++++
 3 files changed, 21 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 684ceec..a4f75c9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -345,6 +345,7 @@ endmenu
 
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
