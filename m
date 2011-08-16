From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 16 Aug 2011 08:36:01 +0200
Subject: [Buildroot] [git commit] uClibc: disallow 0.9.32 on sh
Message-ID: <20110816063719.AE12B8C980@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=5c6212aea681843b0129b17d04ccc24d0bc3403d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Build breaks during final uClibc build with 0.9.32.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/uClibc/Config.in |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/toolchain/uClibc/Config.in b/toolchain/uClibc/Config.in
index 9f3c7b3..34aaa13 100644
--- a/toolchain/uClibc/Config.in
+++ b/toolchain/uClibc/Config.in
@@ -5,7 +5,7 @@ comment "uClibc Options"
 
 choice
 	prompt "uClibc C library Version"
-	default BR2_UCLIBC_VERSION_0_9_31 if BR2_avr32 # 0.9.32 broken
+	default BR2_UCLIBC_VERSION_0_9_31 if (BR2_avr32 || BR2_sh) # 0.9.32 broken
 	default BR2_UCLIBC_VERSION_0_9_32
 	help
 	  Select the version of uClibc you wish to use.
@@ -19,7 +19,7 @@ choice
 
 	config BR2_UCLIBC_VERSION_0_9_32
 		bool "uClibc 0.9.32.x"
-		depends on !BR2_avr32
+		depends on !(BR2_avr32 || BR2_sh)
 
 	config BR2_UCLIBC_VERSION_SNAPSHOT
 		bool "daily snapshot"
-- 
1.7.3.4
