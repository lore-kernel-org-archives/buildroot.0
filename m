From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  9 Sep 2017 23:39:21 +0200
Subject: [Buildroot] [PATCH 15/49 v2] package/asterisk: add optional
	portaudio dependency
In-Reply-To: <cover.1504993178.git.yann.morin.1998@free.fr>
References: <cover.1504993178.git.yann.morin.1998@free.fr>
Message-ID: <72f954f5b191ff0e342ac2ac8a7ee7d78bafd70a.1504993178.git.yann.morin.1998@free.fr>
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
index bd5b794117..99f66aeeb0 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -77,7 +77,6 @@ ASTERISK_CONF_OPTS = \
 	--without-postgres \
 	--without-pjproject \
 	--without-popt \
-	--without-portaudio \
 	--without-pri \
 	--without-pwlib \
 	--without-radius \
@@ -179,6 +178,13 @@ else
 ASTERISK_CONF_OPTS += --without-opus
 endif
 
+ifeq ($(BR2_PACKAGE_PORTAUDIO),y)
+ASTERISK_DEPENDENCIES += portaudio
+ASTERISK_CONF_OPTS += --with-portaudio
+else
+ASTERISK_CONF_OPTS += --without-portaudio
+endif
+
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 ASTERISK_DEPENDENCIES += openssl
 ASTERISK_CONF_OPTS += --with-ssl
-- 
2.11.0
