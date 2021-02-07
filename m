From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  7 Feb 2021 13:35:51 +0100
Subject: [Buildroot] [PATCH 1/1] package/cryptsetup: set
 CRYPTSETUP_CPE_ID_VALID
Message-ID: <20210207123551.2618839-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:cryptsetup_project:cryptsetup is a valid CPE identifier for
this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Acryptsetup_project%3Acryptsetup

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/cryptsetup/cryptsetup.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptsetup.mk
index a59a0c7570..34981282b2 100644
--- a/package/cryptsetup/cryptsetup.mk
+++ b/package/cryptsetup/cryptsetup.mk
@@ -15,6 +15,7 @@ CRYPTSETUP_DEPENDENCIES = \
 	$(TARGET_NLS_DEPENDENCIES)
 CRYPTSETUP_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (library)
 CRYPTSETUP_LICENSE_FILES = COPYING COPYING.LGPL
+CRYPTSETUP_CPE_ID_VALID = YES
 CRYPTSETUP_INSTALL_STAGING = YES
 CRYPTSETUP_CONF_ENV += LDFLAGS="$(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)"
 CRYPTSETUP_CONF_OPTS += --enable-blkid --enable-libargon2
-- 
2.29.2
