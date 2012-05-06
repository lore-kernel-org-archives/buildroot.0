From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 6 May 2012 23:13:46 +0200
Subject: [Buildroot] [git commit] conntrack-tools: new package
Message-ID: <20120506212038.EBFC696A44@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b76f7fb749190d7ec90654aa604e7792a1d967ad
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                          |    1 +
 package/conntrack-tools/Config.in          |   14 ++++++++++++++
 package/conntrack-tools/conntrack-tools.mk |   12 ++++++++++++
 3 files changed, 27 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index aecb056..34c0280 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -490,6 +490,7 @@ source "package/can-utils/Config.in"
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
index 0000000..8b41127
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
+CONNTRACK_TOOLS_DEPENDENCIES = host-pkg-config libnetfilter_conntrack
+
+$(eval $(call AUTOTARGETS))
