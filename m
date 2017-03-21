From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 21 Mar 2017 08:09:26 +0100
Subject: [Buildroot] [PATCH 1/1] package/gnupg2: fix libusb detection
Message-ID: <20170321070926.14178-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

gnupg2 does not use pkgconf to detect the include dir of libusb.

Fixes
http://autobuild.buildroot.net/results/70c/70c9f5f8ae77fbda2b5eba3aacf831430dc59a1c/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/gnupg2/gnupg2.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gnupg2/gnupg2.mk b/package/gnupg2/gnupg2.mk
index 5815e7003..3932c3a0f 100644
--- a/package/gnupg2/gnupg2.mk
+++ b/package/gnupg2/gnupg2.mk
@@ -43,6 +43,7 @@ GNUPG2_CONF_OPTS += --disable-gnutls
 endif
 
 ifeq ($(BR2_PACKAGE_LIBUSB_COMPAT),y)
+GNUPG2_CONF_ENV += CPPFLAGS="$(TARGET_CPPFLAGS) -I$(STAGING_DIR)/usr/include/libusb-1.0"
 GNUPG2_CONF_OPTS += --enable-ccid-driver
 GNUPG2_DEPENDENCIES += libusb-compat
 else
-- 
2.11.0
