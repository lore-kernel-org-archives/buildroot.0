From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 23 Sep 2017 19:20:18 +0200
Subject: [Buildroot] [git commit] package/asterisk: add optional bluez_utils
	dependency
Message-ID: <20170923171327.437FA8103C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=94ae9f15006714ff6bb181063e428988b1d7c3d6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/asterisk/asterisk.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
index bf706f7..74e45e2 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -49,7 +49,6 @@ ASTERISK_CONF_OPTS = \
 	--disable-asteriskssl \
 	--disable-rpath \
 	--without-bfd \
-	--without-bluetooth \
 	--without-cap \
 	--without-cpg \
 	--without-curses \
@@ -148,6 +147,13 @@ else
 ASTERISK_CONF_OPTS += --without-asound
 endif
 
+ifeq ($(BR2_PACKAGE_BLUEZ_UTILS),y)
+ASTERISK_DEPENDENCIES += bluez_utils
+ASTERISK_CONF_OPTS += --with-bluetooth
+else
+ASTERISK_CONF_OPTS += --without-bluetooth
+endif
+
 ifeq ($(BR2_PACKAGE_NEON),y)
 ASTERISK_DEPENDENCIES += neon
 ASTERISK_CONF_OPTS += --with-neon
