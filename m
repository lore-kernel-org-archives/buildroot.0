From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 28 May 2012 11:50:05 -0300
Subject: [Buildroot] [PATCH 3/4] conntrack-tools: bump to version 1.2.1
In-Reply-To: <1338216606-21082-1-git-send-email-gustavo@zacarias.com.ar>
References: <1338216606-21082-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1338216606-21082-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/conntrack-tools/Config.in          |    6 ++++--
 package/conntrack-tools/conntrack-tools.mk |    5 +++--
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/package/conntrack-tools/Config.in b/package/conntrack-tools/Config.in
index 12eb988..be491e6 100644
--- a/package/conntrack-tools/Config.in
+++ b/package/conntrack-tools/Config.in
@@ -1,7 +1,9 @@
 config BR2_PACKAGE_CONNTRACK_TOOLS
 	bool "conntrack-tools"
 	depends on BR2_INET_IPV6
+	depends on BR2_LARGEFILE
 	select BR2_PACKAGE_LIBNETFILTER_CONNTRACK
+	select BR2_PACKAGE_LIBNETFILTER_CTTIMEOUT
 	help
 	  The conntrack-tools are a set of tools targeted at
 	  system administrators.
@@ -10,5 +12,5 @@ config BR2_PACKAGE_CONNTRACK_TOOLS
 
 	  http://www.netfilter.org/projects/conntrack-tools/
 
-comment "conntrack-tools requires a toolchain with IPV6 support"
-	depends on !BR2_INET_IPV6
+comment "conntrack-tools requires a toolchain with IPV6 and LARGEFILE support"
+	depends on !BR2_INET_IPV6 || !BR2_LARGEFILE
diff --git a/package/conntrack-tools/conntrack-tools.mk b/package/conntrack-tools/conntrack-tools.mk
index 8b41127..6b9ba52 100644
--- a/package/conntrack-tools/conntrack-tools.mk
+++ b/package/conntrack-tools/conntrack-tools.mk
@@ -4,9 +4,10 @@
 #
 #############################################################
 
-CONNTRACK_TOOLS_VERSION = 1.0.1
+CONNTRACK_TOOLS_VERSION = 1.2.1
 CONNTRACK_TOOLS_SOURCE = conntrack-tools-$(CONNTRACK_TOOLS_VERSION).tar.bz2
 CONNTRACK_TOOLS_SITE = http://www.netfilter.org/projects/conntrack-tools/files
-CONNTRACK_TOOLS_DEPENDENCIES = host-pkg-config libnetfilter_conntrack
+CONNTRACK_TOOLS_DEPENDENCIES = host-pkg-config \
+	libnetfilter_conntrack libnetfilter_cttimeout
 
 $(eval $(call AUTOTARGETS))
-- 
1.7.3.4
