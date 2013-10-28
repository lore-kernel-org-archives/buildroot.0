From: Markos Chandras <markos.chandras@imgtec.com>
Date: Mon, 28 Oct 2013 14:21:09 +0000
Subject: [Buildroot] [PATCH] arch/mips: Set BR2_GCC_TARGET_ARCH for MIPS
Message-ID: <1382970069-16449-1-git-send-email-markos.chandras@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Set --with-arch instead of --with-tune for MIPS so that the
generated code will be optimal for the given MIPS ISA.

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/Config.in.mips | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/Config.in.mips b/arch/Config.in.mips
index 6242bcc..86fbe64 100644
--- a/arch/Config.in.mips
+++ b/arch/Config.in.mips
@@ -72,7 +72,7 @@ config BR2_ENDIAN
 	default "LITTLE"	if BR2_mipsel || BR2_mips64el
 	default "BIG" 	    	if BR2_mips || BR2_mips64
 
-config BR2_GCC_TARGET_TUNE
+config BR2_GCC_TARGET_ARCH
 	default "mips1"		if BR2_mips_1
 	default "mips2"		if BR2_mips_2
 	default "mips3"		if BR2_mips_3
-- 
1.8.4
