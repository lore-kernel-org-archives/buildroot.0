From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 30 Mar 2010 17:23:23 +0200
Subject: [Buildroot] [git commit master] binutils: default to 2.20.1,
	mark 2.19.1 as deprecated
Message-ID: <20100330152414.C046021340@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=9cca84cd079866ff0fd1c3b34fb06122170a7ace
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/binutils/Config.in |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/toolchain/binutils/Config.in b/toolchain/binutils/Config.in
index 57bddfc..602d696 100644
--- a/toolchain/binutils/Config.in
+++ b/toolchain/binutils/Config.in
@@ -4,7 +4,7 @@ comment "Binutils Options"
 
 choice
 	prompt "Binutils Version"
-	default BR2_BINUTILS_VERSION_2_20
+	default BR2_BINUTILS_VERSION_2_20_1
 	help
 	  Select the version of binutils you wish to use.
 
@@ -34,11 +34,12 @@ choice
 
 	config BR2_BINUTILS_VERSION_2_19_1
 		depends on !BR2_avr32 && !BR2_nios2
-		depends on BR2_DEPRECATED || BR2_RECENT
+		depends on BR2_DEPRECATED
 		bool "binutils 2.19.1"
 
 	config BR2_BINUTILS_VERSION_2_20
 		depends on !BR2_avr32 && !BR2_nios2
+		depends on BR2_DEPRECATED || BR2_RECENT
 		bool "binutils 2.20"
 
 	config BR2_BINUTILS_VERSION_2_20_1
-- 
1.6.3.3
