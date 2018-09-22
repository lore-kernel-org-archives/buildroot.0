From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 22 Sep 2018 22:00:45 +0200
Subject: [Buildroot] [PATCH 1/1] dvblast: drop NPTL dependency
Message-ID: <20180922200045.6608-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The latest uClibc-ng version (1.0.30) provides clock_nanosleep() even
for non NPTL configurations.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/dvblast/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/dvblast/Config.in b/package/dvblast/Config.in
index 5597faea4f..973eee88c6 100644
--- a/package/dvblast/Config.in
+++ b/package/dvblast/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_DVBLAST
 	bool "dvblast"
-	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # clock_nanosleep()
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_BITSTREAM
 	select BR2_PACKAGE_LIBEV
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
@@ -10,5 +10,5 @@ config BR2_PACKAGE_DVBLAST
 
 	  http://www.videolan.org/projects/dvblast.html
 
-comment "dvblast needs a toolchain w/ NPTL"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
+comment "dvblast needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
-- 
2.17.1
