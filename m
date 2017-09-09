From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  9 Sep 2017 23:39:11 +0200
Subject: [Buildroot] [PATCH 05/49 v2] package/asterisk: add optional support
	for SSL
In-Reply-To: <cover.1504993178.git.yann.morin.1998@free.fr>
References: <cover.1504993178.git.yann.morin.1998@free.fr>
Message-ID: <9b06b7d831686f80c90346bdbbb4cc66884cc6c4.1504993178.git.yann.morin.1998@free.fr>
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
index 3051a651c2..f947362906 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -96,7 +96,6 @@ ASTERISK_CONF_OPTS = \
 	--without-speexdsp \
 	--without-sqlite \
 	--without-srtp \
-	--without-ssl \
 	--without-suppserv \
 	--without-tds \
 	--without-termcap \
@@ -138,6 +137,13 @@ else
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
2.11.0
