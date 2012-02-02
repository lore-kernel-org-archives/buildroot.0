From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 2 Feb 2012 09:07:39 +0100
Subject: [Buildroot] [git commit] binutils: default to 2.21.1 for uClibc
	0.9.33 as well
Message-ID: <20120202090835.DAEED9099F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4461b3213d35a4ea4a6ccfd395663eb0b7a5f88a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/binutils/Config.in.host |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index aec51b3..a13d61b 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -3,7 +3,7 @@ comment "Binutils Options"
 choice
 	prompt "Binutils Version"
 	default BR2_BINUTILS_VERSION_2_21 if (BR2_mips || BR2_mipsel || BR2_sh)
-	default BR2_BINUTILS_VERSION_2_21_1 if (BR2_UCLIBC_VERSION_0_9_32 || BR2_UCLIBC_VERSION_SNAPSHOT)
+	default BR2_BINUTILS_VERSION_2_21_1 if (!BR2_UCLIBC_VERSION_0_9_31)
 	default BR2_BINUTILS_VERSION_2_21
 	help
 	  Select the version of binutils you wish to use.
@@ -25,11 +25,11 @@ choice
 		bool "binutils 2.21"
 
 	config BR2_BINUTILS_VERSION_2_21_1
-		depends on !(BR2_avr32 || BR2_UCLIBC_VERSION_0_9_30 || BR2_UCLIBC_VERSION_0_9_31)
+		depends on !(BR2_avr32 || BR2_UCLIBC_VERSION_0_9_31)
 		bool "binutils 2.21.1"
 
 	config BR2_BINUTILS_VERSION_2_22
-		depends on !(BR2_avr32 || BR2_UCLIBC_VERSION_0_9_30 || BR2_UCLIBC_VERSION_0_9_31)
+		depends on !(BR2_avr32 || BR2_UCLIBC_VERSION_0_9_31)
 		bool "binutils 2.22"
 
 endchoice
