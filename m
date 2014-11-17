From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 17 Nov 2014 19:15:41 +0100
Subject: [Buildroot] [PATCH] package/rpm: add missing kconfig dependency to
	zlib
Message-ID: <1416248141-10766-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since we build-depend on zlib, forcibly select it from kconfig.

This went unnoticed so far, because we did select openssl which
in turn selects zlib. But rpm needs zlib for itself, too.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Peter Korsgaard <jacmet@uclibc.org>
---
 package/rpm/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/rpm/Config.in b/package/rpm/Config.in
index 2492616..620eb1a 100644
--- a/package/rpm/Config.in
+++ b/package/rpm/Config.in
@@ -13,6 +13,7 @@ config BR2_PACKAGE_RPM
 	select BR2_PACKAGE_NEON_XML
 	select BR2_PACKAGE_NEON_ZLIB
 	select BR2_PACKAGE_NEON_SSL
+	select BR2_PACKAGE_ZLIB
 	help
 	  The RPM package management system.
 
-- 
1.9.1
