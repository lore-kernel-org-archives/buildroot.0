From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 3 May 2014 21:35:41 +0200
Subject: [Buildroot] [git commit] boot/syslinux: make the sub-options a
	choice
Message-ID: <20140503200855.D1F7B9CACC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0b0eebe96113c75ca8c5ee43fdbf8ebb15e4b39d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently it is possible to choose either, both or none of
the pxelinux or isolinux images.

But it does not make sense to build none or both, as we need
at least one to boot the target, and the target can not use
more than one.

So, we need one and only one image to be selected at once.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Lundquist <thomasez@redpill-linpro.com>
Cc: Frank Hunleth <fhunleth@troodon-software.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Tested-by: Frank Hunleth <fhunleth@troodon-software.com>
Tested-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/syslinux/Config.in |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)

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
