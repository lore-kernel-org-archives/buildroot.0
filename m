From: David Bachelart <david.bachelart@bbright.com>
Date: Mon,  2 Jan 2017 11:49:18 +0100
Subject: [Buildroot] [PATCH 1/1] ifenslave: new package
Message-ID: <1483354166-8331-1-git-send-email-david.bachelart@bbright.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: David Bachelart <david.bachelart@bbright.com>
---
 package/Config.in                |  1 +
 package/ifenslave/Config.in      |  6 ++++++
 package/ifenslave/ifenslave.hash |  4 ++++
 package/ifenslave/ifenslave.mk   | 16 ++++++++++++++++
 4 files changed, 27 insertions(+)
 create mode 100644 package/ifenslave/Config.in
 create mode 100644 package/ifenslave/ifenslave.hash
 create mode 100644 package/ifenslave/ifenslave.mk

diff --git a/package/Config.in b/package/Config.in
index 9ed296f..9c1cda9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1484,6 +1484,7 @@ menu "Networking applications"
 	source "package/httping/Config.in"
 	source "package/ibrdtn-tools/Config.in"
 	source "package/ibrdtnd/Config.in"
+	source "package/ifenslave/Config.in"
 	source "package/ifplugd/Config.in"
 	source "package/iftop/Config.in"
 	source "package/ifupdown/Config.in"
diff --git a/package/ifenslave/Config.in b/package/ifenslave/Config.in
new file mode 100644
index 0000000..357e870
--- /dev/null
+++ b/package/ifenslave/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_IFENSLAVE
+	bool "ifenslave"
+	help
+	  Configure network interfaces for parallel routing (bonding)
+
+	  http://anonscm.debian.org/cgit/collab-maint/ifenslave.git
diff --git a/package/ifenslave/ifenslave.hash b/package/ifenslave/ifenslave.hash
new file mode 100644
index 0000000..3e1247a
--- /dev/null
+++ b/package/ifenslave/ifenslave.hash
@@ -0,0 +1,4 @@
+# Locally computed
+md5 3b3a925fc3502d846c46721516cf0d4d    ifenslave-debian_2.9.tar.gz
+sha1    055ba806c96d085673a75b1d9b237e1ddf94e629    ifenslave-debian_2.9.tar.gz
+sha256  f6a00b425098bd3a050774aa659d740cf0297fb018b3e4f268c270e7b1094e40    ifenslave-debian_2.9.tar.gz
diff --git a/package/ifenslave/ifenslave.mk b/package/ifenslave/ifenslave.mk
new file mode 100644
index 0000000..d335ddc
--- /dev/null
+++ b/package/ifenslave/ifenslave.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# ifenslave
+#
+################################################################################
+
+IFENSLAVE_VERSION = debian/2.9
+IFENSLAVE_SITE = git://anonscm.debian.org/collab-maint/ifenslave.git
+IFENSLAVE_LICENSE = GPLv3+
+IFENSLAVE_LICENSE_FILES = debian/copyright
+
+define IFENSLAVE_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/ifenslave $(TARGET_DIR)/sbin/ifenslave
+endef
+
+$(eval $(generic-package))
-- 
2.1.4
