From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 30 Dec 2016 11:29:17 +0100
Subject: [Buildroot] [PATCH 16/52] package/asterisk: add optional libvorbis
	dependency
In-Reply-To: <cover.1483093662.git.yann.morin.1998@free.fr>
References: <cover.1483093662.git.yann.morin.1998@free.fr>
Message-ID: <4cf1511365d4762e0b24da6c9fe351ecfcbf0e3b.1483093662.git.yann.morin.1998@free.fr>
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
index 30c75bc..aa04c7e 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -86,7 +86,6 @@ ASTERISK_CONF_OPTS += \
 	--without-tonezone \
 	--without-unbound \
 	--without-unixodbc \
-	--without-vorbis \
 	--without-vpb \
 	--without-x11 \
 	--with-crypt \
@@ -170,6 +169,13 @@ else
 ASTERISK_CONF_OPTS += --without-speex  --without-speexdsp
 endif
 
+ifeq ($(BR2_PACKAGE_LIBVORBIS),y)
+ASTERISK_DEPENDENCIES += libvorbis
+ASTERISK_CONF_OPTS += --with-vorbis
+else
+ASTERISK_CONF_OPTS += --without-vorbis
+endif
+
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 ASTERISK_DEPENDENCIES += zlib
 ASTERISK_CONF_OPTS += --with-z
-- 
2.7.4
