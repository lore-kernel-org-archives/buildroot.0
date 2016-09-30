From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 30 Sep 2016 10:36:47 +0100
Subject: [Buildroot] [PATCH 01/13] MIPS: add default CPU ISAs
In-Reply-To: <20160930093659.35032-1-Vincent.Riera@imgtec.com>
References: <20160930093659.35032-1-Vincent.Riera@imgtec.com>
Message-ID: <20160930093659.35032-2-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Meant to be used by the target architecture variants.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 arch/Config.in.mips | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/Config.in.mips b/arch/Config.in.mips
index fda1a1d..5e97fd0 100644
--- a/arch/Config.in.mips
+++ b/arch/Config.in.mips
@@ -1,3 +1,17 @@
+# mips default CPU ISAs
+config BR2_MIPS_CPU_MIPS32
+	bool
+config BR2_MIPS_CPU_MIPS32R2
+	bool
+config BR2_MIPS_CPU_MIPS32R6
+	bool
+config BR2_MIPS_CPU_MIPS64
+	bool
+config BR2_MIPS_CPU_MIPS64R2
+	bool
+config BR2_MIPS_CPU_MIPS64R6
+	bool
+
 choice
 	prompt "Target Architecture Variant"
 	depends on BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
-- 
2.10.0
