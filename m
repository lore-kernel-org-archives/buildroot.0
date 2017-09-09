From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  9 Sep 2017 23:39:40 +0200
Subject: [Buildroot] [PATCH 34/49 v2] package/asterisk: add optional
	corosync dependency
In-Reply-To: <cover.1504993178.git.yann.morin.1998@free.fr>
References: <cover.1504993178.git.yann.morin.1998@free.fr>
Message-ID: <b1a4b1eecb9ce5d3224ab76947d614438924975a.1504993178.git.yann.morin.1998@free.fr>
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
index 1a56894f8f..452f61ba67 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -43,7 +43,6 @@ ASTERISK_CONF_OPTS = \
 	--disable-rpath \
 	--without-bfd \
 	--without-cap \
-	--without-cpg \
 	--without-curses \
 	--without-gtk2 \
 	--without-gmime \
@@ -132,6 +131,13 @@ else
 ASTERISK_CONF_OPTS += --without-bluetooth
 endif
 
+ifeq ($(BR2_PACKAGE_COROSYNC),y)
+ASTERISK_DEPENDENCIES += corosync
+ASTERISK_CONF_OPTS += --with-cpg
+else
+ASTERISK_CONF_OPTS += --without-cpg
+endif
+
 ifeq ($(BR2_PACKAGE_LIBICAL),y)
 ASTERISK_DEPENDENCIES += libical
 ASTERISK_CONF_OPTS += --with-ical
-- 
2.11.0
