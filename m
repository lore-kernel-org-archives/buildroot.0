Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DEF7EE49A3
	for <buildroot@archiver.kernel.org>; Sat, 19 Aug 2023 18:37:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E469C408C5;
	Sat, 19 Aug 2023 18:37:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E469C408C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Yje1hkfwq-mG; Sat, 19 Aug 2023 18:37:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 61EF04040D;
	Sat, 19 Aug 2023 18:37:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 61EF04040D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5B5E41BF868
 for <buildroot@lists.busybox.net>; Sat, 19 Aug 2023 18:37:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 31FA241BBF
 for <buildroot@lists.busybox.net>; Sat, 19 Aug 2023 18:37:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 31FA241BBF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X22o1r9jrV3I for <buildroot@lists.busybox.net>;
 Sat, 19 Aug 2023 18:37:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A6F7541730
 for <buildroot@buildroot.org>; Sat, 19 Aug 2023 18:37:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A6F7541730
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 90AAC85D0F; Sat, 19 Aug 2023 18:37:31 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 19 Aug 2023 20:36:02 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 5e012a07041a4d9000da0a007dd4132f9a85e75a
X-Git-Newrev: f6a6e3a8363a32e5443c9eadc2ee047853640d1a
X-Patchwork-Hint: ignore
Message-Id: <20230819183731.90AAC85D0F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/gettext-gnu: bump to
 version 0.22
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
Content-Type: multipart/mixed; boundary="===============8438116911962493390=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8438116911962493390==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=f6a6e3a8363a32e5443c9eadc2ee047853640d1a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Release notes:
https://lists.gnu.org/archive/html/info-gnu/2020-07/msg00009.html
https://lists.gnu.org/archive/html/info-gnu/2023-06/msg00003.html

Removed patch 0001, the patched file is not present in this release.
Removed patch 0002 which was applied upstream.

Added comment to gettext-tiny.mk about version bumps.

Since upstream commit
https://github.com/autotools-mirror/gettext/commit/785a89e5df994c2b242f082d60de89e2d520aa4a
gettext-runtime is a build-dependency for gettext-tools so we are
building the complete package for the host from now on.

Doing so we can drop the _POST_INSTALL_HOOK, and we can rely of the
in-tree libtextstyle.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .checkpackageignore                                |   2 -
 .../gettext-gnu/0001-error_print_progname.patch    |  20 ---
 ...ty-to-buld-gettext-tools-seperately-part1.patch | 142 ---------------------
 package/gettext-gnu/gettext-gnu.hash               |   7 +-
 package/gettext-gnu/gettext-gnu.mk                 |  31 ++---
 package/gettext-tiny/gettext-tiny.hash             |   6 +-
 package/gettext-tiny/gettext-tiny.mk               |   3 +-
 7 files changed, 21 insertions(+), 190 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 59191eb0cf..e4a60e7aef 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -524,8 +524,6 @@ package/genpart/0001-fix-return-code.patch Upstream
 package/genromfs/0001-build-system.patch Sob Upstream
 package/gensio/0001-Fix-missing-EVP_PKEY_ED25519-build-error-on-libressl.patch Upstream
 package/gerbera/S99gerbera Indent
-package/gettext-gnu/0001-error_print_progname.patch Upstream
-package/gettext-gnu/0002-restore-the-ability-to-buld-gettext-tools-seperately-part1.patch Upstream
 package/giblib/0001-fix-imlib2-detection.patch Upstream
 package/giflib/0001-Makefile-add-targets-to-manage-static-building.patch Upstream
 package/git-crypt/0001-fix-build-with-libressl-3.5.0.patch Upstream
diff --git a/package/gettext-gnu/0001-error_print_progname.patch b/package/gettext-gnu/0001-error_print_progname.patch
deleted file mode 100644
index 7e1d3c55cf..0000000000
--- a/package/gettext-gnu/0001-error_print_progname.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-[Updated to apply cleanly with 0.20.1]
-Signed-off-by: Adam Duskett <Aduskett@gmail.com>
----
-diff --git a/gettext-tools/gnulib-lib/error.h b/gettext-tools/gnulib-lib/error.h
-index 61771cc..4221684 100644
---- a/gettext-tools/gnulib-lib/error.h
-+++ b/gettext-tools/gnulib-lib/error.h
-@@ -68,7 +68,10 @@ extern void error_at_line (int __status, int __errnum, const char *__fname,
- /* If NULL, error will flush stdout, then print on stderr the program
-    name, a colon and a space.  Otherwise, error will call this
-    function without parameters instead.  */
--extern DLL_VARIABLE void (*error_print_progname) (void);
-+#ifndef __UCLIBC__
-+extern DLL_VARIABLE
-+#endif
-+void (*error_print_progname) (void);
- 
- /* This variable is incremented each time 'error' is called.  */
- extern DLL_VARIABLE unsigned int error_message_count;
---
diff --git a/package/gettext-gnu/0002-restore-the-ability-to-buld-gettext-tools-seperately-part1.patch b/package/gettext-gnu/0002-restore-the-ability-to-buld-gettext-tools-seperately-part1.patch
deleted file mode 100644
index 5334a36bb7..0000000000
--- a/package/gettext-gnu/0002-restore-the-ability-to-buld-gettext-tools-seperately-part1.patch
+++ /dev/null
@@ -1,142 +0,0 @@
-From e4b3a3f56fa6fc2a51769e286545f0631bb4837c Mon Sep 17 00:00:00 2001
-From: Bruno Haible <bruno@clisp.org>
-Date: Sat, 18 May 2019 23:33:06 +0200
-Subject: [PATCH] build: Restore the ability to build gettext-tools separately, part 1.
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Reported by Hanspeter Niederstrasser <nieder@users.sourceforge.net>
-in <https://savannah.gnu.org/bugs/?56333>.
-
-Code based on patch by Miguel Ángel Arruga Vivas <rosen644835@gmail.com>.
-
-* autogen.sh: Copy libtextstyle.m4 for use by gettext-tools.
-* gettext-tools/configure.ac: New option --with-installed-libtextstyle.
-(USE_INSTALLED_LIBTEXTSTYLE): New conditional.
-* gettext-tools/src/Makefile.am (textstyle.h): Disable rule if
-USE_INSTALLED_LIBTEXTSTYLE is true.
-(LT_LIBTEXTSTYLE): New variable.
-(libgettextsrc_la_LDFLAGS): Use it instead of hardcoding a relative filename of
-libtextstyle.la.
-* configure.ac: Filter out --with-installed-libtextstyle from inherited --help
-output.
-* Makefile.am (distcheck-hook): Compare different copies of libtextstyle.m4.
-* PACKAGING: Document that gettext-tools's configure needs to be invoked with
---with-installed-libtextstyle.
-
-Upstream-status: committed.
-https://git.savannah.gnu.org/gitweb/?p=gettext.git;a=commitdiff;h=e4b3a3f56fa6fc2a51769e286545f0631bb4837c
-
-Signed-off-by: Bruno Haible <bruno@clisp.org>
-[Backported to 0.20.1]
-Signed-off-by: Adam Duskett <Aduskett@gmail.com>
----
- PACKAGING                     |  2 +-
- autogen.sh                    |  1 +
- configure.ac                  |  2 +-
- gettext-tools/configure.ac    | 16 ++++++++++++++++
- gettext-tools/src/Makefile.am |  8 +++++++-
- 5 files changed, 26 insertions(+), 3 deletions(-)
-
-diff --git a/PACKAGING b/PACKAGING
-index a8ce979..52b80ac 100644
---- a/PACKAGING
-+++ b/PACKAGING
-@@ -42,7 +42,7 @@ The 'libtextstyle' binary package can be installed by doing
- The 'gettext-tools' binary package can be installed by doing
- 
-       cd gettext-tools
--      ./configure
-+      ./configure --with-installed-libtextstyle
-       make
-       make install
- 
-diff --git a/autogen.sh b/autogen.sh
-index 5c28b6f..2ccf373 100755
---- a/autogen.sh
-+++ b/autogen.sh
-@@ -268,6 +268,7 @@ if ! $skip_gnulib; then
-   $GNULIB_TOOL --dir=gettext-tools --lib=libgettextlib --source-base=gnulib-lib --m4-base=gnulib-m4 --tests-base=gnulib-tests --makefile-name=Makefile.gnulib --libtool --with-tests --local-dir=gnulib-local --local-symlink \
-     --import --avoid=array-list-tests --avoid=linkedhash-list-tests --avoid=hash-tests --avoid=fdutimensat-tests --avoid=futimens-tests --avoid=utime-tests --avoid=utimens-tests --avoid=utimensat-tests \
-     `for m in $GNULIB_MODULES_TOOLS_LIBUNISTRING_TESTS; do echo --avoid=$m; done` $GNULIB_MODULES_TOOLS_FOR_SRC $GNULIB_MODULES_TOOLS_FOR_SRC_COMMON_DEPENDENCIES $GNULIB_MODULES_TOOLS_OTHER || exit $?
-+  $GNULIB_TOOL --copy-file m4/libtextstyle.m4 gettext-tools/gnulib-m4/libtextstyle.m4 || exit $?
-   # In gettext-tools/libgrep:
-   GNULIB_MODULES_TOOLS_FOR_LIBGREP='
-     mbrlen
-diff --git a/configure.ac b/configure.ac
-index 38db6fd..0c84bdd 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -49,7 +49,7 @@ AC_CANONICAL_HOST
- dnl Optional Features: AC_ARG_ENABLE calls
- dnl Optional Packages: AC_ARG_WITH calls
- dnl Some influential environment variables: AC_ARG_VAR calls
--esyscmd([{ cd gettext-runtime && autoconf --trace=AC_ARG_ENABLE:'$n([$1],[$2])' --trace=AC_ARG_WITH:'$n([$1],[$2])' --trace=AC_ARG_VAR:'$n($@)' && cd ..; cd libtextstyle && autoconf --trace=AC_ARG_ENABLE:'$n([$1],[$2])' --trace=AC_ARG_WITH:'$n([$1],[$2])' --trace=AC_ARG_VAR:'$n($@)' && cd ..; cd gettext-tools && autoconf --trace=AC_ARG_ENABLE:'$n([$1],[$2])' --trace=AC_ARG_WITH:'$n([$1],[$2])' --trace=AC_ARG_VAR:'$n($@)' && cd ..; } | sed -f build-aux/ac-help.sed ])
-+esyscmd([{ cd gettext-runtime && autoconf --trace=AC_ARG_ENABLE:'$n([$1],[$2])' --trace=AC_ARG_WITH:'$n([$1],[$2])' --trace=AC_ARG_VAR:'$n($@)' && cd ..; cd libtextstyle && autoconf --trace=AC_ARG_ENABLE:'$n([$1],[$2])' --trace=AC_ARG_WITH:'$n([$1],[$2])' --trace=AC_ARG_VAR:'$n($@)' && cd ..; { cd gettext-tools && autoconf --trace=AC_ARG_ENABLE:'$n([$1],[$2])' --trace=AC_ARG_WITH:'$n([$1],[$2])' --trace=AC_ARG_VAR:'$n($@)' && cd ..; } | grep -v installed.libtextstyle; } | sed -f build-aux/ac-help.sed ])
- 
- AC_CONFIG_FILES([Makefile])
- 
-diff --git a/gettext-tools/configure.ac b/gettext-tools/configure.ac
-index cf1dd73..a6816b8 100644
---- a/gettext-tools/configure.ac
-+++ b/gettext-tools/configure.ac
-@@ -121,6 +121,22 @@ AM_CONDITIONAL([PACKAGE_IS_GETTEXT_TOOLS], [true])
- AM_CONDITIONAL([PRELOADABLE_LIBINTL],
-   [test $USE_INCLUDED_LIBINTL = no && test $GLIBC2 = yes])
- 
-+dnl This option allows to build gettext-tools without (re)building libtextstyle.
-+AC_ARG_WITH([installed-libtextstyle],
-+  [AS_HELP_STRING([--with-installed-libtextstyle],
-+     [Use an already installed libtextstyle.])],
-+  [gt_use_installed_libtextstyle=$withval],
-+  [gt_use_installed_libtextstyle=no])
-+if test "$gt_use_installed_libtextstyle" != no; then
-+  gl_LIBTEXTSTYLE
-+else
-+  test -f ../libtextstyle/Makefile || {
-+    AC_MSG_ERROR([When building the gettext-tools package without building the entire gettext package, you need to pass the --with-installed-libtextstyle option to configure.])
-+  }
-+fi
-+AM_CONDITIONAL([USE_INSTALLED_LIBTEXTSTYLE],
-+  [test "$gt_use_installed_libtextstyle" != no])
-+
- dnl This line internationalizes the bison generated parsers.
- BISON_I18N
- 
-diff --git a/gettext-tools/src/Makefile.am b/gettext-tools/src/Makefile.am
-index b98b7ab..af3dcee 100644
---- a/gettext-tools/src/Makefile.am
-+++ b/gettext-tools/src/Makefile.am
-@@ -250,6 +250,9 @@ cldr_plurals_SOURCES = cldr-plural.y cldr-plural-exp.c cldr-plurals.c
- cldr_plurals_CFLAGS = $(AM_CFLAGS) $(INCXML)
- cldr_plurals_LDADD = libgettextsrc.la $(LDADD)
- 
-+if USE_INSTALLED_LIBTEXTSTYLE
-+LT_LIBTEXTSTYLE = @LTLIBTEXTSTYLE@
-+else
- # How to get the include files of libtextstyle.
- textstyle.h textstyle/stdbool.h textstyle/version.h textstyle/woe32dll.h:
- 	here=`pwd`; \
-@@ -257,6 +260,9 @@ textstyle.h textstyle/stdbool.h textstyle/version.h textstyle/woe32dll.h:
- 	  $(MAKE) install-nobase_includeHEADERS install-nobase_nodist_includeHEADERS includedir="$$here"
- BUILT_SOURCES    += textstyle.h textstyle/stdbool.h textstyle/version.h textstyle/woe32dll.h
- MOSTLYCLEANFILES += textstyle.h textstyle/stdbool.h textstyle/version.h textstyle/woe32dll.h
-+# Where to find the built libtextstyle library.
-+LT_LIBTEXTSTYLE = ../../libtextstyle/lib/libtextstyle.la
-+endif
- 
- # How to build libgettextsrc.la.
- # Need ../gnulib-lib/libgettextlib.la.
-@@ -268,7 +274,7 @@ MOSTLYCLEANFILES += textstyle.h textstyle/stdbool.h textstyle/version.h textstyl
- # use iconv().
- libgettextsrc_la_LDFLAGS = \
-   -release @VERSION@ \
--  ../gnulib-lib/libgettextlib.la $(LTLIBUNISTRING) ../../libtextstyle/lib/libtextstyle.la @LTLIBINTL@ @LTLIBICONV@ -lc -no-undefined
-+  ../gnulib-lib/libgettextlib.la $(LTLIBUNISTRING) $(LT_LIBTEXTSTYLE) @LTLIBINTL@ @LTLIBICONV@ -lc -no-undefined
- 
- # OS/2 does not support a DLL name longer than 8 characters.
- if OS2
--- 
-2.24.1
-
diff --git a/package/gettext-gnu/gettext-gnu.hash b/package/gettext-gnu/gettext-gnu.hash
index 4c17fb3e04..b4ec27642c 100644
--- a/package/gettext-gnu/gettext-gnu.hash
+++ b/package/gettext-gnu/gettext-gnu.hash
@@ -1,7 +1,8 @@
-# From https://lists.gnu.org/archive/html/info-gnu/2019-05/msg00011.html
-sha1  62f4a6a2fd5f80bfd0e66c497a04094fa3e07b90  gettext-0.20.1.tar.xz
+# Please keep in sync with package/gettext-tiny/gettext-tiny.hash
+# From https://lists.gnu.org/archive/html/info-gnu/2023-06/msg00003.html
+sha1  d9666d3b9c47a84c814d32e76fa75f60ec23756f  gettext-0.22.tar.xz
 
 # Locally calculated
-sha256  53f02fbbec9e798b0faaf7c73272f83608e835c6288dd58be6c9bb54624a3800  gettext-0.20.1.tar.xz
+sha256  0e60393a47061567b46875b249b7d2788b092d6457d656145bb0e7e6a3e26d93  gettext-0.22.tar.xz
 sha256  e79e9c8a0c85d735ff98185918ec94ed7d175efc377012787aebcf3b80f0d90b  COPYING
 sha256  3fe5361f24b7c49ba12911c08f5a33f9cb18871d95d9fb881f5b8a4793e04288  gettext-runtime/intl/COPYING.LIB
diff --git a/package/gettext-gnu/gettext-gnu.mk b/package/gettext-gnu/gettext-gnu.mk
index 9a1eabd0df..271d6ac57f 100644
--- a/package/gettext-gnu/gettext-gnu.mk
+++ b/package/gettext-gnu/gettext-gnu.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-# Please keep in sync with package/libtextstyle/libtextstyle.mk
-GETTEXT_GNU_VERSION = 0.20.1
+# Please keep in sync with GETTEXT_TINY_ARCHIVE_VERSION in
+# gettext-tiny/gettext-tiny.mk
+GETTEXT_GNU_VERSION = 0.22
 GETTEXT_GNU_SITE = $(BR2_GNU_MIRROR)/gettext
 GETTEXT_GNU_SOURCE = gettext-$(GETTEXT_GNU_VERSION).tar.xz
 GETTEXT_GNU_INSTALL_STAGING = YES
@@ -13,13 +14,11 @@ GETTEXT_GNU_LICENSE = LGPL-2.1+ (libintl), GPL-3.0+ (the rest)
 GETTEXT_GNU_LICENSE_FILES = COPYING gettext-runtime/intl/COPYING.LIB
 GETTEXT_GNU_CPE_ID_VENDOR = gnu
 GETTEXT_GNU_CPE_ID_PRODUCT = gettext
-# 0002-restore-the-ability-to-buld-gettext-tools-seperately-part1.patch
-GETTEXT_GNU_AUTORECONF = YES
 GETTEXT_GNU_PROVIDES = gettext
 GETTEXT_GNU_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBICONV),libiconv)
 
 # Avoid using the bundled subset of libxml2
-HOST_GETTEXT_GNU_DEPENDENCIES = host-libxml2 host-libtextstyle
+HOST_GETTEXT_GNU_DEPENDENCIES = host-libxml2
 
 GETTEXT_GNU_CONF_OPTS += \
 	--disable-libasprintf \
@@ -41,8 +40,7 @@ HOST_GETTEXT_GNU_CONF_OPTS = \
 	--disable-native-java \
 	--disable-csharp \
 	--disable-relocatable \
-	--without-emacs \
-	--with-installed-libtextstyle
+	--without-emacs
 
 # Force the build of libintl, even if the C library provides a stub
 # gettext implementation
@@ -52,10 +50,13 @@ else
 GETTEXT_GNU_CONF_OPTS += --without-included-gettext
 endif
 
-# For the target version, we only need the runtime, and for the host
-# version, we only need the tools.
+# For the target version, we only need the runtime.
 GETTEXT_GNU_SUBDIR = gettext-runtime
-HOST_GETTEXT_GNU_SUBDIR = gettext-tools
+# For the host variant, we only need the tools, but those need the
+# runtime, so it is much simpler to build the whole package. _SUBDIR
+# for the host is inherited from the target if not set or empty, so
+# we need to explicitly set it to build the whole package.
+HOST_GETTEXT_GNU_SUBDIR = .
 
 # Disable the build of documentation and examples of gettext-tools,
 # and the build of documentation and tests of gettext-runtime.
@@ -89,15 +90,5 @@ define HOST_GETTEXT_GNU_GETTEXTIZE_CONFIRMATION
 endef
 HOST_GETTEXT_GNU_POST_INSTALL_HOOKS += HOST_GETTEXT_GNU_GETTEXTIZE_CONFIRMATION
 
-# autoreconf expects gettextize to install ABOUT-NLS, but it only gets
-# installed by gettext-runtime which we don't build/install for the
-# host, so do it manually
-define HOST_GETTEXT_GNU_ADD_ABOUT_NLS
-	$(INSTALL) -m 0644 $(@D)/$(HOST_GETTEXT_GNU_SUBDIR)/ABOUT-NLS \
-		$(HOST_DIR)/share/gettext/ABOUT-NLS
-endef
-
-HOST_GETTEXT_GNU_POST_INSTALL_HOOKS += HOST_GETTEXT_GNU_ADD_ABOUT_NLS
-
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/gettext-tiny/gettext-tiny.hash b/package/gettext-tiny/gettext-tiny.hash
index 5155b41910..f40e6274c0 100644
--- a/package/gettext-tiny/gettext-tiny.hash
+++ b/package/gettext-tiny/gettext-tiny.hash
@@ -2,5 +2,7 @@
 sha256  29cc165e27e83d2bb3760118c2368eadab550830d962d758e51bd36eb860f383  gettext-tiny-0.3.2.tar.gz
 sha256  4c938aa3d8fa3c184bba5e87a8a2febc89560627c9d0567536879e3eca1a7b4f  LICENSE
 sha256  e79e9c8a0c85d735ff98185918ec94ed7d175efc377012787aebcf3b80f0d90b  extra/COPYING
-# From https://lists.gnu.org/archive/html/info-gnu/2019-05/msg00011.html
-sha1  62f4a6a2fd5f80bfd0e66c497a04094fa3e07b90  gettext-0.20.1.tar.xz
+# From https://lists.gnu.org/archive/html/info-gnu/2023-06/msg00003.html
+sha1  d9666d3b9c47a84c814d32e76fa75f60ec23756f  gettext-0.22.tar.xz
+# Locally Computed:
+sha256  0e60393a47061567b46875b249b7d2788b092d6457d656145bb0e7e6a3e26d93  gettext-0.22.tar.xz
diff --git a/package/gettext-tiny/gettext-tiny.mk b/package/gettext-tiny/gettext-tiny.mk
index e2dc563667..234b974075 100644
--- a/package/gettext-tiny/gettext-tiny.mk
+++ b/package/gettext-tiny/gettext-tiny.mk
@@ -14,7 +14,8 @@ HOST_GETTEXT_TINY_LICENSE_FILES = LICENSE extra/COPYING
 GETTEXT_TINY_PROVIDES = gettext
 
 # needed for gettextize
-GETTEXT_TINY_ARCHIVE_VERSION = 0.20.1
+# Please keep in sync with package/gettext-gnu/gettext-gnu.mk
+GETTEXT_TINY_ARCHIVE_VERSION = 0.22
 
 GETTEXT_TINY_EXTRA_GETTEXT_FILES = \
 	gettext-tools/misc/gettextize.in \

--===============8438116911962493390==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8438116911962493390==--
