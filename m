From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 30 Sep 2016 10:36:58 +0100
Subject: [Buildroot] [PATCH 12/13] MIPS: add support for P5600 cores
In-Reply-To: <20160930093659.35032-1-Vincent.Riera@imgtec.com>
References: <20160930093659.35032-1-Vincent.Riera@imgtec.com>
Message-ID: <20160930093659.35032-13-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 arch/Config.in.mips | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/Config.in.mips b/arch/Config.in.mips
index 73be3c9..897c944 100644
--- a/arch/Config.in.mips
+++ b/arch/Config.in.mips
@@ -55,6 +55,10 @@ config BR2_mips_m5101
 	bool "M5101"
 	depends on !BR2_ARCH_IS_64
 	select BR2_MIPS_CPU_MIPS32R5
+config BR2_mips_p5600
+	bool "P5600"
+	depends on !BR2_ARCH_IS_64
+	select BR2_MIPS_CPU_MIPS32R5
 config BR2_mips_64
 	bool "Generic MIPS64"
 	depends on BR2_ARCH_IS_64
@@ -123,6 +127,7 @@ config BR2_GCC_TARGET_ARCH
 	default "interaptiv"	if BR2_mips_interaptiv
 	default "m5100"		if BR2_mips_m5100
 	default "m5101"		if BR2_mips_m5101
+	default "p5600"		if BR2_mips_p5600
 	default "mips64"	if BR2_mips_64
 	default "mips64r2"	if BR2_mips_64r2
 	default "mips64r5"	if BR2_mips_64r5
-- 
2.10.0
