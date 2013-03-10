From: Carsten Schoenert <c.schoenert@gmail.com>
Date: Sun, 10 Mar 2013 10:47:37 +0100
Subject: [Buildroot] =?utf-8?q?=5BPATCH_3/4=5D_directfb=3A_expanding_the_h?=
	=?utf-8?q?elp_strings?=
In-Reply-To: <1362908858-6340-1-git-send-email-c.schoenert@gmail.com>
References: <1362908858-6340-1-git-send-email-c.schoenert@gmail.com>
Message-ID: <1362908858-6340-4-git-send-email-c.schoenert@gmail.com>
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
 package/directfb/Config.in |   17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/package/directfb/Config.in b/package/directfb/Config.in
index a184568..3d22e15 100644
--- a/package/directfb/Config.in
+++ b/package/directfb/Config.in
@@ -49,10 +49,27 @@ config BR2_PACKAGE_DIRECTFB_MATROX
 config BR2_PACKAGE_DIRECTFB_PXA3XX
 	bool "compile pxa3xx graphics driver"
 	depends on BR2_arm
+    help
+      The Marvell PXA3xx Processor Family is a system-on-chip based
+      on XScale? microarchitecture. The PXA3xx processor provide
+      high-performance multimedia, low-power capabilities, and rich
+      peripheral integration. The PXA3xx Processor Family provide
+      enhanced features compared to the PXA27x Processor Family, and
+      are the first Marvell applications processors to integrate a
+      hardware video accelerator unit.
+
+      http://www.marvell.com/application-processors/pxa-family/
 
 config BR2_PACKAGE_DIRECTFB_EP9X
 	bool "compile ep9x graphics driver"
 	depends on BR2_arm
+    help
+      The EP93xx ARMv9 based processors from Cirrus Logic are highly
+      integrated systems-on-a-chip that pave the way for a multitude
+      of next-generation consumer and industrial electronic products.
+
+      http://cirrus.com/en/products/arm9.html
+
 
 config BR2_PACKAGE_DIRECTFB_UNICHROME
 	bool "compile unichrome graphics driver"
-- 
1.7.10.4
