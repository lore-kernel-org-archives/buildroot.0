From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Tue,  2 Jun 2020 12:40:10 +0200
Subject: [Buildroot] [PATCH v2 3/4] package/redis: add optional support for
 TLS connections
In-Reply-To: <20200602104011.837-1-titouan.christophe@railnova.eu>
References: <20200602104011.837-1-titouan.christophe@railnova.eu>
Message-ID: <20200602104011.837-4-titouan.christophe@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
---
 package/redis/redis.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index 1578f97e0d..c88e107c2b 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -30,6 +30,11 @@ endif
 REDIS_BUILDOPTS = $(TARGET_CONFIGURE_OPTS) \
 	PREFIX=$(TARGET_DIR)/usr MALLOC=libc
 
+ifeq ($(BR2_PACKAGE_LIBOPENSSL),y)
+REDIS_DEPENDENCIES += libopenssl
+REDIS_BUILDOPTS += BUILD_TLS=yes
+endif
+
 define REDIS_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) $(REDIS_BUILDOPTS) -C $(@D)
 endef
-- 
2.25.3
