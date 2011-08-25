From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 25 Aug 2011 17:29:40 +0200
Subject: [Buildroot] [git commit] mini2440_defconfig: fix getty config
Message-ID: <20110825153023.09D608CA67@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=d881a14f9b7e7367bc664105bd98166015eaefaf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

BR2_TARGET_GENERIC_GETTY_TTYSAC0 is no more.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 configs/mini2440_defconfig |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/configs/mini2440_defconfig b/configs/mini2440_defconfig
index d1be8e1..ac6d0cf 100644
--- a/configs/mini2440_defconfig
+++ b/configs/mini2440_defconfig
@@ -3,7 +3,8 @@ BR2_arm=y
 BR2_arm920t=y
 
 # Serial port
-BR2_TARGET_GENERIC_GETTY_TTYSAC0=y
+BR2_TARGET_GENERIC_GETTY=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttySAC0"
 
 # Filesystem
 BR2_TARGET_ROOTFS_JFFS2=y
-- 
1.7.3.4
