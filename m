From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 23 Sep 2017 19:20:18 +0200
Subject: [Buildroot] [git commit] package/asterisk: add optional zlib
	dependency
Message-ID: <20170923171326.E10E67FBD7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=13fcc16db76d3c40911a3426cf6e8e729e077fa5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/asterisk/asterisk.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
index 573315c..a3a3703 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -114,7 +114,6 @@ ASTERISK_CONF_OPTS = \
 	--without-vorbis \
 	--without-vpb \
 	--without-x11 \
-	--without-z \
 	--with-crypt \
 	--with-jansson \
 	--with-libcurl \
@@ -146,6 +145,13 @@ else
 ASTERISK_CONF_OPTS += --without-gsm
 endif
 
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+ASTERISK_DEPENDENCIES += zlib
+ASTERISK_CONF_OPTS += --with-z
+else
+ASTERISK_CONF_OPTS += --without-z
+endif
+
 ASTERISK_DIRS = \
 	ASTVARLIBDIR="/usr/lib/asterisk" \
 	ASTDATADIR="/usr/lib/asterisk" \
