From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 23 Sep 2017 19:20:18 +0200
Subject: [Buildroot] [git commit] package/asterisk: add optional opus
	dependency
Message-ID: <20170923171327.502F08103C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=da2539d5efba94a68c7a84b2ff7d81f48436f476
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/asterisk/asterisk.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
index 74e45e2..2278d04 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -79,7 +79,6 @@ ASTERISK_CONF_OPTS = \
 	--without-netsnmp \
 	--without-newt \
 	--without-openr2 \
-	--without-opus \
 	--without-osptk \
 	--without-oss \
 	--without-postgres \
@@ -170,6 +169,13 @@ else
 ASTERISK_CONF_OPTS += --without-ogg
 endif
 
+ifeq ($(BR2_PACKAGE_OPUS),y)
+ASTERISK_DEPENDENCIES += opus
+ASTERISK_CONF_OPTS += --with-opus
+else
+ASTERISK_CONF_OPTS += --without-opus
+endif
+
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 ASTERISK_DEPENDENCIES += openssl
 ASTERISK_CONF_OPTS += --with-ssl
