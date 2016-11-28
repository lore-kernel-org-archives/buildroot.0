From: Max Filippov <jcmvbkbc@gmail.com>
Date: Mon, 28 Nov 2016 13:54:30 -0800
Subject: [Buildroot] [PATCH] Revert "jasper: Disable debugging when building
	for xtensa"
Message-ID: <1480370070-21452-1-git-send-email-jcmvbkbc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This reverts commit 71d9b0c1f06896f113b09e941aa84d979bff5710.
Now that -mauto-litpools is in TARGET_ABI when building for xtensa, -O0
builds succeed, so this workaround is no longer needed.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 package/jasper/jasper.mk | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/package/jasper/jasper.mk b/package/jasper/jasper.mk
index bacb1a6..ebd7750 100644
--- a/package/jasper/jasper.mk
+++ b/package/jasper/jasper.mk
@@ -12,10 +12,4 @@ JASPER_LICENSE = JasPer License Version 2.0
 JASPER_LICENSE_FILES = LICENSE
 JASPER_CONF_OPTS = --disable-strict
 
-# Xtensa gcc is unable to generate correct code with -O0 enabled by
-# --enable-debug. Allow package build but disable debug.
-ifeq ($(BR2_xtensa)$(BR2_ENABLE_DEBUG),yy)
-JASPER_CONF_OPTS += --disable-debug
-endif
-
 $(eval $(autotools-package))
-- 
2.1.4
