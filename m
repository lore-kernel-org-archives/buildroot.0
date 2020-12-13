From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 13 Dec 2020 22:57:10 +0100
Subject: [Buildroot] [PATCH 1/1] package/libllcp: drop wrong comment
Message-ID: <20201213215710.630433-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dependency on threads comes from libllcp itself not from libusb (which
is not even selected)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libllcp/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libllcp/Config.in b/package/libllcp/Config.in
index 1660e92a87..238e725166 100644
--- a/package/libllcp/Config.in
+++ b/package/libllcp/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_LIBLLCP
 	bool "libllcp"
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_LIBNFC
 	help
 	  Library extending libnfc with support for Logical Link Control
-- 
2.29.2
