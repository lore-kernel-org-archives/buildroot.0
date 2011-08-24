From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 24 Aug 2011 14:45:46 +0200
Subject: [Buildroot] [git commit] binutils: only use 2.21.1 for uClibc
	0.9.32 / snapshot
Message-ID: <20110824124641.AE9288B8BE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=60620a1d8195774a65b053268d07ab603caab192
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Earlier versions don't build with it.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/binutils/Config.in.host |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index 7de59f0..f87298a 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -3,7 +3,8 @@ comment "Binutils Options"
 choice
 	prompt "Binutils Version"
 	default BR2_BINUTILS_VERSION_2_21 if (BR2_mips || BR2_mipsel || BR2_sh)
-	default BR2_BINUTILS_VERSION_2_21_1
+	default BR2_BINUTILS_VERSION_2_21_1 if (BR2_UCLIBC_VERSION_0_9_32 || BR2_UCLIBC_VERSION_SNAPSHOT)
+	default BR2_BINUTILS_VERSION_2_21
 	help
 	  Select the version of binutils you wish to use.
 
@@ -39,7 +40,7 @@ choice
 		bool "binutils 2.21"
 
 	config BR2_BINUTILS_VERSION_2_21_1
-		depends on !BR2_avr32
+		depends on !(BR2_avr32 || BR2_UCLIBC_VERSION_0_9_30 || BR2_UCLIBC_VERSION_0_9_31)
 		bool "binutils 2.21.1"
 
 endchoice
-- 
1.7.3.4
