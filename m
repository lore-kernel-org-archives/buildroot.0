From: =?UTF-8?q?J=C3=B6rg=20Krause?= <jkrause@posteo.de>
Date: Mon, 11 Aug 2014 13:42:52 +0200
Subject: [Buildroot] [PATCH 2/4] mpd: Fix config option for plugin FLAC
In-Reply-To: <1407757374-7456-1-git-send-email-jkrause@posteo.de>
References: <1407757374-7456-1-git-send-email-jkrause@posteo.de>
Message-ID: <1407757374-7456-3-git-send-email-jkrause@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: J?rg Krause <jkrause@posteo.de>
---
 package/mpd/mpd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index cd18754..cddcfb2 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -54,7 +54,7 @@ endif
 ifeq ($(BR2_PACKAGE_MPD_FLAC),y)
 MPD_DEPENDENCIES += flac
 else
-MPD_CONF_OPT += --without-flac --disable-oggflac
+MPD_CONF_OPT += --disable-flac
 endif
 
 ifeq ($(BR2_PACKAGE_MPD_CURL),y)
-- 
2.0.4
