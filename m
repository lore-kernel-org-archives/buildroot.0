From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 30 Apr 2012 09:49:37 -0300
Subject: [Buildroot] [PATCH 3/4] conntrack-tools: new package
In-Reply-To: <1335790178-25333-1-git-send-email-gustavo@zacarias.com.ar>
References: <1335790178-25333-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1335790178-25333-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/Config.in                          |    1 +
 package/conntrack-tools/Config.in          |   14 ++++++++++++++
 package/conntrack-tools/conntrack-tools.mk |   12 ++++++++++++
 3 files changed, 27 insertions(+), 0 deletions(-)
 create mode 100644 package/conntrack-tools/Config.in
 create mode 100644 package/conntrack-tools/conntrack-tools.mk

diff --git a/package/Config.in b/package/Config.in
index 6b97c64..81a006b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -456,6 +456,7 @@ source "package/can-utils/Config.in"
 source "package/connman/Config.in"
 source "package/ctorrent/Config.in"
 source "package/cifs-utils/Config.in"
+source "package/conntrack-tools/Config.in"
 source "package/cups/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/dhcp/Config.in"
diff --git a/package/conntrack-tools/Config.in b/package/conntrack-tools/Config.in
new file mode 100644
index 0000000..12eb988
--- /dev/null
+++ b/package/conntrack-tools/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_CONNTRACK_TOOLS
+	bool "conntrack-tools"
+	depends on BR2_INET_IPV6
+	select BR2_PACKAGE_LIBNETFILTER_CONNTRACK
+	help
+	  The conntrack-tools are a set of tools targeted at
+	  system administrators.
+	  They are conntrack, the userspace command line interface,
+	  and conntrackd, the userspace daemon.
+
+	  http://www.netfilter.org/projects/conntrack-tools/
+
+comment "conntrack-tools requires a toolchain with IPV6 support"
+	depends on !BR2_INET_IPV6
diff --git a/package/conntrack-tools/conntrack-tools.mk b/package/conntrack-tools/conntrack-tools.mk
new file mode 100644
index 0000000..395734e
--- /dev/null
+++ b/package/conntrack-tools/conntrack-tools.mk
@@ -0,0 +1,12 @@
+#############################################################
+#
+# conntrack-tools
+#
+#############################################################
+
+CONNTRACK_TOOLS_VERSION = 1.0.1
+CONNTRACK_TOOLS_SOURCE = conntrack-tools-$(CONNTRACK_TOOLS_VERSION).tar.bz2
+CONNTRACK_TOOLS_SITE = http://www.netfilter.org/projects/conntrack-tools/files
+CONNTRACK_TOOLS_DEPENDENCIES = host-bison host-flex host-pkg-config libnetfilter_conntrack
+
+$(eval $(call AUTOTARGETS))
-- 
1.7.3.4
