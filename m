From: Simon Dawson <spdawson@gmail.com>
Date: Wed, 26 Feb 2014 18:00:49 +0000
Subject: [Buildroot] [PATCH] zyre: remove unnecessary autoreconf options
Message-ID: <1393437649-22123-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The default $(PKG)_AUTORECONF_OPT already includes the -i and -f flags,
so there is no point in specifying these in the package makefile. Further,
the -v option to autoreconf is not required.

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/zyre/zyre.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/zyre/zyre.mk b/package/zyre/zyre.mk
index 405697a..66952aa 100644
--- a/package/zyre/zyre.mk
+++ b/package/zyre/zyre.mk
@@ -11,7 +11,6 @@ ZYRE_LICENSE_FILES = COPYING COPYING.LESSER
 ZYRE_INSTALL_STAGING = YES
 ZYRE_DEPENDENCIES = filemq
 ZYRE_AUTORECONF = YES
-ZYRE_AUTORECONF_OPT = --install --force --verbose
 
 define ZYRE_CREATE_CONFIG_DIR
 	mkdir -p $(@D)/config
-- 
1.8.3.2
