From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun, 26 Apr 2015 14:54:31 +0200
Subject: [Buildroot] [PATCH 2/2] kodi: Without native RPC use libtirpc
In-Reply-To: <1430052871-6235-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1430052871-6235-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1430052871-6235-2-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The previous patch allow to build libnfs without native RPC support by
using libtirpc. Report that dependency here.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/kodi/Config.in | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 91c1cce..04a9cb4 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -176,14 +176,11 @@ config BR2_PACKAGE_KODI_LIBMICROHTTPD
 
 config BR2_PACKAGE_KODI_LIBNFS
 	bool "nfs"
-	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_PACKAGE_LIBNFS
+	select BR2_PACKAGE_LIBTIRPC if !BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	help
 	  Enable NFS server support.
 
-comment "nfs support needs a toolchain w/ RPC support"
-	depends on !BR2_TOOLCHAIN_HAS_NATIVE_RPC
-
 config BR2_PACKAGE_KODI_RTMPDUMP
 	bool "rtmp"
 	select BR2_PACKAGE_RTMPDUMP
-- 
2.1.4
