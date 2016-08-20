From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sat, 20 Aug 2016 21:46:05 +0200
Subject: [Buildroot] [PATCH] m68k: disable BR2_BINFMT_FLAT_SEP_DATA
Message-ID: <20160820194605.GA8295@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As some packages like pcre have bigger functions than sep-data format
allows for this kind of CPU, simple disable this format for now.

Fixes gcc compile errors like:

Fatal error: Tried to convert PC relative branch to absolute jump
or
error: value -yyyyy out of range

Fixes:
  http://autobuild.buildroot.net/results/20b/20b1586757450d6aad8583ad7a787a7ca11acef1/
  http://autobuild.buildroot.net/results/d31/d311955ada1ffcd7f69e82965c8fe33eabe488cd/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---

It would be nice if the autobuilder toolchain could be recompiled.

---
 arch/Config.in | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/Config.in b/arch/Config.in
index b980e05..4906be3 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -331,13 +331,12 @@ choice
 
 config BR2_BINFMT_FLAT_ONE
 	bool "One memory region"
-	depends on !BR2_m68k
 	help
 	  All segments are linked into one memory region.
 
 config BR2_BINFMT_FLAT_SEP_DATA
 	bool "Separate data and code region"
-	depends on BR2_m68k || BR2_bfin
+	depends on BR2_bfin
 	help
 	  Allow for the data and text segments to be separated and placed in
 	  different regions of memory.
-- 
2.1.4
