From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 6 Dec 2011 12:02:32 +0100
Subject: [Buildroot] [git commit] Revert "netsnmp: bump to 5.7.1 LTS"
Message-ID: <20111206110312.310638F7CD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0c8407a9bcf6369f62a682a2b663894dc8157355
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Gustavoz reported that 5.7 series segfault on powerpc.

This reverts commit 60859a1e1ac717aafc3543f92adeccba9ed33b29.
---
 package/netsnmp/netsnmp.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/netsnmp/netsnmp.mk b/package/netsnmp/netsnmp.mk
index 959e39f..5d789b9 100644
--- a/package/netsnmp/netsnmp.mk
+++ b/package/netsnmp/netsnmp.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-NETSNMP_VERSION = 5.7.1
+NETSNMP_VERSION = 5.6.1.1
 NETSNMP_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/net-snmp
 NETSNMP_SOURCE = net-snmp-$(NETSNMP_VERSION).tar.gz
 NETSNMP_INSTALL_STAGING = YES
