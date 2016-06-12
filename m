From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Jun 2016 18:38:51 +0200
Subject: [Buildroot] [git commit] package/mono: bump to version 4.4.0.182
Message-ID: <20160612164003.145787FA05@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f238d37bb63d5eb27e56cc07cf999c5111ac6e1a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch bumps mono to versione 4.4.0.182.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...glib-checking-for-locale_charset-function.patch | 28 ----------------------
 ....in-fixing-wrong-MonoPosixHelper-location.patch | 28 ----------------------
 package/mono/mono.hash                             |  2 +-
 package/mono/mono.mk                               |  2 +-
 4 files changed, 2 insertions(+), 58 deletions(-)

diff --git a/package/mono/0005-eglib-checking-for-locale_charset-function.patch b/package/mono/0005-eglib-checking-for-locale_charset-function.patch
deleted file mode 100644
index 52d5638..0000000
--- a/package/mono/0005-eglib-checking-for-locale_charset-function.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 026a8c44d332b3595814ce0aceba255467cd7b6d Mon Sep 17 00:00:00 2001
-From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
-Date: Sat, 5 Sep 2015 08:57:21 +0200
-Subject: [PATCH] eglib: checking for locale_charset function
-
-This patch checks if locale_charset function is availabe in
-libiconv or libcharset and changes the linking options accordingly.
-
-Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
----
- eglib/configure.ac | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/eglib/configure.ac b/eglib/configure.ac
-index 9d094ea..5ea220e 100644
---- a/eglib/configure.ac
-+++ b/eglib/configure.ac
-@@ -182,6 +182,7 @@ fi
- AC_SUBST(G_HAVE_ISO_VARARGS)
- 
- AC_CHECK_HEADERS(getopt.h sys/select.h sys/time.h sys/wait.h pwd.h langinfo.h iconv.h localcharset.h sys/types.h sys/resource.h)
-+AC_CHECK_LIB([iconv], [locale_charset],[],[AC_CHECK_LIB([charset], [locale_charset],[LIBS+="-liconv -lcharset"])])
- AC_CHECK_HEADER(alloca.h, [HAVE_ALLOCA_H=1], [HAVE_ALLOCA_H=0])
- AC_SUBST(HAVE_ALLOCA_H)
- 
--- 
-1.9.1
-
diff --git a/package/mono/0007-config.in-fixing-wrong-MonoPosixHelper-location.patch b/package/mono/0007-config.in-fixing-wrong-MonoPosixHelper-location.patch
deleted file mode 100644
index 6ebb802..0000000
--- a/package/mono/0007-config.in-fixing-wrong-MonoPosixHelper-location.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 76aa4fb62a433e61dc35eefcc3077f0463182d2f Mon Sep 17 00:00:00 2001
-From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
-Date: Tue, 23 Feb 2016 22:43:39 +0100
-Subject: [PATCH] config.in: fixing wrong MonoPosixHelper location
-
-This patch remove a wrong prefix for libMonoPosixHelper
-
-Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
----
- data/config.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/data/config.in b/data/config.in
-index b760176..41495b9 100644
---- a/data/config.in
-+++ b/data/config.in
-@@ -10,7 +10,7 @@
- 	<dllmap dll="i:odbc32.dll" target="libiodbc.dylib" os="osx"/>
- 	<dllmap dll="oci" target="libclntsh@libsuffix@" os="!windows"/>
- 	<dllmap dll="db2cli" target="libdb2_36@libsuffix@" os="!windows"/>
--	<dllmap dll="MonoPosixHelper" target="@prefix@/@reloc_libdir@/libMonoPosixHelper@libsuffix@" os="!windows" />
-+	<dllmap dll="MonoPosixHelper" target="libMonoPosixHelper@libsuffix@" os="!windows" />
- 	<dllmap dll="i:msvcrt" target="@LIBC@" os="!windows"/>
- 	<dllmap dll="i:msvcrt.dll" target="@LIBC@" os="!windows"/>
- 	<dllmap dll="sqlite" target="@SQLITE@" os="!windows"/>
--- 
-1.9.1
-
diff --git a/package/mono/mono.hash b/package/mono/mono.hash
index d1277c5..748a9e1 100644
--- a/package/mono/mono.hash
+++ b/package/mono/mono.hash
@@ -1,2 +1,2 @@
 # sha256 locally computed
-sha256 4703d390416a6e9977585f13711f59a6d54431086c2dbacee49888dcc31937be  mono-4.2.3.4.tar.bz2
+sha256 983e27a054bc3dc6709b32b8de45a0f4335e9e9c3911b20d29f63eb7cc00bfe5  mono-4.4.0.182.tar.bz2
diff --git a/package/mono/mono.mk b/package/mono/mono.mk
index 0b9cb46..3104622 100644
--- a/package/mono/mono.mk
+++ b/package/mono/mono.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MONO_VERSION = 4.2.3.4
+MONO_VERSION = 4.4.0.182
 MONO_SITE = http://download.mono-project.com/sources/mono
 MONO_SOURCE = mono-$(MONO_VERSION).tar.bz2
 MONO_LICENSE = GPLv2 or MIT (compiler, tools), LGPLv2 (runtime libs), MIT (class libs) or commercial
