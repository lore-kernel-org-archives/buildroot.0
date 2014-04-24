From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 24 Apr 2014 15:19:18 +0200
Subject: [Buildroot] [git commit] binutils: disable <2.24 for aarch64
Message-ID: <20140424132247.CCEBF9C969@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=79407e01fe383f8c2884e0ef5c99584058eaaa51
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Versions lower than 2.24 fail to build a working kernel as in:

Freeing unused kernel memory: 184K (ffffffc00059a000 - ffffffc0005c8000)
init[1]: unhandled level 2 translation fault (11) at 0x00000008, esr
0x92000006
pgd = ffffffc876403000
[00000008] *pgd=00000008f6ea0003, *pmd=0000000000000000

[Peter: adjust commit message]
Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/binutils/Config.in.host |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index 58738e8..2f86f51 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -14,30 +14,30 @@ choice
 		bool "binutils 2.18-avr32-1.0.1"
 
 	config BR2_BINUTILS_VERSION_2_20_1
-		depends on !BR2_avr32
+		depends on !BR2_avr32 && !BR2_aarch64
 		depends on !BR2_ARM_EABIHF
 		bool "binutils 2.20.1"
 
 	config BR2_BINUTILS_VERSION_2_21
-		depends on !BR2_avr32
+		depends on !BR2_avr32 && !BR2_aarch64
 		depends on !BR2_ARM_EABIHF
 		bool "binutils 2.21"
 
 	config BR2_BINUTILS_VERSION_2_21_1
-		depends on !BR2_avr32
+		depends on !BR2_avr32 && !BR2_aarch64
 		depends on !BR2_ARM_EABIHF
 		bool "binutils 2.21.1"
 
 	config BR2_BINUTILS_VERSION_2_22
-		depends on !BR2_avr32
+		depends on !BR2_avr32 && !BR2_aarch64
 		bool "binutils 2.22"
 
 	config BR2_BINUTILS_VERSION_2_23_1
-		depends on !BR2_avr32
+		depends on !BR2_avr32 && !BR2_aarch64
 		bool "binutils 2.23.1"
 
 	config BR2_BINUTILS_VERSION_2_23_2
-		depends on !BR2_avr32
+		depends on !BR2_avr32 && !BR2_aarch64
 		bool "binutils 2.23.2"
 
 	config BR2_BINUTILS_VERSION_2_24
