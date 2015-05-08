From: Romain Naour <romain.naour@openwide.fr>
Date: Fri,  8 May 2015 16:11:40 +0200
Subject: [Buildroot] [PATCH 1/2] Revert "harfbuzz: fix static linking of
	test programs when toolchain has threads support"
Message-ID: <1431094301-21369-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

harfbuzz version was updated since this change and
the test build has been fixed by upstream.

This reverts commit 3d03017f53c2566ed32a0ae76d79eeb1ef4a7feb.
---
 package/harfbuzz/harfbuzz.mk | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index 9cfd613..1b58c22 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -28,11 +28,6 @@ HOST_HARFBUZZ_CONF_OPTS = \
 # beta libtool version
 HARFBUZZ_AUTORECONF = YES
 
-ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
-# forgets to link test programs with -pthread breaking static link
-HARFBUZZ_CONF_ENV = LDFLAGS="$(TARGET_LDFLAGS) -pthread"
-endif
-
 ifeq ($(BR2_PACKAGE_CAIRO),y)
 HARFBUZZ_DEPENDENCIES += cairo
 HARFBUZZ_CONF_OPTS += --with-cairo=yes
-- 
1.9.3
