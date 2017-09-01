From: Baruch Siach <baruch@tkos.co.il>
Date: Fri,  1 Sep 2017 11:34:32 +0300
Subject: [Buildroot] [PATCH 1/3] gnupg2: switch optional dependency to libusb
Message-ID: <8e3276a52f2c7f2b28ce726f096b6225fd52595f.1504254874.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

gnupg2 migrated to libusb-1.0 in version 2.1.12.

Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/gnupg2/gnupg2.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gnupg2/gnupg2.mk b/package/gnupg2/gnupg2.mk
index e5451639fd54..4bf9cfcea5dc 100644
--- a/package/gnupg2/gnupg2.mk
+++ b/package/gnupg2/gnupg2.mk
@@ -42,10 +42,10 @@ else
 GNUPG2_CONF_OPTS += --disable-gnutls
 endif
 
-ifeq ($(BR2_PACKAGE_LIBUSB_COMPAT),y)
+ifeq ($(BR2_PACKAGE_LIBUSB),y)
 GNUPG2_CONF_ENV += CPPFLAGS="$(TARGET_CPPFLAGS) -I$(STAGING_DIR)/usr/include/libusb-1.0"
 GNUPG2_CONF_OPTS += --enable-ccid-driver
-GNUPG2_DEPENDENCIES += libusb-compat
+GNUPG2_DEPENDENCIES += libusb
 else
 GNUPG2_CONF_OPTS += --disable-ccid-driver
 endif
-- 
2.14.1
