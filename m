From: David Bachelart <david.bachelart@bbright.com>
Date: Mon,  2 Jan 2017 16:45:28 +0100
Subject: [Buildroot] [PATCH v2] throttle: new package
In-Reply-To: <1483371929-13907-1-git-send-email-david.bachelart@bbright.com>
References: <1483371929-13907-1-git-send-email-david.bachelart@bbright.com>
Message-ID: <1483371929-13907-7-git-send-email-david.bachelart@bbright.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Eric Le Bihan <eric.le.bihan.dev@free.fr>

Signed-off-by: David Bachelart <david.bachelart@bbright.com>
---
Changes v1 -> v2:
  - Fix url in .mk file
  - Fix comment in hash file, use MD5 sum from upstream
---
 package/Config.in              |  1 +
 package/throttle/Config.in     |  7 +++++++
 package/throttle/throttle.hash |  3 +++
 package/throttle/throttle.mk   | 12 ++++++++++++
 4 files changed, 23 insertions(+)
 create mode 100644 package/throttle/Config.in
 create mode 100644 package/throttle/throttle.hash
 create mode 100644 package/throttle/throttle.mk

diff --git a/package/Config.in b/package/Config.in
index 59fa851..608ba0c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1768,6 +1768,7 @@ menu "System tools"
 	source "package/systemd-bootchart/Config.in"
 	source "package/sysvinit/Config.in"
 	source "package/tar/Config.in"
+	source "package/throttle/Config.in"
 	source "package/tpm-tools/Config.in"
 	source "package/unscd/Config.in"
 	source "package/util-linux/Config.in"
diff --git a/package/throttle/Config.in b/package/throttle/Config.in
new file mode 100644
index 0000000..30f9308
--- /dev/null
+++ b/package/throttle/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_THROTTLE
+	bool "throttle"
+	help
+	  Throttle copies the standard input to the standard output while limiting
+	  bandwidth to the specified maximum.
+
+	  http://rpms.famillecollet.com/rpmphp/zoom.php?rpm=throttle
diff --git a/package/throttle/throttle.hash b/package/throttle/throttle.hash
new file mode 100644
index 0000000..460b421
--- /dev/null
+++ b/package/throttle/throttle.hash
@@ -0,0 +1,3 @@
+# md5 from http://pkgs.fedoraproject.org/repo/pkgs/throttle/throttle-1.2.tar.gz/md5, sha256 locally calculated
+md5 bb8abf5a9a63ed7d80951f056543a88c    throttle-1.2.tar.gz
+sha256  6d90e4dcd6c604846020d60e82df1576e0a022cb96716a709db4ebfa143d6772  throttle-1.2.tar.gz
diff --git a/package/throttle/throttle.mk b/package/throttle/throttle.mk
new file mode 100644
index 0000000..8fb694e
--- /dev/null
+++ b/package/throttle/throttle.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# throttle
+#
+################################################################################
+
+THROTTLE_VERSION = 1.2
+THROTTLE_SITE = http://pkgs.fedoraproject.org/repo/pkgs/throttle/throttle-$(THROTTLE_VERSION).tar.gz/bb8abf5a9a63ed7d80951f056543a88c
+THROTTLE_LICENSE = GPLv2+ 
+THROTTLE_LICENSE_FILES = COPYING
+
+$(eval $(autotools-package))
-- 
2.1.4
