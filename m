From: David Bachelart <david.bachelart@bbright.com>
Date: Mon,  2 Jan 2017 11:49:25 +0100
Subject: [Buildroot] [PATCH 1/1] throttle: new package
In-Reply-To: <1483354166-8331-1-git-send-email-david.bachelart@bbright.com>
References: <1483354166-8331-1-git-send-email-david.bachelart@bbright.com>
Message-ID: <1483354166-8331-8-git-send-email-david.bachelart@bbright.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: David Bachelart <david.bachelart@bbright.com>
---
 package/Config.in              |  1 +
 package/throttle/Config.in     |  7 +++++++
 package/throttle/throttle.hash |  2 ++
 package/throttle/throttle.mk   | 12 ++++++++++++
 4 files changed, 22 insertions(+)
 create mode 100644 package/throttle/Config.in
 create mode 100644 package/throttle/throttle.hash
 create mode 100644 package/throttle/throttle.mk

diff --git a/package/Config.in b/package/Config.in
index 9ed296f..c98c6a8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1752,6 +1752,7 @@ menu "System tools"
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
index 0000000..b8edef5
--- /dev/null
+++ b/package/throttle/throttle.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  6d90e4dcd6c604846020d60e82df1576e0a022cb96716a709db4ebfa143d6772  throttle-1.2.tar.gz
diff --git a/package/throttle/throttle.mk b/package/throttle/throttle.mk
new file mode 100644
index 0000000..8f3bdc8
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
+THROTTLE_SITE = http://pkgs.fedoraproject.org/repo/pkgs/throttle/throttle-$(THROTTLE_VERSION).tar.gz/bb8abf5a9a63ed7d80951f056543a88c/
+THROTTLE_LICENSE = GPLv2+ 
+THROTTLE_LICENSE_FILES = COPYING
+
+$(eval $(autotools-package))
-- 
2.1.4
