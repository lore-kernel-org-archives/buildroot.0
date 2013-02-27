From: Gilles Talis <gilles.talis@gmail.com>
Date: Tue, 26 Feb 2013 17:22:38 -0800
Subject: [Buildroot] [PATCH] flashbench: force gnu99 dialect on sh2a
In-Reply-To: <y>
References: <y>
Message-ID: <1361928158-27934-1-git-send-email-gilles.talis@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.org/results/33880036054c39cb04dad71bc8c0a9eece16fac6

CodeSourcery toolchains for sh2a only provide LLONG_MAX when
used with the gnu99 dialect.

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 package/flashbench/flashbench.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/flashbench/flashbench.mk b/package/flashbench/flashbench.mk
index faf8ae6..45d0540 100644
--- a/package/flashbench/flashbench.mk
+++ b/package/flashbench/flashbench.mk
@@ -11,8 +11,8 @@ FLASHBENCH_LICENSE_FILES = COPYING
 
 FLASHBENCH_CFLAGS = $(TARGET_CFLAGS)
 
-ifeq ($(BR2_microblaze),y)
-# microblaze toolchain only provides LLONG_MAX when used with gnu99 dialect
+ifeq ($(BR2_microblaze)$(BR2_sh2a),y)
+# microblaze and sh2a toolchains only provide LLONG_MAX when used with gnu99 dialect
 FLASHBENCH_CFLAGS += -std=gnu99
 endif
 
-- 
1.7.4.1
