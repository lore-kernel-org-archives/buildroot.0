From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Sep 2019 22:46:18 +0200
Subject: [Buildroot] [git commit] package/brltty: add expat optional
 dependency
Message-ID: <20190928204919.3F07C82678@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=def0f8d1347d800f37c68b31289758eb60da6239
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

expat optional dependency has been added in version 6.0 with
https://github.com/brltty/brltty/commit/a37febee8cc4215eaac668a064ebc590684122b7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/brltty/brltty.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/brltty/brltty.mk b/package/brltty/brltty.mk
index 30114606f1..aee18d0b9a 100644
--- a/package/brltty/brltty.mk
+++ b/package/brltty/brltty.mk
@@ -50,6 +50,13 @@ else
 BRLTTY_CONF_OPTS += --without-espeak
 endif
 
+ifeq ($(BR2_PACKAGE_EXPAT),y)
+BRLTTY_DEPENDENCIES += expat
+BRLTTY_CONF_OPTS += --enable-expat
+else
+BRLTTY_CONF_OPTS += --disable-expat
+endif
+
 ifeq ($(BR2_PACKAGE_FLITE),y)
 BRLTTY_DEPENDENCIES += flite
 BRLTTY_CONF_OPTS += --with-flite=$(STAGING_DIR)/usr
