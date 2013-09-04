From: Axel Lin <axel.lin@ingics.com>
Date: Wed, 04 Sep 2013 09:47:49 +0800
Subject: [Buildroot] [PATCH] elf2flt: Allow enabling elf2flt support for
	blackfin
Message-ID: <1378259269.32360.1.camel@phoenix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This allows using toolchain-buildroot to build BFLT executable for blackfin.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
build with elf2flt disabled:
# BR2_PACKAGE_HOST_ELF2FLT is not set
$ file output/target/bin/busybox
output/target/bin/busybox: ELF 32-bit LSB executable, Analog Devices Blackfin, version 1 (SYSV), statically linked, not stripped

build with elf2flt enabled:
BR2_PACKAGE_HOST_ELF2FLT=y
$ file output/target/bin/busybox 
output/target/bin/busybox: BFLT executable - version 4 ram


 package/elf2flt/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/elf2flt/Config.in.host b/package/elf2flt/Config.in.host
index 31a6c7f..dad48d8 100644
--- a/package/elf2flt/Config.in.host
+++ b/package/elf2flt/Config.in.host
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_HOST_ELF2FLT
 	bool "Enable elf2flt support?"
-	depends on BR2_arm || BR2_sh || BR2_sparc
+	depends on BR2_arm || BR2_bfin || BR2_sh || BR2_sparc
 	help
 	  uCLinux uses a Binary Flat format commonly known as BFLT. It
 	  is a relatively simple and lightweight executable format
-- 
1.8.1.2
