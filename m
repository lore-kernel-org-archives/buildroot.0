From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 23 Sep 2017 19:20:18 +0200
Subject: [Buildroot] [git commit] package/asterisk: add optional netsnmp
	dependency
Message-ID: <20170923171328.5909380FA9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4d597d70ec20d48b9a73d8987854bb0ff8f2e0d6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/asterisk/asterisk.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
index 02d0f29..a6801a0 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -73,7 +73,6 @@ ASTERISK_CONF_OPTS = \
 	--without-mysqlclient \
 	--without-nbs \
 	--without-neon29 \
-	--without-netsnmp \
 	--without-newt \
 	--without-openr2 \
 	--without-osptk \
@@ -164,6 +163,13 @@ else
 ASTERISK_CONF_OPTS += --without-neon
 endif
 
+ifeq ($(BR2_PACKAGE_NETSNMP),y)
+ASTERISK_DEPENDENCIES += netsnmp
+ASTERISK_CONF_OPTS += --with-netsnmp=$(STAGING_DIR)/usr
+else
+ASTERISK_CONF_OPTS += --without-netsnmp
+endif
+
 ifeq ($(BR2_PACKAGE_LIBOGG),y)
 ASTERISK_DEPENDENCIES += libogg
 ASTERISK_CONF_OPTS += --with-ogg
