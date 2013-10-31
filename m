From: Clayton Shotwell <clshotwe@rockwellcollins.com>
Date: Thu, 31 Oct 2013 12:30:52 -0700
Subject: [Buildroot] [PATCH 1/1] cryptsetup: Fix autobuild error
	http://autobuild.buildroot.net/results/cc1a65b9554bc2ece1b3ea8b51cd805b9bda7e86/
Message-ID: <1383247852-32199-1-git-send-email-clshotwe@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adding libintl to the libraries list for cryptsetup when using a
uclibc toolchain.

Signed-off-by: Clayton Shotwell <clshotwe@rockwellcollins.com>
---
 package/cryptsetup/cryptsetup.mk |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptsetup.mk
index 48d37f6..d6169ec 100644
--- a/package/cryptsetup/cryptsetup.mk
+++ b/package/cryptsetup/cryptsetup.mk
@@ -12,4 +12,8 @@ CRYPTSETUP_DEPENDENCIES = lvm2 popt e2fsprogs libgcrypt host-pkgconf
 CRYPTSETUP_LICENSE = GPLv2+ (programs), LGPLv2.1+ (library)
 CRYPTSETUP_LICENSE_FILES = COPYING COPYING.LGPL
 
+ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
+CRYPTSETUP_CONF_ENV += LDFLAGS="-lintl"
+endif
+
 $(eval $(autotools-package))
-- 
1.7.9.5
