From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed, 16 Apr 2014 12:25:15 +0200
Subject: [Buildroot] [PATCH 1/2] snmp++: need dynamic library support
Message-ID: <1397643916-21135-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
  http://autobuild.buildroot.net/results/7b9/7b9ec11514219e5f315df0b30204f431b4c4f8a1/

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/snmppp/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/snmppp/Config.in b/package/snmppp/Config.in
index 8b69fab..ef217f7 100644
--- a/package/snmppp/Config.in
+++ b/package/snmppp/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_SNMPPP
 	bool "snmp++"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_PREFER_STATIC_LIB
 	help
 	  SNMP++v3.x is a C++ API which supports SNMP v1, v2c, and v3.
 
@@ -25,5 +26,6 @@ config BR2_PACKAGE_SNMPPP_SNMPV3
 
 endif
 
-comment "snmp++ needs a toolchain w/ threads, C++"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
+comment "snmp++ needs a toolchain w/ threads, C++, dynamic library"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
+		BR2_PREFER_STATIC_LIB
-- 
1.8.3.2
