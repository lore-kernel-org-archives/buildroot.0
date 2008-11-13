From: Markus Heidelberg <markus.heidelberg@web.de>
Date: Thu, 13 Nov 2008 20:07:00 +0100
Subject: [Buildroot] [PATCH] lzo: add $(DISABLE_LARGEFILE) to configure
	options
Message-ID: <200811132007.00790.markus.heidelberg@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Markus Heidelberg <markus.heidelberg@web.de>
---
 package/lzo/lzo.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/lzo/lzo.mk b/package/lzo/lzo.mk
index c43dc58..7883506 100644
--- a/package/lzo/lzo.mk
+++ b/package/lzo/lzo.mk
@@ -11,7 +11,7 @@ LZO_INSTALL_STAGING = YES
 LZO_INSTALL_TARGET = YES
 LZO_INSTALL_STAGING_OPT = CC="$(TARGET_CC)" DESTDIR=$(STAGING_DIR) install
 LZO_CONF_ENV =
-LZO_CONF_OPT =
+LZO_CONF_OPT = $(DISABLE_LARGEFILE)
 LZO_DEPENDENCIES = uclibc
 
 $(eval $(call AUTOTARGETS,package,lzo))
-- 
1.6.0.4.620.g87fa
