From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 14 Oct 2013 10:47:15 -0300
Subject: [Buildroot] [PATCH] snmppp: new package
Message-ID: <1381758435-13669-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/Config.in        |  1 +
 package/snmppp/Config.in | 12 ++++++++++++
 package/snmppp/snmppp.mk | 16 ++++++++++++++++
 3 files changed, 29 insertions(+)
 create mode 100644 package/snmppp/Config.in
 create mode 100644 package/snmppp/snmppp.mk

diff --git a/package/Config.in b/package/Config.in
index df53587..16cb36d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -638,6 +638,7 @@ source "package/omniorb/Config.in"
 source "package/openpgm/Config.in"
 source "package/ortp/Config.in"
 source "package/slirp/Config.in"
+source "package/snmppp/Config.in"
 source "package/usbredir/Config.in"
 source "package/wvstreams/Config.in"
 source "package/zeromq/Config.in"
diff --git a/package/snmppp/Config.in b/package/snmppp/Config.in
new file mode 100644
index 0000000..9757814
--- /dev/null
+++ b/package/snmppp/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_SNMPPP
+	bool "snmp++"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_OPENSSL
+	help
+	  SNMP++v3.x is a C++ API which supports SNMP v1, v2c, and v3.
+
+	  http://www.agentpp.com/snmp_pp3_x/snmp_pp3_x.html
+
+comment "snmp++ requires a toolchain with threads and C++ support enabled"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/snmppp/snmppp.mk b/package/snmppp/snmppp.mk
new file mode 100644
index 0000000..ea99967
--- /dev/null
+++ b/package/snmppp/snmppp.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# snmp++
+#
+################################################################################
+
+SNMPPP_VERSION = 3.3.0
+SNMPPP_SOURCE = snmp++v$(SNMPPP_VERSION).tar.gz
+SNMPPP_SITE = http://www.agentpp.com
+SNMPPP_DEPENDENCIES = openssl host-pkgconf
+SNMPPP_INSTALL_STAGING = YES
+SNMPPP_AUTORECONF = YES
+SNMPPP_LICENSE = SNMP++
+SNMPPP_LICENSE_FILES = snmp_pp/snmp_pp.cpp
+
+$(eval $(autotools-package))
-- 
1.8.1.5
