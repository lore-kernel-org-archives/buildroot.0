From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 11 Jun 2020 08:28:26 +0200
Subject: [Buildroot] [PATCH 1/1] package/mtools: select
 BR2_TOOLCHAIN_GLIBC_GCONV_LIBS_COPY
Message-ID: <20200611062826.643125-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - https://bugs.buildroot.org/show_bug.cgi?id=12986

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mtools/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/mtools/Config.in b/package/mtools/Config.in
index 99a073ca83..43e14e2c0c 100644
--- a/package/mtools/Config.in
+++ b/package/mtools/Config.in
@@ -2,6 +2,8 @@ config BR2_PACKAGE_MTOOLS
 	bool "mtools"
 	depends on BR2_USE_WCHAR
 	depends on BR2_USE_MMU # fork()
+	# runtime UTF conversion support
+	select BR2_TOOLCHAIN_GLIBC_GCONV_LIBS_COPY if BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  Mtools is a collection of utilities to access MS-DOS disks
 	  from Unix without mounting them. It supports Win'95 style
-- 
2.26.2
