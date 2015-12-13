From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 13 Dec 2015 19:34:31 +0100
Subject: [Buildroot] [PATCH 1/1] package/mplayer: Needs threads
Message-ID: <1450031671-24884-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/fc0/fc02e01514965e13ee1de8f520a5b45f63a1103e/
http://autobuild.buildroot.net/results/b9c/b9cb712b321de4528d1a8dfb9bdfb16190bb660a/
http://autobuild.buildroot.net/results/22a/22aa0367ff76a3024faec69c762a08a4a441f45f/
and others

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mplayer/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/mplayer/Config.in b/package/mplayer/Config.in
index 7a8b03f..686b3b0 100644
--- a/package/mplayer/Config.in
+++ b/package/mplayer/Config.in
@@ -10,12 +10,17 @@ config BR2_PACKAGE_MPLAYER_ARCH_SUPPORTS
 config BR2_PACKAGE_MPLAYER
 	bool "mplayer"
 	depends on BR2_PACKAGE_MPLAYER_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  MPlayer is a movie player which runs on many systems and supports
 	  many different file formats.
 
 	  http://www.mplayerhq.hu/
 
+comment "mplayer needs a toolchain w/ threads"
+	depends on BR2_PACKAGE_MPLAYER_ARCH_SUPPORTS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
 if BR2_PACKAGE_MPLAYER
 
 config BR2_PACKAGE_MPLAYER_MPLAYER
-- 
2.6.2
