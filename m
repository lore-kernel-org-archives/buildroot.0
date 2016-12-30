From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 30 Dec 2016 11:29:07 +0100
Subject: [Buildroot] [PATCH 06/52] package/asterisk: add optional libgsm
	dependency
In-Reply-To: <cover.1483093662.git.yann.morin.1998@free.fr>
References: <cover.1483093662.git.yann.morin.1998@free.fr>
Message-ID: <e8f4afb3bd560c65b90e4ebc950ba8f2687237ba.1483093662.git.yann.morin.1998@free.fr>
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
index 147729f..4a701e8 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -37,7 +37,6 @@ ASTERISK_CONF_OPTS += \
 	--without-cpg \
 	--without-curses \
 	--without-dahdi \
-	--without-gsm \
 	--without-ilbc \
 	--without-gtk2 \
 	--without-gmime \
@@ -116,6 +115,13 @@ else
 ASTERISK_CONF_OPTS += --without-execinfo
 endif
 
+ifeq ($(BR2_PACKAGE_LIBGSM),y)
+ASTERISK_DEPENDENCIES += libgsm
+ASTERISK_CONF_OPTS += --with-gsm
+else
+ASTERISK_CONF_OPTS += --without-gsm
+endif
+
 ASTERISK_DIRS = \
 	ASTVARLIBDIR="/usr/lib/asterisk" \
 	ASTDATADIR="/usr/lib/asterisk" \
-- 
2.7.4
