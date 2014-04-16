From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Apr 2014 19:09:58 +0200
Subject: [Buildroot] [git commit] snmp++: need dynamic library support
Message-ID: <20140416172410.A38B19C80D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=15c5284d98168b9ccd3ff8cf9ba6ec82af75ac67
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
  http://autobuild.buildroot.net/results/7b9/7b9ec11514219e5f315df0b30204f431b4c4f8a1/

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/snmppp/Config.in |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

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
