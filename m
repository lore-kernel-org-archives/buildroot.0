From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 12 Sep 2013 23:44:16 +0200
Subject: [Buildroot] [git commit] igmpproxy: new package
Message-ID: <20130912214407.8F8899B6EE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2bf58d7633f42bd1cec79873deabbf979f1c5e8b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: minor white space fixes]
Signed-off-by: Matt Weber <mlweber1@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in              |    1 +
 package/igmpproxy/Config.in    |   13 +++++++++++++
 package/igmpproxy/igmpproxy.mk |   12 ++++++++++++
 3 files changed, 26 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 5835bcb..aae3296 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -783,6 +783,7 @@ source "package/ifplugd/Config.in"
 endif
 source "package/iftop/Config.in"
 source "package/igh-ethercat/Config.in"
+source "package/igmpproxy/Config.in"
 source "package/inadyn/Config.in"
 source "package/iperf/Config.in"
 source "package/iproute2/Config.in"
diff --git a/package/igmpproxy/Config.in b/package/igmpproxy/Config.in
new file mode 100644
index 0000000..03f8da5
--- /dev/null
+++ b/package/igmpproxy/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_IGMPPROXY
+	bool "igmpproxy"
+	depends on BR2_USE_WCHAR
+	help
+	  A simple dynamic Multicast Routing Daemon
+	  using only IGMP signalling. It's intended
+	  for simple forwarding of Multicast traffic
+	  between networks.
+
+	  http://sourceforge.net/projects/igmpproxy/
+
+comment "igmpproxy needs a toolchain with wchar support"
+	depends on !BR2_USE_WCHAR
diff --git a/package/igmpproxy/igmpproxy.mk b/package/igmpproxy/igmpproxy.mk
new file mode 100644
index 0000000..577717c
--- /dev/null
+++ b/package/igmpproxy/igmpproxy.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# igmpproxy
+#
+################################################################################
+
+IGMPPROXY_VERSION = 0.1
+IGMPPROXY_SITE = http://downloads.sourceforge.net/project/igmpproxy/igmpproxy/$(IGMPPROXY_VERSION)
+IGMPPROXY_LICENSE = GPLv2+
+IGMPPROXY_LICENSE_FILES = COPYING
+
+$(eval $(autotools-package))
