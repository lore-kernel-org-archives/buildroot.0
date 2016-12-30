From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 30 Dec 2016 11:29:20 +0100
Subject: [Buildroot] [PATCH 19/52] package/asterisk: add optional libical
	dependency
In-Reply-To: <cover.1483093662.git.yann.morin.1998@free.fr>
References: <cover.1483093662.git.yann.morin.1998@free.fr>
Message-ID: <eddec7fe4d6fdd8ea5a23b3ac0f899ca947f5f29.1483093662.git.yann.morin.1998@free.fr>
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
index 4994111..70e8a60 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -39,7 +39,6 @@ ASTERISK_CONF_OPTS += \
 	--without-gmime \
 	--without-h323 \
 	--without-hoard \
-	--without-ical \
 	--without-iconv \
 	--without-iksemel \
 	--without-imap \
@@ -123,6 +122,13 @@ else
 ASTERISK_CONF_OPTS += --without-bluetooth
 endif
 
+ifeq ($(BR2_PACKAGE_LIBICAL),y)
+ASTERISK_DEPENDENCIES += libical
+ASTERISK_CONF_OPTS += --with-ical
+else
+ASTERISK_CONF_OPTS += --without-ical
+endif
+
 ifeq ($(BR2_PACKAGE_LIBILBC),y)
 ASTERISK_DEPENDENCIES += libilbc
 ASTERISK_CONF_OPTS += --with-ilbc
-- 
2.7.4
