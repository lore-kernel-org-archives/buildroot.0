From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 23 Sep 2017 19:20:18 +0200
Subject: [Buildroot] [git commit] package/asterisk: add optional libgsm
	dependency
Message-ID: <20170923171326.D2E4D7FBD7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d068ccfd08b573190c97a6949a27760201a5817b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/asterisk/asterisk.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
index 65f8062..573315c 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -55,7 +55,6 @@ ASTERISK_CONF_OPTS = \
 	--without-cpg \
 	--without-curses \
 	--without-dahdi \
-	--without-gsm \
 	--without-gtk2 \
 	--without-gmime \
 	--without-h323 \
@@ -140,6 +139,13 @@ else
 ASTERISK_CONF_OPTS += --without-execinfo
 endif
 
+ifeq ($(BR2_PACKAGE_LIBGSM),y)
+ASTERISK_DEPENDENCIES += libgsm
+ASTERISK_CONF_OPTS += --with-gsm
+else
+ASTERISK_CONF_OPTS += --without-gsm
+endif
+
 ASTERISK_DIRS = \
 	ASTVARLIBDIR="/usr/lib/asterisk" \
 	ASTDATADIR="/usr/lib/asterisk" \
