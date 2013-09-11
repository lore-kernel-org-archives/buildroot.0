From: Matt Weber <mlweber1@rockwellcollins.com>
Date: Wed, 11 Sep 2013 13:28:45 -0500
Subject: [Buildroot] [PATCH 1/1] igmpproxy: new package
Message-ID: <1378924125-441-1-git-send-email-mlweber1@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Matt Weber <mlweber1@rockwellcollins.com>
---
 package/Config.in              |    1 +
 package/igmpproxy/Config.in    |    7 +++++++
 package/igmpproxy/igmpproxy.mk |   13 +++++++++++++
 3 files changed, 21 insertions(+), 0 deletions(-)
 create mode 100755 package/igmpproxy/Config.in
 create mode 100755 package/igmpproxy/igmpproxy.mk

diff --git a/package/Config.in b/package/Config.in
index 2351839..6413242 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -781,6 +781,7 @@ source "package/ifplugd/Config.in"
 endif
 source "package/iftop/Config.in"
 source "package/igh-ethercat/Config.in"
+source "package/igmpproxy/Config.in"
 source "package/inadyn/Config.in"
 source "package/iperf/Config.in"
 source "package/iproute2/Config.in"
diff --git a/package/igmpproxy/Config.in b/package/igmpproxy/Config.in
new file mode 100755
index 0000000..53a25b1
--- /dev/null
+++ b/package/igmpproxy/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_IGMPPROXY
+	bool "igmpproxy"
+	help
+	  A simple dynamic Multicast Routing Daemon 
+	  using only IGMP signalling. It's intended 
+	  for simple forwarding of Multicast traffic 
+	  between networks.
diff --git a/package/igmpproxy/igmpproxy.mk b/package/igmpproxy/igmpproxy.mk
new file mode 100755
index 0000000..468f356
--- /dev/null
+++ b/package/igmpproxy/igmpproxy.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# igmpproxy 
+#
+################################################################################
+
+IGMPPROXY_VERSION = 0.1
+IGMPPROXY_SITE = http://downloads.sourceforge.net/project/igmpproxy/igmpproxy/$(IGMPPROXY_VERSION)
+IGMPPROXY_SOURCE = igmpproxy-$(IGMPPROXY_VERSION).tar.gz
+IGMPPROXY_LICENSE = GPLv2+
+IGMPPROXY_LICENSE_FILES = COPYING
+
+$(eval $(autotools-package))
-- 
1.7.1
