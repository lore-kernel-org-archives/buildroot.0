From: Wojciech Nizinski <niziak@spox.org>
Date: Mon,  6 Mar 2017 08:44:58 +0100
Subject: [Buildroot] [PATCH 1/1] fwup: requires dynamic library support
Message-ID: <1488786298-5737-1-git-send-email-niziak@spox.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/7f1/7f127655ffeb45b8f49616a1ed16bb184d9d7abf/
Signed-off-by: Wojciech Nizinski <niziak@spox.org>
---
 package/fwup/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/fwup/Config.in b/package/fwup/Config.in
index fd40cf326..3b93c5424 100644
--- a/package/fwup/Config.in
+++ b/package/fwup/Config.in
@@ -2,6 +2,8 @@ config BR2_PACKAGE_FWUP
 	bool "fwup"
 	depends on BR2_USE_MMU
 	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_LIBARCHIVE
 	# required by libarchive to include zip compression
 	select BR2_PACKAGE_ZLIB
@@ -13,6 +15,6 @@ config BR2_PACKAGE_FWUP
 
 	  https://github.com/fhunleth/fwup
 
-comment "fwup needs a toolchain w/ wchar"
+comment "fwup needs a toolchain w/ wchar, threads, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || BR2_STATIC_LIBS
-- 
2.11.0
