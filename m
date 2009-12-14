From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Dec 2009 00:19:17 +0100
Subject: [Buildroot] [git commit master] binutils: do not allow selection of
	non-avr32 versions on AVR32
Message-ID: <20091214232056.B94CD77796@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=b772cdd1a7771f0a9c3a2c07951f4e7a50a4d27f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/binutils/Config.in |    9 ++++-----
 1 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/toolchain/binutils/Config.in b/toolchain/binutils/Config.in
index 4405bcb..b8ce332 100644
--- a/toolchain/binutils/Config.in
+++ b/toolchain/binutils/Config.in
@@ -9,14 +9,13 @@ choice
 	  Select the version of binutils you wish to use.
 
 	config BR2_BINUTILS_VERSION_2_17
-		depends on !BR2_nios2
-		depends on BR2_DEPRECATED || (BR2_avr32 && BR2_EXT_BINUTILS_VERSION_2_17)
+		depends on !BR2_nios2 && !BR2_avr32
+		depends on BR2_DEPRECATED
 		bool "binutils 2.17"
 
 	config BR2_BINUTILS_VERSION_2_18
-		depends on !BR2_nios2
-		depends on BR2_DEPRECATED || BR2_avr32
-		depends on BR2_EXT_BINUTILS_VERSION_2_18
+		depends on !BR2_nios2 && !BR2_avr32
+		depends on BR2_DEPRECATED
 		bool "binutils 2.18"
 
 	config BR2_BINUTILS_VERSION_2_18_50_0_9
-- 
1.6.3.3
