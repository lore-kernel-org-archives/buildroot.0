From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 14 Jan 2015 21:58:57 -0300
Subject: [Buildroot] [PATCH] xorriso: needs threads and mmu
Message-ID: <1421283537-30600-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes (threads):
http://autobuild.buildroot.net/results/c2f/c2fb1cd4e9fe022e152bf6db7d5d819b08d673cd/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/xorriso/Config.in | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/xorriso/Config.in b/package/xorriso/Config.in
index cd60d7f..14d81fa 100644
--- a/package/xorriso/Config.in
+++ b/package/xorriso/Config.in
@@ -3,6 +3,8 @@ config BR2_PACKAGE_XORRISO
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	depends on BR2_USE_WCHAR
 	depends on BR2_LARGEFILE
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU # fork()
 	help
 	  xorriso cd/dvd/bd iso 9660 manipulation and disc burner.
 
@@ -17,5 +19,6 @@ config BR2_PACKAGE_XORRISO
 	  http://libburnia-project.org/
 	  http://www.gnu.org/software/xorriso
 
-comment "xorriso needs a toolchain w/ wchar, largefile"
-	depends on !BR2_USE_WCHAR || !BR2_LARGEFILE
+comment "xorriso needs a toolchain w/ wchar, largefile, threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
-- 
2.0.5
