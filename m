From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 25 Apr 2014 00:29:59 +0200
Subject: [Buildroot] [PATCH 4/9] boot/syslinux: rewrite options prompts
In-Reply-To: <cover.1398378217.git.yann.morin.1998@free.fr>
References: <cover.1398378217.git.yann.morin.1998@free.fr>
Message-ID: <8977ed467510f41bf80553eb104ed93e52aac1c8.1398378217.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Rewrite the options prompt in preparation to adding a new
type of image to install.

Add help entries to each option, too.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Frank Hunleth <fhunleth@troodon-software.com>
---
 boot/syslinux/Config.in | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/boot/syslinux/Config.in b/boot/syslinux/Config.in
index 1b8c527..b92f28f 100644
--- a/boot/syslinux/Config.in
+++ b/boot/syslinux/Config.in
@@ -12,10 +12,16 @@ config BR2_TARGET_SYSLINUX
 if BR2_TARGET_SYSLINUX
 
 config BR2_TARGET_SYSLINUX_ISOLINUX
-	bool "Install isolinux"
+	bool "isolinux"
 	default y
+	help
+	  Install the legacy BIOS 'isolinux' image, to boot off
+	  optical medias (CDROM, DVD.)
 
 config BR2_TARGET_SYSLINUX_PXELINUX
-	bool "Install pxelinux"
+	bool "pxelinux"
+	help
+	  Install the legacy BIOS 'pxelinux' image, to boot off
+	  the network using PXE.
 
-endif
+endif # BR2_TARGET_SYSLINUX
-- 
1.8.3.2
