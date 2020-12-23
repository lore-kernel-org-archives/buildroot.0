From: Marcin Niestroj <m.niestroj@grinn-global.com>
Date: Wed, 23 Dec 2020 17:12:24 +0100
Subject: [Buildroot] [PATCH 3/3] package/python-aiohttp: add missing
 python-typing-extensions dependency
In-Reply-To: <20201223161224.69815-1-m.niestroj@grinn-global.com>
References: <20201223161224.69815-1-m.niestroj@grinn-global.com>
Message-ID: <20201223161224.69815-4-m.niestroj@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

typing_extensions package is needed starting from aiohttp v3.7.1.

While at it sort all dependencies alphabetically.

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
---
 package/python-aiohttp/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/python-aiohttp/Config.in b/package/python-aiohttp/Config.in
index d75c440225..9ffea088e4 100644
--- a/package/python-aiohttp/Config.in
+++ b/package/python-aiohttp/Config.in
@@ -1,13 +1,14 @@
 config BR2_PACKAGE_PYTHON_AIOHTTP
 	bool "python-aiohttp"
 	depends on BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_PYTHON_AIODNS # runtime
+	select BR2_PACKAGE_PYTHON_ASYNC_TIMEOUT # runtime
 	select BR2_PACKAGE_PYTHON_ATTRS # runtime
 	select BR2_PACKAGE_PYTHON_CCHARDET if BR2_INSTALL_LIBSTDCPP # runtime
 	select BR2_PACKAGE_PYTHON_CHARDET if !BR2_INSTALL_LIBSTDCPP # runtime
 	select BR2_PACKAGE_PYTHON_MULTIDICT # runtime
-	select BR2_PACKAGE_PYTHON_ASYNC_TIMEOUT # runtime
+	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
 	select BR2_PACKAGE_PYTHON_YARL # runtime
-	select BR2_PACKAGE_PYTHON_AIODNS # runtime
 	select BR2_PACKAGE_PYTHON3_ZLIB # runtime
 	help
 	  Async http client/server framework (asyncio).
-- 
2.29.2
