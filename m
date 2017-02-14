From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Tue, 14 Feb 2017 23:43:59 +0100
Subject: [Buildroot] [PATCH 1/4] Revert "bctoolbox: fix typos and logic
	error"
Message-ID: <20170214224402.8785-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This reverts commit 5c4d3560b94c9cb8f1594c9200a632b89ddf7aa0.

Although the patch fixes the build error it does not set the flags for
Libs.private properly. A fellow-up patch will provide a better solution
for this issue.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/bctoolbox/0001-fix-typo.patch | 18 ------------------
 1 file changed, 18 deletions(-)
 delete mode 100644 package/bctoolbox/0001-fix-typo.patch

diff --git a/package/bctoolbox/0001-fix-typo.patch b/package/bctoolbox/0001-fix-typo.patch
deleted file mode 100644
index b94daee8d..000000000
--- a/package/bctoolbox/0001-fix-typo.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-Fix a typo in the variable name. Only check path for a single library name.
-
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org> 
-
-diff -Nur bctoolbox-0.4.0.orig/CMakeLists.txt bctoolbox-0.4.0/CMakeLists.txt
---- bctoolbox-0.4.0.orig/CMakeLists.txt	2016-10-06 17:30:41.000000000 +0200
-+++ bctoolbox-0.4.0/CMakeLists.txt	2017-02-13 23:30:38.641288032 +0100
-@@ -103,8 +103,8 @@
- endif()
- 
- if(MBEDTLS_FOUND)
--	get_filename_component(mbedtls_library_path "${MBEDTLS_LIBRARIES}" PATH)
--	set(LIBS_PRIVATE "${LIBS_PRIVATE} -L${mbedlts_library_path}")
-+	get_filename_component(mbedtls_library_path "${MBEDTLS_LIBRARY}" PATH)
-+	set(LIBS_PRIVATE "${LIBS_PRIVATE} -L${mbedtls_library_path}")
- endif()
- if(POLARSSL_FOUND)
- 	get_filename_component(polarssl_library_path "${POLARSSL_LIBRARIES}" PATH)
-- 
2.11.1
