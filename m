From: =?UTF-8?q?J=C3=B6rg=20Krause?= <jkrause@posteo.de>
Date: Tue, 26 Aug 2014 10:28:05 +0200
Subject: [Buildroot] [PATCH 1/1] package/mpd: Fix missing dependency of
	libogg for plugin opus
Message-ID: <1409041685-9603-1-git-send-email-jkrause@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The opus decoder plugin depends on libopus and libogg.

Signed-off-by: J?rg Krause <jkrause@posteo.de>
---
 package/mpd/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index b8a56b7..108b2b1 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -145,6 +145,7 @@ config BR2_PACKAGE_MPD_MUSEPACK
 config BR2_PACKAGE_MPD_OPUS
 	bool "opus"
 	select BR2_PACKAGE_OPUS
+	select BR2_PACKAGE_LIBOGG
 	help
 	  Enable opus input support.
 	  Select this if you want to play back OPUS encoded files.
-- 
2.1.0
