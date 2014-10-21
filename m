From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Oct 2014 22:27:02 +0200
Subject: [Buildroot] [PATCH v2 15/30] webkit: use BR2_ARM_CPU_ARM* options
In-Reply-To: <1413923237-2861-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1413923237-2861-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1413923237-2861-16-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The webkit package is not available on ARM < v5, so this commit
switches to using the newly introduced BR2_ARM_CPU_ARM* options
instead of per ARM core options.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/webkit/Config.in | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/webkit/Config.in b/package/webkit/Config.in
index d1bc1d5..2f0b90d 100644
--- a/package/webkit/Config.in
+++ b/package/webkit/Config.in
@@ -1,8 +1,7 @@
 config BR2_PACKAGE_WEBKIT_ARCH_SUPPORTS
 	bool
 	# ARM needs BLX, so v5t+
-	default y if (BR2_arm || BR2_armeb) && \
-		!(BR2_arm920t || BR2_arm922t || BR2_fa526)
+	default y if (BR2_arm || BR2_armeb) && !BR2_ARM_CPU_ARMV4
 	default y if BR2_i386 || BR2_mips || BR2_mipsel || \
 		BR2_sparc || BR2_x86_64
 	depends on BR2_USE_MMU # libgail -> pango -> libglib2
-- 
2.0.0
