From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 23 Apr 2014 22:00:35 -0300
Subject: [Buildroot] [PATCHv2 6/6] toolchain: enable internal for aarch64
In-Reply-To: <1398301235-8445-1-git-send-email-gustavo@zacarias.com.ar>
References: <1398301235-8445-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1398301235-8445-6-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Enable the internal toolchain backend for aarch64.
Tested with arm_foundationv8_defconfig and ARMs foundation v8 emulator.
Both glibc & eglibc work.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 toolchain/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index a1065ac..54b5d17 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -43,7 +43,7 @@ choice
 
 config BR2_TOOLCHAIN_BUILDROOT
 	bool "Buildroot toolchain"
-	depends on !BR2_aarch64 && !BR2_nios2
+	depends on !BR2_nios2
 	select BR2_TOOLCHAIN_HAS_SHADOW_PASSWORDS
 
 config BR2_TOOLCHAIN_EXTERNAL
-- 
1.8.3.2
