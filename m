From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 23 Sep 2017 19:20:18 +0200
Subject: [Buildroot] [git commit] package/asterisk: add optional support for
	openssl
Message-ID: <20170923171326.EF6087FBD7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5bc671c32dce7f0eb6be3b903a3ed45f113fcd33
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/asterisk/asterisk.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
index a3a3703..8d21601 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -102,7 +102,6 @@ ASTERISK_CONF_OPTS = \
 	--without-speexdsp \
 	--without-sqlite \
 	--without-srtp \
-	--without-ssl \
 	--without-suppserv \
 	--without-tds \
 	--without-termcap \
@@ -145,6 +144,13 @@ else
 ASTERISK_CONF_OPTS += --without-gsm
 endif
 
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+ASTERISK_DEPENDENCIES += openssl
+ASTERISK_CONF_OPTS += --with-ssl
+else
+ASTERISK_CONF_OPTS += --without-ssl
+endif
+
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 ASTERISK_DEPENDENCIES += zlib
 ASTERISK_CONF_OPTS += --with-z
