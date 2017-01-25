From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Jan 2017 22:23:35 +0100
Subject: [Buildroot] [git commit] Revert "tslib: disable raw input plugin
	under kernel < v3.12"
Message-ID: <20170125213156.858FA81F58@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=031ca6e15c2259c94c59c85e4ff2de9faeff422d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit 46d6aa520f2490928f27da716356b00da357cc99.

Since commit 7c60211ce382 (tslib: needs kernel headers 3.12)
BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 is always enabled when building tslib. No
need to check for that.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tslib/tslib.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/tslib/tslib.mk b/package/tslib/tslib.mk
index 2bf10eb..d3388a2 100644
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
