From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Jun 2020 22:20:59 +0200
Subject: [Buildroot] [git commit] package/janus-gateway: fix libogg
 dependency
Message-ID: <20200620202009.6BA8E82974@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2b47bd59a6f73e6d91f94059a58efc5be1ef627e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libogg is not only used for voicemail plugin, it is an optional
dependency of:
- audiobridge plugin since version 0.9.3 and
  https://github.com/meetecho/janus-gateway/commit/53761d07c5456424d368c708fda2757e6606a4bf
- streaming plugin since version 0.9.3 and
  https://github.com/meetecho/janus-gateway/commit/d9aa1cec84c662f2f7fda025ee023f6dec927bdc

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/janus-gateway/janus-gateway.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/janus-gateway/janus-gateway.mk b/package/janus-gateway/janus-gateway.mk
index 56b7d67332..94d83eb33e 100644
--- a/package/janus-gateway/janus-gateway.mk
+++ b/package/janus-gateway/janus-gateway.mk
@@ -11,7 +11,8 @@ JANUS_GATEWAY_LICENSE_FILES = COPYING
 
 # ding-libs provides the ini_config library
 JANUS_GATEWAY_DEPENDENCIES = host-pkgconf jansson libnice \
-	libsrtp host-gengetopt libglib2 openssl libconfig
+	libsrtp host-gengetopt libglib2 openssl libconfig \
+	$(if $(BR2_PACKAGE_LIBOGG),libogg)
 
 # Straight out of the repository, no ./configure, and we also patch
 # configure.ac.
@@ -72,7 +73,6 @@ JANUS_GATEWAY_CONF_OPTS += --disable-plugin-videoroom
 endif
 
 ifeq ($(BR2_PACKAGE_JANUS_GATEWAY_VOICE_MAIL),y)
-JANUS_GATEWAY_DEPENDENCIES += libogg
 JANUS_GATEWAY_CONF_OPTS += --enable-plugin-voicemail
 else
 JANUS_GATEWAY_CONF_OPTS += --disable-plugin-voicemail
