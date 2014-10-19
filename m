From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Oct 2014 22:07:50 +0200
Subject: [Buildroot] [PATCH 16/31] webkit: use BR2_ARM_CPU_ARM* options
In-Reply-To: <1413749285-1108-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1413749285-1108-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1413749285-1108-17-git-send-email-thomas.petazzoni@free-electrons.com>
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
 package/webkit/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/webkit/Config.in b/package/webkit/Config.in
index d1bc1d5..054b818 100644
--- a/package/webkit/Config.in
+++ b/package/webkit/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_WEBKIT_ARCH_SUPPORTS
 	bool
 	# ARM needs BLX, so v5t+
 	default y if (BR2_arm || BR2_armeb) && \
-		!(BR2_arm920t || BR2_arm922t || BR2_fa526)
+		!BR2_ARM_CPU_ARMV4 && !BR2_ARM_CPU_ARMV4T
 	default y if BR2_i386 || BR2_mips || BR2_mipsel || \
 		BR2_sparc || BR2_x86_64
 	depends on BR2_USE_MMU # libgail -> pango -> libglib2
-- 
2.0.0
