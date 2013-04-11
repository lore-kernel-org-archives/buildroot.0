From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 11 Apr 2013 16:00:10 +0200
Subject: [Buildroot] [git commit] aircrack-ng: needs toolchain with threads
	support
Message-ID: <20130411140827.275299B586@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ae37c5413464e42247bd44c2ff08a1b544d85d20
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.org/results/418c9385a9a5a5087a6790001560056d32cd9708

[Peter: drop iw comment]
Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/aircrack-ng/Config.in |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/aircrack-ng/Config.in b/package/aircrack-ng/Config.in
index 319b7c4..ee887ae 100644
--- a/package/aircrack-ng/Config.in
+++ b/package/aircrack-ng/Config.in
@@ -4,11 +4,12 @@ config BR2_PACKAGE_AIRCRACK_NG
 	depends on BR2_USE_MMU # uses fork()
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_IW # runtime
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  A set of tools for auditing wireless networks
 
 	  http://www.aircrack-ng.org/
 
-comment "aircrack-ng needs a toolchain with largefile support"
-	depends on !BR2_LARGEFILE
+comment "aircrack-ng needs a toolchain with largefile and threads support"
+	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
 
