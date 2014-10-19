From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Oct 2014 22:07:44 +0200
Subject: [Buildroot] [PATCH 10/31] libplayer: use BR2_ARM_CPU_ARM* option
In-Reply-To: <1413749285-1108-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1413749285-1108-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1413749285-1108-11-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libplayer/Config.in | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/libplayer/Config.in b/package/libplayer/Config.in
index 703b96d..1b6f1c0 100644
--- a/package/libplayer/Config.in
+++ b/package/libplayer/Config.in
@@ -19,8 +19,7 @@ config BR2_PACKAGE_LIBPLAYER_MPLAYER
 	depends on BR2_LARGEFILE
 	# mplayer
 	# Broken support for <ARMv5
-	depends on !(BR2_arm920t || BR2_arm920t || BR2_arm922t || BR2_fa526 \
-		|| BR2_strongarm)
+	depends on !BR2_ARM_CPU_ARMV4 && !BR2_ARM_CPU_ARMV4T
 	select BR2_PACKAGE_MPLAYER
 
 config BR2_PACKAGE_LIBPLAYER_GSTREAMER
-- 
2.0.0
