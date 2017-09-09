From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  9 Sep 2017 23:39:19 +0200
Subject: [Buildroot] [PATCH 13/49 v2] package/asterisk: add optional
	libvorbis dependency
In-Reply-To: <cover.1504993178.git.yann.morin.1998@free.fr>
References: <cover.1504993178.git.yann.morin.1998@free.fr>
Message-ID: <dc91ae8aed1947f345e8d06e56139f9865c5be49.1504993178.git.yann.morin.1998@free.fr>
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
index 4a7fd8c6d5..342c642feb 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -97,7 +97,6 @@ ASTERISK_CONF_OPTS = \
 	--without-tonezone \
 	--without-unbound \
 	--without-unixodbc \
-	--without-vorbis \
 	--without-vpb \
 	--without-x11 \
 	--with-crypt \
@@ -188,6 +187,13 @@ else
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
2.11.0
