From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Date: Mon, 10 May 2021 11:00:45 -0700
Subject: [Buildroot] [PATCH v3 1/4] ARC: config: explicit'ify -mcpu for cpu
 selection
In-Reply-To: <20210510180049.61421-1-vgupta@synopsys.com>
References: <20210510180049.61421-1-vgupta@synopsys.com>
Message-ID: <20210510180049.61421-2-vgupta@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This helps with distinguishing the cpu at the time of config selection

Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
---
 arch/Config.in.arc | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/Config.in.arc b/arch/Config.in.arc
index f7a6d920b50d..c9a695000f2c 100644
--- a/arch/Config.in.arc
+++ b/arch/Config.in.arc
@@ -6,20 +6,20 @@ choice
 	    Specific CPU to use
 
 config BR2_arc750d
-	bool "ARC 750D"
+	bool "ARC 750D (-mcpu=arc700)"
 
 config BR2_arc770d
-	bool "ARC 770D"
+	bool "ARC 770D (-mcpu=arc700)"
 
 config BR2_archs38
-	bool "ARC HS38"
+	bool "ARC HS38 (-mcpu=archs)"
 	help
 	  Generic ARC HS capable of running Linux, i.e. with MMU,
 	  caches and 32-bit multiplier. Also it corresponds to the
 	  default configuration in older GNU toolchain versions.
 
 config BR2_archs38_64mpy
-	bool "ARC HS38 with 64-bit mpy"
+	bool "ARC HS38 with 64-bit mpy (-mcpu=hs38)"
 	help
 	  Fully featured ARC HS capable of running Linux, i.e. with
 	  MMU, caches and 64-bit multiplier.
@@ -28,7 +28,7 @@ config BR2_archs38_64mpy
 	  for use this one.
 
 config BR2_archs38_full
-	bool "ARC HS38 with Quad MAC & FPU"
+	bool "ARC HS38 with Quad MAC & FPU (-mcpu=hs38_linux)"
 	help
 	  Fully featured ARC HS with additional support for
 	   - Dual- and quad multiply and MC oprations
@@ -38,12 +38,12 @@ config BR2_archs38_full
 	  ARChitect.
 
 config BR2_archs4x_rel31
-	bool "ARC HS48 rel 31"
+	bool "ARC HS48 rel 31  (-mcpu=hs4x_rel31)"
 	help
 	   Build for HS48 release 3.1
 
 config BR2_archs4x
-	bool "ARC HS48"
+	bool "ARC HS48 (-mcpu=hs4x)"
 	help
 	   Latest release of HS48 processor
 	   - Dual and Quad multiply and MAC operations
-- 
2.25.1
