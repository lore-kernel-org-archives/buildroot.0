From: Waldemar Brodkorb <wbx@openadk.org>
Date: Thu, 3 Dec 2015 18:23:22 +0100
Subject: [Buildroot] [PATCH] connman: disable for sparc
Message-ID: <20151203172322.GA767@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Connman uses __sync_fetch_and_add, which is not available for sparc.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/connman/Config.in |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/connman/Config.in b/package/connman/Config.in
index ba238af..687d903 100644
--- a/package/connman/Config.in
+++ b/package/connman/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_CONNMAN
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, libglib2
 	depends on BR2_USE_MMU # dbus, libglib2
 	depends on !BR2_STATIC_LIBS # needs dlopen()
+	depends on !BR2_sparc # needs atomic operation __sync_fetch_and_add
 	help
 	  The Connection Manager (ConnMan) project provides a daemon
 	  for managing internet connections within embedded devices
-- 
1.7.10.4
