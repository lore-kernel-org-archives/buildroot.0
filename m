From: Matt Weber <mlweber1@rockwellcollins.com>
Date: Thu, 12 Sep 2013 15:45:57 -0500
Subject: [Buildroot] [PATCH v2] igmpproxy: new package
Message-ID: <1379018757-27111-1-git-send-email-mlweber1@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Matt Weber <mlweber1@rockwellcollins.com>
---
Changes v1 -> v2:
  * Added dependency on BR2_USE_WCHAR package/igmpproxy/Config.in
    (Suggested by Thomas)
  * Added link to website package/igmpproxy/Config.in (Suggested by Thomas)
  * Added comment to note when WCHAR isn't enabled and that
    igmpproxy expects it package/igmpproxy/Config.in (Suggested by Thomas)
  * Removed definition of source file since it was the 
    default package/igmpproxy/igmpproxy.mk (suggested by Thomas)

 package/Config.in              |    1 +
 package/igmpproxy/Config.in    |   14 ++++++++++++++
 package/igmpproxy/igmpproxy.mk |   12 ++++++++++++
 3 files changed, 27 insertions(+), 0 deletions(-)
 create mode 100644 package/igmpproxy/Config.in
 create mode 100644 package/igmpproxy/igmpproxy.mk

diff --git a/package/Config.in b/package/Config.in
index 02e5afc..5156296 100644
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
new file mode 100644
index 0000000..b12ddd5
--- /dev/null
+++ b/package/igmpproxy/Config.in
@@ -0,0 +1,14 @@
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
+
diff --git a/package/igmpproxy/igmpproxy.mk b/package/igmpproxy/igmpproxy.mk
new file mode 100644
index 0000000..75a02d9
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
-- 
1.7.1
