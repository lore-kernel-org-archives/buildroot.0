From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 30 Oct 2012 09:29:51 -0300
Subject: [Buildroot] [PATCHv2 10/12] conntrack-tools: bump to version 1.4.0
In-Reply-To: <1351600193-21511-1-git-send-email-gustavo@zacarias.com.ar>
References: <1351600193-21511-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1351600193-21511-11-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/conntrack-tools/Config.in          |    7 +++++--
 package/conntrack-tools/conntrack-tools.mk |    5 +++--
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/package/conntrack-tools/Config.in b/package/conntrack-tools/Config.in
index be491e6..f109adf 100644
--- a/package/conntrack-tools/Config.in
+++ b/package/conntrack-tools/Config.in
@@ -1,9 +1,12 @@
 config BR2_PACKAGE_CONNTRACK_TOOLS
 	bool "conntrack-tools"
 	depends on BR2_INET_IPV6
+	depends on BR2_INET_RPC
 	depends on BR2_LARGEFILE
 	select BR2_PACKAGE_LIBNETFILTER_CONNTRACK
+	select BR2_PACKAGE_LIBNETFILTER_CTHELPER
 	select BR2_PACKAGE_LIBNETFILTER_CTTIMEOUT
+	select BR2_PACKAGE_LIBNETFILTER_QUEUE
 	help
 	  The conntrack-tools are a set of tools targeted at
 	  system administrators.
@@ -12,5 +15,5 @@ config BR2_PACKAGE_CONNTRACK_TOOLS
 
 	  http://www.netfilter.org/projects/conntrack-tools/
 
-comment "conntrack-tools requires a toolchain with IPV6 and LARGEFILE support"
-	depends on !BR2_INET_IPV6 || !BR2_LARGEFILE
+comment "conntrack-tools requires a toolchain with IPV6, LARGEFILE and RPC support"
+	depends on !BR2_INET_IPV6 || !BR2_LARGEFILE || !BR2_INET_RPC
diff --git a/package/conntrack-tools/conntrack-tools.mk b/package/conntrack-tools/conntrack-tools.mk
index b8c8f5a..ce64021 100644
--- a/package/conntrack-tools/conntrack-tools.mk
+++ b/package/conntrack-tools/conntrack-tools.mk
@@ -4,11 +4,12 @@
 #
 #############################################################
 
-CONNTRACK_TOOLS_VERSION = 1.2.2
+CONNTRACK_TOOLS_VERSION = 1.4.0
 CONNTRACK_TOOLS_SOURCE = conntrack-tools-$(CONNTRACK_TOOLS_VERSION).tar.bz2
 CONNTRACK_TOOLS_SITE = http://www.netfilter.org/projects/conntrack-tools/files
 CONNTRACK_TOOLS_DEPENDENCIES = host-pkgconf \
-	libnetfilter_conntrack libnetfilter_cttimeout
+	libnetfilter_conntrack libnetfilter_cthelper libnetfilter_cttimeout \
+	libnetfilter_queue
 CONNTRACK_TOOLS_LICENSE = GPLv2
 CONNTRACK_TOOLS_LICENSE_FILES = COPYING
 
-- 
1.7.8.6
