From: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
Date: Fri, 22 Sep 2017 08:20:19 +0200
Subject: [Buildroot] [PATCH 1/2] libkcapi: test apps require MMU
Message-ID: <1506061220-30790-1-git-send-email-marcin.nowakowski@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Test apps use fork() and therefore need a dependency on BR2_USE_MMU

Signed-off-by: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
---
 package/libkcapi/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libkcapi/Config.in b/package/libkcapi/Config.in
index 453dc69..2b98177 100644
--- a/package/libkcapi/Config.in
+++ b/package/libkcapi/Config.in
@@ -9,6 +9,7 @@ if BR2_PACKAGE_LIBKCAPI
 
 config BR2_PACKAGE_LIBKCAPI_APPS
 	bool "build test applications"
+	depends on BR2_USE_MMU # fork()
 	help
 	  Build additional test applications that can provide
 	  performance or algorithm tests.
-- 
2.7.4
