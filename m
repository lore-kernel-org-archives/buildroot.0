From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 23 Sep 2017 19:20:18 +0200
Subject: [Buildroot] [git commit] package/asterisk: add optional libogg
	dependency
Message-ID: <20170923171327.380318103C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=637800de21706bd98e39fed162281763efddbba6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/asterisk/asterisk.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
index 859129b..bf706f7 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -79,7 +79,6 @@ ASTERISK_CONF_OPTS = \
 	--without-neon29 \
 	--without-netsnmp \
 	--without-newt \
-	--without-ogg \
 	--without-openr2 \
 	--without-opus \
 	--without-osptk \
@@ -158,6 +157,13 @@ else
 ASTERISK_CONF_OPTS += --without-neon
 endif
 
+ifeq ($(BR2_PACKAGE_LIBOGG),y)
+ASTERISK_DEPENDENCIES += libogg
+ASTERISK_CONF_OPTS += --with-ogg
+else
+ASTERISK_CONF_OPTS += --without-ogg
+endif
+
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 ASTERISK_DEPENDENCIES += openssl
 ASTERISK_CONF_OPTS += --with-ssl
