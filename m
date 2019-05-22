From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Wed, 22 May 2019 14:25:42 +0200
Subject: [Buildroot] [PATCH 8/8] package/flashbench: remove old check if
 BR2_microblaze & BR2_sh2a
In-Reply-To: <20190522122542.84146-1-giulio.benetti@micronovasrl.com>
References: <20190522122542.84146-1-giulio.benetti@micronovasrl.com>
Message-ID: <20190522122542.84146-9-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit:
https://git.buildroot.net/buildroot/commit/?id=bad25aff36b70b55b34ea4580b45f657385ae9ac
removed sourcery toolchain already deprecated in 2014 causing build
failure. It was based on Gcc 4.6.2 and Buildroot doesn't use this
anymore.

Remove check against BR2_microblaze and BR2_sh2a.

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 package/flashbench/flashbench.mk | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/flashbench/flashbench.mk b/package/flashbench/flashbench.mk
index cbcf9ea2d1..e5c6b97283 100644
--- a/package/flashbench/flashbench.mk
+++ b/package/flashbench/flashbench.mk
@@ -11,11 +11,6 @@ FLASHBENCH_LICENSE_FILES = COPYING
 
 FLASHBENCH_CFLAGS = $(TARGET_CFLAGS)
 
-ifeq ($(BR2_microblaze)$(BR2_sh2a),y)
-# microblaze and sh2a toolchains only provide LLONG_MAX when used with gnu99 dialect
-FLASHBENCH_CFLAGS += -std=gnu99
-endif
-
 define FLASHBENCH_BUILD_CMDS
 	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) \
 		CFLAGS="$(FLASHBENCH_CFLAGS)" \
-- 
2.17.1
