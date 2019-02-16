From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 16 Feb 2019 11:50:27 +0100
Subject: [Buildroot] [PATCH/next 1/1] package/wavemon: remove NPTL dependency
Message-ID: <20190216105027.26055-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

wavemon does not use pthread_mutexattr_setrobust since version 0.8.2 and
https://github.com/uoaerg/wavemon/commit/d271685e03bc896829d8cc01ca0de28cd7b6ba72

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/wavemon/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/wavemon/Config.in b/package/wavemon/Config.in
index b72a617759..0cb4cb5c69 100644
--- a/package/wavemon/Config.in
+++ b/package/wavemon/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_WAVEMON
 	bool "wavemon"
-	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_LIBNL
 	help
@@ -15,5 +15,5 @@ config BR2_PACKAGE_WAVEMON
 
 	  https://github.com/uoaerg/wavemon
 
-comment "wavemon needs a toolchain w/ NPTL"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
+comment "wavemon needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
-- 
2.14.1
