From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Sun,  2 Feb 2014 22:54:38 +0100
Subject: [Buildroot] [PATCH] libsoc: bump to 0.6
Message-ID: <1391378078-20653-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add --disable-debug to unset default DEBUG option.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/libsoc/libsoc.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/libsoc/libsoc.mk b/package/libsoc/libsoc.mk
index 3e9ce97..09aee35 100644
--- a/package/libsoc/libsoc.mk
+++ b/package/libsoc/libsoc.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-LIBSOC_VERSION = 0.5
+LIBSOC_VERSION = 0.6
 LIBSOC_SITE = $(call github,jackmitch,libsoc,$(LIBSOC_VERSION))
 LIBSOC_LICENSE = LGPLv2.1
 LIBSOC_LICENSE_FILES = COPYING
 LIBSOC_AUTORECONF = YES
 LIBSOC_INSTALL_STAGING = YES
+LIBSOC_CONF_OPT = --disable-debug
 
 $(eval $(autotools-package))
-- 
1.8.1.2
