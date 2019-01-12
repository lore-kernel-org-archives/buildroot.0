From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 12 Jan 2019 18:40:41 +0100
Subject: [Buildroot] [git commit] package/asterisk: needs threads
Message-ID: <20190112174025.A5CFD8B8A7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a4c30b548de9f7ce284d768d431816313b74d7a5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/85d30a4f94efa868a9155f7dda593ba8079063b5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/asterisk/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/asterisk/Config.in b/package/asterisk/Config.in
index b55bc0174d..c52456f8fc 100644
--- a/package/asterisk/Config.in
+++ b/package/asterisk/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_ASTERISK
 	depends on !BR2_STATIC_LIBS # dlfcn.h
 	depends on !BR2_TOOLCHAIN_USES_MUSL
 	depends on BR2_USE_MMU # libedit
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_WCHAR # libedit
 	select BR2_PACKAGE_JANSSON
 	select BR2_PACKAGE_LIBCURL
@@ -24,7 +25,8 @@ config BR2_PACKAGE_ASTERISK
 
 	  http://www.asterisk.org/
 
-comment "asterisk needs a glibc or uClibc toolchain w/ C++, dynamic library, wchar"
+comment "asterisk needs a glibc or uClibc toolchain w/ C++, dynamic library, threads, wchar"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_USES_MUSL || !BR2_INSTALL_LIBSTDCPP \
-		|| BR2_STATIC_LIBS || !BR2_USE_WCHAR
+		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS \
+		|| !BR2_USE_WCHAR
