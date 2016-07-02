From: Julien Floret <julien.floret@6wind.com>
Date: Sun,  3 Jul 2016 00:21:33 +0200
Subject: [Buildroot] [PATCH 64/69] mtools: remove empty host dependencies
	definition
In-Reply-To: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
References: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
Message-ID: <1467498098-23731-65-git-send-email-julien.floret@6wind.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Julien Floret <julien.floret@6wind.com>
---
 package/mtools/mtools.mk | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/mtools/mtools.mk b/package/mtools/mtools.mk
index fc145c083206..adba1fc47376 100644
--- a/package/mtools/mtools.mk
+++ b/package/mtools/mtools.mk
@@ -22,11 +22,9 @@ HOST_MTOOLS_CONF_ENV = \
 ifeq ($(BR2_PACKAGE_LIBICONV),y)
 MTOOLS_DEPENDENCIES += libiconv
 MTOOLS_CONF_ENV += LIBS=-liconv
-# We have no host dependencies
-HOST_MTOOLS_DEPENDENCIES =
 endif
 
-#?Package does not build in parallel due to improper make rules
+# Package does not build in parallel due to improper make rules
 MTOOLS_MAKE = $(MAKE1)
 
 $(eval $(autotools-package))
-- 
2.1.0
