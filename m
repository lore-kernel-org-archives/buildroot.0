Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1419CC433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 15:11:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A14ED61120;
	Sun, 24 Jul 2022 15:11:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A14ED61120
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z-dmBnL1F3vn; Sun, 24 Jul 2022 15:11:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D1E0960E1E;
	Sun, 24 Jul 2022 15:11:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D1E0960E1E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id ADC5B1BF282
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 15:10:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 87C2860C11
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 15:10:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 87C2860C11
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SKNtt_gW-CWI for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 15:10:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9A7E760E1E
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 15:10:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9A7E760E1E
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 40B8285C8F; Sun, 24 Jul 2022 14:57:12 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 24 Jul 2022 17:09:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a36b947d52d289ec6aad50a12b99232fcab3368e
X-Git-Newrev: 5bbb1834a412f2fb2d9692cdc40c99097fb8a46d
X-Patchwork-Hint: ignore
Message-Id: <20220724145712.40B8285C8F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libest: bump version to current
 HEAD
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5bbb1834a412f2fb2d9692cdc40c99097fb8a46d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream makes releases very irregularly; our current version is already
two years old and upstream HEAD contains a lot of fixes. Therefore:

- Bump to the current HEAD SHA1
- Remove patches applied to upstream

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...-jni-client.c-add-support-for-OpenSSL-1.1.patch | 112 --------------
 ...disable-examples-flag-to-toggle-examples-.patch |  90 -----------
 ...stem-libsafec-flag-to-link-against-system.patch | 109 --------------
 ...e.ac-Fix-AC_ARG_ENABLE-AC_ARG_WITH-macros.patch | 164 ---------------------
 package/libest/libest.hash                         |   2 +-
 package/libest/libest.mk                           |   4 +-
 6 files changed, 3 insertions(+), 478 deletions(-)

diff --git a/package/libest/0001-java-jni-client.c-add-support-for-OpenSSL-1.1.patch b/package/libest/0001-java-jni-client.c-add-support-for-OpenSSL-1.1.patch
deleted file mode 100644
index 3c0d890d3f..0000000000
--- a/package/libest/0001-java-jni-client.c-add-support-for-OpenSSL-1.1.patch
+++ /dev/null
@@ -1,112 +0,0 @@
-From 8f152a6e47484056968973a71a16e4f2142213a9 Mon Sep 17 00:00:00 2001
-From: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
-Date: Mon, 13 Jul 2020 23:05:26 +0000
-Subject: [PATCH] java/jni/client.c: add support for OpenSSL 1.1
-
-This shall allow the java/jni to build with and link against OpenSSL 1.1.
-
-Additionally, the configuration program will not attempt to process the
-java/jni/ subdirectory if no --enable-jni has been specified.
-
-Upstream: https://github.com/cisco/libest/pull/81/. It was merged
-upstream in commit 4fd7e74dc556519132b9ea4c8a0f022bd1254a31, but this
-commit mixes multiple patches in one.
-
-Signed-off-by: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
----
- Makefile.am       |  8 ++++++--
- configure.ac      | 10 ++++++----
- java/jni/client.c | 21 ++++++++++++++++-----
- 3 files changed, 28 insertions(+), 11 deletions(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index 10e38fd..9601de6 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -1,9 +1,13 @@
- ACLOCAL_AMFLAGS = -I m4
- 
-+if ENABLE_JNI
-+libest_jni = java/jni
-+endif
-+
- if ENABLE_CLIENT_ONLY 
--SUBDIRS = safe_c_stub src java/jni example/client example/client-simple example/client-brski
-+SUBDIRS = safe_c_stub src $(libest_jni) example/client example/client-simple example/client-brski
- else 
--SUBDIRS = safe_c_stub src java/jni example/client example/client-simple example/server example/proxy example/client-brski
-+SUBDIRS = safe_c_stub src $(libest_jni) example/client example/client-simple example/server example/proxy example/client-brski
- endif
- 
- EXTRA_DIST = autogen.sh example/util LICENSE README.brski $(srcdir)/build.gradle $(srcdir)/example/build_examples.gradle
-diff --git a/configure.ac b/configure.ac
-index e02a54d..d648030 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -35,9 +35,9 @@ AM_COND_IF([FREEBSD], AC_MSG_RESULT([Skipping libdl check]),
- AC_ARG_ENABLE([jni], 
- 	       [AS_HELP_STRING([--enable-jni],
- 			       [Enable support for JNI library])],
--		[jni_on=1],
--		[jni_on=0])
--AM_CONDITIONAL([ENABLE_JNI], [test x$jni_on = x1])
-+		[],
-+		[enable_jni="no"])
-+AM_CONDITIONAL([ENABLE_JNI], [test "$enable_jni" = "yes"])
- AM_COND_IF([ENABLE_JNI], 
- 	   AC_MSG_RESULT([JNI support enabled])
- 	   AC_DEFINE([ENABLE_JNI]),
-@@ -198,5 +198,7 @@ AC_PREFIX_DEFAULT([/usr/local/est])
- 
- cp confdefs.h est_config.h
- 
--AC_CONFIG_FILES([Makefile version safe_c_stub/Makefile safe_c_stub/lib/Makefile java/jni/Makefile src/Makefile src/est/Makefile example/client/Makefile example/client-simple/Makefile example/client-brski/Makefile example/server/Makefile example/proxy/Makefile])
-+AC_CONFIG_FILES([Makefile version safe_c_stub/Makefile safe_c_stub/lib/Makefile src/Makefile src/est/Makefile example/client/Makefile example/client-simple/Makefile example/client-brski/Makefile example/server/Makefile example/proxy/Makefile])
-+AM_COND_IF([ENABLE_JNI],
-+           [AC_CONFIG_FILES([java/jni/Makefile])])
- AC_OUTPUT
-diff --git a/java/jni/client.c b/java/jni/client.c
-index 9a8a34e..f7aeefc 100644
---- a/java/jni/client.c
-+++ b/java/jni/client.c
-@@ -130,11 +130,18 @@ static int jni_est_client_X509_REQ_sign (X509_REQ *x, EVP_PKEY *pkey, const EVP_
- {
-     int rv;
-     EVP_PKEY_CTX *pkctx = NULL;
--    EVP_MD_CTX mctx;
-+    EVP_MD_CTX *mctx;
- 
--    EVP_MD_CTX_init(&mctx);
-+#ifdef HAVE_OLD_OPENSSL
-+    EVP_MD_CTX md_ctx;
-+    mctx = &md_ctx;
- 
--    if (!EVP_DigestSignInit(&mctx, &pkctx, md, NULL, pkey)) {
-+    EVP_MD_CTX_init(mctx);
-+#else
-+    mctx = EVP_MD_CTX_new();
-+#endif
-+
-+    if (!EVP_DigestSignInit(mctx, &pkctx, md, NULL, pkey)) {
-         return 0;
-     }
- 
-@@ -150,9 +157,13 @@ static int jni_est_client_X509_REQ_sign (X509_REQ *x, EVP_PKEY *pkey, const EVP_
-     x->req_info->enc.modified = 1;
- #endif
- 
--    rv = X509_REQ_sign_ctx(x, &mctx);
-+    rv = X509_REQ_sign_ctx(x, mctx);
- 
--    EVP_MD_CTX_cleanup(&mctx);
-+#ifdef HAVE_OLD_OPENSSL
-+    EVP_MD_CTX_cleanup(mctx);
-+#else
-+    EVP_MD_CTX_free(mctx);
-+#endif
- 
-     return (rv);
- }
--- 
-2.17.1
-
diff --git a/package/libest/0002-Add-enable-disable-examples-flag-to-toggle-examples-.patch b/package/libest/0002-Add-enable-disable-examples-flag-to-toggle-examples-.patch
deleted file mode 100644
index 9b35e8831d..0000000000
--- a/package/libest/0002-Add-enable-disable-examples-flag-to-toggle-examples-.patch
+++ /dev/null
@@ -1,90 +0,0 @@
-From 4bd41ea12924161baca48add39ba5ecfab2cae30 Mon Sep 17 00:00:00 2001
-From: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
-Date: Mon, 13 Jul 2020 23:42:42 +0000
-Subject: [PATCH] Add --{enable,disable}-examples flag to toggle examples
- compilation
-
-Upstream: https://github.com/cisco/libest/pull/81/. It was merged
-upstream in commit 4fd7e74dc556519132b9ea4c8a0f022bd1254a31, but this
-commit mixes multiple patches in one.
-
-Signed-off-by: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
----
- Makefile.am  | 11 +++++++----
- configure.ac | 24 ++++++++++++++++++------
- 2 files changed, 25 insertions(+), 10 deletions(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index 9601de6..e2561e7 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -4,10 +4,13 @@ if ENABLE_JNI
- libest_jni = java/jni
- endif
- 
--if ENABLE_CLIENT_ONLY 
--SUBDIRS = safe_c_stub src $(libest_jni) example/client example/client-simple example/client-brski
--else 
--SUBDIRS = safe_c_stub src $(libest_jni) example/client example/client-simple example/server example/proxy example/client-brski
-+if ENABLE_EXAMPLES
-+if ENABLE_CLIENT_ONLY
-+examples = example/client example/client-simple example/client-brski
-+else
-+examples = example/client example/client-simple example/client-brski example/server example/proxy
-+endif
- endif
- 
-+SUBDIRS = safe_c_stub src $(libest_jni) $(examples)
- EXTRA_DIST = autogen.sh example/util LICENSE README.brski $(srcdir)/build.gradle $(srcdir)/example/build_examples.gradle
-diff --git a/configure.ac b/configure.ac
-index d648030..95b3223 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -2,11 +2,6 @@ dnl Process this file with autoconf to produce a configure script.
- AC_INIT([libest],[3.2.0p],[libest-dev])
- AC_CONFIG_AUX_DIR(config)
- AC_CONFIG_SRCDIR(src/est/est.c)
--AC_CONFIG_SRCDIR(example/client/estclient.c)
--AC_CONFIG_SRCDIR(example/client-simple/estclient-simple.c)
--AC_CONFIG_SRCDIR(example/client-brski/estclient-brski.c)
--AC_CONFIG_SRCDIR(example/server/estserver.c)
--AC_CONFIG_SRCDIR(example/proxy/estproxy.c)
- AC_CONFIG_MACRO_DIR([m4])
- 
- AM_INIT_AUTOMAKE
-@@ -80,6 +75,15 @@ AM_COND_IF([DISABLE_PTHREAD], [],
- 	    [AC_CHECK_LIB([pthread], [pthread_create], [],
-              [AC_MSG_FAILURE([can't find pthread lib])])])
- 
-+AC_ARG_ENABLE([examples],
-+	       [AS_HELP_STRING([--disable-examples],
-+			       [Disable examples compilation])],
-+		[],
-+		[enable_examples="yes"])
-+AC_MSG_CHECKING(whether to build examples)
-+AM_CONDITIONAL([ENABLE_EXAMPLES], [test "$enable_examples" = "yes"])
-+AM_COND_IF([ENABLE_EXAMPLES], AC_MSG_RESULT([yes]), AC_MSG_RESULT([no]))
-+
- AC_ARG_WITH([ssl-dir],
- 	    [AS_HELP_STRING([--with-ssl-dir],
- 		[location of OpenSSL install folder, defaults to /usr/local/ssl])],
-@@ -198,7 +202,15 @@ AC_PREFIX_DEFAULT([/usr/local/est])
- 
- cp confdefs.h est_config.h
- 
--AC_CONFIG_FILES([Makefile version safe_c_stub/Makefile safe_c_stub/lib/Makefile src/Makefile src/est/Makefile example/client/Makefile example/client-simple/Makefile example/client-brski/Makefile example/server/Makefile example/proxy/Makefile])
-+AC_CONFIG_FILES([Makefile version safe_c_stub/Makefile safe_c_stub/lib/Makefile src/Makefile src/est/Makefile])
- AM_COND_IF([ENABLE_JNI],
-            [AC_CONFIG_FILES([java/jni/Makefile])])
-+AM_COND_IF([ENABLE_EXAMPLES],
-+[
-+            AC_CONFIG_FILES([example/client/Makefile example/client-simple/Makefile example/client-brski/Makefile])
-+            AM_COND_IF([ENABLE_CLIENT_ONLY],
-+                       [],
-+                       [AC_CONFIG_FILES([example/server/Makefile example/proxy/Makefile])])
-+])
-+
- AC_OUTPUT
--- 
-2.17.1
-
diff --git a/package/libest/0003-Add-with-system-libsafec-flag-to-link-against-system.patch b/package/libest/0003-Add-with-system-libsafec-flag-to-link-against-system.patch
deleted file mode 100644
index 66574cd937..0000000000
--- a/package/libest/0003-Add-with-system-libsafec-flag-to-link-against-system.patch
+++ /dev/null
@@ -1,109 +0,0 @@
-From 017155b98ff3722816a52953b1079c9c8704d2ff Mon Sep 17 00:00:00 2001
-From: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
-Date: Tue, 14 Jul 2020 10:03:14 +0000
-Subject: [PATCH] Add --with-system-libsafec flag to link against system
- libsafec
-
-Specifying the --with-system-libsafec flag shall allow the configuration
-program to search for and, if found, to link against the libsafec library
-that is installed in the system.
-
-Upstream: https://github.com/cisco/libest/pull/81/. It was merged
-upstream in commit 4fd7e74dc556519132b9ea4c8a0f022bd1254a31, but this
-commit mixes multiple patches in one.
-
-Signed-off-by: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
----
- Makefile.am  |  6 +++++-
- configure.ac | 41 +++++++++++++++++++++++++++++++----------
- 2 files changed, 36 insertions(+), 11 deletions(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index e2561e7..d53b0d5 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -12,5 +12,9 @@ examples = example/client example/client-simple example/client-brski example/ser
- endif
- endif
- 
--SUBDIRS = safe_c_stub src $(libest_jni) $(examples)
-+if ! WITH_SYSTEM_LIBSAFEC
-+builtin_libsafec = safe_c_stub
-+endif
-+
-+SUBDIRS = $(builtin_libsafec) src $(libest_jni) $(examples)
- EXTRA_DIST = autogen.sh example/util LICENSE README.brski $(srcdir)/build.gradle $(srcdir)/example/build_examples.gradle
-diff --git a/configure.ac b/configure.ac
-index 95b3223..048aa3c 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -10,6 +10,7 @@ AM_INIT_AUTOMAKE([subdir-objects])
- 
- AC_PROG_CC
- AM_PROG_CC_C_O
-+PKG_PROG_PKG_CONFIG
- LT_INIT
- AC_CANONICAL_HOST
- case $host in
-@@ -187,22 +188,39 @@ AC_ARG_WITH([libcoap-dir],
-         ]
-        )
- 
--SAFEC_STUB_DIR='$(abs_top_builddir)/safe_c_stub'
--AC_SUBST(SAFEC_STUB_DIR)
--safecdir="$SAFEC_STUB_DIR" 
--AC_SUBST([SAFEC_DIR], "$safecdir")
--AC_SUBST([SAFEC_CFLAGS], "$safecdir/include")
--AC_SUBST([SAFEC_LDFLAGS], "$safecdir/lib")
-+AC_ARG_WITH(system-libsafec,
-+            AS_HELP_STRING([--with-system-libsafec],
-+                           [select to use libsafec installed in the system]),
-+            [],
-+            [with_system_libsafec="no"])
- 
--CFLAGS="$CFLAGS -Wall -I$safecdir/include"
--LDFLAGS="$LDFLAGS -L$safecdir/lib"
--LIBS="$LIBS -lsafe_lib"
-+AC_MSG_CHECKING(which libsafec to use)
-+AM_CONDITIONAL([WITH_SYSTEM_LIBSAFEC], [test "$with_system_libsafec" = "yes"])
-+AM_COND_IF([WITH_SYSTEM_LIBSAFEC], AC_MSG_RESULT([system]), AC_MSG_RESULT([built-in]))
-+AM_COND_IF([WITH_SYSTEM_LIBSAFEC],
-+[
-+           PKG_CHECK_MODULES([libsafec], [libsafec])
-+           LIBS="$LIBS $libsafec_LIBS"
-+           CFLAGS="$CFLAGS $libsafec_CFLAGS"
-+           CPPFLAGS="$CPPFLAGS $libsafec_CFLAGS"
-+],[
-+           SAFEC_STUB_DIR='$(abs_top_builddir)/safe_c_stub'
-+           AC_SUBST(SAFEC_STUB_DIR)
-+           safecdir="$SAFEC_STUB_DIR"
-+           AC_SUBST([SAFEC_DIR], "$safecdir")
-+           AC_SUBST([SAFEC_CFLAGS], "$safecdir/include")
-+           AC_SUBST([SAFEC_LDFLAGS], "$safecdir/lib")
-+
-+           CFLAGS="$CFLAGS -Wall -I$safecdir/include"
-+           LDFLAGS="$LDFLAGS -L$safecdir/lib"
-+           LIBS="$LIBS -lsafe_lib"
-+])
- 
- AC_PREFIX_DEFAULT([/usr/local/est])
- 
- cp confdefs.h est_config.h
- 
--AC_CONFIG_FILES([Makefile version safe_c_stub/Makefile safe_c_stub/lib/Makefile src/Makefile src/est/Makefile])
-+AC_CONFIG_FILES([Makefile version src/Makefile src/est/Makefile])
- AM_COND_IF([ENABLE_JNI],
-            [AC_CONFIG_FILES([java/jni/Makefile])])
- AM_COND_IF([ENABLE_EXAMPLES],
-@@ -212,5 +230,8 @@ AM_COND_IF([ENABLE_EXAMPLES],
-                        [],
-                        [AC_CONFIG_FILES([example/server/Makefile example/proxy/Makefile])])
- ])
-+AM_COND_IF([WITH_SYSTEM_LIBSAFEC],
-+           [],
-+           [AC_CONFIG_FILES([safe_c_stub/Makefile safe_c_stub/lib/Makefile])])
- 
- AC_OUTPUT
--- 
-2.17.1
-
diff --git a/package/libest/0004-configure.ac-Fix-AC_ARG_ENABLE-AC_ARG_WITH-macros.patch b/package/libest/0004-configure.ac-Fix-AC_ARG_ENABLE-AC_ARG_WITH-macros.patch
deleted file mode 100644
index f5e1b0c41a..0000000000
--- a/package/libest/0004-configure.ac-Fix-AC_ARG_ENABLE-AC_ARG_WITH-macros.patch
+++ /dev/null
@@ -1,164 +0,0 @@
-From 9a76187aa4d779de39afa12024d5a73a14175371 Mon Sep 17 00:00:00 2001
-From: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
-Date: Wed, 15 Jul 2020 11:25:05 +0000
-Subject: [PATCH] configure.ac: Fix AC_ARG_ENABLE/AC_ARG_WITH macros
-
-Multiple tests in configure.ac are flawed:
-
-[--snip--]
-    AC_ARG_ENABLE([pthreads],
-            [AS_HELP_STRING([--disable-pthreads],
-                            [Disable support for pthreads])],
-            [pthreads_on=1],
-            [pthreads_on=0])
-[--snip--]
-
-The third argument is "action-if-given" and the fourth argument
-is "action-if-not-given" [0]. Which means that, whether you pass
---enable-pthreads or --disable-pthreads, the third argument will be
-executed, that is "pthreads_on=1". And if you pass neither, the fourth
-argument will be executed, i.e. "pthreads_on=0".
-
-We want `--enable-pthreads` and `--disable-pthreads` flags to do their job.
-The right way to do that will be to eliminate "action-if-given" and replace
-the user-defined `FEATURE_on=0|1` shell variables with the `enable_FEATURE`
-and `with_PACKAGE` shell variables provided by Autotools.
-
-[0] https://www.gnu.org/savannah-checkouts/gnu/autoconf/manual/autoconf-2.69/autoconf.html#Package-Options
-
-Upstream: https://github.com/cisco/libest/pull/81/. It was merged
-upstream in commit 4fd7e74dc556519132b9ea4c8a0f022bd1254a31, but this
-commit mixes multiple patches in one.
-
-Signed-off-by: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
----
- configure.ac | 60 ++++++++++++++++++++++++++--------------------------
- 1 file changed, 30 insertions(+), 30 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 048aa3c..0b930bf 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -43,9 +43,9 @@ AM_CONDITIONAL([JAVA_HOME_SET], [test ! -z "$JAVA_HOME"])
- AC_ARG_ENABLE([client-only], 
- 	       [AS_HELP_STRING([--enable-client-only],
- 			       [Enable the building of only the client mode of libEST])],
--		[clientonly_on=1],
--		[clientonly_on=0])
--AM_CONDITIONAL([ENABLE_CLIENT_ONLY], [test x$clientonly_on = x1])
-+		[],
-+		[enable_client_only="no"])
-+AM_CONDITIONAL([ENABLE_CLIENT_ONLY], [test "$enable_client_only" = "yes"])
- AM_COND_IF([ENABLE_CLIENT_ONLY], 
- 	   AC_MSG_RESULT([Client only build enabled])
- 	   AC_DEFINE([ENABLE_CLIENT_ONLY]),
-@@ -54,9 +54,9 @@ AM_COND_IF([ENABLE_CLIENT_ONLY],
- AC_ARG_ENABLE([brski], 
- 	       [AS_HELP_STRING([--enable-brski],
- 			       [Enable support for brski bootstrap functionality])],
--		[brski_on=1],
--		[brski_on=0])
--AM_CONDITIONAL([ENABLE_BRSKI], [test x$brski_on = x1])
-+		[],
-+		[enable_brski="no"])
-+AM_CONDITIONAL([ENABLE_BRSKI], [test "$enable_brski" = "yes"])
- AM_COND_IF([ENABLE_BRSKI], 
- 	   AC_MSG_RESULT([BRSKI support enabled])
- 	   AC_DEFINE([ENABLE_BRSKI]),
-@@ -65,9 +65,9 @@ AM_COND_IF([ENABLE_BRSKI],
- AC_ARG_ENABLE([pthreads], 
- 	       [AS_HELP_STRING([--disable-pthreads],
- 			       [Disable support for pthreads])],
--		[pthreads_on=1],
--		[pthreads_on=0])
--AM_CONDITIONAL([DISABLE_PTHREAD], [test x$pthreads_on = x1])
-+		[],
-+		[enable_pthreads="yes"])
-+AM_CONDITIONAL([DISABLE_PTHREAD], [test "$enable_pthreads" = "no"])
- AM_COND_IF([DISABLE_PTHREAD], 
- 	   AC_MSG_RESULT([pthread support disabled])
- 	   AC_DEFINE([DISABLE_PTHREADS]), 
-@@ -88,13 +88,13 @@ AM_COND_IF([ENABLE_EXAMPLES], AC_MSG_RESULT([yes]), AC_MSG_RESULT([no]))
- AC_ARG_WITH([ssl-dir],
- 	    [AS_HELP_STRING([--with-ssl-dir],
- 		[location of OpenSSL install folder, defaults to /usr/local/ssl])],
--	    [ssldir="$withval"],
--	    [ssldir="/usr/local/ssl"])
--AC_SUBST([SSL_CFLAGS], "$ssldir/include")
--AC_SUBST([SSL_LDFLAGS], "$ssldir/lib")
-+	    [],
-+	    [with_ssl_dir="/usr/local/ssl"])
-+AC_SUBST([SSL_CFLAGS], "$with_ssl_dir/include")
-+AC_SUBST([SSL_LDFLAGS], "$with_ssl_dir/lib")
- 
--CFLAGS="$CFLAGS -Wall -I$ssldir/include"
--LDFLAGS="$LDFLAGS -L$ssldir/lib"
-+CFLAGS="$CFLAGS -Wall -I$with_ssl_dir/include"
-+LDFLAGS="$LDFLAGS -L$with_ssl_dir/lib"
- if test "$is_freebsd" = "1" ; then
- AC_CHECK_LIB([crypto], [EVP_EncryptInit], [],
-              [AC_MSG_FAILURE([can't find openssl crypto lib])]
-@@ -120,13 +120,13 @@ AC_CHECK_LIB([crypto], [EVP_CIPHER_CTX_reset], [],
- AC_ARG_WITH([libcurl-dir],
-  [AS_HELP_STRING([--with-libcurl-dir],
- 				 [enable support for client proxy using libcurl])],
-- [libcurldir="$withval"],
-- [with_libcurldir=no])
-+ [],
-+ [with_libcurl_dir=no])
- 
-   AS_IF(
--        [test "x$with_libcurldir" != xno],
--        [[CFLAGS="$CFLAGS -I$libcurldir/include"]
--         [LDFLAGS="$LDFLAGS -L$libcurldir/lib -lcurl"]
-+        [test "$with_libcurl_dir" != "no"],
-+        [[CFLAGS="$CFLAGS -I$with_libcurl_dir/include"]
-+         [LDFLAGS="$LDFLAGS -L$with_libcurl_dir/lib -lcurl"]
-          AC_CHECK_LIB(
-               [curl],
-               [curl_easy_init],
-@@ -143,17 +143,17 @@ AC_ARG_WITH([libcurl-dir],
- AC_ARG_WITH([uriparser-dir],
-  [AS_HELP_STRING([--with-uriparser-dir],
- 				 [enable support for path segments using uriparser])],
-- [uriparserdir="$withval"],
-- [with_uriparserdir=no])
-+ [],
-+ [with_uriparser_dir=no])
-           
-  dnl CFLAGS="$CFLAGS -Wall -I$uriparserdir/include"
-  dnl CPPFLAGS="$CPPFLAGS -I$uriparser/include"
-  dnl LDFLAGS="$LDFLAGS -L$uriparserdir/lib -luriparser"
- 
-   AS_IF(
--        [test "x$with_uriparserdir" != xno],
--        [[CFLAGS="$CFLAGS -I$uriparserdir/include"]
--         [LDFLAGS="$LDFLAGS -L$uriparserdir/lib -luriparser"]
-+        [test "$with_uriparser_dir" != "no"],
-+        [[CFLAGS="$CFLAGS -I$with_uriparser_dir/include"]
-+         [LDFLAGS="$LDFLAGS -L$with_uriparser_dir/lib -luriparser"]
-          AC_CHECK_LIB(
-               [uriparser], 
-               [uriParseUriA],
-@@ -170,13 +170,13 @@ AC_ARG_WITH([uriparser-dir],
- AC_ARG_WITH([libcoap-dir],
-  [AS_HELP_STRING([--with-libcoap-dir],
- 				 [enable support for ESToCoAP using libcoap library])],
-- [libcoapdir="$withval"],
-- [with_libcoapdir=no])          
-+ [],
-+ [with_libcoap_dir=no])
- 
-   AS_IF(
--        [test "x$with_libcoapdir" != xno],
--        [[CFLAGS="$CFLAGS -I$libcoapdir/include"]
--         [LDFLAGS="$LDFLAGS -L$libcoapdir/lib -lcoap-2-openssl"]
-+        [test "$with_libcoap_dir" != "no"],
-+        [[CFLAGS="$CFLAGS -I$with_libcoap_dir/include"]
-+         [LDFLAGS="$LDFLAGS -L$with_libcoap_dir/lib -lcoap-2-openssl"]
-          AC_CHECK_LIB(
-               [coap-2-openssl], 
-               [coap_startup],
--- 
-2.17.1
-
diff --git a/package/libest/libest.hash b/package/libest/libest.hash
index c902a9568f..dc9bc05255 100644
--- a/package/libest/libest.hash
+++ b/package/libest/libest.hash
@@ -1,3 +1,3 @@
 # Computed locally
-sha256  324b3a2b16cd14ea4234d75fa90f08b29509bac9cd3795c44268e22f906ee0ad  libest-3.2.0.tar.gz
+sha256  83983ac05137fd73586ddcb4874e30689fe694ee9a329797b60b3defc9a87327  libest-f8a6e5b53a5f70e72fe4029981df0693b17cbb32.tar.gz
 sha256  fbdb055f98babf8d86095d6f9b9e34d2ff21a8212e442b8f18bdcb403e44366c  LICENSE
diff --git a/package/libest/libest.mk b/package/libest/libest.mk
index 0dd3e7d0e4..9f3168767d 100644
--- a/package/libest/libest.mk
+++ b/package/libest/libest.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBEST_VERSION = 3.2.0
-LIBEST_SITE = $(call github,cisco,libest,r$(LIBEST_VERSION))
+LIBEST_VERSION = f8a6e5b53a5f70e72fe4029981df0693b17cbb32
+LIBEST_SITE = $(call github,cisco,libest,$(LIBEST_VERSION))
 # We don't build examples, so we're not affected by the OpenSSL
 # license
 LIBEST_LICENSE = BSD-3-Clause, MIT, W3C
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
