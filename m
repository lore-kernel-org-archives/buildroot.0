From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed, 16 Apr 2014 12:25:16 +0200
Subject: [Buildroot] [PATCH 2/2] agent++: need dynamic library support
In-Reply-To: <1397643916-21135-1-git-send-email-luca@lucaceresoli.net>
References: <1397643916-21135-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1397643916-21135-2-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Required by SNMP++.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/agentpp/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/agentpp/Config.in b/package/agentpp/Config.in
index 1442a45..8fd6c0d 100644
--- a/package/agentpp/Config.in
+++ b/package/agentpp/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_AGENTPP
 	select BR2_PACKAGE_SNMPPP
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS # snmp++
+	depends on !BR2_PREFER_STATIC_LIB # snmp++
 	help
 	  AGENT++ is a set of C++ classes which provides a complete protocol
 	  engine and dispatch table for the development of SNMP agents.
@@ -16,5 +17,6 @@ config BR2_PACKAGE_AGENTPP
 
 	  http://www.agentpp.com/agentpp3_5/agentpp3_5.html
 
-comment "agent++ needs a toolchain w/ threads, C++"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
+comment "agent++ needs a toolchain w/ threads, C++, dynamic library"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
+		BR2_PREFER_STATIC_LIB
-- 
1.8.3.2
