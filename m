From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  7 Jan 2016 10:00:27 -0300
Subject: [Buildroot] [PATCH] squeezelite: uses dlopen/dlfcn,
	needs dynamic libraries
Message-ID: <1452171627-17404-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/382/38201ac27b2813f0e9784d63b7aecd0cad06efdf/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/squeezelite/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/squeezelite/Config.in b/package/squeezelite/Config.in
index 6befee1..1c2960e 100644
--- a/package/squeezelite/Config.in
+++ b/package/squeezelite/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_SQUEEZELITE
 	depends on BR2_USE_WCHAR # flac
 	depends on BR2_TOOLCHAIN_HAS_THREADS # alsa-lib
 	depends on BR2_USE_MMU # mpg123
+	depends on !BR2_STATIC_LIBS # dlopen
 	select BR2_PACKAGE_ALSA_LIB
 	select BR2_PACKAGE_ALSA_LIB_MIXER
 	select BR2_PACKAGE_FLAC
@@ -35,6 +36,7 @@ config BR2_PACKAGE_SQUEEZELITE_VISEXPORT
 
 endif
 
-comment "squeezelite needs a toolchain w/ wchar, threads"
+comment "squeezelite needs a toolchain w/ wchar, threads, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS \
+		|| BR2_STATIC_LIBS
-- 
2.4.10
