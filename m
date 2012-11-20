From: Chris Zankel <chris@zankel.net>
Date: Tue, 20 Nov 2012 11:01:49 -0800
Subject: [Buildroot] [PATCH 3/3] xtensa: disable libffi for Xtensa
Message-ID: <50ac8f69.6548420a.6f5c.2a1b@mx.google.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Xtensa currently doesn't support libffi.

Signed-off-by: Chris Zankel <chris@zankel.net>
---
 package/libffi/Config.in |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libffi/Config.in b/package/libffi/Config.in
index 7211f8f..4afb669 100644
--- a/package/libffi/Config.in
+++ b/package/libffi/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBFFI
 	bool "libffi"
+	depends on !BR2_xtensa
 	help
 	  The libffi library provides a portable, high level
 	  programming interface to various calling conventions. This
-- 
1.7.9.5
