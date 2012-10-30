From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 30 Oct 2012 09:29:50 -0300
Subject: [Buildroot] [PATCHv2 09/12] nfacct: add new package
In-Reply-To: <1351600193-21511-1-git-send-email-gustavo@zacarias.com.ar>
References: <1351600193-21511-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1351600193-21511-10-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/Config.in        |    1 +
 package/nfacct/Config.in |   12 ++++++++++++
 package/nfacct/nfacct.mk |   15 +++++++++++++++
 3 files changed, 28 insertions(+), 0 deletions(-)
 create mode 100644 package/nfacct/Config.in
 create mode 100644 package/nfacct/nfacct.mk

diff --git a/package/Config.in b/package/Config.in
index 848b7f7..d12e3bc 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -607,6 +607,7 @@ source "package/netplug/Config.in"
 source "package/netsnmp/Config.in"
 source "package/netstat-nat/Config.in"
 source "package/network-manager/Config.in"
+source "package/nfacct/Config.in"
 source "package/noip/Config.in"
 source "package/ngircd/Config.in"
 source "package/ngrep/Config.in"
diff --git a/package/nfacct/Config.in b/package/nfacct/Config.in
new file mode 100644
index 0000000..ac437da
--- /dev/null
+++ b/package/nfacct/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_NFACCT
+	bool "nfacct"
+	depends on BR2_LARGEFILE
+	select BR2_PACKAGE_LIBNETFILTER_ACCT
+	help
+	  nfacct is the command line tool to create/retrieve/delete
+	  netfilter accounting objects.
+
+	  http://www.netfilter.org/projects/nfacct/
+
+comment "nfacct requires a toolchain with LARGEFILE support"
+	depends on !BR2_LARGEFILE
diff --git a/package/nfacct/nfacct.mk b/package/nfacct/nfacct.mk
new file mode 100644
index 0000000..60c6e44
--- /dev/null
+++ b/package/nfacct/nfacct.mk
@@ -0,0 +1,15 @@
+#############################################################
+#
+# nfacct
+#
+#############################################################
+
+NFACCT_VERSION = 1.0.0
+NFACCT_SOURCE = nfacct-$(NFACCT_VERSION).tar.bz2
+NFACCT_SITE = http://www.netfilter.org/projects/nfacct/files
+NFACCT_DEPENDENCIES = host-pkgconf \
+	libnetfilter_acct
+NFACCT_LICENSE = GPLv2
+NFACCT_LICENSE_FILES = COPYING
+
+$(eval $(autotools-package))
-- 
1.7.8.6
