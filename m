From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 11 Oct 2018 09:28:44 +0200
Subject: [Buildroot] [git commit] boot/binaries-marvell: bump version to
 marvell-armada-18.06
Message-ID: <20181011072918.AF09782803@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=58e9d24952253a12dbb2b25e7470b3397b0eface
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Note that the license file has been entirely rewritten (hence the
change in the hash), but it is still GPL-2.0 with FreeRTOS exception.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/binaries-marvell/Config.in             | 4 ++--
 boot/binaries-marvell/binaries-marvell.hash | 4 ++--
 boot/binaries-marvell/binaries-marvell.mk   | 3 ++-
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/boot/binaries-marvell/Config.in b/boot/binaries-marvell/Config.in
index d565e4dbfd..63052070bd 100644
--- a/boot/binaries-marvell/Config.in
+++ b/boot/binaries-marvell/Config.in
@@ -26,7 +26,7 @@ endchoice
 
 config BR2_TARGET_BINARIES_MARVELL_IMAGE
 	string
-	default "mrvl_scp_bl2_8040.img" if BR2_TARGET_BINARIES_MARVELL_8040
-	default "mrvl_scp_bl2_7040.img" if BR2_TARGET_BINARIES_MARVELL_7040
+	default "mrvl_scp_bl2_mss_ap_cp1_a8040.img" if BR2_TARGET_BINARIES_MARVELL_8040
+	default "mrvl_scp_bl2_mss_ap_cp1_a7040.img" if BR2_TARGET_BINARIES_MARVELL_7040
 
 endif
diff --git a/boot/binaries-marvell/binaries-marvell.hash b/boot/binaries-marvell/binaries-marvell.hash
index 94c66039c9..0d214502a7 100644
--- a/boot/binaries-marvell/binaries-marvell.hash
+++ b/boot/binaries-marvell/binaries-marvell.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 7c41cddc2ce46038b630b59d2e9e50e903d27032bcfbf38019eaed14fcfdbe40 binaries-marvell-a8ac27b7884ed2c1efcf9f3326de3e0ed7b94e91.tar.gz
-sha256 d8560ab4ea4042a55eee6857ded1d7e4bca2d9120b8c7a86d2a7fdc4ba4994e0	README.md
+sha256 45c348d7a62fd147e7c6a59211a77876ce5dd26de690bd45ab79c8ff891acedf binaries-marvell-14481806e699dcc6f7025dbe3e46cf26bb787791.tar.gz
+sha256 509a36bb6faa106bbc9730c23038a361ee0c860e53a4cdf9e8605c0174fe45f7	README.md
diff --git a/boot/binaries-marvell/binaries-marvell.mk b/boot/binaries-marvell/binaries-marvell.mk
index 152c9cd97a..6c70148540 100644
--- a/boot/binaries-marvell/binaries-marvell.mk
+++ b/boot/binaries-marvell/binaries-marvell.mk
@@ -4,7 +4,8 @@
 #
 ################################################################################
 
-BINARIES_MARVELL_VERSION = a8ac27b7884ed2c1efcf9f3326de3e0ed7b94e91
+# This is version binaries-marvell-armada-18.06
+BINARIES_MARVELL_VERSION = 14481806e699dcc6f7025dbe3e46cf26bb787791
 BINARIES_MARVELL_SITE = $(call github,MarvellEmbeddedProcessors,binaries-marvell,$(BINARIES_MARVELL_VERSION))
 
 BINARIES_MARVELL_LICENSE = GPL-2.0 with freertos-exception-2.0
