From: Sven Neumann <s.neumann@raumfeld.com>
Date: Tue, 17 Apr 2012 12:19:13 +0200
Subject: [Buildroot] [PATCH 2/2] network-manager: follow udev changes
In-Reply-To: <1334657953-29113-1-git-send-email-s.neumann@raumfeld.com>
References: <1334657953-29113-1-git-send-email-s.neumann@raumfeld.com>
Message-ID: <1334657953-29113-2-git-send-email-s.neumann@raumfeld.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

NetworkManager needs to select BR2_PACKAGE_UDEV_GUDEV.

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
---
 package/network-manager/Config.in |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/network-manager/Config.in b/package/network-manager/Config.in
index fb0c0e9..d14edd2 100644
--- a/package/network-manager/Config.in
+++ b/package/network-manager/Config.in
@@ -7,7 +7,7 @@ config BR2_PACKAGE_NETWORK_MANAGER
 	depends on BR2_USE_WCHAR # libglib2
 	select BR2_PACKAGE_DBUS_GLIB
 	select BR2_PACKAGE_UDEV
-	select BR2_PACKAGE_UDEV_ALL_EXTRAS
+	select BR2_PACKAGE_UDEV_GUDEV
 	select BR2_PACKAGE_GNUTLS
 	select BR2_PACKAGE_LIBNL
 	select BR2_PACKAGE_UTIL_LINUX
-- 
1.7.9.5
