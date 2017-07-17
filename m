From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 17 Jul 2017 13:22:55 +0100
Subject: [Buildroot] [PATCH 2/2] arch/mips: improve help text of FP32 mode
	option
In-Reply-To: <20170717122255.61795-1-Vincent.Riera@imgtec.com>
References: <20170717122255.61795-1-Vincent.Riera@imgtec.com>
Message-ID: <20170717122255.61795-2-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 arch/Config.in.mips | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/Config.in.mips b/arch/Config.in.mips
index f2b352b0b..de71110e0 100644
--- a/arch/Config.in.mips
+++ b/arch/Config.in.mips
@@ -139,7 +139,10 @@ choice
 	depends on !BR2_ARCH_IS_64 && !BR2_MIPS_SOFT_FLOAT
 	default BR2_MIPS_FP32_MODE_XX
 	help
-	  FP mode to be used
+	  MIPS32 supports different FP modes (32,xx,64). Information about FP
+	  modes can be found here:
+	  https://sourceware.org/binutils/docs/as/MIPS-Options.html
+	  https://dmz-portal.imgtec.com/wiki/MIPS_O32_ABI_-_FR0_and_FR1_Interlinking#5._Generating_modeless_code
 
 config BR2_MIPS_FP32_MODE_32
 	bool "32"
-- 
2.13.0
