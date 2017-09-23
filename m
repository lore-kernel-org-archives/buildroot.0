From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 23 Sep 2017 19:20:18 +0200
Subject: [Buildroot] [git commit] package/asterisk: add optional libvorbis
	dependency
Message-ID: <20170923171327.70F8781077@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c5a4355c739a4d38547329eeb6e36c10f1a85795
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/asterisk/asterisk.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
index 1ac1f49..82ca2ba 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -103,7 +103,6 @@ ASTERISK_CONF_OPTS = \
 	--without-tonezone \
 	--without-unbound \
 	--without-unixodbc \
-	--without-vorbis \
 	--without-vpb \
 	--without-x11 \
 	--with-crypt \
@@ -188,6 +187,13 @@ else
 ASTERISK_CONF_OPTS += --without-speex  --without-speexdsp
 endif
 
+ifeq ($(BR2_PACKAGE_LIBVORBIS),y)
+ASTERISK_DEPENDENCIES += libvorbis
+ASTERISK_CONF_OPTS += --with-vorbis
+else
+ASTERISK_CONF_OPTS += --without-vorbis
+endif
+
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 ASTERISK_DEPENDENCIES += zlib
 ASTERISK_CONF_OPTS += --with-z
