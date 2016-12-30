From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 30 Dec 2016 11:29:52 +0100
Subject: [Buildroot] [PATCH 51/52] package/asterisk: add optional unixodbc
	dependency
In-Reply-To: <cover.1483093662.git.yann.morin.1998@free.fr>
References: <cover.1483093662.git.yann.morin.1998@free.fr>
Message-ID: <7fd2ef44f7fd19a7f92a10e4a13626c044430d93.1483093662.git.yann.morin.1998@free.fr>
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
index 1436575..6729414 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -38,7 +38,6 @@ ASTERISK_CONF_OPTS += \
 	--without-hoard \
 	--without-iksemel \
 	--without-imap \
-	--without-iodbc \
 	--without-isdnnet \
 	--without-jack \
 	--without-uriparser \
@@ -274,6 +273,13 @@ else
 ASTERISK_CONF_OPTS += --without-vorbis
 endif
 
+ifeq ($(BR2_PACKAGE_UNIXODBC),y)
+ASTERISK_DEPENDENCIES += unixodbc
+ASTERISK_CONF_OPTS += --without-iodbc
+else
+ASTERISK_CONF_OPTS += --without-iodbc
+endif
+
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 ASTERISK_DEPENDENCIES += zlib
 ASTERISK_CONF_OPTS += --with-z
-- 
2.7.4
