From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 23 Sep 2017 19:20:18 +0200
Subject: [Buildroot] [git commit] package/asterisk: add optional alsa-lib
	dependency
Message-ID: <20170923171327.07FDF8103C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bb50a1ffd512785ab31cd3147ed2aea83e8bdc93
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/asterisk/asterisk.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
index 8d21601..7ef449f 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -48,7 +48,6 @@ ASTERISK_CONF_OPTS = \
 	--disable-internal-poll \
 	--disable-asteriskssl \
 	--disable-rpath \
-	--without-asound \
 	--without-bfd \
 	--without-bluetooth \
 	--without-cap \
@@ -144,6 +143,13 @@ else
 ASTERISK_CONF_OPTS += --without-gsm
 endif
 
+ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
+ASTERISK_DEPENDENCIES += alsa-lib
+ASTERISK_CONF_OPTS += --with-asound
+else
+ASTERISK_CONF_OPTS += --without-asound
+endif
+
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 ASTERISK_DEPENDENCIES += openssl
 ASTERISK_CONF_OPTS += --with-ssl
