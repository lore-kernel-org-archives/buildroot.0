From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Oct 2014 22:26:56 +0200
Subject: [Buildroot] [PATCH v2 09/30] libplayer: use BR2_ARM_CPU_ARM* option
In-Reply-To: <1413923237-2861-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1413923237-2861-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1413923237-2861-10-git-send-email-thomas.petazzoni@free-electrons.com>
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
index 703b96d..5a9f466 100644
--- a/package/libplayer/Config.in
+++ b/package/libplayer/Config.in
@@ -19,8 +19,7 @@ config BR2_PACKAGE_LIBPLAYER_MPLAYER
 	depends on BR2_LARGEFILE
 	# mplayer
 	# Broken support for <ARMv5
-	depends on !(BR2_arm920t || BR2_arm920t || BR2_arm922t || BR2_fa526 \
-		|| BR2_strongarm)
+	depends on !BR2_ARM_CPU_ARMV4
 	select BR2_PACKAGE_MPLAYER
 
 config BR2_PACKAGE_LIBPLAYER_GSTREAMER
-- 
2.0.0
