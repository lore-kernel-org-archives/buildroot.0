From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 6 Nov 2014 23:52:55 +0100
Subject: [Buildroot] [git commit] webkit: use BR2_ARM_CPU_ARM* options
Message-ID: <20141106233446.A1522B1487@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4fcba753836e43fceaf55fef2c1ac560c6e00210
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The webkit package is not available on ARM < v5, so this commit
switches to using the newly introduced BR2_ARM_CPU_ARM* options
instead of per ARM core options.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/webkit/Config.in |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

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
