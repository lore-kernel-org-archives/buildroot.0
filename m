From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  4 Feb 2014 15:18:23 +0100
Subject: [Buildroot] [PATCH] uclibc: fix sh2a option definition
Message-ID: <1391523503-7867-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The uClibc options for sh2a is SH2A, not SHA2, and this value should
be used for sh2a, not sh2.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/uclibc/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index 079a15c..77756e3 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -240,7 +240,7 @@ config BR2_UCLIBC_MIPS_ISA
 config BR2_UCLIBC_SH_TYPE
 	string
 	depends on BR2_UCLIBC_TARGET_ARCH = "sh"
-	default SHA2 if BR2_sh2
+	default SH2A if BR2_sh2a
 	default SH3  if BR2_sh3 || BR2_sh3eb
 	default SH4  if BR2_sh4 || BR2_sh4eb
 
-- 
1.8.3.2
