From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 26 Oct 2019 10:26:39 +0200
Subject: [Buildroot] [PATCH v2, 1/1] package/bird: fix build without babel,
 bgp, ospf, radv, rip or static
Message-ID: <20191026082639.9732-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/0b00948eed9bb8405b70f3f9112ecce99b365f35

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2:
 - Use upstream patch

 ...001-Nest-Fix-build-without-protocols.patch | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 package/bird/0001-Nest-Fix-build-without-protocols.patch

diff --git a/package/bird/0001-Nest-Fix-build-without-protocols.patch b/package/bird/0001-Nest-Fix-build-without-protocols.patch
new file mode 100644
index 0000000000..48d21441ca
--- /dev/null
+++ b/package/bird/0001-Nest-Fix-build-without-protocols.patch
@@ -0,0 +1,28 @@
+From f9eb9b4cab65b850c61738dd56632bae0e7329ca Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 19 Oct 2019 12:50:27 +0200
+Subject: [PATCH] Nest: Fix build without protocols
+
+(CHECK keyword added by commiter)
+[Retrieved from:
+https://gitlab.labs.nic.cz/labs/bird/commit/f9eb9b4cab65b850c61738dd56632bae0e7329ca]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ nest/config.Y | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/nest/config.Y b/nest/config.Y
+index c62501a3..1bc203dd 100644
+--- a/nest/config.Y
++++ b/nest/config.Y
+@@ -75,6 +75,7 @@ CF_KEYWORDS(BGP, PASSWORDS, DESCRIPTION, SORTED)
+ CF_KEYWORDS(RELOAD, IN, OUT, MRTDUMP, MESSAGES, RESTRICT, MEMORY, IGP_METRIC, CLASS, DSCP)
+ CF_KEYWORDS(TIMEFORMAT, ISO, SHORT, LONG, ROUTE, PROTOCOL, BASE, LOG, S, MS, US)
+ CF_KEYWORDS(GRACEFUL, RESTART, WAIT, MAX, FLUSH, AS)
++CF_KEYWORDS(CHECK, LINK)
+ 
+ /* For r_args_channel */
+ CF_KEYWORDS(IPV4, IPV4_MC, IPV4_MPLS, IPV6, IPV6_MC, IPV6_MPLS, IPV6_SADR, VPN4, VPN4_MC, VPN4_MPLS, VPN6, VPN6_MC, VPN6_MPLS, ROA4, ROA6, FLOW4, FLOW6, MPLS, PRI, SEC)
+-- 
+2.21.0
+
-- 
2.23.0
