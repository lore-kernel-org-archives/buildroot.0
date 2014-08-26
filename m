From: =?UTF-8?q?J=C3=B6rg=20Krause?= <jkrause@posteo.de>
Date: Tue, 26 Aug 2014 11:26:28 +0200
Subject: [Buildroot] [PATCH 1/1] package/mpd: Fix autobuilder failure
	4924194292a428a295ded2f7aa0b9a3f81ed1b4a
Message-ID: <1409045188-9522-1-git-send-email-jkrause@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The opus decoder plugin depends on libopus and libogg.

Signed-off-by: J?rg Krause <jkrause@posteo.de>
---
 package/mpd/Config.in | 1 +
 package/mpd/mpd.mk    | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

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
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index df94035..f84c6d0 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -97,7 +97,7 @@ MPD_CONF_OPT += --disable-sndfile
 endif
 
 ifeq ($(BR2_PACKAGE_MPD_OPUS),y)
-MPD_DEPENDENCIES += opus
+MPD_DEPENDENCIES += opus libogg
 MPD_CONF_OPT += --enable-opus
 else
 MPD_CONF_OPT += --disable-opus
-- 
2.1.0
