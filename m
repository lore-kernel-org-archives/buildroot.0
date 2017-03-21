From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Mar 2017 22:51:03 +0100
Subject: [Buildroot] [git commit] package/gnupg2: fix libusb detection
Message-ID: <20170321215107.9D57682616@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8ae1804ff63b7c3af054f6a3a670c07c205f8890
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

gnupg2 does not use pkgconf to detect the include dir of libusb.

Fixes
http://autobuild.buildroot.net/results/70c/70c9f5f8ae77fbda2b5eba3aacf831430dc59a1c/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gnupg2/gnupg2.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gnupg2/gnupg2.mk b/package/gnupg2/gnupg2.mk
index 5815e70..3932c3a 100644
--- a/package/gnupg2/gnupg2.mk
+++ b/package/gnupg2/gnupg2.mk
@@ -43,6 +43,7 @@ GNUPG2_CONF_OPTS += --disable-gnutls
 endif
 
 ifeq ($(BR2_PACKAGE_LIBUSB_COMPAT),y)
+GNUPG2_CONF_ENV += CPPFLAGS="$(TARGET_CPPFLAGS) -I$(STAGING_DIR)/usr/include/libusb-1.0"
 GNUPG2_CONF_OPTS += --enable-ccid-driver
 GNUPG2_DEPENDENCIES += libusb-compat
 else
