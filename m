From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 30 Dec 2016 11:29:08 +0100
Subject: [Buildroot] [PATCH 07/52] package/asterisk: add optional zlib
	dependency
In-Reply-To: <cover.1483093662.git.yann.morin.1998@free.fr>
References: <cover.1483093662.git.yann.morin.1998@free.fr>
Message-ID: <dac0c9ad3abe5e631684c859fbf2cd16c869f4c3.1483093662.git.yann.morin.1998@free.fr>
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
index 4a701e8..fa4b226 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -98,7 +98,6 @@ ASTERISK_CONF_OPTS += \
 	--without-vorbis \
 	--without-vpb \
 	--without-x11 \
-	--without-z \
 	--with-crypt \
 	--with-jansson \
 	--with-libxml2 \
@@ -122,6 +121,13 @@ else
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
2.7.4
