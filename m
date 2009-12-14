From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Dec 2009 00:19:17 +0100
Subject: [Buildroot] [git commit master] gcc: on avr32,
	only allow avr32 gcc versions
Message-ID: <20091214232053.C9CCF77696@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=5c6ccd9f20a9aec2d26bcbb32f17a027b333ace3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove references to BR2_EXT_GCC_VERSION_* configuration options, and
only allows special avr32 gcc versions on the AVR32 architecture.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/gcc/Config.in |   15 ++++++---------
 1 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/toolchain/gcc/Config.in b/toolchain/gcc/Config.in
index 3d3da46..07e42a6 100644
--- a/toolchain/gcc/Config.in
+++ b/toolchain/gcc/Config.in
@@ -10,20 +10,18 @@ choice
 	  Select the version of gcc you wish to use.
 
 	config BR2_GCC_VERSION_4_1_2
-		depends on !BR2_nios2
-		depends on BR2_EXT_GCC_VERSION_4_1_2
+		depends on !BR2_nios2 && !BR2_avr32
 		depends on BR2_DEPRECATED
 		bool "gcc 4.1.2"
 
 	config BR2_GCC_VERSION_4_2_1
-		depends on !BR2_nios2
-		depends on BR2_EXT_GCC_VERSION_4_2_1
+		depends on !BR2_nios2 && !BR2_avr32
 		depends on BR2_DEPRECATED
 		bool "gcc 4.2.1"
 
 	config BR2_GCC_VERSION_4_2_2
-		depends on BR2_EXT_GCC_VERSION_4_2_2
-		depends on BR2_DEPRECATED || BR2_avr32
+		depends on !BR2_avr32
+		depends on BR2_DEPRECATED
 		bool "gcc 4.2.2"
 
 	config BR2_GCC_VERSION_4_2_2_AVR32_2_1_5
@@ -31,9 +29,8 @@ choice
 	       bool "gcc 4.2.2-avr32-2.1.5"
 
 	config BR2_GCC_VERSION_4_2_3
-		depends on !BR2_nios2
-		depends on BR2_EXT_GCC_VERSION_4_2_3
-		depends on BR2_DEPRECATED || BR2_avr32
+		depends on !BR2_nios2 && !BR2_avr32
+		depends on BR2_DEPRECATED
 		bool "gcc 4.2.3"
 
 	config BR2_GCC_VERSION_4_2_4
-- 
1.6.3.3
