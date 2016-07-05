From: Paul Cercueil <paul.cercueil@analog.com>
Date: Tue, 5 Jul 2016 18:05:54 +0200
Subject: [Buildroot] [PATCH] libiio: BR2_PACKAGE_LIBIIO_TESTS requires
	BR2_PACKAGE_LIBIIO_XML_BACKEND
Message-ID: <1467734754-16816-1-git-send-email-paul.cercueil@analog.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Paul Cercueil <paul.cercueil@analog.com>
---
 package/libiio/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libiio/Config.in b/package/libiio/Config.in
index e7a5d18..69269e0 100644
--- a/package/libiio/Config.in
+++ b/package/libiio/Config.in
@@ -63,6 +63,7 @@ comment "IIO Daemon needs a toolchain w/ threads"
 config BR2_PACKAGE_LIBIIO_TESTS
 	bool "Install test programs"
 	select BR2_PACKAGE_LIBIIO_LOCAL_BACKEND
+	select BR2_PACKAGE_LIBIIO_XML_BACKEND
 	select BR2_PACKAGE_LIBIIO_NETWORK_BACKEND
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
-- 
2.8.1
