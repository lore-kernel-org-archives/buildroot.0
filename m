From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:56:39 -0000
Subject: [Buildroot] [git commit branch/next] netsnmp: fix static build
Message-ID: <20150808105638.E0C8C803C1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3c59cfaf291f22ec96531ec1595d339c9b4aa9bd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Exclude the ucd-snmp/dlmod MIB module when building statically.

Fixes:
http://autobuild.buildroot.net/results/782/7829e74f83c3c4a1f45e049ec9f9d6b00e002c1c/
http://autobuild.buildroot.net/results/5df/5df28482dfa3d7c54d1e4ae3e1d373bd8e9a2265/
http://autobuild.buildroot.net/results/4b7/4b7f3c15a4f4c4f4457e78767f5526c044d6dc1d/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/netsnmp/Config.in |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/netsnmp/Config.in b/package/netsnmp/Config.in
index 47a53d7..57cc6b9 100644
--- a/package/netsnmp/Config.in
+++ b/package/netsnmp/Config.in
@@ -31,7 +31,8 @@ config BR2_PACKAGE_NETSNMP_ENABLE_MIBS
 
 config BR2_PACKAGE_NETSNMP_WITH_MIB_MODULES
 	string "Build with these MIB modules"
-	default "host ucd-snmp/dlmod agentx"
+	default "host ucd-snmp/dlmod agentx" if !BR2_STATIC_LIBS
+	default "host agentx" if BR2_STATIC_LIBS
 	help
 	  Specify which MIB modules to include.
 
