From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 Aug 2014 13:54:22 +0200
Subject: [Buildroot] [PATCH] webkit: disable on SuperH
Message-ID: <1409140462-10560-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Webkit has been failing on SuperH since a long time, with nobody
caring to fix the problem. Since anyway our Webkit version is old and
in the process of being updated, our best option for 2014.08 is to
simply disallow Webkit on SuperH.

Fixes:

  http://autobuild.buildroot.org/results/3a0/3a0c48f65c06f7f19e608d54307c0788a0130589/
  http://autobuild.buildroot.org/?reason=webkit-1.11.5&arch=sh4a

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/webkit/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/webkit/Config.in b/package/webkit/Config.in
index fcb61b6..d1bc1d5 100644
--- a/package/webkit/Config.in
+++ b/package/webkit/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_WEBKIT_ARCH_SUPPORTS
 	default y if (BR2_arm || BR2_armeb) && \
 		!(BR2_arm920t || BR2_arm922t || BR2_fa526)
 	default y if BR2_i386 || BR2_mips || BR2_mipsel || \
-		BR2_sh || BR2_sparc || BR2_x86_64
+		BR2_sparc || BR2_x86_64
 	depends on BR2_USE_MMU # libgail -> pango -> libglib2
 
 # disabled on powerpc due to bug https://bugs.webkit.org/show_bug.cgi?id=113638
-- 
2.0.0
