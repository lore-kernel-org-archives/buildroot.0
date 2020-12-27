From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 27 Dec 2020 09:01:39 +0100
Subject: [Buildroot] [git commit branch/2020.11.x] package/mutt: add zlib
 optional dependency
Message-ID: <20201227082441.C8ACA81370@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fa41416454cd584a480716b4a96ba84dea2bd7cf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

zlib is an optional dependency which is enabled by default since version
1.14.1 and
https://gitlab.com/muttmua/mutt/-/commit/136ae0add512f21bc418f9e31a2f1b970ad1a490

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 554610803c3807775c1d9e153187ee99ccfd11ad)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
