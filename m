From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 29 Nov 2015 14:07:48 +0100
Subject: [Buildroot] [PATCH 1/2] package/minidlna: Fix typo
Message-ID: <1448802469-18096-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/5ac/5ac519320ec79cf8117060dcc2620aa517845000/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/minidlna/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/minidlna/Config.in b/package/minidlna/Config.in
index 9799672..0a475f7 100644
--- a/package/minidlna/Config.in
+++ b/package/minidlna/Config.in
@@ -12,7 +12,7 @@ config BR2_PACKAGE_MINIDLNA
 	select BR2_PACKAGE_LIBJPEG
 	select BR2_PACKAGE_SQLITE
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
-	depends on !nios2 # ffmpeg
+	depends on !BR2_nios2 # ffmpeg
 	help
 	  MiniDLNA (aka ReadyDLNA) is server software with the aim of being
 	  fully compliant with DLNA/UPnP-AV clients.
@@ -21,5 +21,5 @@ config BR2_PACKAGE_MINIDLNA
 
 comment "minidlna needs a toolchain w/ threads, wchar"
 	depends on BR2_USE_MMU
-	depends on !nios2
+	depends on !BR2_nios2
 	depends on !(BR2_TOOLCHAIN_HAS_THREADS && BR2_USE_WCHAR)
-- 
2.6.2
