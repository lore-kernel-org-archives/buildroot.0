From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  9 Sep 2017 23:39:54 +0200
Subject: [Buildroot] [PATCH 48/49 v2] package/asterisk: add optional
	unixodbc dependency
In-Reply-To: <cover.1504993178.git.yann.morin.1998@free.fr>
References: <cover.1504993178.git.yann.morin.1998@free.fr>
Message-ID: <de4e62d0de07797a5f2168c80a873cb04634e56c.1504993178.git.yann.morin.1998@free.fr>
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
index 54007f46b3..3bf37da709 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -79,7 +79,6 @@ ASTERISK_CONF_OPTS = \
 	--without-timerfd \
 	--without-tinfo \
 	--without-unbound \
-	--without-unixodbc \
 	--without-vpb \
 	--without-x11 \
 	--with-crypt \
@@ -292,6 +291,13 @@ else
 ASTERISK_CONF_OPTS += --without-vorbis
 endif
 
+ifeq ($(BR2_PACKAGE_UNIXODBC),y)
+ASTERISK_DEPENDENCIES += unixodbc
+ASTERISK_CONF_OPTS += --with-unixodbc
+else
+ASTERISK_CONF_OPTS += --without-unixodbc
+endif
+
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 ASTERISK_DEPENDENCIES += zlib
 ASTERISK_CONF_OPTS += --with-z
-- 
2.11.0
