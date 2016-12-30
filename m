From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 30 Dec 2016 11:29:53 +0100
Subject: [Buildroot] [PATCH 52/52] package/asterisk: add optional jack2
	dependency
In-Reply-To: <cover.1483093662.git.yann.morin.1998@free.fr>
References: <cover.1483093662.git.yann.morin.1998@free.fr>
Message-ID: <2c4935f525c5e093034b853387b907466af6d0d0.1483093662.git.yann.morin.1998@free.fr>
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
index 6729414..74a2cb4 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -39,7 +39,6 @@ ASTERISK_CONF_OPTS += \
 	--without-iksemel \
 	--without-imap \
 	--without-isdnnet \
-	--without-jack \
 	--without-uriparser \
 	--without-kqueue \
 	--without-libedit \
@@ -121,6 +120,13 @@ else
 ASTERISK_CONF_OPTS += --without-cpg
 endif
 
+ifeq ($(BR2_PACKAGE_JACK2),y)
+ASTERISK_DEPENDENCIES += jack2
+ASTERISK_CONF_OPTS += --with-jack
+else
+ASTERISK_CONF_OPTS += --without-jack
+endif
+
 ifeq ($(BR2_PACKAGE_LIBICAL),y)
 ASTERISK_DEPENDENCIES += libical
 ASTERISK_CONF_OPTS += --with-ical
-- 
2.7.4
