From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 8 Jan 2016 19:11:54 +0100
Subject: [Buildroot] [git commit] squeezelite: uses dlopen/dlfcn,
	needs dynamic libraries
Message-ID: <20160108182923.466C2818A5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1da563a7fa5eb9f4cf2644cbbbc1411dae45d3d3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/382/38201ac27b2813f0e9784d63b7aecd0cad06efdf/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
