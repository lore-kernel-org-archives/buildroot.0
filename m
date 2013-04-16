From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 15 Apr 2013 21:39:42 -0300
Subject: [Buildroot] [PATCH 1/2] netsnmp: enable agentx support by default
Message-ID: <1366072783-28319-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Enable agentx support by default, it's required for newer versions of
quagga.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/netsnmp/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/netsnmp/Config.in b/package/netsnmp/Config.in
index d5056f9..d94abb7 100644
--- a/package/netsnmp/Config.in
+++ b/package/netsnmp/Config.in
@@ -17,7 +17,7 @@ config BR2_PACKAGE_NETSNMP_ENABLE_MIBS
 
 config BR2_PACKAGE_NETSNMP_WITH_MIB_MODULES
 	string "Build with these MIB modules"
-	default "host ucd-snmp/dlmod"
+	default "host ucd-snmp/dlmod agentx"
 	depends on BR2_PACKAGE_NETSNMP
 	help
 	  Specify which MIB modules to include.
-- 
1.8.1.5
