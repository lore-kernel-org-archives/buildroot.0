From: Spenser Gilliland <spenser@gillilanding.com>
Date: Mon, 15 Jul 2013 14:46:51 -0500
Subject: [Buildroot] [PATCH 08/67] dbus-python: libglib2 requires threads
In-Reply-To: <1373917670-30006-1-git-send-email-spenser@gillilanding.com>
References: <1373917670-30006-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1373917670-30006-9-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/dbus-python/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/dbus-python/Config.in b/package/dbus-python/Config.in
index 91c127d..61e81e7 100644
--- a/package/dbus-python/Config.in
+++ b/package/dbus-python/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_DBUS_PYTHON
 	bool "dbus-python"
 	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
 	depends on BR2_PACKAGE_DBUS
 	depends on BR2_PACKAGE_PYTHON
 	select BR2_PACKAGE_DBUS_GLIB
@@ -9,5 +10,6 @@ config BR2_PACKAGE_DBUS_PYTHON
 
 	  http://dbus.freedesktop.org/doc/dbus-python/
 
-comment "dbus-python requires a toolchain with WCHAR support"
-	depends on BR2_PACKAGE_DBUS && BR2_PACKAGE_PYTHON && !BR2_USE_WCHAR
+comment "dbus-python requires a toolchain with WCHAR and threading support"
+	depends on BR2_PACKAGE_DBUS && BR2_PACKAGE_PYTHON && \
+		(!BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS)
-- 
1.8.1.2
