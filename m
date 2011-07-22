From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 22 Jul 2011 07:34:09 +0200
Subject: [Buildroot] [git commit] iptables: largefile support not required
	anymore
Message-ID: <20110722053533.1400C8B3D7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=c1ac6ce60e9d4bb0c611aeae604033228af15e68
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/iptables/Config.in |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/package/iptables/Config.in b/package/iptables/Config.in
index da5a832..8c4e989 100644
--- a/package/iptables/Config.in
+++ b/package/iptables/Config.in
@@ -1,10 +1,6 @@
 config BR2_PACKAGE_IPTABLES
 	bool "iptables"
-	depends on BR2_LARGEFILE
 	help
 	  Linux kernel (2.4+) firewall, NAT, and packet mangling tools.
 
 	  http://www.iptables.org/
-
-comment "iptables requires a toolchain with LARGEFILE support"
-        depends on !BR2_LARGEFILE
-- 
1.7.3.4
