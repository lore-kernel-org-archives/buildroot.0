From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 23 Sep 2017 19:20:18 +0200
Subject: [Buildroot] [git commit] package/asterisk: add optional portaudio
	dependency
Message-ID: <20170923171327.8042E81077@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9b12a77ff81728ab914cf21d963aacc697f868c7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/asterisk/asterisk.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
index 82ca2ba..de3a0d5 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -84,7 +84,6 @@ ASTERISK_CONF_OPTS = \
 	--without-postgres \
 	--without-pjproject \
 	--without-popt \
-	--without-portaudio \
 	--without-pri \
 	--without-pwlib \
 	--without-radius \
@@ -173,6 +172,13 @@ else
 ASTERISK_CONF_OPTS += --without-opus
 endif
 
+ifeq ($(BR2_PACKAGE_PORTAUDIO),y)
+ASTERISK_DEPENDENCIES += portaudio
+ASTERISK_CONF_OPTS += --with-portaudio
+else
+ASTERISK_CONF_OPTS += --without-portaudio
+endif
+
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 ASTERISK_DEPENDENCIES += openssl
 ASTERISK_CONF_OPTS += --with-ssl
