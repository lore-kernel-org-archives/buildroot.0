From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 26 Dec 2020 18:22:26 +0100
Subject: [Buildroot] [git commit] package/mutt: add zlib optional dependency
Message-ID: <20201226170551.447E081480@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=554610803c3807775c1d9e153187ee99ccfd11ad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

zlib is an optional dependency which is enabled by default since version
1.14.1 and
https://gitlab.com/muttmua/mutt/-/commit/136ae0add512f21bc418f9e31a2f1b970ad1a490

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mutt/mutt.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/mutt/mutt.mk b/package/mutt/mutt.mk
index cc4b5f56b4..4e14004577 100644
--- a/package/mutt/mutt.mk
+++ b/package/mutt/mutt.mk
@@ -61,6 +61,13 @@ else
 MUTT_CONF_OPTS += --without-sqlite3
 endif
 
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+MUTT_DEPENDENCIES += zlib
+MUTT_CONF_OPTS += --with-zlib=$(STAGING_DIR)/usr
+else
+MUTT_CONF_OPTS += --without-zlib
+endif
+
 # Avoid running tests to check for:
 #  - target system is *BSD
 #  - C99 conformance (snprintf, vsnprintf)
