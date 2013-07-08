From: Jan Viktorin <xvikto03@stud.fit.vutbr.cz>
Date: Mon,  8 Jul 2013 16:08:18 +0200
Subject: [Buildroot] [PATCH 1/1] Make the microblaze toolchains easily
	distinguishable
Message-ID: <1373292498-1117-1-git-send-email-xvikto03@stud.fit.vutbr.cz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It was confusing to have two different toolchains with the
same label.

Signed-off-by: Jan Viktorin <xvikto03@stud.fit.vutbr.cz>
---
 toolchain/toolchain-external/Config.in |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 946063f..130b705 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -649,7 +649,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R1
 	  http://blackfin.uclinux.org.
 
 config BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEEL_14_3
-	bool "Xilinx Little Endian Microblaze GNU Tools"
+	bool "Xilinx Little Endian Microblaze GNU Tools 14.3"
 	depends on BR2_microblazeel
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
@@ -661,7 +661,7 @@ config BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEEL_14_3
 	  uses gcc 4.6.2, binutils 2.21.53, glibc 2.14 and gdb 7.4.50.
 
 config BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEEL_V2
-	bool "Xilinx Little Endian Microblaze GNU Tools"
+	bool "Xilinx Little Endian Microblaze GNU Tools v2"
 	depends on BR2_microblazeel
 	depends on BR2_HOSTARCH = "x86_64"
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
-- 
1.7.1
