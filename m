From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 20 Nov 2014 11:37:19 +0200
Subject: [Buildroot] [PATCH] arch/Config.in: Drop unused BR2_BINFMT_ELF
Message-ID: <da642e089b9c4f19e755d4ef1f3b7477ac7a7201.1416476239.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The BR2_BINFMT_ELF symbol (introduced in commit 57133825c930) can't possibly
be selected because it depends on (!BR2_bfin && !BR2_m68k), while the
surrounding choice depends on (BR2_bfin || BR2_m68k). This symbol is never
used.

Cc: Sonic Zhang <sonic.zhang@analog.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 arch/Config.in | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/arch/Config.in b/arch/Config.in
index d62d8872b3f3..966046aa4b84 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -257,14 +257,6 @@ choice
 	depends on BR2_bfin || BR2_m68k
 	default BR2_BINFMT_FDPIC
 
-config BR2_BINFMT_ELF
-	bool "ELF"
-	depends on !BR2_bfin && !BR2_m68k
-	help
-	  ELF (Executable and Linkable Format) is a format for libraries and
-	  executables used across different architectures and operating
-	  systems.
-
 config BR2_BINFMT_FDPIC
 	bool "FDPIC"
 	depends on BR2_bfin || BR2_m68k
-- 
2.1.3
