From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 4 Feb 2020 22:33:23 +0100
Subject: [Buildroot] [git commit] package/ussp-push: add all blue5_utils
 dependencies
Message-ID: <20200204212624.0F3498B798@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=34e160b19f2c9bfe334a5e1e4274af000d6aff60
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 61a813339af43024ec05e749a05886fff1bf2a39 forgot to add all the
bluez5_utils dependencies

Fixes:
 - http://autobuild.buildroot.org/results/9a1600ab6b6c8587e8e254e1a9653f5316d3c4fd

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ussp-push/Config.in | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/ussp-push/Config.in b/package/ussp-push/Config.in
index ef40ae7a53..276c8dca20 100644
--- a/package/ussp-push/Config.in
+++ b/package/ussp-push/Config.in
@@ -4,6 +4,8 @@ config BR2_PACKAGE_USSP_PUSH
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, alsa-lib, libglib2
 	depends on BR2_USE_MMU # dbus
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # bluez5_utils
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4 # bluez5_utils
 	select BR2_PACKAGE_OPENOBEX
 	select BR2_PACKAGE_BLUEZ5_UTILS
 	help
@@ -12,6 +14,8 @@ config BR2_PACKAGE_USSP_PUSH
 
 	  http://www.xmailserver.org/ussp-push.html
 
-comment "ussp-push needs a toolchain w/ wchar, threads, dynamic library"
+comment "ussp-push needs a toolchain w/ wchar, threads, dynamic library, headers >= 3.4"
 	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4
