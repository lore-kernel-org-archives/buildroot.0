From: =?UTF-8?q?Guido=20Mart=C3=ADnez?= <guido@vanguardiasur.com.ar>
Date: Tue, 14 Jul 2015 13:09:34 -0300
Subject: [Buildroot] [PATCH v5 3/3] toolchain: disable internal for Cortex-M3
In-Reply-To: <1436890174-23236-1-git-send-email-guido@vanguardiasur.com.ar>
References: <1436886664-3206-1-git-send-email-guido@vanguardiasur.com.ar>
 <1436890174-23236-1-git-send-email-guido@vanguardiasur.com.ar>
Message-ID: <1436890174-23236-3-git-send-email-guido@vanguardiasur.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The internal toolchain won't work with Cortex-M3, mostly because of the
fact that some packages (notably: uclibc and glibc) fall back to regular
ARM instructions in some situations, and Cortex-M3 has no support for
those kind of instructions.

So, just disable it for now and rely on the external toolchain.

Signed-off-by: Guido Mart?nez <guido@vanguardiasur.com.ar>
---
 toolchain/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index a851ce4..399d25b 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -40,6 +40,7 @@ choice
 config BR2_TOOLCHAIN_BUILDROOT
 	bool "Buildroot toolchain"
 	depends on !BR2_bfin
+	depends on !BR2_cortex_m3
 	select BR2_TOOLCHAIN_HAS_SHADOW_PASSWORDS
 
 config BR2_TOOLCHAIN_EXTERNAL
-- 
2.1.4
