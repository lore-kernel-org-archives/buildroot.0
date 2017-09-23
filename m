From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 23 Sep 2017 19:20:18 +0200
Subject: [Buildroot] [git commit] package/asterisk: add optional libical
	dependency
Message-ID: <20170923171327.923AF80330@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a1e2cd6325d66a7a793792d2a5cc661d10562f44
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/asterisk/asterisk.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
index de3a0d5..921281e 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -57,7 +57,6 @@ ASTERISK_CONF_OPTS = \
 	--without-gmime \
 	--without-h323 \
 	--without-hoard \
-	--without-ical \
 	--without-iconv \
 	--without-iksemel \
 	--without-imap \
@@ -149,6 +148,13 @@ else
 ASTERISK_CONF_OPTS += --without-bluetooth
 endif
 
+ifeq ($(BR2_PACKAGE_LIBICAL),y)
+ASTERISK_DEPENDENCIES += libical
+ASTERISK_CONF_OPTS += --with-ical
+else
+ASTERISK_CONF_OPTS += --without-ical
+endif
+
 ifeq ($(BR2_PACKAGE_NEON),y)
 ASTERISK_DEPENDENCIES += neon
 ASTERISK_CONF_OPTS += --with-neon
