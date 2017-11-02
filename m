From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Nov 2017 13:37:25 +0100
Subject: [Buildroot] [git commit] package/ussp-push: removed deprecated/no
 longer needed deps on openobex-bluez
Message-ID: <20171102123032.8303F7FAEF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0f68d289d15ab6be7cb9b92cd6e084e4fa302312
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 49a9fb0f13789298e65f21405502a9106e2c7382 removed the
BR2_PACKAGE_OPENOBEX_BLUEZ option, because BlueZ support is now
unconditionally included in OpenOBEX. Therefore, selecting this legacy
option no longer makes sense, and in fact triggers the legacy handling
for no reason.

Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Reported-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Samuel Martin <s.martin49@gmail.com>
[Thomas: tweak commit log.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ussp-push/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/ussp-push/Config.in b/package/ussp-push/Config.in
index e6695bb..aefec85 100644
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
