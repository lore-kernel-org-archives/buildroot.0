From: Alexander Clouter <alex+buildroot@digriz.org.uk>
Date: Sun, 18 Jan 2015 16:56:30 +0000
Subject: [Buildroot] [PATCH] odhcp6c: new package
Message-ID: <20150118165630.GS27361@marmot>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Alexander Clouter <alex+buildroot@digriz.org.uk>
--
  package/Config.in          |    1 +
  package/odhcp6c/Config.in  |    7 +++++++
  package/odhcp6c/odhcp6c.mk |   12 ++++++++++++
  3 files changed, 20 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 266de13..b9805dc 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1123,6 +1123,7 @@ endif
  	source "package/noip/Config.in"
  	source "package/ntp/Config.in"
  	source "package/nuttcp/Config.in"
+	source "package/odhcp6c/Config.in"
  	source "package/odhcploc/Config.in"
  	source "package/olsr/Config.in"
  	source "package/openntpd/Config.in"
diff --git a/package/odhcp6c/Config.in b/package/odhcp6c/Config.in
new file mode 100644
index 0000000..8155f47
--- /dev/null
+++ b/package/odhcp6c/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_ODHCP6C
+	bool "odhcp6c"
+	help
+	  odhcp6c is a minimal DHCPv6 and RA-client for use in embedded Linux systems
+	  especially routers.
+
+	  https://github.com/sbyx/odhcp6c
diff --git a/package/odhcp6c/odhcp6c.mk b/package/odhcp6c/odhcp6c.mk
new file mode 100644
index 0000000..db963e0
--- /dev/null
+++ b/package/odhcp6c/odhcp6c.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# odhcp6c
+#
+################################################################################
+
+ODHCP6C_VERSION = c42e34111e19bd435dc4b5bb3ba81224ea214314
+ODHCP6C_SITE = $(call github,sbyx,odhcp6c,$(ODHCP6C_VERSION))
+ODHCP6C_LICENSE = GPLv2
+ODHCP6C_LICENSE_FILES = COPYING
+
+$(eval $(cmake-package))
