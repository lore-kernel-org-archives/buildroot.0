From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 13 Nov 2013 14:46:16 +0100
Subject: [Buildroot] [git commit] libplayer: propagate mplayer arm variant
	dependencies
Message-ID: <20131113134659.9C18E9BC85@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=68a1bd1e4f6d0a56030f5b52183b4620c0467ee9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/a91/a91647e9aca73611f3866a672c61d4d820ea1ce6/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libplayer/Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/libplayer/Config.in b/package/libplayer/Config.in
index dad012d..113f650 100644
--- a/package/libplayer/Config.in
+++ b/package/libplayer/Config.in
@@ -16,6 +16,10 @@ config BR2_PACKAGE_LIBPLAYER_MPLAYER
 	depends on !BR2_sh4a && !BR2_sh4aeb && !BR2_microblaze && !BR2_aarch64
 	# mplayer
 	depends on BR2_LARGEFILE
+	# mplayer
+	# Broken support for <ARMv5
+	depends on !(BR2_arm7tdmi || BR2_arm720t || BR2_arm920t \
+		|| BR2_arm920t || BR2_arm922t || BR2_fa526 || BR2_strongarm)
 	select BR2_PACKAGE_MPLAYER
 
 config BR2_PACKAGE_LIBPLAYER_GSTREAMER
