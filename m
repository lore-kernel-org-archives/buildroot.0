From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 3 Aug 2019 20:18:01 +0200
Subject: [Buildroot] [git commit] package/sshguard: need threads
Message-ID: <20190803181558.18508888E1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9790d1ca9457dc455970d04a73e4943f3e5bf0d2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.net/results/01fb32fdb21c60ffece09ea5e7ba7b58d989ed76/

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sshguard/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/sshguard/Config.in b/package/sshguard/Config.in
index e834f17f41..7454c0a931 100644
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
