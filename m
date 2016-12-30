From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 30 Dec 2016 11:29:09 +0100
Subject: [Buildroot] [PATCH 08/52] package/asterisk: add optional support
	for SSL
In-Reply-To: <cover.1483093662.git.yann.morin.1998@free.fr>
References: <cover.1483093662.git.yann.morin.1998@free.fr>
Message-ID: <5dce82451d6b74256b8e5a8bdb1f63b54dc0954d.1483093662.git.yann.morin.1998@free.fr>
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
index fa4b226..7028012 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -86,7 +86,6 @@ ASTERISK_CONF_OPTS += \
 	--without-speexdsp \
 	--without-sqlite \
 	--without-srtp \
-	--without-ssl \
 	--without-suppserv \
 	--without-tds \
 	--without-termcap \
@@ -121,6 +120,13 @@ else
 ASTERISK_CONF_OPTS += --without-gsm
 endif
 
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+ASTERISK_DEPENDENCIES += openssl
+ASTERISK_CONF_OPTS += --with-ssl
+else
+ASTERISK_CONF_OPTS += --without-ssl
+endif
+
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 ASTERISK_DEPENDENCIES += zlib
 ASTERISK_CONF_OPTS += --with-z
-- 
2.7.4
