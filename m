From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  9 Sep 2017 23:39:51 +0200
Subject: [Buildroot] [PATCH 45/49 v2] package/asterisk: add optional libcap
	dependency
In-Reply-To: <cover.1504993178.git.yann.morin.1998@free.fr>
References: <cover.1504993178.git.yann.morin.1998@free.fr>
Message-ID: <792b38a2bf1b8d9adad7de1ed0f570bb47ea6026.1504993178.git.yann.morin.1998@free.fr>
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
index 9327451254..cd3325ce9e 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -42,7 +42,6 @@ ASTERISK_CONF_OPTS = \
 	--disable-asteriskssl \
 	--disable-rpath \
 	--without-bfd \
-	--without-cap \
 	--without-curses \
 	--without-gtk2 \
 	--without-gmime \
@@ -157,6 +156,13 @@ else
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
2.11.0
