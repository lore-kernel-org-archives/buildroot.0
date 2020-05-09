From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Sat,  9 May 2020 18:50:38 +0200
Subject: [Buildroot] [PATCH 3/4] package/redis: add optional support for TLS
 connections
In-Reply-To: <20200509165039.10363-1-titouan.christophe@railnova.eu>
References: <20200509165039.10363-1-titouan.christophe@railnova.eu>
Message-ID: <20200509165039.10363-4-titouan.christophe@railnova.eu>
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
index bb7829522d..c83a3a0775 100644
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
