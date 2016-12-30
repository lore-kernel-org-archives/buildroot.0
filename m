From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 30 Dec 2016 11:29:49 +0100
Subject: [Buildroot] [PATCH 48/52] package/asterisk: add optional libcap
	dependency
In-Reply-To: <cover.1483093662.git.yann.morin.1998@free.fr>
References: <cover.1483093662.git.yann.morin.1998@free.fr>
Message-ID: <2f7b2c8da45f5e959f6ce0efdbd79e8ad02e65dc.1483093662.git.yann.morin.1998@free.fr>
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
index bdc904c..dee60c0 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -31,7 +31,6 @@ ASTERISK_CONF_OPTS += \
 	--disable-asteriskssl \
 	--disable-rpath \
 	--without-bfd \
-	--without-cap \
 	--without-curses \
 	--without-gtk2 \
 	--without-gmime \
@@ -139,6 +138,13 @@ else
 ASTERISK_CONF_OPTS += --without-ldap
 endif
 
+ifeq ($(BR2_PACKAGE_LIBCAP),y)
+ASTERISK_DEPENDENCIES += libcap
+ASTERISK_CONF_OPTS += --with-cap
+else
+ASTERISK_CONF_OPTS += --without-cap
+endif
+
 ifeq ($(BR2_PACKAGE_LIBCURL),y)
 ASTERISK_DEPENDENCIES += libcurl
 ASTERISK_CONF_OPTS += --with-libcurl
-- 
2.7.4
