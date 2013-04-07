From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  7 Apr 2013 21:25:24 +0200
Subject: [Buildroot] [PATCH 1/2] fs/jffs2: refactor endianess selection to
	use BR2_ENDIAN
In-Reply-To: <1365362725-30251-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1365362725-30251-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1365362725-30251-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Instead of explicitly listing the sub-architectures or architectures
that are big-endian, use BR2_ENDIAN directly.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 fs/jffs2/Config.in |    5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

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
-- 
1.7.9.5
