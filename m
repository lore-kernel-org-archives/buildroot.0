From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 3 May 2014 21:36:33 +0200
Subject: [Buildroot] [git commit] boot/syslinux: rewrite options prompts
Message-ID: <20140503200855.DB6519CAD8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=09548e41cb8f4f6092ad76173be1d47ae586da8b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Rewrite the options prompt in preparation to adding a new
type of image to install.

Add help entries to each option, too.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Frank Hunleth <fhunleth@troodon-software.com>
Tested-by: Frank Hunleth <fhunleth@troodon-software.com>
Tested-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/syslinux/Config.in |   12 +++++++++---
 1 files changed, 9 insertions(+), 3 deletions(-)

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
