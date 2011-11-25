From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 25 Nov 2011 12:49:04 -0300
Subject: [Buildroot] [PATCH] php: fix build breakage
Message-ID: <1322236144-2570-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The zip extension requires zlib, so select it.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/php/Config.ext |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/php/Config.ext b/package/php/Config.ext
index 4f1614e..6df8cc3 100644
--- a/package/php/Config.ext
+++ b/package/php/Config.ext
@@ -125,6 +125,8 @@ config BR2_PACKAGE_PHP_EXT_SYSVSHM
 
 config BR2_PACKAGE_PHP_EXT_ZIP
 	bool "zip"
+	select BR2_PACKAGE_PHP_EXT_ZLIB
+	select BR2_PACKAGE_ZLIB
 	help
 	  Zip read/write support
 
-- 
1.7.3.4
