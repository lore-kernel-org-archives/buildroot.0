From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  5 Mar 2017 16:19:11 +0100
Subject: [Buildroot] [PATCH] cryptsetup: install to staging
Message-ID: <1488727151-7633-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cryptsetup installs a library and a header file, so it makes sense to
install it to staging.

Fixes bug #9691.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cryptsetup/cryptsetup.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptsetup.mk
index 50bf5f2..6081009 100644
--- a/package/cryptsetup/cryptsetup.mk
+++ b/package/cryptsetup/cryptsetup.mk
@@ -12,6 +12,7 @@ CRYPTSETUP_DEPENDENCIES = lvm2 popt util-linux host-pkgconf \
 	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
 CRYPTSETUP_LICENSE = GPLv2+ (programs), LGPLv2.1+ (library)
 CRYPTSETUP_LICENSE_FILES = COPYING COPYING.LGPL
+CRYPTSETUP_INSTALL_STAGING = YES
 
 ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
 CRYPTSETUP_CONF_ENV += LDFLAGS="$(TARGET_LDFLAGS) -lintl"
-- 
2.7.4
