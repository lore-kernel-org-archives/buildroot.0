From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Fri,  9 May 2014 18:08:42 +0400
Subject: [Buildroot] [PATCH] ARC: allow uImage cretaion for ARC
Message-ID: <1399644522-31363-1-git-send-email-abrodkin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Mischa Jonker <mjonker@synopsys.com>

Starting from U-Boot v2014.04 ARC architecture is supported,
so now it's possible to create uImage for ARC as well.

Signed-off-by: Mischa Jonker <mjonker@synopsys.com>

Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Cc: Peter Korsgaard <peter@korsgaard.com>

---
Prerequisite:
	[PATCH v3] uboot-tools: bump to version 2014.04
---
 linux/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/linux/Config.in b/linux/Config.in
index 77c28f3..cc1127a 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -167,7 +167,8 @@ choice
 
 config BR2_LINUX_KERNEL_UIMAGE
 	bool "uImage"
-	depends on BR2_arm || BR2_armeb || BR2_bfin || BR2_powerpc || BR2_avr32 || BR2_sh || BR2_sh64
+	depends on BR2_arc || BR2_arm || BR2_armeb || BR2_bfin || \
+		   BR2_powerpc || BR2_avr32 || BR2_sh || BR2_sh64
 	select BR2_LINUX_KERNEL_UBOOT_IMAGE
 
 config BR2_LINUX_KERNEL_APPENDED_UIMAGE
-- 
1.9.0
