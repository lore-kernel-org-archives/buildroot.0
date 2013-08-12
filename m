From: Markos Chandras <markos.chandras@imgtec.com>
Date: Mon, 12 Aug 2013 13:43:14 +0100
Subject: [Buildroot] [PATCH] arch/mips: Restrict n32 for Sourcery CodeBench
	toolchains.
Message-ID: <1376311394-17106-1-git-send-email-markos.chandras@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

n32 is not supported in Sourcery CodeBench toolchains.

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
See https://sourcery.mentor.com/GNUToolchain/release2477?@template=datasheet
---
 arch/Config.in.mips | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/Config.in.mips b/arch/Config.in.mips
index 6242bcc..a01d6bb 100644
--- a/arch/Config.in.mips
+++ b/arch/Config.in.mips
@@ -46,7 +46,10 @@ config BR2_MIPS_OABI32
 	bool "o32"
 config BR2_MIPS_NABI32
 	bool "n32"
-	depends on BR2_ARCH_IS_64
+	depends on BR2_ARCH_IS_64 && \
+		!BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201305 && \
+		!BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201209 && \
+		!BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201203
 config BR2_MIPS_NABI64
 	bool "n64"
 	depends on BR2_ARCH_IS_64
-- 
1.8.3.2
