From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 30 Jan 2016 17:17:13 +0100
Subject: [Buildroot] [PATCH 2/5] package/libraw: Remove /usr/local from
	configure.ac
In-Reply-To: <1454170636-9427-1-git-send-email-bernd.kuhls@t-online.de>
References: <1454170636-9427-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1454170636-9427-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build fails with BR2_COMPILER_PARANOID_UNSAFE_PATH=y

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...emove-paths-which-break-cross-compilation.patch | 29 ++++++++++++++++++++++
 package/libraw/libraw.mk                           |  2 ++
 2 files changed, 31 insertions(+)
 create mode 100644 package/libraw/0001-Remove-paths-which-break-cross-compilation.patch

diff --git a/package/libraw/0001-Remove-paths-which-break-cross-compilation.patch b/package/libraw/0001-Remove-paths-which-break-cross-compilation.patch
new file mode 100644
index 0000000..0f0eee1
--- /dev/null
+++ b/package/libraw/0001-Remove-paths-which-break-cross-compilation.patch
@@ -0,0 +1,29 @@
+From 1f9c2ebc9c65e8ce7fdbece55d578cf00c6c4b46 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Sat, 30 Jan 2016 17:06:04 +0100
+Subject: [PATCH 1/1] Remove paths which break cross-compilation
+
+Patch sent upstream: https://github.com/LibRaw/LibRaw/pull/57
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ configure.ac | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 9bb07b2..78064d9 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -16,9 +16,6 @@ AC_SUBST(LIBTOOL_DEPS)
+ 
+ # Config files to generate
+ 
+-CPPFLAGS="$CPPFLAGS -I/usr/local/include"
+-LDFLAGS="$LDFLAGS -L/usr/local/lib"
+-
+ AC_CONFIG_FILES([
+ 	Makefile
+ 	libraw.pc
+-- 
+2.7.0.rc3
+
diff --git a/package/libraw/libraw.mk b/package/libraw/libraw.mk
index 2f8643d..a4ab92f 100644
--- a/package/libraw/libraw.mk
+++ b/package/libraw/libraw.mk
@@ -8,6 +8,8 @@ LIBRAW_VERSION = 0.17.1
 LIBRAW_SOURCE = LibRaw-$(LIBRAW_VERSION).tar.gz
 LIBRAW_SITE = http://www.libraw.org/data
 LIBRAW_INSTALL_STAGING = YES
+# we patch configure.ac
+LIBRAW_AUTORECONF = YES
 LIBRAW_CONF_OPTS += \
 	--disable-examples \
 	--disable-lcms \
-- 
2.7.0.rc3
