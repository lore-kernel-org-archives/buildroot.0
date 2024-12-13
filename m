Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B85B6C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:38:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4333D42473;
	Fri, 28 Feb 2025 16:38:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z0UlpNqQ5LhJ; Fri, 28 Feb 2025 16:38:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BA91D4F48A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA91D4F48A;
	Fri, 28 Feb 2025 16:38:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 10789711
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CC1A242515
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NVvW1XrOBgBc for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:29:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 52F18419B4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 52F18419B4
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 49064844AB; Fri, 28 Feb 2025 16:29:39 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 13 Dec 2024 19:18:57 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: f7530d2bce00301882b7b71995144caafbe04feb
X-Git-Newrev: bb27353014fecb656a1ce71c445c7d3c885d7d84
X-Patchwork-Hint: ignore
Message-Id: <20250228162939.49064844AB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python3: bump to
 version 3.12.8
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=bb27353014fecb656a1ce71c445c7d3c885d7d84
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Brings a number of bugfixes:
https://docs.python.org/release/3.12.8/whatsnew/changelog.html#python-3-12-8

Refresh patches to apply without fuzz.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...1-Make-the-build-of-pyc-files-conditional.patch | 14 ++++++------
 ...gy_getaddrinfo-configure-test-when-cross-.patch |  8 +++----
 .../0003-Add-an-option-to-disable-pydoc.patch      | 14 ++++++------
 .../0004-Add-an-option-to-disable-lib2to3.patch    | 18 ++++++++--------
 .../0005-Add-an-option-to-disable-IDLE.patch       | 14 ++++++------
 ...e.ac-move-PY_STDLIB_MOD_SET_NA-further-up.patch |  8 +++----
 ...-Add-option-to-disable-the-sqlite3-module.patch | 12 +++++------
 ...08-Add-an-option-to-disable-the-tk-module.patch | 18 ++++++++--------
 ...dd-an-option-to-disable-the-curses-module.patch | 12 +++++------
 .../0010-Add-an-option-to-disable-expat.patch      | 25 +++++++++++-----------
 ...c-fixup-CC-print-multiarch-output-for-mus.patch |  6 +++---
 ...ix-cross-compiles-when-host-and-target-us.patch | 18 ++++++++--------
 package/python3/python3.hash                       |  6 +++---
 package/python3/python3.mk                         |  2 +-
 14 files changed, 87 insertions(+), 88 deletions(-)

diff --git a/package/python3/0001-Make-the-build-of-pyc-files-conditional.patch b/package/python3/0001-Make-the-build-of-pyc-files-conditional.patch
index b35b06216c..83e2e22f52 100644
--- a/package/python3/0001-Make-the-build-of-pyc-files-conditional.patch
+++ b/package/python3/0001-Make-the-build-of-pyc-files-conditional.patch
@@ -1,4 +1,4 @@
-From 5d0f69ce7fc05adbd3c71e113c11da0aedbca33a Mon Sep 17 00:00:00 2001
+From 057c836d1d6b61e490d9015fb4d679a54c5e9f2c Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 22 Feb 2017 16:21:31 -0800
 Subject: [PATCH] Make the build of pyc files conditional
@@ -17,10 +17,10 @@ Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
  2 files changed, 8 insertions(+)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 4a957fb004..9c5f3c031a 100644
+index 083f4c750a0..2ff75f51571 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -2329,6 +2329,7 @@ libinstall:	all $(srcdir)/Modules/xxmodule.c
+@@ -2335,6 +2335,7 @@ libinstall:	all $(srcdir)/Modules/xxmodule.c
  		$(DESTDIR)$(LIBDEST); \
  	$(INSTALL_DATA) $(srcdir)/LICENSE $(DESTDIR)$(LIBDEST)/LICENSE.txt
  	@ # Build PYC files for the 3 optimization levels (0, 1, 2)
@@ -28,7 +28,7 @@ index 4a957fb004..9c5f3c031a 100644
  	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
  		$(PYTHON_FOR_BUILD) -Wi $(DESTDIR)$(LIBDEST)/compileall.py \
  		-o 0 -o 1 -o 2 $(COMPILEALL_OPTS) -d $(LIBDEST) -f \
-@@ -2338,6 +2339,7 @@ libinstall:	all $(srcdir)/Modules/xxmodule.c
+@@ -2344,6 +2345,7 @@ libinstall:	all $(srcdir)/Modules/xxmodule.c
  		$(PYTHON_FOR_BUILD) -Wi $(DESTDIR)$(LIBDEST)/compileall.py \
  		-o 0 -o 1 -o 2 $(COMPILEALL_OPTS) -d $(LIBDEST)/site-packages -f \
  		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
@@ -37,10 +37,10 @@ index 4a957fb004..9c5f3c031a 100644
  		$(PYTHON_FOR_BUILD) -m lib2to3.pgen2.driver $(DESTDIR)$(LIBDEST)/lib2to3/Grammar.txt
  	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
 diff --git a/configure.ac b/configure.ac
-index 8a32cb58f4..611c33949a 100644
+index 9270b5f7172..879e6a2d432 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1479,6 +1479,12 @@ fi
+@@ -1482,6 +1482,12 @@ fi
  
  AC_MSG_CHECKING([LDLIBRARY])
  
@@ -54,5 +54,5 @@ index 8a32cb58f4..611c33949a 100644
  # library that we build, but we do not want to link against it (we
  # will find it with a -framework option). For this reason there is an
 -- 
-2.34.1
+2.39.5
 
diff --git a/package/python3/0002-Disable-buggy_getaddrinfo-configure-test-when-cross-.patch b/package/python3/0002-Disable-buggy_getaddrinfo-configure-test-when-cross-.patch
index e774e442dc..81db26fa45 100644
--- a/package/python3/0002-Disable-buggy_getaddrinfo-configure-test-when-cross-.patch
+++ b/package/python3/0002-Disable-buggy_getaddrinfo-configure-test-when-cross-.patch
@@ -1,4 +1,4 @@
-From 3a0d7824f7ddd4dd0336c8419cb4246ba936d711 Mon Sep 17 00:00:00 2001
+From cbdfde1abc7715f7c113e3c2144953d1d25cf8db Mon Sep 17 00:00:00 2001
 From: Vanya Sergeev <vsergeev@gmail.com>
 Date: Wed, 23 Dec 2015 11:30:33 +0100
 Subject: [PATCH] Disable buggy_getaddrinfo configure test when cross-compiling
@@ -10,10 +10,10 @@ Signed-off-by: Vanya Sergeev <vsergeev@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 611c33949a..059ac2f883 100644
+index 879e6a2d432..7bc049863c3 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -5428,7 +5428,7 @@ fi]))
+@@ -5433,7 +5433,7 @@ fi]))
  dnl if ac_cv_func_getaddrinfo
  ])
  
@@ -23,5 +23,5 @@ index 611c33949a..059ac2f883 100644
    AS_VAR_IF([ipv6], [yes], [
      AC_MSG_ERROR([m4_normalize([
 -- 
-2.34.1
+2.39.5
 
diff --git a/package/python3/0003-Add-an-option-to-disable-pydoc.patch b/package/python3/0003-Add-an-option-to-disable-pydoc.patch
index 01ce235afd..2eaf868965 100644
--- a/package/python3/0003-Add-an-option-to-disable-pydoc.patch
+++ b/package/python3/0003-Add-an-option-to-disable-pydoc.patch
@@ -1,4 +1,4 @@
-From f910bdee70b07792c136aaced3850a08eaaafdee Mon Sep 17 00:00:00 2001
+From c1c1a844c1819da38c0e03d1f23a97099b571b86 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 22 Feb 2017 17:07:56 -0800
 Subject: [PATCH] Add an option to disable pydoc
@@ -20,7 +20,7 @@ Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
  2 files changed, 14 insertions(+), 1 deletion(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 9c5f3c031a..2243a658a9 100644
+index 2ff75f51571..401d130b804 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
 @@ -2050,7 +2050,9 @@ bininstall: commoninstall altbininstall
@@ -41,7 +41,7 @@ index 9c5f3c031a..2243a658a9 100644
  		re \
  		site-packages \
  		sqlite3 \
-@@ -2257,6 +2258,10 @@ TESTSUBDIRS=	idlelib/idle_test \
+@@ -2263,6 +2264,10 @@ TESTSUBDIRS=	idlelib/idle_test \
  
  COMPILEALL_OPTS=-j0
  
@@ -52,7 +52,7 @@ index 9c5f3c031a..2243a658a9 100644
  TEST_MODULES=@TEST_MODULES@
  
  .PHONY: libinstall
-@@ -2471,7 +2476,9 @@ libainstall: all scripts
+@@ -2477,7 +2482,9 @@ libainstall: all scripts
  	$(INSTALL_SCRIPT) python-config $(DESTDIR)$(BINDIR)/python$(LDVERSION)-config
  	$(INSTALL_SCRIPT) $(SCRIPT_2TO3) $(DESTDIR)$(BINDIR)/2to3-$(VERSION)
  	$(INSTALL_SCRIPT) $(SCRIPT_IDLE) $(DESTDIR)$(BINDIR)/idle$(VERSION)
@@ -63,10 +63,10 @@ index 9c5f3c031a..2243a658a9 100644
  		"`echo $(MACHDEP) | sed 's/^\(...\).*/\1/'`" = "aix" ]; then \
  		echo; echo "Installing support files for building shared extension modules on AIX:"; \
 diff --git a/configure.ac b/configure.ac
-index 059ac2f883..1a2dd28d1e 100644
+index 7bc049863c3..ca226dcc5b9 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -4511,6 +4511,12 @@ AS_VAR_IF([posix_threads], [stub], [
+@@ -4514,6 +4514,12 @@ AS_VAR_IF([posix_threads], [stub], [
    AC_DEFINE([HAVE_PTHREAD_STUBS], [1], [Define if platform requires stubbed pthreads support])
  ])
  
@@ -80,5 +80,5 @@ index 059ac2f883..1a2dd28d1e 100644
  AH_TEMPLATE([ENABLE_IPV6], [Define if --enable-ipv6 is specified])
  AC_MSG_CHECKING([if --enable-ipv6 is specified])
 -- 
-2.34.1
+2.39.5
 
diff --git a/package/python3/0004-Add-an-option-to-disable-lib2to3.patch b/package/python3/0004-Add-an-option-to-disable-lib2to3.patch
index cc21cbd0b5..7dccf471c4 100644
--- a/package/python3/0004-Add-an-option-to-disable-lib2to3.patch
+++ b/package/python3/0004-Add-an-option-to-disable-lib2to3.patch
@@ -1,4 +1,4 @@
-From 572f3164d1dce13db30e897ab0be7c706fa7b731 Mon Sep 17 00:00:00 2001
+From 2a4b87bb00805156d40782a3197fbbf20937da6f Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 22 Feb 2017 17:15:31 -0800
 Subject: [PATCH] Add an option to disable lib2to3
@@ -22,7 +22,7 @@ Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
  2 files changed, 20 insertions(+), 5 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 2243a658a9..3f314d1354 100644
+index 401d130b804..b44ad736144 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
 @@ -2054,7 +2054,9 @@ ifeq (@PYDOC@,yes)
@@ -43,7 +43,7 @@ index 2243a658a9..3f314d1354 100644
  		logging \
  		multiprocessing multiprocessing/dummy \
  		re \
-@@ -2207,10 +2208,6 @@ TESTSUBDIRS=	idlelib/idle_test \
+@@ -2208,10 +2209,6 @@ TESTSUBDIRS=	idlelib/idle_test \
  		test/test_importlib/resources/zipdata02 \
  		test/test_importlib/source \
  		test/test_json \
@@ -54,7 +54,7 @@ index 2243a658a9..3f314d1354 100644
  		test/test_module \
  		test/test_peg_generator \
  		test/test_pydoc \
-@@ -2262,6 +2259,14 @@ ifeq (@PYDOC@,yes)
+@@ -2268,6 +2265,14 @@ ifeq (@PYDOC@,yes)
  LIBSUBDIRS += pydoc_data
  endif
  
@@ -69,7 +69,7 @@ index 2243a658a9..3f314d1354 100644
  TEST_MODULES=@TEST_MODULES@
  
  .PHONY: libinstall
-@@ -2345,10 +2350,12 @@ ifeq (@PYC_BUILD@,yes)
+@@ -2351,10 +2356,12 @@ ifeq (@PYC_BUILD@,yes)
  		-o 0 -o 1 -o 2 $(COMPILEALL_OPTS) -d $(LIBDEST)/site-packages -f \
  		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
  endif
@@ -82,7 +82,7 @@ index 2243a658a9..3f314d1354 100644
  
  # bpo-21536: Misc/python-config.sh is generated in the build directory
  # from $(srcdir)Misc/python-config.sh.in.
-@@ -2474,7 +2481,9 @@ libainstall: all scripts
+@@ -2480,7 +2487,9 @@ libainstall: all scripts
  	$(INSTALL_SCRIPT) $(srcdir)/install-sh $(DESTDIR)$(LIBPL)/install-sh
  	$(INSTALL_SCRIPT) python-config.py $(DESTDIR)$(LIBPL)/python-config.py
  	$(INSTALL_SCRIPT) python-config $(DESTDIR)$(BINDIR)/python$(LDVERSION)-config
@@ -93,10 +93,10 @@ index 2243a658a9..3f314d1354 100644
  ifeq (@PYDOC@,yes)
  	$(INSTALL_SCRIPT) $(SCRIPT_PYDOC) $(DESTDIR)$(BINDIR)/pydoc$(VERSION)
 diff --git a/configure.ac b/configure.ac
-index 1a2dd28d1e..f0354c580d 100644
+index ca226dcc5b9..9b77582560d 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -7561,6 +7561,12 @@ PY_STDLIB_MOD([xxlimited_35], [test "$with_trace_refs" = "no"], [test "$ac_cv_fu
+@@ -7572,6 +7572,12 @@ PY_STDLIB_MOD([xxlimited_35], [test "$with_trace_refs" = "no"], [test "$ac_cv_fu
  # substitute multiline block, must come after last PY_STDLIB_MOD()
  AC_SUBST([MODULE_BLOCK])
  
@@ -110,5 +110,5 @@ index 1a2dd28d1e..f0354c580d 100644
  AC_CONFIG_FILES(m4_normalize([
    Makefile.pre
 -- 
-2.34.1
+2.39.5
 
diff --git a/package/python3/0005-Add-an-option-to-disable-IDLE.patch b/package/python3/0005-Add-an-option-to-disable-IDLE.patch
index e9218af1c8..5bcf66dea2 100644
--- a/package/python3/0005-Add-an-option-to-disable-IDLE.patch
+++ b/package/python3/0005-Add-an-option-to-disable-IDLE.patch
@@ -1,4 +1,4 @@
-From ffa7fbceb54918eb518474c8f821fda0a58cf181 Mon Sep 17 00:00:00 2001
+From 5b4755f8d6bbeb68f2966464038c3e1f337868d3 Mon Sep 17 00:00:00 2001
 From: Maxime Ripard <maxime.ripard@free-electrons.com>
 Date: Wed, 22 Feb 2017 17:45:14 -0800
 Subject: [PATCH] Add an option to disable IDLE
@@ -19,7 +19,7 @@ Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
  2 files changed, 14 insertions(+), 1 deletion(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 3f314d1354..5fad7f82fb 100644
+index b44ad736144..aceb52e31ce 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
 @@ -2048,7 +2048,9 @@ bininstall: commoninstall altbininstall
@@ -40,7 +40,7 @@ index 3f314d1354..5fad7f82fb 100644
  		importlib importlib/resources importlib/metadata \
  		json \
  		logging \
-@@ -2267,6 +2268,10 @@ TESTSUBDIRS += test/test_lib2to3			\
+@@ -2273,6 +2274,10 @@ TESTSUBDIRS += test/test_lib2to3			\
  		test/test_lib2to3/data/fixers/myfixes
  endif
  
@@ -51,7 +51,7 @@ index 3f314d1354..5fad7f82fb 100644
  TEST_MODULES=@TEST_MODULES@
  
  .PHONY: libinstall
-@@ -2484,7 +2489,9 @@ libainstall: all scripts
+@@ -2490,7 +2495,9 @@ libainstall: all scripts
  ifeq (@LIB2TO3@,yes)
  	$(INSTALL_SCRIPT) $(SCRIPT_2TO3) $(DESTDIR)$(BINDIR)/2to3-$(VERSION)
  endif
@@ -62,10 +62,10 @@ index 3f314d1354..5fad7f82fb 100644
  	$(INSTALL_SCRIPT) $(SCRIPT_PYDOC) $(DESTDIR)$(BINDIR)/pydoc$(VERSION)
  endif
 diff --git a/configure.ac b/configure.ac
-index f0354c580d..43086962e9 100644
+index 9b77582560d..becec336dc2 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -7567,6 +7567,12 @@ AC_ARG_ENABLE(lib2to3,
+@@ -7578,6 +7578,12 @@ AC_ARG_ENABLE(lib2to3,
  	AS_HELP_STRING([--disable-lib2to3], [disable lib2to3]),
  	[ LIB2TO3="${enableval}" ], [ LIB2TO3=yes ])
  
@@ -79,5 +79,5 @@ index f0354c580d..43086962e9 100644
  AC_CONFIG_FILES(m4_normalize([
    Makefile.pre
 -- 
-2.34.1
+2.39.5
 
diff --git a/package/python3/0006-configure.ac-move-PY_STDLIB_MOD_SET_NA-further-up.patch b/package/python3/0006-configure.ac-move-PY_STDLIB_MOD_SET_NA-further-up.patch
index e594e6cd63..baffece4a5 100644
--- a/package/python3/0006-configure.ac-move-PY_STDLIB_MOD_SET_NA-further-up.patch
+++ b/package/python3/0006-configure.ac-move-PY_STDLIB_MOD_SET_NA-further-up.patch
@@ -1,4 +1,4 @@
-From 267516c76208e63b5a3ec7d4dead6c329d8763bb Mon Sep 17 00:00:00 2001
+From 36fbff49ddfe4e91af5683290a68b717aea1b875 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 Date: Tue, 6 Feb 2024 22:46:59 +0100
 Subject: [PATCH] configure.ac: move PY_STDLIB_MOD_SET_NA further up
@@ -12,7 +12,7 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
  1 file changed, 5 insertions(+), 5 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 43086962e9..561e33f550 100644
+index becec336dc2..ab68cc3dd73 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -95,6 +95,11 @@ AC_DEFUN([PY_CHECK_EMSCRIPTEN_PORT], [
@@ -27,7 +27,7 @@ index 43086962e9..561e33f550 100644
  AC_SUBST([BASECPPFLAGS])
  if test "$srcdir" != . -a "$srcdir" != "$(pwd)"; then
      # If we're building out-of-tree, we need to make sure the following
-@@ -7258,11 +7263,6 @@ AC_ARG_ENABLE([test-modules],
+@@ -7261,11 +7266,6 @@ AC_ARG_ENABLE([test-modules],
  AC_MSG_RESULT([$TEST_MODULES])
  AC_SUBST([TEST_MODULES])
  
@@ -40,5 +40,5 @@ index 43086962e9..561e33f550 100644
  dnl Modules that are not available on some platforms
  dnl AIX has shadow passwords, but access is not via getspent()
 -- 
-2.34.1
+2.39.5
 
diff --git a/package/python3/0007-Add-option-to-disable-the-sqlite3-module.patch b/package/python3/0007-Add-option-to-disable-the-sqlite3-module.patch
index f26091ebfb..24138c2761 100644
--- a/package/python3/0007-Add-option-to-disable-the-sqlite3-module.patch
+++ b/package/python3/0007-Add-option-to-disable-the-sqlite3-module.patch
@@ -1,4 +1,4 @@
-From a8566f6ee2a2b859ba5562f2d9f06cb4d271f277 Mon Sep 17 00:00:00 2001
+From a24aee2ba81617baf01215b333c26434355bf91a Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 Date: Tue, 6 Feb 2024 22:12:20 +0100
 Subject: [PATCH] Add option to disable the sqlite3 module
@@ -16,7 +16,7 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
  2 files changed, 11 insertions(+), 1 deletion(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 5fad7f82fb..7b6c9811a6 100644
+index aceb52e31ce..7c5bcea59ba 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
 @@ -2108,7 +2108,6 @@ LIBSUBDIRS=	asyncio \
@@ -27,7 +27,7 @@ index 5fad7f82fb..7b6c9811a6 100644
  		tkinter \
  		tomllib \
  		turtledemo \
-@@ -2272,6 +2271,10 @@ ifeq (@IDLE@,yes)
+@@ -2278,6 +2277,10 @@ ifeq (@IDLE@,yes)
  LIBSUBDIRS += idlelib idlelib/Icons
  endif
  
@@ -39,10 +39,10 @@ index 5fad7f82fb..7b6c9811a6 100644
  
  .PHONY: libinstall
 diff --git a/configure.ac b/configure.ac
-index 561e33f550..d1c54bd67c 100644
+index ab68cc3dd73..3fbcabe29c8 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -4516,6 +4516,13 @@ AS_VAR_IF([posix_threads], [stub], [
+@@ -4519,6 +4519,13 @@ AS_VAR_IF([posix_threads], [stub], [
    AC_DEFINE([HAVE_PTHREAD_STUBS], [1], [Define if platform requires stubbed pthreads support])
  ])
  
@@ -57,5 +57,5 @@ index 561e33f550..d1c54bd67c 100644
  
  AC_ARG_ENABLE(pydoc,
 -- 
-2.34.1
+2.39.5
 
diff --git a/package/python3/0008-Add-an-option-to-disable-the-tk-module.patch b/package/python3/0008-Add-an-option-to-disable-the-tk-module.patch
index 97ee2d717c..6fb80871cb 100644
--- a/package/python3/0008-Add-an-option-to-disable-the-tk-module.patch
+++ b/package/python3/0008-Add-an-option-to-disable-the-tk-module.patch
@@ -1,4 +1,4 @@
-From c1ec9fa46cd7679fd009f66a3ebed8de95d84f10 Mon Sep 17 00:00:00 2001
+From 4d02905278ef62aaf9e984022033c3390d675948 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 22 Feb 2017 17:23:42 -0800
 Subject: [PATCH] Add an option to disable the tk module
@@ -19,7 +19,7 @@ Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
  2 files changed, 12 insertions(+), 3 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 7b6c9811a6..6d9527ddd0 100644
+index 7c5bcea59ba..5de6f63220d 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
 @@ -2108,7 +2108,6 @@ LIBSUBDIRS=	asyncio \
@@ -30,7 +30,7 @@ index 7b6c9811a6..6d9527ddd0 100644
  		tomllib \
  		turtledemo \
  		unittest \
-@@ -2212,7 +2211,6 @@ TESTSUBDIRS=	idlelib/idle_test \
+@@ -2213,7 +2212,6 @@ TESTSUBDIRS=	idlelib/idle_test \
  		test/test_peg_generator \
  		test/test_pydoc \
  		test/test_sqlite3 \
@@ -38,15 +38,15 @@ index 7b6c9811a6..6d9527ddd0 100644
  		test/test_tomllib \
  		test/test_tomllib/data \
  		test/test_tomllib/data/invalid \
-@@ -2232,7 +2230,6 @@ TESTSUBDIRS=	idlelib/idle_test \
- 		test/test_tomllib/data/valid/dates-and-times \
+@@ -2234,7 +2232,6 @@ TESTSUBDIRS=	idlelib/idle_test \
  		test/test_tomllib/data/valid/multiline-basic-str \
  		test/test_tools \
+ 		test/test_tools/i18n_data \
 -		test/test_ttk \
  		test/test_unittest \
  		test/test_unittest/testmock \
  		test/test_warnings \
-@@ -2253,6 +2250,11 @@ TESTSUBDIRS=	idlelib/idle_test \
+@@ -2259,6 +2256,11 @@ TESTSUBDIRS=	idlelib/idle_test \
  		test/test_multiprocessing_forkserver \
  		test/test_multiprocessing_spawn
  
@@ -59,10 +59,10 @@ index 7b6c9811a6..6d9527ddd0 100644
  
  ifeq (@PYDOC@,yes)
 diff --git a/configure.ac b/configure.ac
-index d1c54bd67c..4c5cbe4153 100644
+index 3fbcabe29c8..4331ed4264f 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -4529,6 +4529,13 @@ AC_ARG_ENABLE(pydoc,
+@@ -4532,6 +4532,13 @@ AC_ARG_ENABLE(pydoc,
  	AS_HELP_STRING([--disable-pydoc], [disable pydoc]),
  	[ PYDOC="${enableval}" ], [ PYDOC=yes ])
  
@@ -77,5 +77,5 @@ index d1c54bd67c..4c5cbe4153 100644
  AH_TEMPLATE([ENABLE_IPV6], [Define if --enable-ipv6 is specified])
  AC_MSG_CHECKING([if --enable-ipv6 is specified])
 -- 
-2.34.1
+2.39.5
 
diff --git a/package/python3/0009-Add-an-option-to-disable-the-curses-module.patch b/package/python3/0009-Add-an-option-to-disable-the-curses-module.patch
index 139bf1544b..443005584d 100644
--- a/package/python3/0009-Add-an-option-to-disable-the-curses-module.patch
+++ b/package/python3/0009-Add-an-option-to-disable-the-curses-module.patch
@@ -1,4 +1,4 @@
-From d7ea122e8ae506019761b92987b141fe7ea55f76 Mon Sep 17 00:00:00 2001
+From 32ecd62c7f1444652911d05c2c03152ff7fff6b5 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 22 Feb 2017 17:31:51 -0800
 Subject: [PATCH] Add an option to disable the curses module
@@ -15,7 +15,7 @@ Signed-off-by: Adam Duskett <aduskett@gmail.com>
  2 files changed, 11 insertions(+), 1 deletion(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 6d9527ddd0..283ca1bd60 100644
+index 5de6f63220d..2b0307b1282 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
 @@ -2095,7 +2095,6 @@ LIBSUBDIRS=	asyncio \
@@ -26,7 +26,7 @@ index 6d9527ddd0..283ca1bd60 100644
  		dbm \
  		email email/mime \
  		encodings \
-@@ -2255,6 +2254,10 @@ LIBSUBDIRS += tkinter
+@@ -2261,6 +2260,10 @@ LIBSUBDIRS += tkinter
  TESTSUBDIRS += test/test_tkinter test/test_ttk
  endif
  
@@ -38,10 +38,10 @@ index 6d9527ddd0..283ca1bd60 100644
  
  ifeq (@PYDOC@,yes)
 diff --git a/configure.ac b/configure.ac
-index 4c5cbe4153..92d663ed40 100644
+index 4331ed4264f..94bebbfd48e 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -4523,6 +4523,13 @@ AC_ARG_ENABLE(sqlite3,
+@@ -4526,6 +4526,13 @@ AC_ARG_ENABLE(sqlite3,
  AS_IF([test "$SQLITE3" = "no"],
        [PY_STDLIB_MOD_SET_NA([_sqlite3])])
  
@@ -56,5 +56,5 @@ index 4c5cbe4153..92d663ed40 100644
  
  AC_ARG_ENABLE(pydoc,
 -- 
-2.34.1
+2.39.5
 
diff --git a/package/python3/0010-Add-an-option-to-disable-expat.patch b/package/python3/0010-Add-an-option-to-disable-expat.patch
index 2363aeb01d..803bf5f05a 100644
--- a/package/python3/0010-Add-an-option-to-disable-expat.patch
+++ b/package/python3/0010-Add-an-option-to-disable-expat.patch
@@ -1,4 +1,4 @@
-From d1701f1c89e9d2319ede200052319183fbb4ae18 Mon Sep 17 00:00:00 2001
+From 455e500067431c19770d637ee0769b450208550f Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 22 Feb 2017 17:40:45 -0800
 Subject: [PATCH] Add an option to disable expat
@@ -17,11 +17,11 @@ Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
 Signed-off-by: Adam Duskett <aduskett@gmail.com>
 ---
  Makefile.pre.in |  5 ++++-
- configure.ac    | 24 +++++++++++++-----------
- 2 files changed, 17 insertions(+), 12 deletions(-)
+ configure.ac    | 22 ++++++++++++----------
+ 2 files changed, 16 insertions(+), 11 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 283ca1bd60..13f7512f42 100644
+index 2b0307b1282..fcddbf33e9e 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
 @@ -2113,7 +2113,6 @@ LIBSUBDIRS=	asyncio \
@@ -32,7 +32,7 @@ index 283ca1bd60..13f7512f42 100644
  		xmlrpc \
  		zipfile zipfile/_path \
  		zoneinfo \
-@@ -2280,6 +2279,10 @@ ifeq (@SQLITE3@,yes)
+@@ -2286,6 +2285,10 @@ ifeq (@SQLITE3@,yes)
  LIBSUBDIRS += sqlite3
  endif
  
@@ -44,10 +44,10 @@ index 283ca1bd60..13f7512f42 100644
  
  .PHONY: libinstall
 diff --git a/configure.ac b/configure.ac
-index 92d663ed40..1cb95f41fd 100644
+index 94bebbfd48e..a2436c0733b 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3823,17 +3823,19 @@ LIBS="$withval $LIBS"
+@@ -3826,17 +3826,19 @@ LIBS="$withval $LIBS"
  [AC_MSG_RESULT([no])])
  
  # Check for use of the system expat library
@@ -58,10 +58,6 @@ index 92d663ed40..1cb95f41fd 100644
 -     [--with-system-expat],
 -     [build pyexpat module using an installed expat library, see Doc/library/pyexpat.rst (default is no)]
 -  )], [], [with_system_expat="no"])
--
--AC_MSG_RESULT([$with_system_expat])
--
--AS_VAR_IF([with_system_expat], [yes], [
 +AC_MSG_CHECKING(for --with-expat)
 +AC_ARG_WITH(expat,
 +            AS_HELP_STRING([--with-expat], [select which expat version to use: system, builtin, none]),
@@ -73,11 +69,14 @@ index 92d663ed40..1cb95f41fd 100644
 +      [PY_STDLIB_MOD_SET_NA([pyexpat])
 +       EXPAT=no])
 +AC_SUBST(EXPAT)
-+
+ 
+-AC_MSG_RESULT([$with_system_expat])
+-
+-AS_VAR_IF([with_system_expat], [yes], [
 +AS_VAR_IF([with_expat], [system], [
    LIBEXPAT_CFLAGS=${LIBEXPAT_CFLAGS-""}
    LIBEXPAT_LDFLAGS=${LIBEXPAT_LDFLAGS-"-lexpat"}
    LIBEXPAT_INTERNAL=
 -- 
-2.34.1
+2.39.5
 
diff --git a/package/python3/0011-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch b/package/python3/0011-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch
index a92f78fe57..b3848a69e0 100644
--- a/package/python3/0011-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch
+++ b/package/python3/0011-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch
@@ -1,4 +1,4 @@
-From 3eccbd53df3c51c1c6ece217d19f1d01eb9575a7 Mon Sep 17 00:00:00 2001
+From a52c5db8ffa6715b72ae6813a48491b8cf2ce86e Mon Sep 17 00:00:00 2001
 From: Peter Korsgaard <peter@korsgaard.com>
 Date: Fri, 2 Aug 2019 15:53:16 +0200
 Subject: [PATCH] configure.ac: fixup $CC --print-multiarch output for
@@ -32,7 +32,7 @@ Signed-off-by: Vincent Fazio <vfazio@gmail.com>
  1 file changed, 5 insertions(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 1cb95f41fd..d142af404a 100644
+index a2436c0733b..d779009f0a6 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -1128,7 +1128,11 @@ AC_MSG_CHECKING([for multiarch])
@@ -49,5 +49,5 @@ index 1cb95f41fd..d142af404a 100644
  AC_SUBST([MULTIARCH])
  AC_MSG_RESULT([$MULTIARCH])
 -- 
-2.34.1
+2.39.5
 
diff --git a/package/python3/0012-gh-115382-Fix-cross-compiles-when-host-and-target-us.patch b/package/python3/0012-gh-115382-Fix-cross-compiles-when-host-and-target-us.patch
index 5a7949b2fd..642209faa6 100644
--- a/package/python3/0012-gh-115382-Fix-cross-compiles-when-host-and-target-us.patch
+++ b/package/python3/0012-gh-115382-Fix-cross-compiles-when-host-and-target-us.patch
@@ -1,4 +1,4 @@
-From e7fa6023be567251b409527bd005b93335914501 Mon Sep 17 00:00:00 2001
+From 56149930c412fb35aac124bf91b838a5dd4ae72c Mon Sep 17 00:00:00 2001
 From: Vincent Fazio <5265893+vfazio@users.noreply.github.com>
 Date: Wed, 28 Feb 2024 13:55:04 -0600
 Subject: [PATCH] gh-115382: Fix cross compiles when host and target use same
@@ -48,10 +48,10 @@ Upstream: https://github.com/python/cpython/pull/116294
  6 files changed, 19 insertions(+), 3 deletions(-)
 
 diff --git a/Lib/sysconfig.py b/Lib/sysconfig.py
-index 122d441bd1..260aec3127 100644
+index 517b13acaf6..9b9ba869747 100644
 --- a/Lib/sysconfig.py
 +++ b/Lib/sysconfig.py
-@@ -533,7 +533,20 @@ def _init_posix(vars):
+@@ -531,7 +531,20 @@ def _init_posix(vars):
      """Initialize the module as appropriate for POSIX systems."""
      # _sysconfigdata is generated at build time, see _generate_posix_vars()
      name = _get_sysconfigdata_name()
@@ -74,7 +74,7 @@ index 122d441bd1..260aec3127 100644
      vars.update(build_time_vars)
  
 diff --git a/Lib/test/libregrtest/main.py b/Lib/test/libregrtest/main.py
-index e41646d2d1..f54e570728 100644
+index 04404cbcd52..f97172ad680 100644
 --- a/Lib/test/libregrtest/main.py
 +++ b/Lib/test/libregrtest/main.py
 @@ -576,6 +576,7 @@ def _add_cross_compile_opts(self, regrtest_opts):
@@ -86,7 +86,7 @@ index e41646d2d1..f54e570728 100644
              }
              old_environ = os.environ
 diff --git a/Lib/test/pythoninfo.py b/Lib/test/pythoninfo.py
-index 6efeaad812..d43e52c9e4 100644
+index 6efeaad8126..d43e52c9e4c 100644
 --- a/Lib/test/pythoninfo.py
 +++ b/Lib/test/pythoninfo.py
 @@ -326,6 +326,7 @@ def format_groups(groups):
@@ -98,7 +98,7 @@ index 6efeaad812..d43e52c9e4 100644
  
          # Sanitizer options
 diff --git a/Tools/scripts/run_tests.py b/Tools/scripts/run_tests.py
-index 445a34ae3e..4077a83424 100644
+index 445a34ae3e8..4077a834245 100644
 --- a/Tools/scripts/run_tests.py
 +++ b/Tools/scripts/run_tests.py
 @@ -42,6 +42,7 @@ def main(regrtest_args):
@@ -110,7 +110,7 @@ index 445a34ae3e..4077a83424 100644
          }
          environ = {
 diff --git a/configure b/configure
-index 6dc8a66e48..a69346db8c 100755
+index 241cf8f3d4a..484da8c43ef 100755
 --- a/configure
 +++ b/configure
 @@ -3689,7 +3689,7 @@ fi
@@ -123,7 +123,7 @@ index 6dc8a66e48..a69346db8c 100755
  printf "%s\n" "$with_build_python" >&6; }
  
 diff --git a/configure.ac b/configure.ac
-index 1cb95f41fd..de420dde2c 100644
+index d779009f0a6..a5a52a4e139 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -169,7 +169,7 @@ AC_ARG_WITH([build-python],
@@ -136,5 +136,5 @@ index 1cb95f41fd..de420dde2c 100644
    ], [
      AS_VAR_IF([cross_compiling], [yes],
 -- 
-2.34.1
+2.39.5
 
diff --git a/package/python3/python3.hash b/package/python3/python3.hash
index ad73a85a7f..ea026376fd 100644
--- a/package/python3/python3.hash
+++ b/package/python3/python3.hash
@@ -1,5 +1,5 @@
-# From https://www.python.org/downloads/release/python-3127/
-md5  c6c933c1a0db52597cb45a7910490f93  Python-3.12.7.tar.xz
+# From https://www.python.org/downloads/release/python-3128/
+md5  d46e5bf9f2e596a3ba45fc0b3c053dd2  Python-3.12.8.tar.xz
 # Locally computed
-sha256  24887b92e2afd4a2ac602419ad4b596372f67ac9b077190f459aba390faf5550  Python-3.12.7.tar.xz
+sha256  c909157bb25ec114e5869124cc2a9c4a4d4c1e957ca4ff553f1edc692101154e  Python-3.12.8.tar.xz
 sha256  3b2f81fe21d181c499c59a256c8e1968455d6689d269aa85373bfb6af41da3bf  LICENSE
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index d029d3dbbc..2be6bb7004 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON3_VERSION_MAJOR = 3.12
-PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).7
+PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).8
 PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
 PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
 PYTHON3_LICENSE = Python-2.0, others
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
