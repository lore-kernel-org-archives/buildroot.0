From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  7 May 2014 14:10:04 -0300
Subject: [Buildroot] [PATCH 1/2] toolchain: remove nommu option for MIPS
Message-ID: <1399482605-1850-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

MIPS nommu never took off, the only MIPS processors without MMU are
microcontrollers and the only uclinux effort for them has non-upstream
patches against very very old versions.
See http://www.xiptech.com/uclinuxformips.htm

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 toolchain/toolchain-common.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index f98f19b..1573e00 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -92,7 +92,7 @@ config BR2_NEEDS_GETTEXT_IF_LOCALE
 	default y if (BR2_NEEDS_GETTEXT && BR2_ENABLE_LOCALE)
 
 config BR2_USE_MMU
-	bool "Enable MMU support" if BR2_arm || BR2_armeb || BR2_mips || BR2_mipsel || BR2_sh || BR2_xtensa
+	bool "Enable MMU support" if BR2_arm || BR2_armeb || BR2_sh || BR2_xtensa
 	default y if !BR2_bfin
 	help
 	  If your target has a MMU, you should say Y here.  If you
-- 
1.8.5.5
