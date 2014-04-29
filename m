From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 29 Apr 2014 18:49:11 +0200
Subject: [Buildroot] [PATCH 3/9] boot/syslinux: make the sub-options a choice
In-Reply-To: <cover.1398789775.git.yann.morin.1998@free.fr>
References: <cover.1398789775.git.yann.morin.1998@free.fr>
Message-ID: <7dc2975e14efed9252e5287502f96c74fecc1ffe.1398789775.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Currently it is possible to choose either, both or none of
the pxelinux or isolinux images.

But it does not make sense to build none or both, as we need
at least one to boot the target, and the target can use more
than one.

So, we need one and only one image to be selected at once.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Lundquist <thomasez@redpill-linpro.com>
Cc: Frank Hunleth <fhunleth@troodon-software.com>
Cc: Arnout Vandecappelle <arnout@mind.be>

---
Changes v1 -> v2:
  - make it a choice, not a forced-bool  (Arnout)
---
 boot/syslinux/Config.in | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/boot/syslinux/Config.in b/boot/syslinux/Config.in
index 5b1122d..f7525b8 100644
--- a/boot/syslinux/Config.in
+++ b/boot/syslinux/Config.in
@@ -10,12 +10,15 @@ config BR2_TARGET_SYSLINUX
 
 if BR2_TARGET_SYSLINUX
 
+choice
+	bool "Image to install"
+
 config BR2_TARGET_SYSLINUX_ISOLINUX
 	bool "Install isolinux"
-	default y
 
 config BR2_TARGET_SYSLINUX_PXELINUX
 	bool "Install pxelinux"
-	default y
+
+endchoice
 
 endif
-- 
1.8.3.2
