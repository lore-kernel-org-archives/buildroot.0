From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 30 Dec 2016 11:29:38 +0100
Subject: [Buildroot] [PATCH 37/52] package/asterisk: add optional corosync
	dependency
In-Reply-To: <cover.1483093662.git.yann.morin.1998@free.fr>
References: <cover.1483093662.git.yann.morin.1998@free.fr>
Message-ID: <61bf06a295129714bc85cae30c1dbdb4d073dda1.1483093662.git.yann.morin.1998@free.fr>
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
index e5fd28e..aff6ffc 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -32,7 +32,6 @@ ASTERISK_CONF_OPTS += \
 	--disable-rpath \
 	--without-bfd \
 	--without-cap \
-	--without-cpg \
 	--without-curses \
 	--without-gtk2 \
 	--without-gmime \
@@ -114,6 +113,13 @@ else
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
2.7.4
