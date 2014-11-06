From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 6 Nov 2014 23:40:27 +0100
Subject: [Buildroot] [git commit] libplayer: use BR2_ARM_CPU_ARM* option
Message-ID: <20141106233446.66AC9B2052@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a5ca78d84225c2dde1dd0ed5a43a0e270a335a0a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libplayer/Config.in |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/package/libplayer/Config.in b/package/libplayer/Config.in
index 603bae8..fd3e325 100644
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
