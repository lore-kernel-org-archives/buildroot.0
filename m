From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri,  2 May 2014 19:10:30 +0200
Subject: [Buildroot] [PATCH 04/12] boot/syslinux: rewrite options prompts
In-Reply-To: <cover.1399050467.git.yann.morin.1998@free.fr>
References: <cover.1399050467.git.yann.morin.1998@free.fr>
Message-ID: <13828ae91b00bb8f7602dc540fd4bc343de19418.1399050467.git.yann.morin.1998@free.fr>
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
Tested-by: Frank Hunleth <fhunleth@troodon-software.com>
Tested-by: Romain Naour <romain.naour@openwide.fr>

---
Changes v1 -> v2:
  - typo s/medias/media/  (Arnout)
  - s/legacy BIOS/legacy-BIOS/ to remove ambiguity  (Arnout)
---
 boot/syslinux/Config.in | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/boot/syslinux/Config.in b/boot/syslinux/Config.in
index f7525b8..7263128 100644
--- a/boot/syslinux/Config.in
+++ b/boot/syslinux/Config.in
@@ -14,11 +14,17 @@ choice
 	bool "Image to install"
 
 config BR2_TARGET_SYSLINUX_ISOLINUX
-	bool "Install isolinux"
+	bool "isolinux"
+	help
+	  Install the legacy-BIOS 'isolinux' image, to boot off
+	  optical media (CDROM, DVD.)
 
 config BR2_TARGET_SYSLINUX_PXELINUX
-	bool "Install pxelinux"
+	bool "pxelinux"
+	help
+	  Install the legacy-BIOS 'pxelinux' image, to boot off
+	  the network using PXE.
 
 endchoice
 
-endif
+endif # BR2_TARGET_SYSLINUX
-- 
1.8.3.2
