From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 28 Mar 2016 07:32:23 -0300
Subject: [Buildroot] [PATCH] redis: needs BR2_TOOLCHAIN_HAS_SYNC_4
Message-ID: <1459161143-4434-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Uses 32-bit atomics, fixes:
http://autobuild.buildroot.net/results/dfd/dfdfd77463b0ddd7016202372afcad7fb6fc9ce4/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/redis/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/redis/Config.in b/package/redis/Config.in
index 3b7b743..20d3a13 100644
--- a/package/redis/Config.in
+++ b/package/redis/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_REDIS
 	bool "redis"
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	help
 	  Redis is an open source, advanced key-value store. It is
 	  often referred to as a data structure server since keys can
@@ -11,4 +12,5 @@ config BR2_PACKAGE_REDIS
 
 comment "redis needs a toolchain w/ threads"
 	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
-- 
2.7.3
