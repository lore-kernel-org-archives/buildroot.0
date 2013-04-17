From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 17 Apr 2013 21:47:03 +0200
Subject: [Buildroot] [git commit] netsnmp: enable agentx support by default
Message-ID: <20130417195408.8E6139B71F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c295f0797ee5d4f1efa7a5833876638d1e9feab4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Enable agentx support by default, it's required for newer versions of
quagga.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/netsnmp/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
