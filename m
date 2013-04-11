From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 11 Apr 2013 15:57:37 +0200
Subject: [Buildroot] [git commit] fs/jffs2: refactor endianess selection to
	use BR2_ENDIAN
Message-ID: <20130411140826.D4B499B586@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0f1bce64bde1a17e4b8d2eceef19a3a4e9d40482
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Instead of explicitly listing the sub-architectures or architectures
that are big-endian, use BR2_ENDIAN directly.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 fs/jffs2/Config.in |    5 +----
 1 files changed, 1 insertions(+), 4 deletions(-)

diff --git a/fs/jffs2/Config.in b/fs/jffs2/Config.in
index 9a96d7d..f15e730 100644
--- a/fs/jffs2/Config.in
+++ b/fs/jffs2/Config.in
@@ -92,10 +92,7 @@ config BR2_TARGET_ROOTFS_JFFS2_PADSIZE
 
 choice
 	prompt "Endianess"
-	default BR2_TARGET_ROOTFS_JFFS2_BE if BR2_armeb || \
-			BR2_avr32 || BR2_m68k || BR2_mips || \
-			BR2_powerpc || BR2_sh2 || BR2_sh2a || \
-			BR2_sh3eb || BR2_sh4eb || BR2_sh4aeb || BR2_sparc
+	default BR2_TARGET_ROOTFS_JFFS2_BE if BR2_ENDIAN = "BIG"
 
 config BR2_TARGET_ROOTFS_JFFS2_LE
 	bool "little-endian"
