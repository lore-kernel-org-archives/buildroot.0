From: =?UTF-8?q?J=C3=B6rg=20Krause?= <jkrause@posteo.de>
Date: Mon, 11 Aug 2014 13:42:54 +0200
Subject: [Buildroot] [PATCH 4/4] mpd: Add missing config option for plugin
	MAD
In-Reply-To: <1407757374-7456-1-git-send-email-jkrause@posteo.de>
References: <1407757374-7456-1-git-send-email-jkrause@posteo.de>
Message-ID: <1407757374-7456-5-git-send-email-jkrause@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: J?rg Krause <jkrause@posteo.de>
---
 package/mpd/mpd.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index 2c2f74f..df94035 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -110,6 +110,13 @@ else
 MPD_CONF_OPT += --disable-vorbis --disable-vorbis-encoder
 endif
 
+ifeq ($(BR2_PACKAGE_MPD_MAD),y)
+MPD_DEPENDENCIES += libid3tag libmad
+MPD_CONF_OPT += --enable-mad
+else
+MPD_CONF_OPT += --disable-mad
+endif
+
 ifeq ($(BR2_PACKAGE_MPD_MPG123),y)
 MPD_DEPENDENCIES += libid3tag mpg123
 MPD_CONF_OPT += --enable-mpg123
-- 
2.0.4
