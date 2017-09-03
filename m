From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Sep 2017 14:19:17 +0200
Subject: [Buildroot] [git commit] gnupg2: switch optional dependency to
	libusb
Message-ID: <20170903121429.0AD6B819CE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=65818acad6b419f8a595f804aa589dfc8a1f13a6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

gnupg2 migrated to libusb-1.0 in version 2.1.12.

Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gnupg2/gnupg2.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gnupg2/gnupg2.mk b/package/gnupg2/gnupg2.mk
index e545163..4bf9cfc 100644
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
