From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 29 Dec 2020 09:29:35 +0100
Subject: [Buildroot] [git commit] package/python-aiohttp: add missing
 python-typing-extensions dependency
Message-ID: <20201229081342.A0F4B7FEA9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9e504acbbca582ef331bea1c7435e2a61d157e9a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

typing_extensions package is needed starting from aiohttp v3.7.1.

While at it sort all dependencies alphabetically.

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
