From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 25 Jan 2017 20:32:54 +0200
Subject: [Buildroot] [PATCH] Revert "tslib: disable raw input plugin under
	kernel < v3.12"
Message-ID: <94c51efa07549195cb340849a8657fe552c05387.1485369174.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This reverts commit 46d6aa520f2490928f27da716356b00da357cc99.

Since commit 7c60211ce382 (tslib: needs kernel headers 3.12)
BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 is always enabled when building tslib. No
need to check for that.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/tslib/tslib.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/tslib/tslib.mk b/package/tslib/tslib.mk
index 2bf10ebaabd8..d3388a2be064 100644
--- a/package/tslib/tslib.mk
+++ b/package/tslib/tslib.mk
@@ -14,8 +14,4 @@ TSLIB_AUTORECONF = YES
 TSLIB_INSTALL_STAGING = YES
 TSLIB_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) LDFLAGS=-L$(STAGING_DIR)/usr/lib install
 
-ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12),)
-TSLIB_CONF_OPTS += --disable-input
-endif
-
 $(eval $(autotools-package))
-- 
2.11.0
