From: Max Filippov <jcmvbkbc@gmail.com>
Date: Sat, 25 Oct 2014 16:15:09 +0400
Subject: [Buildroot] [PATCH] package/aircrack-ng: add missing space to LIBSQL
Message-ID: <1414239309-24860-1-git-send-email-jcmvbkbc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 package/aircrack-ng/aircrack-ng.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/aircrack-ng/aircrack-ng.mk b/package/aircrack-ng/aircrack-ng.mk
index 720c144..b72506d 100644
--- a/package/aircrack-ng/aircrack-ng.mk
+++ b/package/aircrack-ng/aircrack-ng.mk
@@ -13,7 +13,7 @@ AIRCRACK_NG_DEPENDENCIES = openssl
 ifeq ($(BR2_PACKAGE_SQLITE),y)
 	AIRCRACK_NG_MAKE_OPTS = sqlite=true
 	AIRCRACK_NG_MAKE_OPTS += \
-		LIBSQL="-lsqlite3$(if $(BR2_PREFER_STATIC_LIB),-lpthread)"
+		LIBSQL="-lsqlite3$(if $(BR2_PREFER_STATIC_LIB), -lpthread)"
 
 	AIRCRACK_NG_DEPENDENCIES += sqlite
 else
-- 
1.8.1.4
