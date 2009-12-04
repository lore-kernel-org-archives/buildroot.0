From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 4 Dec 2009 20:55:37 +0100
Subject: [Buildroot] [git commit master] binutils: default to 2.20,
	mark 2.19 as deprecated
Message-ID: <20091204195654.E4F1C777CF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=fdc8e6b915c4f084c56382bb78b8ed92daf7c774
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/binutils/Config.in |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/toolchain/binutils/Config.in b/toolchain/binutils/Config.in
index a97f04d..0ca2786 100644
--- a/toolchain/binutils/Config.in
+++ b/toolchain/binutils/Config.in
@@ -4,7 +4,7 @@ comment "Binutils Options"
 
 choice
 	prompt "Binutils Version"
-	default BR2_BINUTILS_VERSION_2_19_1
+	default BR2_BINUTILS_VERSION_2_20
 	help
 	  Select the version of binutils you wish to use.
 
@@ -51,11 +51,12 @@ choice
 
 	config BR2_BINUTILS_VERSION_2_19
 		depends on !BR2_avr32 && !BR2_nios2
-		depends on BR2_DEPRECATED || BR2_RECENT
+		depends on BR2_DEPRECATED
 		bool "binutils 2.19"
 
 	config BR2_BINUTILS_VERSION_2_19_1
 		depends on !BR2_avr32 && !BR2_nios2
+		depends on BR2_DEPRECATED || BR2_RECENT
 		bool "binutils 2.19.1"
 
 	config BR2_BINUTILS_VERSION_2_20
-- 
1.6.3.3
