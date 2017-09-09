From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  9 Sep 2017 23:39:09 +0200
Subject: [Buildroot] [PATCH 03/49 v2] package/asterisk: add optional libgsm
	dependency
In-Reply-To: <cover.1504993178.git.yann.morin.1998@free.fr>
References: <cover.1504993178.git.yann.morin.1998@free.fr>
Message-ID: <45db41b5a2895da41b458626beafa6657eb415cf.1504993178.git.yann.morin.1998@free.fr>
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
index 82d69afe49..3509783e66 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -48,7 +48,6 @@ ASTERISK_CONF_OPTS = \
 	--without-cpg \
 	--without-curses \
 	--without-dahdi \
-	--without-gsm \
 	--without-ilbc \
 	--without-gtk2 \
 	--without-gmime \
@@ -133,6 +132,13 @@ else
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
2.11.0
