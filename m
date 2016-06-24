From: Adam Duskett <aduskett@gmail.com>
Date: Thu, 23 Jun 2016 22:43:16 -0400
Subject: [Buildroot] [PATCH 1/1] Add libselinux and libsepol dependency for
	SELinux support.
Message-ID: <1466736201-17310-1-git-send-email-Aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/busybox/Config.in | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/busybox/Config.in b/package/busybox/Config.in
index a3a328d..b7d6c13 100644
--- a/package/busybox/Config.in
+++ b/package/busybox/Config.in
@@ -33,7 +33,8 @@ config BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	  by busybox.
 
 config BR2_PACKAGE_BUSYBOX_SELINUX
-	select BR2_PACKAGE_LIBSELINUX
+	depends on BR2_PACKAGE_LIBSELINUX
+	depends on BR2_PACKAGE_LIBSEPOL
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS
 	depends on !BR2_arc
@@ -51,6 +52,9 @@ config BR2_PACKAGE_BUSYBOX_SELINUX
 	  crond, then individual binaries have to be enabled for the
 	  SELinux type transitions to occur properly.
 
+	comment "SELinux support in BusyBox requires libselinux, libsepol"
+		depends on !BR2_PACKAGE_LIBSELINUX || !BR2_PACKAGE_LIBSEPOL
+
 config BR2_PACKAGE_BUSYBOX_WATCHDOG
 	bool "Install the watchdog daemon startup script"
 	help
-- 
2.7.4
