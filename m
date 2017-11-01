From: Samuel Martin <s.martin49@gmail.com>
Date: Wed,  1 Nov 2017 21:11:37 +0100
Subject: [Buildroot] [PATCH 4/4] package/ussp-push: removed deprecated/no
 longer needed deps on openobex-bluez
In-Reply-To: <20171101201137.29939-1-s.martin49@gmail.com>
References: <20171101201137.29939-1-s.martin49@gmail.com>
Message-ID: <20171101201137.29939-4-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 49a9fb0f13789298e65f21405502a9106e2c7382 deprecates the
BR2_PACKAGE_OPENOBEX_BLUEZ option, which should be turned in
BR2_PACKAGE_BLUEZ_UTILS instead.

Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Reported-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/ussp-push/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/ussp-push/Config.in b/package/ussp-push/Config.in
index e6695bb197..aefec85a20 100644
--- a/package/ussp-push/Config.in
+++ b/package/ussp-push/Config.in
@@ -5,7 +5,6 @@ config BR2_PACKAGE_USSP_PUSH
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, alsa-lib, libglib2
 	depends on BR2_USE_MMU # dbus
 	select BR2_PACKAGE_OPENOBEX
-	select BR2_PACKAGE_OPENOBEX_BLUEZ
 	select BR2_PACKAGE_BLUEZ_UTILS
 	help
 	  ussp-push is an OBEX object pusher for Linux, using the BlueZ
-- 
2.15.0
