From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  9 Sep 2017 23:39:55 +0200
Subject: [Buildroot] [PATCH 49/49 v2] package/asterisk: add optional jack2
	dependency
In-Reply-To: <cover.1504993178.git.yann.morin.1998@free.fr>
References: <cover.1504993178.git.yann.morin.1998@free.fr>
Message-ID: <52f266829b294499545ad7b38d32e884fa20d86d.1504993178.git.yann.morin.1998@free.fr>
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
index 3bf37da709..489fc49e30 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -51,7 +51,6 @@ ASTERISK_CONF_OPTS = \
 	--without-imap \
 	--without-iodbc \
 	--without-isdnnet \
-	--without-jack \
 	--without-uriparser \
 	--without-kqueue \
 	--without-libedit \
@@ -139,6 +138,13 @@ else
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
2.11.0
