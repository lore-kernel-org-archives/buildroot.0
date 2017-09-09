From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  9 Sep 2017 23:39:10 +0200
Subject: [Buildroot] [PATCH 04/49 v2] package/asterisk: add optional zlib
	dependency
In-Reply-To: <cover.1504993178.git.yann.morin.1998@free.fr>
References: <cover.1504993178.git.yann.morin.1998@free.fr>
Message-ID: <46609e78b9cd45ead4f708027a507c11be6f2f35.1504993178.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/asterisk/asterisk.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
index 3509783e66..3051a651c2 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -108,7 +108,6 @@ ASTERISK_CONF_OPTS = \
 	--without-vorbis \
 	--without-vpb \
 	--without-x11 \
-	--without-z \
 	--with-crypt \
 	--with-jansson \
 	--with-libcurl \
@@ -139,6 +138,13 @@ else
 ASTERISK_CONF_OPTS += --without-gsm
 endif
 
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+ASTERISK_DEPENDENCIES += zlib
+ASTERISK_CONF_OPTS += --with-z
+else
+ASTERISK_CONF_OPTS += --without-z
+endif
+
 ASTERISK_DIRS = \
 	ASTVARLIBDIR="/usr/lib/asterisk" \
 	ASTDATADIR="/usr/lib/asterisk" \
-- 
2.11.0
