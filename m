From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 21 Jul 2011 16:49:57 -0300
Subject: [Buildroot] [PATCH 2/2] ipset: new package
In-Reply-To: <1311277797-20347-1-git-send-email-gustavo@zacarias.com.ar>
References: <1311277797-20347-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1311277797-20347-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add ipset support package.
Note that this requires bleeding edge (>=2.6.39) kernel version or
patches.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/Config.in       |    1 +
 package/ipset/Config.in |    8 ++++++++
 package/ipset/ipset.mk  |   13 +++++++++++++
 3 files changed, 22 insertions(+), 0 deletions(-)
 create mode 100644 package/ipset/Config.in
 create mode 100644 package/ipset/ipset.mk

diff --git a/package/Config.in b/package/Config.in
index c993c31..5dc32a7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -408,6 +408,7 @@ source "package/ifplugd/Config.in"
 source "package/iperf/Config.in"
 source "package/iproute2/Config.in"
 source "package/ipsec-tools/Config.in"
+source "package/ipset/Config.in"
 source "package/iptables/Config.in"
 source "package/iw/Config.in"
 source "package/kismet/Config.in"
diff --git a/package/ipset/Config.in b/package/ipset/Config.in
new file mode 100644
index 0000000..6951413
--- /dev/null
+++ b/package/ipset/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_IPSET
+	bool "ipset"
+	select BR2_PACKAGE_LIBMNL
+	help
+	  Utility to manage IP sets in the linux kernel.
+	  Requires a patched kernel or version >=2.6.39.
+
+	  http://ipset.netfilter.org/
diff --git a/package/ipset/ipset.mk b/package/ipset/ipset.mk
new file mode 100644
index 0000000..fafa201
--- /dev/null
+++ b/package/ipset/ipset.mk
@@ -0,0 +1,13 @@
+#############################################################
+#
+# ipset
+#
+#############################################################
+
+IPSET_VERSION = 6.8
+IPSET_SOURCE = ipset-$(IPSET_VERSION).tar.bz2
+IPSET_SITE = http://ipset.netfilter.org
+IPSET_AUTORECONF = YES
+IPSET_DEPENDENCIES = libmnl
+
+$(eval $(call AUTOTARGETS,package,ipset))
-- 
1.7.3.4
