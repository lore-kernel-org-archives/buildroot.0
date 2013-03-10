From: Carsten Schoenert <c.schoenert@gmail.com>
Date: Sun, 10 Mar 2013 19:32:44 +0100
Subject: [Buildroot] =?utf-8?q?=5BPATCH_v2_03/10=5D_directfb=3A_expanding_?=
	=?utf-8?q?the_help_strings?=
In-Reply-To: <1362940371-25899-1-git-send-email-c.schoenert@gmail.com>
References: <1362940371-25899-1-git-send-email-c.schoenert@gmail.com>
Message-ID: <1362940371-25899-4-git-send-email-c.schoenert@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carsten Schoenert <c.schoenert@gmail.com>

Adding a helper string for the PXA3xx and graphics driver from Marvell
and the EP9x graphics driver from Cirrus Logic.

Signed-off-by: Carsten Schoenert <c.schoenert@gmail.com>
---
Changes in v2:
	- reworking the helper text after suggestions from Thomas Petazzoni

 package/directfb/Config.in |   11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/package/directfb/Config.in b/package/directfb/Config.in
index a184568..796be37 100644
--- a/package/directfb/Config.in
+++ b/package/directfb/Config.in
@@ -49,10 +49,21 @@ config BR2_PACKAGE_DIRECTFB_MATROX
 config BR2_PACKAGE_DIRECTFB_PXA3XX
 	bool "compile pxa3xx graphics driver"
 	depends on BR2_arm
+	help
+	  The Marvell PXA3xx Processor Family is a system-on-chip based
+	  on XScale? microarchitecture. This option enables the graphic
+	  driver support for the PXA3xx processor family.
+
+	  http://www.marvell.com/application-processors/pxa-family/
 
 config BR2_PACKAGE_DIRECTFB_EP9X
 	bool "compile ep9x graphics driver"
 	depends on BR2_arm
+	help
+	  Enable the graphic driver support for the EP93xx ARMv9 based
+	  processors from Cirrus Logic.
+
+	  http://cirrus.com/en/products/arm9.html
 
 config BR2_PACKAGE_DIRECTFB_UNICHROME
 	bool "compile unichrome graphics driver"
-- 
1.7.10.4
