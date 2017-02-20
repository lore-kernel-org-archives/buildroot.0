From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Feb 2017 22:18:15 +0100
Subject: [Buildroot] [git commit] Revert "bctoolbox: fix typos and logic
	error"
Message-ID: <20170220212444.E072282203@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7dd52cabc3eb43fc477af53bd7a817bac081e962
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit 5c4d3560b94c9cb8f1594c9200a632b89ddf7aa0.

Although the patch fixes the build error it does not set the flags for
Libs.private properly. A follow-up patch will provide a better solution
for this issue.

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/bctoolbox/0001-fix-typo.patch | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/package/bctoolbox/0001-fix-typo.patch b/package/bctoolbox/0001-fix-typo.patch
deleted file mode 100644
index b94daee..0000000
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
