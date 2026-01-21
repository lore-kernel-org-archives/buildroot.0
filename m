Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9808BC44508
	for <buildroot@archiver.kernel.org>; Wed, 21 Jan 2026 20:44:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B97F81366;
	Wed, 21 Jan 2026 20:44:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WRquPHw9Prh9; Wed, 21 Jan 2026 20:44:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9DE40812FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769028297;
	bh=fCXafittgyHv1qnu1hsN5wOysaV89BEsy8vWI/i9Dmg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Kl4ia9h0y9ic2pvtX3V4w5NSiaX4PorfwQcio8PBYH/6OEO6IFvVJgMlXTCJv0Bmy
	 0cfLjUAxYg1iQTptF/YqV7x1mz7KEUAVOjXgOclKzAiu8ie1CXyl7iE22Q6w6T1IHf
	 rdSpABzJnJTBRavqLWcJD/3LvfK260wUAMnXmffOLLgQg2Q0MADipzGoOY8U/y2yOt
	 SsUxRgpyviN2T4hKqgiHUkYNwTjiZ/wS2QAB4q6S/W6YT3mdrckac+yGgqhaC5xJO4
	 Hwb/tZE8EHMKizuIt/R1XMRtgtqR3mz8jDspAUU0Ovx/S2Z+Jj7ouGeGNRuiPf1Szc
	 w1SqPtjzlPHFA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9DE40812FF;
	Wed, 21 Jan 2026 20:44:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C2137158
 for <buildroot@buildroot.org>; Wed, 21 Jan 2026 20:44:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8C23C40C6C
 for <buildroot@buildroot.org>; Wed, 21 Jan 2026 20:44:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GrhM52q1CQE0 for <buildroot@buildroot.org>;
 Wed, 21 Jan 2026 20:44:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE35440C6F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DE35440C6F
 for <buildroot@buildroot.org>; Wed, 21 Jan 2026 20:44:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D7A10874AF; Wed, 21 Jan 2026 20:44:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 21 Jan 2026 21:06:01 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5978e0157be195e7712f1cb9b01929968b30f5fc
X-Git-Newrev: a0a6abc8b193e5bdab5326324d7299c19d5d8c67
X-Patchwork-Hint: ignore
Message-Id: <20260121204445.D7A10874AF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python3: bump version to 3.14.2
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a0a6abc8b193e5bdab5326324d7299c19d5d8c67
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://www.python.org/downloads/release/python-3142/
https://docs.python.org/release/3.14.2/whatsnew/changelog.html

Rebased all patches.

Added patch 0010 to fix build error reported by Julien:
https://gitlab.com/jolivain/buildroot/-/jobs/12589702787

Kodi added the same patch:
https://github.com/xbmc/xbmc/blob/master/tools/depends/target/python3/process-vm-ready.patch

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...1-Make-the-build-of-pyc-files-conditional.patch | 14 +++---
 .../0002-Add-an-option-to-disable-pydoc.patch      | 18 +++----
 .../0003-Add-an-option-to-disable-IDLE.patch       | 18 +++----
 ...e.ac-move-PY_STDLIB_MOD_SET_NA-further-up.patch | 12 +++--
 ...-Add-option-to-disable-the-sqlite3-module.patch | 16 ++++---
 ...06-Add-an-option-to-disable-the-tk-module.patch | 28 +++++------
 ...dd-an-option-to-disable-the-curses-module.patch | 16 ++++---
 .../0008-Add-an-option-to-disable-expat.patch      | 14 +++---
 ...gure.ac-detect-unusable-termio-operations.patch |  8 ++--
 ...ix-compilation-of-Modules-_remote_debuggi.patch | 55 ++++++++++++++++++++++
 package/python3/python3.hash                       |  8 ++--
 package/python3/python3.mk                         |  4 +-
 12 files changed, 141 insertions(+), 70 deletions(-)

diff --git a/package/python3/0001-Make-the-build-of-pyc-files-conditional.patch b/package/python3/0001-Make-the-build-of-pyc-files-conditional.patch
index 30ad4146c5..dbc3c60d87 100644
--- a/package/python3/0001-Make-the-build-of-pyc-files-conditional.patch
+++ b/package/python3/0001-Make-the-build-of-pyc-files-conditional.patch
@@ -15,16 +15,18 @@ Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
 Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
 [ Vincent Fazio: ported to Python 3.13.2 ]
 Signed-off-by: Vincent Fazio <vfazio@gmail.com>
+[ Bernd Kuhls: ported to Python 3.14.2]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  Makefile.pre.in | 2 ++
  configure.ac    | 7 +++++++
  2 files changed, 9 insertions(+)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index a7dc9709d62..a1d460b36f4 100644
+index 08ad5f4921d..486a35ed99b 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -2570,6 +2570,7 @@ libinstall:	all $(srcdir)/Modules/xxmodule.c
+@@ -2812,6 +2812,7 @@ libinstall:	all $(srcdir)/Modules/xxmodule.c
  		patch --force --reject-file "$(abs_builddir)/app-store-compliance.rej" --strip 2 --directory "$(DESTDIR)$(LIBDEST)" --input "$(abs_srcdir)/$(APP_STORE_COMPLIANCE_PATCH)" || true ; \
  	fi
  	@ # Build PYC files for the 3 optimization levels (0, 1, 2)
@@ -32,7 +34,7 @@ index a7dc9709d62..a1d460b36f4 100644
  	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
  		$(PYTHON_FOR_BUILD) -Wi $(DESTDIR)$(LIBDEST)/compileall.py \
  		-o 0 -o 1 -o 2 $(COMPILEALL_OPTS) -d $(LIBDEST) -f \
-@@ -2579,6 +2580,7 @@ libinstall:	all $(srcdir)/Modules/xxmodule.c
+@@ -2821,6 +2822,7 @@ libinstall:	all $(srcdir)/Modules/xxmodule.c
  		$(PYTHON_FOR_BUILD) -Wi $(DESTDIR)$(LIBDEST)/compileall.py \
  		-o 0 -o 1 -o 2 $(COMPILEALL_OPTS) -d $(LIBDEST)/site-packages -f \
  		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
@@ -41,10 +43,10 @@ index a7dc9709d62..a1d460b36f4 100644
  # bpo-21536: Misc/python-config.sh is generated in the build directory
  # from $(srcdir)Misc/python-config.sh.in.
 diff --git a/configure.ac b/configure.ac
-index 597a44b331a..edac73ec5d3 100644
+index bd4446e9488..ad0781f9ee6 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1513,6 +1513,13 @@ fi
+@@ -1533,6 +1533,13 @@ fi
  
  AC_MSG_CHECKING([LDLIBRARY])
  
@@ -59,5 +61,5 @@ index 597a44b331a..edac73ec5d3 100644
  # library that we build, but we do not want to link against it (we
  # will find it with a -framework option). For this reason there is an
 -- 
-2.50.1
+2.47.3
 
diff --git a/package/python3/0002-Add-an-option-to-disable-pydoc.patch b/package/python3/0002-Add-an-option-to-disable-pydoc.patch
index 6692561971..294520f815 100644
--- a/package/python3/0002-Add-an-option-to-disable-pydoc.patch
+++ b/package/python3/0002-Add-an-option-to-disable-pydoc.patch
@@ -18,16 +18,18 @@ Signed-off-by: Adam Duskett <aduskett@gmail.com>
 Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
 [ Vincent Fazio: ported to Python 3.13.2 ]
 Signed-off-by: Vincent Fazio <vfazio@gmail.com>
+[ Bernd Kuhls: ported to Python 3.14.2]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  Makefile.pre.in | 9 ++++++++-
  configure.ac    | 6 ++++++
  2 files changed, 14 insertions(+), 1 deletion(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index a1d460b36f4..81f3fd54ee4 100644
+index 486a35ed99b..c3732bedb30 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -2281,7 +2281,9 @@ bininstall: commoninstall altbininstall
+@@ -2513,7 +2513,9 @@ bininstall: commoninstall altbininstall
  	-rm -f $(DESTDIR)$(BINDIR)/idle3
  	(cd $(DESTDIR)$(BINDIR); $(LN) -s idle$(VERSION) idle3)
  	-rm -f $(DESTDIR)$(BINDIR)/pydoc3
@@ -37,7 +39,7 @@ index a1d460b36f4..81f3fd54ee4 100644
  	if test "x$(LIPO_32BIT_FLAGS)" != "x" ; then \
  		rm -f $(DESTDIR)$(BINDIR)/python3-32$(EXE); \
  		(cd $(DESTDIR)$(BINDIR); $(LN) -s python$(VERSION)-32$(EXE) python3-32$(EXE)) \
-@@ -2331,7 +2333,6 @@ LIBSUBDIRS=	asyncio \
+@@ -2564,7 +2566,6 @@ LIBSUBDIRS=	asyncio \
  		logging \
  		multiprocessing multiprocessing/dummy \
  		pathlib \
@@ -45,7 +47,7 @@ index a1d460b36f4..81f3fd54ee4 100644
  		re \
  		site-packages \
  		sqlite3 \
-@@ -2490,6 +2491,10 @@ TESTSUBDIRS=	idlelib/idle_test \
+@@ -2731,6 +2732,10 @@ TESTSUBDIRS=	idlelib/idle_test \
  
  COMPILEALL_OPTS=-j0
  
@@ -56,7 +58,7 @@ index a1d460b36f4..81f3fd54ee4 100644
  TEST_MODULES=@TEST_MODULES@
  
  .PHONY: libinstall
-@@ -2717,7 +2722,9 @@ libainstall: all scripts
+@@ -2959,7 +2964,9 @@ libainstall: all scripts
  	$(INSTALL_SCRIPT) python-config.py $(DESTDIR)$(LIBPL)/python-config.py
  	$(INSTALL_SCRIPT) python-config $(DESTDIR)$(BINDIR)/python$(LDVERSION)-config
  	$(INSTALL_SCRIPT) $(SCRIPT_IDLE) $(DESTDIR)$(BINDIR)/idle$(VERSION)
@@ -67,10 +69,10 @@ index a1d460b36f4..81f3fd54ee4 100644
  		"`echo $(MACHDEP) | sed 's/^\(...\).*/\1/'`" = "aix" ]; then \
  		echo; echo "Installing support files for building shared extension modules on AIX:"; \
 diff --git a/configure.ac b/configure.ac
-index edac73ec5d3..7ed4fa578f3 100644
+index ad0781f9ee6..00d2b54ead5 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -4749,6 +4749,12 @@ AS_VAR_IF([posix_threads], [stub], [
+@@ -4789,6 +4789,12 @@ AS_VAR_IF([posix_threads], [stub], [
    AC_DEFINE([HAVE_PTHREAD_STUBS], [1], [Define if platform requires stubbed pthreads support])
  ])
  
@@ -84,5 +86,5 @@ index edac73ec5d3..7ed4fa578f3 100644
  AH_TEMPLATE([ENABLE_IPV6], [Define if --enable-ipv6 is specified])
  AC_MSG_CHECKING([if --enable-ipv6 is specified])
 -- 
-2.50.1
+2.47.3
 
diff --git a/package/python3/0003-Add-an-option-to-disable-IDLE.patch b/package/python3/0003-Add-an-option-to-disable-IDLE.patch
index afef612d30..3a386b7a29 100644
--- a/package/python3/0003-Add-an-option-to-disable-IDLE.patch
+++ b/package/python3/0003-Add-an-option-to-disable-IDLE.patch
@@ -17,16 +17,18 @@ Signed-off-by: Adam Duskett <aduskett@gmail.com>
 Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
 [ Vincent Fazio: ported to Python 3.13.2 ]
 Signed-off-by: Vincent Fazio <vfazio@gmail.com>
+[ Bernd Kuhls: ported to Python 3.14.2]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  Makefile.pre.in | 9 ++++++++-
  configure.ac    | 6 ++++++
  2 files changed, 14 insertions(+), 1 deletion(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 81f3fd54ee4..2d067730633 100644
+index c3732bedb30..2197bb18434 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -2279,7 +2279,9 @@ bininstall: commoninstall altbininstall
+@@ -2511,7 +2511,9 @@ bininstall: commoninstall altbininstall
  	-rm -f $(DESTDIR)$(LIBPC)/python3-embed.pc
  	(cd $(DESTDIR)$(LIBPC); $(LN) -s python-$(VERSION)-embed.pc python3-embed.pc)
  	-rm -f $(DESTDIR)$(BINDIR)/idle3
@@ -36,7 +38,7 @@ index 81f3fd54ee4..2d067730633 100644
  	-rm -f $(DESTDIR)$(BINDIR)/pydoc3
  ifeq (@PYDOC@,yes)
  	(cd $(DESTDIR)$(BINDIR); $(LN) -s pydoc$(VERSION) pydoc3)
-@@ -2327,7 +2329,6 @@ LIBSUBDIRS=	asyncio \
+@@ -2560,7 +2562,6 @@ LIBSUBDIRS=	asyncio \
  		ensurepip ensurepip/_bundled \
  		html \
  		http \
@@ -44,7 +46,7 @@ index 81f3fd54ee4..2d067730633 100644
  		importlib importlib/resources importlib/metadata \
  		json \
  		logging \
-@@ -2495,6 +2496,10 @@ ifeq (@PYDOC@,yes)
+@@ -2736,6 +2737,10 @@ ifeq (@PYDOC@,yes)
  LIBSUBDIRS += pydoc_data
  endif
  
@@ -55,7 +57,7 @@ index 81f3fd54ee4..2d067730633 100644
  TEST_MODULES=@TEST_MODULES@
  
  .PHONY: libinstall
-@@ -2721,7 +2726,9 @@ libainstall: all scripts
+@@ -2963,7 +2968,9 @@ libainstall: all scripts
  	$(INSTALL_SCRIPT) $(srcdir)/install-sh $(DESTDIR)$(LIBPL)/install-sh
  	$(INSTALL_SCRIPT) python-config.py $(DESTDIR)$(LIBPL)/python-config.py
  	$(INSTALL_SCRIPT) python-config $(DESTDIR)$(BINDIR)/python$(LDVERSION)-config
@@ -66,10 +68,10 @@ index 81f3fd54ee4..2d067730633 100644
  	$(INSTALL_SCRIPT) $(SCRIPT_PYDOC) $(DESTDIR)$(BINDIR)/pydoc$(VERSION)
  endif
 diff --git a/configure.ac b/configure.ac
-index 7ed4fa578f3..d5dac4bf8bc 100644
+index 00d2b54ead5..5395e82384b 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -7927,6 +7927,12 @@ PY_STDLIB_MOD([xxlimited_35], [test "$TEST_MODULES" = yes], [test "$ac_cv_func_d
+@@ -8189,6 +8189,12 @@ PY_STDLIB_MOD([xxlimited_35], [test "$TEST_MODULES" = yes], [test "$ac_cv_func_d
  # substitute multiline block, must come after last PY_STDLIB_MOD()
  AC_SUBST([MODULE_BLOCK])
  
@@ -83,5 +85,5 @@ index 7ed4fa578f3..d5dac4bf8bc 100644
  AC_CONFIG_FILES(m4_normalize([
    Makefile.pre
 -- 
-2.50.1
+2.47.3
 
diff --git a/package/python3/0004-configure.ac-move-PY_STDLIB_MOD_SET_NA-further-up.patch b/package/python3/0004-configure.ac-move-PY_STDLIB_MOD_SET_NA-further-up.patch
index c52ff62831..faf990430c 100644
--- a/package/python3/0004-configure.ac-move-PY_STDLIB_MOD_SET_NA-further-up.patch
+++ b/package/python3/0004-configure.ac-move-PY_STDLIB_MOD_SET_NA-further-up.patch
@@ -11,12 +11,14 @@ Upstream: N/A
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 [ Vincent Fazio: ported to Python 3.13.2 ]
 Signed-off-by: Vincent Fazio <vfazio@gmail.com>
+[ Bernd Kuhls: ported to Python 3.14.2]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  configure.ac | 13 ++++++-------
  1 file changed, 6 insertions(+), 7 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index d5dac4bf8bc..6635aaa134d 100644
+index 5395e82384b..ec9a24c5311 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -95,6 +95,12 @@ AC_DEFUN([PY_CHECK_EMSCRIPTEN_PORT], [
@@ -32,9 +34,9 @@ index d5dac4bf8bc..6635aaa134d 100644
  AC_SUBST([BASECPPFLAGS])
  if test "$srcdir" != . -a "$srcdir" != "$(pwd)"; then
      # If we're building out-of-tree, we need to make sure the following
-@@ -7595,13 +7601,6 @@ AS_VAR_IF([ac_cv_libatomic_needed], [yes],
-            LIBATOMIC=${LIBATOMIC-"-latomic"}])
- _RESTORE_VAR([CPPFLAGS])
+@@ -7701,13 +7707,6 @@ if test -n "$_PYTHREAD_NAME_MAXLEN"; then
+ fi
+ AC_SUBST([_PYTHREAD_NAME_MAXLEN])
  
 -
 -# stdlib
@@ -47,5 +49,5 @@ index d5dac4bf8bc..6635aaa134d 100644
  dnl Modules that are not available on some platforms
  AS_CASE([$ac_sys_system],
 -- 
-2.50.1
+2.47.3
 
diff --git a/package/python3/0005-Add-option-to-disable-the-sqlite3-module.patch b/package/python3/0005-Add-option-to-disable-the-sqlite3-module.patch
index df79837145..77c2f22bc5 100644
--- a/package/python3/0005-Add-option-to-disable-the-sqlite3-module.patch
+++ b/package/python3/0005-Add-option-to-disable-the-sqlite3-module.patch
@@ -14,24 +14,26 @@ Signed-off-by: Adam Duskett <aduskett@gmail.com>
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 [ Vincent Fazio: ported to Python 3.13.2 ]
 Signed-off-by: Vincent Fazio <vfazio@gmail.com>
+[ Bernd Kuhls: ported to Python 3.14.2]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  Makefile.pre.in | 5 ++++-
  configure.ac    | 7 +++++++
  2 files changed, 11 insertions(+), 1 deletion(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 2d067730633..a45a76cce45 100644
+index 2197bb18434..c8f7ab1e6a9 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -2336,7 +2336,6 @@ LIBSUBDIRS=	asyncio \
+@@ -2569,7 +2569,6 @@ LIBSUBDIRS=	asyncio \
  		pathlib \
  		re \
  		site-packages \
 -		sqlite3 \
+ 		string \
  		sysconfig \
  		tkinter \
- 		tomllib \
-@@ -2500,6 +2499,10 @@ ifeq (@IDLE@,yes)
+@@ -2741,6 +2740,10 @@ ifeq (@IDLE@,yes)
  LIBSUBDIRS += idlelib idlelib/Icons
  endif
  
@@ -43,10 +45,10 @@ index 2d067730633..a45a76cce45 100644
  
  .PHONY: libinstall
 diff --git a/configure.ac b/configure.ac
-index 6635aaa134d..8153b738b2f 100644
+index ec9a24c5311..e8e201206bc 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -4755,6 +4755,13 @@ AS_VAR_IF([posix_threads], [stub], [
+@@ -4795,6 +4795,13 @@ AS_VAR_IF([posix_threads], [stub], [
    AC_DEFINE([HAVE_PTHREAD_STUBS], [1], [Define if platform requires stubbed pthreads support])
  ])
  
@@ -61,5 +63,5 @@ index 6635aaa134d..8153b738b2f 100644
  
  AC_ARG_ENABLE(pydoc,
 -- 
-2.50.1
+2.47.3
 
diff --git a/package/python3/0006-Add-an-option-to-disable-the-tk-module.patch b/package/python3/0006-Add-an-option-to-disable-the-tk-module.patch
index e67f06f78c..b928cd9435 100644
--- a/package/python3/0006-Add-an-option-to-disable-the-tk-module.patch
+++ b/package/python3/0006-Add-an-option-to-disable-the-tk-module.patch
@@ -11,8 +11,8 @@ Signed-off-by: Samuel Martin <s.martin49@gmail.com>
 Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
 [ Adam Duskett: ported to Python 3.10.0 ]
 Signed-off-by: Adam Duskett <aduskett@gmail.com>
-[ Bernd Kuhls: ported to Python 3.11.4]
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+[ Bernd Kuhls: ported to Python 3.14.2]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 [ Adam Duskett: ported to Python 3.12.1 ]
 Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
 [ Vincent Fazio: ported to Python 3.13.2 ]
@@ -25,34 +25,34 @@ Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
  2 files changed, 12 insertions(+), 3 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index a45a76cce45..76d67ce7185 100644
+index c8f7ab1e6a9..2c91d0dda71 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -2337,7 +2337,6 @@ LIBSUBDIRS=	asyncio \
- 		re \
+@@ -2571,7 +2571,6 @@ LIBSUBDIRS=	asyncio \
  		site-packages \
+ 		string \
  		sysconfig \
 -		tkinter \
  		tomllib \
  		turtledemo \
  		unittest \
-@@ -2445,7 +2444,6 @@ TESTSUBDIRS=	idlelib/idle_test \
- 		test/test_pydoc \
+@@ -2681,7 +2680,6 @@ TESTSUBDIRS=	idlelib/idle_test \
  		test/test_pyrepl \
+ 		test/test_string \
  		test/test_sqlite3 \
 -		test/test_tkinter \
  		test/test_tomllib \
  		test/test_tomllib/data \
  		test/test_tomllib/data/invalid \
-@@ -2467,7 +2465,6 @@ TESTSUBDIRS=	idlelib/idle_test \
+@@ -2703,7 +2701,6 @@ TESTSUBDIRS=	idlelib/idle_test \
  		test/test_tools \
  		test/test_tools/i18n_data \
  		test/test_tools/msgfmt_data \
 -		test/test_ttk \
  		test/test_unittest \
- 		test/test_unittest/testmock \
- 		test/test_warnings \
-@@ -2489,6 +2486,11 @@ TESTSUBDIRS=	idlelib/idle_test \
+ 		test/test_unittest/namespace_test_pkg \
+ 		test/test_unittest/namespace_test_pkg/bar \
+@@ -2730,6 +2727,11 @@ TESTSUBDIRS=	idlelib/idle_test \
  		test/xmltestdata/c14n-20 \
  		test/zipimport_data
  
@@ -65,10 +65,10 @@ index a45a76cce45..76d67ce7185 100644
  
  ifeq (@PYDOC@,yes)
 diff --git a/configure.ac b/configure.ac
-index 8153b738b2f..0cf06a50c71 100644
+index e8e201206bc..840976ec1bd 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -4768,6 +4768,13 @@ AC_ARG_ENABLE(pydoc,
+@@ -4808,6 +4808,13 @@ AC_ARG_ENABLE(pydoc,
  	AS_HELP_STRING([--disable-pydoc], [disable pydoc]),
  	[ PYDOC="${enableval}" ], [ PYDOC=yes ])
  
@@ -83,5 +83,5 @@ index 8153b738b2f..0cf06a50c71 100644
  AH_TEMPLATE([ENABLE_IPV6], [Define if --enable-ipv6 is specified])
  AC_MSG_CHECKING([if --enable-ipv6 is specified])
 -- 
-2.50.1
+2.47.3
 
diff --git a/package/python3/0007-Add-an-option-to-disable-the-curses-module.patch b/package/python3/0007-Add-an-option-to-disable-the-curses-module.patch
index 05bb126ba7..729cb5d624 100644
--- a/package/python3/0007-Add-an-option-to-disable-the-curses-module.patch
+++ b/package/python3/0007-Add-an-option-to-disable-the-curses-module.patch
@@ -13,24 +13,26 @@ Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
 Signed-off-by: Adam Duskett <aduskett@gmail.com>
 [ Vincent Fazio: ported to Python 3.13.2 ]
 Signed-off-by: Vincent Fazio <vfazio@gmail.com>
+[ Bernd Kuhls: ported to Python 3.14.2]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  Makefile.pre.in | 5 ++++-
  configure.ac    | 7 +++++++
  2 files changed, 11 insertions(+), 1 deletion(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 76d67ce7185..bfb6cb65354 100644
+index 2c91d0dda71..fb11e416731 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -2322,7 +2322,6 @@ LIBSUBDIRS=	asyncio \
- 		concurrent concurrent/futures \
+@@ -2555,7 +2555,6 @@ LIBSUBDIRS=	asyncio \
+ 		concurrent concurrent/futures concurrent/interpreters \
  		csv \
  		ctypes ctypes/macholib \
 -		curses \
  		dbm \
  		email email/mime \
  		encodings \
-@@ -2491,6 +2490,10 @@ LIBSUBDIRS += tkinter
+@@ -2732,6 +2731,10 @@ LIBSUBDIRS += tkinter
  TESTSUBDIRS += test/test_tkinter test/test_ttk
  endif
  
@@ -42,10 +44,10 @@ index 76d67ce7185..bfb6cb65354 100644
  
  ifeq (@PYDOC@,yes)
 diff --git a/configure.ac b/configure.ac
-index 0cf06a50c71..0895dc57808 100644
+index 840976ec1bd..1d7ba91ccc9 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -4762,6 +4762,13 @@ AC_ARG_ENABLE(sqlite3,
+@@ -4802,6 +4802,13 @@ AC_ARG_ENABLE(sqlite3,
  AS_IF([test "$SQLITE3" = "no"],
        [PY_STDLIB_MOD_SET_NA([_sqlite3])])
  
@@ -60,5 +62,5 @@ index 0cf06a50c71..0895dc57808 100644
  
  AC_ARG_ENABLE(pydoc,
 -- 
-2.50.1
+2.47.3
 
diff --git a/package/python3/0008-Add-an-option-to-disable-expat.patch b/package/python3/0008-Add-an-option-to-disable-expat.patch
index 8f3143d61b..4093d6fa76 100644
--- a/package/python3/0008-Add-an-option-to-disable-expat.patch
+++ b/package/python3/0008-Add-an-option-to-disable-expat.patch
@@ -19,16 +19,18 @@ Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
 Signed-off-by: Adam Duskett <aduskett@gmail.com>
 [ Vincent Fazio: ported to Python 3.13.2 ]
 Signed-off-by: Vincent Fazio <vfazio@gmail.com>
+[ Bernd Kuhls: ported to Python 3.14.2]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  Makefile.pre.in |  5 ++++-
  configure.ac    | 24 +++++++++++++-----------
  2 files changed, 17 insertions(+), 12 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index bfb6cb65354..7a662ea4b32 100644
+index fb11e416731..c261b3f9cd7 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -2342,7 +2342,6 @@ LIBSUBDIRS=	asyncio \
+@@ -2576,7 +2576,6 @@ LIBSUBDIRS=	asyncio \
  		urllib \
  		venv venv/scripts venv/scripts/common venv/scripts/posix \
  		wsgiref \
@@ -36,7 +38,7 @@ index bfb6cb65354..7a662ea4b32 100644
  		xmlrpc \
  		zipfile zipfile/_path \
  		zoneinfo \
-@@ -2508,6 +2507,10 @@ ifeq (@SQLITE3@,yes)
+@@ -2749,6 +2748,10 @@ ifeq (@SQLITE3@,yes)
  LIBSUBDIRS += sqlite3
  endif
  
@@ -48,10 +50,10 @@ index bfb6cb65354..7a662ea4b32 100644
  
  .PHONY: libinstall
 diff --git a/configure.ac b/configure.ac
-index 0895dc57808..34e4d5dd244 100644
+index 1d7ba91ccc9..3980548b253 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -4058,17 +4058,19 @@ LIBS="$withval $LIBS"
+@@ -4065,17 +4065,19 @@ LIBS="$withval $LIBS"
  [AC_MSG_RESULT([no])])
  
  # Check for use of the system expat library
@@ -83,5 +85,5 @@ index 0895dc57808..34e4d5dd244 100644
    LIBEXPAT_LDFLAGS=${LIBEXPAT_LDFLAGS-"-lexpat"}
    LIBEXPAT_INTERNAL=
 -- 
-2.50.1
+2.47.3
 
diff --git a/package/python3/0009-configure.ac-detect-unusable-termio-operations.patch b/package/python3/0009-configure.ac-detect-unusable-termio-operations.patch
index 1a11caeb49..78c0fe057c 100644
--- a/package/python3/0009-configure.ac-detect-unusable-termio-operations.patch
+++ b/package/python3/0009-configure.ac-detect-unusable-termio-operations.patch
@@ -15,13 +15,15 @@ done using a new m4 macro PY_CHECK_IOCTL.
 
 Upstream: https://github.com/python/cpython/pull/142380
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+[ Bernd Kuhls: ported to Python 3.14.2]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  Modules/termios.c |  8 ++++----
  configure.ac      | 26 ++++++++++++++++++++++++++
  2 files changed, 30 insertions(+), 4 deletions(-)
 
 diff --git a/Modules/termios.c b/Modules/termios.c
-index f2c5a4bafa7..dbfe922d1e8 100644
+index efb5fcc17fa..3177cb0747a 100644
 --- a/Modules/termios.c
 +++ b/Modules/termios.c
 @@ -1115,7 +1115,7 @@ static struct constant {
@@ -51,7 +53,7 @@ index f2c5a4bafa7..dbfe922d1e8 100644
  #endif
  #ifdef TCSETS
 diff --git a/configure.ac b/configure.ac
-index 34e4d5dd244..646aa24ecf3 100644
+index 3980548b253..48604024fcf 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -101,6 +101,26 @@ AC_DEFUN([PY_STDLIB_MOD_SET_NA], [
@@ -81,7 +83,7 @@ index 34e4d5dd244..646aa24ecf3 100644
  AC_SUBST([BASECPPFLAGS])
  if test "$srcdir" != . -a "$srcdir" != "$(pwd)"; then
      # If we're building out-of-tree, we need to make sure the following
-@@ -7955,6 +7975,12 @@ AC_ARG_ENABLE(idle3,
+@@ -8217,6 +8237,12 @@ AC_ARG_ENABLE(idle3,
  	AS_HELP_STRING([--disable-idle3], [disable idle3 IDE]),
  	[ IDLE="${enableval}" ], [ IDLE=yes ])
  
diff --git a/package/python3/0010-gh-139275-Fix-compilation-of-Modules-_remote_debuggi.patch b/package/python3/0010-gh-139275-Fix-compilation-of-Modules-_remote_debuggi.patch
new file mode 100644
index 0000000000..7a72ebb16c
--- /dev/null
+++ b/package/python3/0010-gh-139275-Fix-compilation-of-Modules-_remote_debuggi.patch
@@ -0,0 +1,55 @@
+From 528429e329047ee572248da0e1212f7cc1ef7d11 Mon Sep 17 00:00:00 2001
+From: Pablo Galindo Salgado <Pablogsal@gmail.com>
+Date: Thu, 25 Sep 2025 00:16:44 +0100
+Subject: [PATCH] gh-139275: Fix compilation of
+ Modules/_remote_debugging_module.c when the system doesn't have
+ process_vm_readv (#139307)
+
+Upstream: https://github.com/python/cpython/commit/1963e701001839389cfb1b11d803b0743f4705d7
+
+[ Bernd Kuhls: ported to Python 3.14.2]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ .../2025-09-24-17-32-52.gh-issue-139275.novrqf.rst              | 2 ++
+ Modules/_remote_debugging_module.c                              | 2 +-
+ Python/remote_debug.h                                           | 2 +-
+ 3 files changed, 4 insertions(+), 2 deletions(-)
+ create mode 100644 Misc/NEWS.d/next/Core_and_Builtins/2025-09-24-17-32-52.gh-issue-139275.novrqf.rst
+
+diff --git a/Misc/NEWS.d/next/Core_and_Builtins/2025-09-24-17-32-52.gh-issue-139275.novrqf.rst b/Misc/NEWS.d/next/Core_and_Builtins/2025-09-24-17-32-52.gh-issue-139275.novrqf.rst
+new file mode 100644
+index 00000000000..8cb4b972ad6
+--- /dev/null
++++ b/Misc/NEWS.d/next/Core_and_Builtins/2025-09-24-17-32-52.gh-issue-139275.novrqf.rst
+@@ -0,0 +1,2 @@
++Fix compilation problems in ``_remote_debugging_module.c`` when the system
++doesn't have ``process_vm_readv``. Patch by Pablo Galindo
+diff --git a/Modules/_remote_debugging_module.c b/Modules/_remote_debugging_module.c
+index b46538b76df..e86a27d5812 100644
+--- a/Modules/_remote_debugging_module.c
++++ b/Modules/_remote_debugging_module.c
+@@ -812,7 +812,7 @@ _Py_RemoteDebug_GetAsyncioDebugAddress(proc_handle_t* handle)
+         PyErr_SetString(PyExc_RuntimeError, "Failed to find the AsyncioDebug section in the process.");
+         _PyErr_ChainExceptions1(exc);
+     }
+-#elif defined(__linux__)
++#elif defined(__linux__) && HAVE_PROCESS_VM_READV
+     // On Linux, search for asyncio debug in executable or DLL
+     address = search_linux_map_for_section(handle, "AsyncioDebug", "_asyncio.cpython");
+     if (address == 0) {
+diff --git a/Python/remote_debug.h b/Python/remote_debug.h
+index 8f9b6cd4c49..b7d17a0f345 100644
+--- a/Python/remote_debug.h
++++ b/Python/remote_debug.h
+@@ -881,7 +881,7 @@ _Py_RemoteDebug_GetPyRuntimeAddress(proc_handle_t* handle)
+             handle->pid);
+         _PyErr_ChainExceptions1(exc);
+     }
+-#elif defined(__linux__)
++#elif defined(__linux__) && HAVE_PROCESS_VM_READV
+     // On Linux, search for 'python' in executable or DLL
+     address = search_linux_map_for_section(handle, "PyRuntime", "python");
+     if (address == 0) {
+-- 
+2.47.3
+
diff --git a/package/python3/python3.hash b/package/python3/python3.hash
index fddfcc1a4d..b71f6e7deb 100644
--- a/package/python3/python3.hash
+++ b/package/python3/python3.hash
@@ -1,5 +1,5 @@
-# From https://www.python.org/downloads/release/python-31311/
-md5  4c3517dd8b1fd76377dcb3e5e8f71ad6  Python-3.13.11.tar.xz
+# From https://www.python.org/downloads/release/python-3142/
+md5  19a31b2838db3b53f9f2db8782bf8773  Python-3.14.2.tar.xz
 # Locally computed
-sha256  16ede7bb7cdbfa895d11b0642fa0e523f291e6487194d53cf6d3b338c3a17ea2  Python-3.13.11.tar.xz
-sha256  78b12c3a81360b357002334f0e70ea0e92eebf7a9b358805c03c48484945f3bb  LICENSE
+sha256  ce543ab854bc256b61b71e9b27f831ffd1bfd60a479d639f8be7f9757cf573e9  Python-3.14.2.tar.xz
+sha256  b0e25a78cffb43f4d92de8b61ccfa1f1f98ecbc22330b54b5251e7b6ba010231  LICENSE
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index d8ee11e8a8..31b5a4500e 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON3_VERSION_MAJOR = 3.13
-PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).11
+PYTHON3_VERSION_MAJOR = 3.14
+PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).2
 PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
 PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
 PYTHON3_LICENSE = Python-2.0, others
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
