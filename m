From: Pierre-Jean Texier <pjtexier@koncepto.io>
Date: Sat,  3 Aug 2019 19:57:43 +0200
Subject: [Buildroot] [PATCH] package/sshguard: need threads
Message-ID: <1564855063-1853-1-git-send-email-pjtexier@koncepto.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - autobuild.buildroot.net/results/01f/01fb32fdb21c60ffece09ea5e7ba7b58d989ed76/

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 package/sshguard/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/sshguard/Config.in b/package/sshguard/Config.in
index e834f17..7454c0a 100644
--- a/package/sshguard/Config.in
+++ b/package/sshguard/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_SSHGUARD
 	bool "sshguard"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_IPTABLES # runtime
 	help
 	  sshguard protects hosts from brute-force attacks against SSH
@@ -8,3 +9,6 @@ config BR2_PACKAGE_SSHGUARD
 	  including iptables, ipfw, and pf.
 
 	  https://www.sshguard.net
+
+comment "sshguard needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
-- 
2.7.4
