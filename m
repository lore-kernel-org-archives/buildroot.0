From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 21 Jul 2020 23:12:38 +0200
Subject: [Buildroot] [git commit branch/2020.05.x] package/exiv2: drop
 unrecognized variable
Message-ID: <20200721210931.D87827F917@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=914f8322d1843fb7260791601952c4a1d96e63b6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.05.x

EXIV2_ENABLE_LIBXMP has been dropped since version 0.27 and
https://github.com/Exiv2/exiv2/commit/2784b1f7f7ddcc66211e6cf492de1588aa6093d9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit e5310ad13e4d789030c169f6ed9d6ce1a0dd134d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/exiv2/exiv2.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/exiv2/exiv2.mk b/package/exiv2/exiv2.mk
index 2b2e534c38..a2590ecdf6 100644
--- a/package/exiv2/exiv2.mk
+++ b/package/exiv2/exiv2.mk
@@ -41,10 +41,10 @@ EXIV2_CONF_OPTS += -DEXIV2_ENABLE_PNG=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_EXIV2_XMP),y)
-EXIV2_CONF_OPTS += -DEXIV2_ENABLE_XMP=ON -DEXIV2_ENABLE_LIBXMP=ON
+EXIV2_CONF_OPTS += -DEXIV2_ENABLE_XMP=ON
 EXIV2_DEPENDENCIES += expat
 else
-EXIV2_CONF_OPTS += -DEXIV2_ENABLE_XMP=OFF -DEXIV2_ENABLE_LIBXMP=OFF
+EXIV2_CONF_OPTS += -DEXIV2_ENABLE_XMP=OFF
 endif
 
 EXIV2_DEPENDENCIES += $(TARGET_NLS_DEPENDENCIES)
