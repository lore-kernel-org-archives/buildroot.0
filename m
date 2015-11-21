From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 21 Nov 2015 20:40:28 +0100
Subject: [Buildroot] [PATCH/next 1/8] package/boost: bump version to 1.59.0
Message-ID: <1448134835-27519-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed patch applied upstream.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../boost/0002-gcc.jam-compiler-options-fix.patch  | 37 ----------------------
 package/boost/boost.hash                           |  6 ++--
 package/boost/boost.mk                             |  2 +-
 3 files changed, 4 insertions(+), 41 deletions(-)
 delete mode 100644 package/boost/0002-gcc.jam-compiler-options-fix.patch

diff --git a/package/boost/0002-gcc.jam-compiler-options-fix.patch b/package/boost/0002-gcc.jam-compiler-options-fix.patch
deleted file mode 100644
index c645250..0000000
--- a/package/boost/0002-gcc.jam-compiler-options-fix.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From a891e48ed0b647b7bf550ad1d179398b23d0726e Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
-Date: Sat, 2 May 2015 13:47:54 +0200
-Subject: [PATCH] gcc.jam compiler options fix
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Only PowerPC, SPARC, and x86 do support the -m32 and -m64 compiler options [1].
-
-Rather then excluding all architectures not supporting these options as it is
-done in commit c0634341d9ee2c02d3a55c91dafb988afc066c49 [2], include all
-architectures that do support them.
-
-[1] https://gcc.gnu.org/onlinedocs/gcc/Option-Summary.html
-[2] https://github.com/boostorg/build/commit/c0634341d9ee2c02d3a55c91dafb988afc066c49
-
-Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
----
- src/tools/gcc.jam | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tools/build/src/tools/gcc.jam b/tools/build/src/tools/gcc.jam
-index db04534..fbe8ab0 100644
---- a/tools/build/src/tools/gcc.jam
-+++ b/tools/build/src/tools/gcc.jam
-@@ -451,7 +451,7 @@ rule setup-address-model ( targets * : sources * : properties * )
-         else
-         {
-             local arch = [ feature.get-values architecture : $(properties) ] ;
--            if $(arch) != arm
-+            if $(arch) = power || $(arch) = sparc || $(arch) = x86
-             {
-                 if $(model) = 32
-                 {
---
-2.3.7
diff --git a/package/boost/boost.hash b/package/boost/boost.hash
index 706eea2..1b2f5e2 100644
--- a/package/boost/boost.hash
+++ b/package/boost/boost.hash
@@ -1,3 +1,3 @@
-# From http://sourceforge.net/projects/boost/files/boost/1.58.0/
-md5	b8839650e61e9c1c0a89f371dd475546	boost_1_58_0.tar.bz2
-sha1	2fc96c1651ac6fe9859b678b165bd78dc211e881	boost_1_58_0.tar.bz2
+# From http://sourceforge.net/projects/boost/files/boost/1.59.0/
+md5	6aa9a5c6a4ca1016edd0ed1178e3cb87		boost_1_59_0.tar.bz2
+sha1	b94de47108b2cdb0f931833a7a9834c2dd3ca46e	boost_1_59_0.tar.bz2
diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index efc0020..35c8809 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BOOST_VERSION = 1.58.0
+BOOST_VERSION = 1.59.0
 BOOST_SOURCE = boost_$(subst .,_,$(BOOST_VERSION)).tar.bz2
 BOOST_SITE = http://downloads.sourceforge.net/project/boost/boost/$(BOOST_VERSION)
 BOOST_INSTALL_STAGING = YES
-- 
2.6.2
