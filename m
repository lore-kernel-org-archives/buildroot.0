From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 17 Sep 2017 19:58:18 +0200
Subject: [Buildroot] [PATCH 2/2] package/poco: Update check for uclibc
	toolchain
In-Reply-To: <20170917175818.10621-1-bernd.kuhls@t-online.de>
References: <20170917175818.10621-1-bernd.kuhls@t-online.de>
Message-ID: <20170917175818.10621-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/poco/poco.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/poco/poco.mk b/package/poco/poco.mk
index 673b93a4f9..29752e24c9 100644
--- a/package/poco/poco.mk
+++ b/package/poco/poco.mk
@@ -28,7 +28,7 @@ POCO_OMIT = Data/ODBC PageCompiler \
 	$(if $(BR2_PACKAGE_POCO_DATA_MYSQL),,Data/MySQL) \
 	$(if $(BR2_PACKAGE_POCO_DATA_SQLITE),,Data/SQLite)
 
-ifeq ($(LIBC),uclibc)
+ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
 POCO_CONF_OPTS += --no-fpenvironment --no-wstring
 endif
 
-- 
2.11.0
