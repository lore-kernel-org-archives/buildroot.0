From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sun, 31 Jul 2016 14:54:50 +0200
Subject: [Buildroot] [PATCH] wavemon: depends on a toolchain with NPTL
Message-ID: <20160731125449.GA13036@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The software uses pthread_mutexattr_setrobust which isn't
available in uClibc-ng Linuxthreads support.

Fixes:
http://autobuild.buildroot.net/results/d81b199c74cb4251f0b0eb975f66cb5016eb464c/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/wavemon/Config.in |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/wavemon/Config.in b/package/wavemon/Config.in
index b0f2f34..e073dee 100644
--- a/package/wavemon/Config.in
+++ b/package/wavemon/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_WAVEMON
 	bool "wavemon"
-	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_LIBNL
 	help
@@ -14,5 +14,5 @@ config BR2_PACKAGE_WAVEMON
 
 	  https://github.com/uoaerg/wavemon
 
-comment "wavemon needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+comment "wavemon needs a toolchain w/ NPTL"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
-- 
1.7.10.4
