From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Mon, 13 Jul 2015 21:12:25 +0200
Subject: [Buildroot] [PATCH] zeromq: Remove useless space
Message-ID: <1436814745-21624-1-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Be coherent with all the other ifeq check where there's no space.
From the doc of Make, it should not cause any trouble, but coherence has
its own merit.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/zeromq/zeromq.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/zeromq/zeromq.mk b/package/zeromq/zeromq.mk
index 623a12e..029fab2 100644
--- a/package/zeromq/zeromq.mk
+++ b/package/zeromq/zeromq.mk
@@ -36,7 +36,7 @@ ZEROMQ_CONF_OPTS += --with-system-pgm
 endif
 
 # ZeroMQ uses libsodium if it's available.
-ifeq ($(BR2_PACKAGE_LIBSODIUM), y)
+ifeq ($(BR2_PACKAGE_LIBSODIUM),y)
 ZEROMQ_DEPENDENCIES += libsodium
 ZEROMQ_CONF_OPTS += --with-libsodium="$(STAGING_DIR)/usr"
 else
-- 
2.1.4
