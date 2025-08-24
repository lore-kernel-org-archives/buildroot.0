Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CAD0CA0EEB
	for <buildroot@archiver.kernel.org>; Sun, 24 Aug 2025 10:25:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1231E60AB6;
	Sun, 24 Aug 2025 10:25:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bdE58PVSghfP; Sun, 24 Aug 2025 10:25:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3DD7860ABF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3DD7860ABF;
	Sun, 24 Aug 2025 10:25:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 294C019C
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 10:25:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0F95D60ABF
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 10:25:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wy7839QN24-v for <buildroot@buildroot.org>;
 Sun, 24 Aug 2025 10:25:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5086860AB6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5086860AB6
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 10:25:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3F2EB879CF; Sun, 24 Aug 2025 10:25:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 24 Aug 2025 12:24:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 164d6e65c74305ee19343c7db0b83c30057b9c50
X-Git-Newrev: 6b410a5fd88c96a9fef97d9bdaaa7124eb9f7bad
X-Patchwork-Hint: ignore
Message-Id: <20250824102509.3F2EB879CF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python3: bump to 3.13.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=6b410a5fd88c96a9fef97d9bdaaa7124eb9f7bad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is a minor version bump.

Release notes of 3.13.6:

https://www.python.org/downloads/release/python-3136/

"3.13.6 is the sixth maintenance release of 3.13, containing around
200 bugfixes, build improvements and documentation changes since
3.13.5.

Release notes of 3.13.7:

https://www.python.org/downloads/release/python-3137/

"3.13.7 is an expedited release to fix a significant issue with the
3.13.6 release:

gh-137583: Regression in ssl module between 3.13.5 and 3.13.6: reading
from a TLS-encrypted connection blocks"

Patches are just refreshed, except patch
0009-3.13-gh-130577-tarfile-now-validates-archives-to-ens.patch which
is dropped as it is upstream as of commit
cdae923ffe187d6ef916c0f665a31249619193fe. The corresponding
_IGNORE_CVES entry is also removed.

Passes our basic Python 3 tests:

  https://gitlab.com/tpetazzoni/buildroot/-/pipelines/1990154299

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[Julien: remove _IGNORE_CVES for removed patch #0009]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...1-Make-the-build-of-pyc-files-conditional.patch |  12 +-
 .../0002-Add-an-option-to-disable-pydoc.patch      |  18 +-
 .../0003-Add-an-option-to-disable-IDLE.patch       |  18 +-
 ...e.ac-move-PY_STDLIB_MOD_SET_NA-further-up.patch |   8 +-
 ...-Add-option-to-disable-the-sqlite3-module.patch |  14 +-
 ...06-Add-an-option-to-disable-the-tk-module.patch |  18 +-
 ...dd-an-option-to-disable-the-curses-module.patch |  14 +-
 .../0008-Add-an-option-to-disable-expat.patch      |  14 +-
 ...577-tarfile-now-validates-archives-to-ens.patch | 221 ---------------------
 package/python3/python3.hash                       |   6 +-
 package/python3/python3.mk                         |   5 +-
 11 files changed, 62 insertions(+), 286 deletions(-)

diff --git a/package/python3/0001-Make-the-build-of-pyc-files-conditional.patch b/package/python3/0001-Make-the-build-of-pyc-files-conditional.patch
index 9b31c39140..30ad4146c5 100644
--- a/package/python3/0001-Make-the-build-of-pyc-files-conditional.patch
+++ b/package/python3/0001-Make-the-build-of-pyc-files-conditional.patch
@@ -1,4 +1,4 @@
-From 96a5a899445bee3bc1b750cc4aca730cc1733375 Mon Sep 17 00:00:00 2001
+From 52bb6f2a3ef352cda16d95a588a0356da562de8e Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 22 Feb 2017 16:21:31 -0800
 Subject: [PATCH] Make the build of pyc files conditional
@@ -21,10 +21,10 @@ Signed-off-by: Vincent Fazio <vfazio@gmail.com>
  2 files changed, 9 insertions(+)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 46a37ded970..b9a2ab2b02b 100644
+index a7dc9709d62..a1d460b36f4 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -2563,6 +2563,7 @@ libinstall:	all $(srcdir)/Modules/xxmodule.c
+@@ -2570,6 +2570,7 @@ libinstall:	all $(srcdir)/Modules/xxmodule.c
  		patch --force --reject-file "$(abs_builddir)/app-store-compliance.rej" --strip 2 --directory "$(DESTDIR)$(LIBDEST)" --input "$(abs_srcdir)/$(APP_STORE_COMPLIANCE_PATCH)" || true ; \
  	fi
  	@ # Build PYC files for the 3 optimization levels (0, 1, 2)
@@ -32,7 +32,7 @@ index 46a37ded970..b9a2ab2b02b 100644
  	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
  		$(PYTHON_FOR_BUILD) -Wi $(DESTDIR)$(LIBDEST)/compileall.py \
  		-o 0 -o 1 -o 2 $(COMPILEALL_OPTS) -d $(LIBDEST) -f \
-@@ -2572,6 +2573,7 @@ libinstall:	all $(srcdir)/Modules/xxmodule.c
+@@ -2579,6 +2580,7 @@ libinstall:	all $(srcdir)/Modules/xxmodule.c
  		$(PYTHON_FOR_BUILD) -Wi $(DESTDIR)$(LIBDEST)/compileall.py \
  		-o 0 -o 1 -o 2 $(COMPILEALL_OPTS) -d $(LIBDEST)/site-packages -f \
  		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
@@ -41,7 +41,7 @@ index 46a37ded970..b9a2ab2b02b 100644
  # bpo-21536: Misc/python-config.sh is generated in the build directory
  # from $(srcdir)Misc/python-config.sh.in.
 diff --git a/configure.ac b/configure.ac
-index 3fcb18922c5..c60381f9605 100644
+index 597a44b331a..edac73ec5d3 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -1513,6 +1513,13 @@ fi
@@ -59,5 +59,5 @@ index 3fcb18922c5..c60381f9605 100644
  # library that we build, but we do not want to link against it (we
  # will find it with a -framework option). For this reason there is an
 -- 
-2.34.1
+2.50.1
 
diff --git a/package/python3/0002-Add-an-option-to-disable-pydoc.patch b/package/python3/0002-Add-an-option-to-disable-pydoc.patch
index 9ee7d00fb3..6692561971 100644
--- a/package/python3/0002-Add-an-option-to-disable-pydoc.patch
+++ b/package/python3/0002-Add-an-option-to-disable-pydoc.patch
@@ -1,4 +1,4 @@
-From 7db6ccbed6dd0b47011d1dfecb040d447ccf4595 Mon Sep 17 00:00:00 2001
+From 8ba9dc9a12687d37454dd949409599f108f1ce44 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 22 Feb 2017 17:07:56 -0800
 Subject: [PATCH] Add an option to disable pydoc
@@ -24,10 +24,10 @@ Signed-off-by: Vincent Fazio <vfazio@gmail.com>
  2 files changed, 14 insertions(+), 1 deletion(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index b9a2ab2b02b..4360b60165a 100644
+index a1d460b36f4..81f3fd54ee4 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -2275,7 +2275,9 @@ bininstall: commoninstall altbininstall
+@@ -2281,7 +2281,9 @@ bininstall: commoninstall altbininstall
  	-rm -f $(DESTDIR)$(BINDIR)/idle3
  	(cd $(DESTDIR)$(BINDIR); $(LN) -s idle$(VERSION) idle3)
  	-rm -f $(DESTDIR)$(BINDIR)/pydoc3
@@ -37,7 +37,7 @@ index b9a2ab2b02b..4360b60165a 100644
  	if test "x$(LIPO_32BIT_FLAGS)" != "x" ; then \
  		rm -f $(DESTDIR)$(BINDIR)/python3-32$(EXE); \
  		(cd $(DESTDIR)$(BINDIR); $(LN) -s python$(VERSION)-32$(EXE) python3-32$(EXE)) \
-@@ -2325,7 +2327,6 @@ LIBSUBDIRS=	asyncio \
+@@ -2331,7 +2333,6 @@ LIBSUBDIRS=	asyncio \
  		logging \
  		multiprocessing multiprocessing/dummy \
  		pathlib \
@@ -45,7 +45,7 @@ index b9a2ab2b02b..4360b60165a 100644
  		re \
  		site-packages \
  		sqlite3 \
-@@ -2483,6 +2484,10 @@ TESTSUBDIRS=	idlelib/idle_test \
+@@ -2490,6 +2491,10 @@ TESTSUBDIRS=	idlelib/idle_test \
  
  COMPILEALL_OPTS=-j0
  
@@ -56,7 +56,7 @@ index b9a2ab2b02b..4360b60165a 100644
  TEST_MODULES=@TEST_MODULES@
  
  .PHONY: libinstall
-@@ -2710,7 +2715,9 @@ libainstall: all scripts
+@@ -2717,7 +2722,9 @@ libainstall: all scripts
  	$(INSTALL_SCRIPT) python-config.py $(DESTDIR)$(LIBPL)/python-config.py
  	$(INSTALL_SCRIPT) python-config $(DESTDIR)$(BINDIR)/python$(LDVERSION)-config
  	$(INSTALL_SCRIPT) $(SCRIPT_IDLE) $(DESTDIR)$(BINDIR)/idle$(VERSION)
@@ -67,10 +67,10 @@ index b9a2ab2b02b..4360b60165a 100644
  		"`echo $(MACHDEP) | sed 's/^\(...\).*/\1/'`" = "aix" ]; then \
  		echo; echo "Installing support files for building shared extension modules on AIX:"; \
 diff --git a/configure.ac b/configure.ac
-index c60381f9605..583adc7e16a 100644
+index edac73ec5d3..7ed4fa578f3 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -4661,6 +4661,12 @@ AS_VAR_IF([posix_threads], [stub], [
+@@ -4749,6 +4749,12 @@ AS_VAR_IF([posix_threads], [stub], [
    AC_DEFINE([HAVE_PTHREAD_STUBS], [1], [Define if platform requires stubbed pthreads support])
  ])
  
@@ -84,5 +84,5 @@ index c60381f9605..583adc7e16a 100644
  AH_TEMPLATE([ENABLE_IPV6], [Define if --enable-ipv6 is specified])
  AC_MSG_CHECKING([if --enable-ipv6 is specified])
 -- 
-2.34.1
+2.50.1
 
diff --git a/package/python3/0003-Add-an-option-to-disable-IDLE.patch b/package/python3/0003-Add-an-option-to-disable-IDLE.patch
index 45b7d6e522..afef612d30 100644
--- a/package/python3/0003-Add-an-option-to-disable-IDLE.patch
+++ b/package/python3/0003-Add-an-option-to-disable-IDLE.patch
@@ -1,4 +1,4 @@
-From 8da950588cd2597a6588a46374ad917d642c583d Mon Sep 17 00:00:00 2001
+From 463c64020b288b8ddfd32a63c4a23ab7369b9669 Mon Sep 17 00:00:00 2001
 From: Maxime Ripard <maxime.ripard@free-electrons.com>
 Date: Wed, 22 Feb 2017 17:45:14 -0800
 Subject: [PATCH] Add an option to disable IDLE
@@ -23,10 +23,10 @@ Signed-off-by: Vincent Fazio <vfazio@gmail.com>
  2 files changed, 14 insertions(+), 1 deletion(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 4360b60165a..e88f89b91b1 100644
+index 81f3fd54ee4..2d067730633 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -2273,7 +2273,9 @@ bininstall: commoninstall altbininstall
+@@ -2279,7 +2279,9 @@ bininstall: commoninstall altbininstall
  	-rm -f $(DESTDIR)$(LIBPC)/python3-embed.pc
  	(cd $(DESTDIR)$(LIBPC); $(LN) -s python-$(VERSION)-embed.pc python3-embed.pc)
  	-rm -f $(DESTDIR)$(BINDIR)/idle3
@@ -36,7 +36,7 @@ index 4360b60165a..e88f89b91b1 100644
  	-rm -f $(DESTDIR)$(BINDIR)/pydoc3
  ifeq (@PYDOC@,yes)
  	(cd $(DESTDIR)$(BINDIR); $(LN) -s pydoc$(VERSION) pydoc3)
-@@ -2321,7 +2323,6 @@ LIBSUBDIRS=	asyncio \
+@@ -2327,7 +2329,6 @@ LIBSUBDIRS=	asyncio \
  		ensurepip ensurepip/_bundled \
  		html \
  		http \
@@ -44,7 +44,7 @@ index 4360b60165a..e88f89b91b1 100644
  		importlib importlib/resources importlib/metadata \
  		json \
  		logging \
-@@ -2488,6 +2489,10 @@ ifeq (@PYDOC@,yes)
+@@ -2495,6 +2496,10 @@ ifeq (@PYDOC@,yes)
  LIBSUBDIRS += pydoc_data
  endif
  
@@ -55,7 +55,7 @@ index 4360b60165a..e88f89b91b1 100644
  TEST_MODULES=@TEST_MODULES@
  
  .PHONY: libinstall
-@@ -2714,7 +2719,9 @@ libainstall: all scripts
+@@ -2721,7 +2726,9 @@ libainstall: all scripts
  	$(INSTALL_SCRIPT) $(srcdir)/install-sh $(DESTDIR)$(LIBPL)/install-sh
  	$(INSTALL_SCRIPT) python-config.py $(DESTDIR)$(LIBPL)/python-config.py
  	$(INSTALL_SCRIPT) python-config $(DESTDIR)$(BINDIR)/python$(LDVERSION)-config
@@ -66,10 +66,10 @@ index 4360b60165a..e88f89b91b1 100644
  	$(INSTALL_SCRIPT) $(SCRIPT_PYDOC) $(DESTDIR)$(BINDIR)/pydoc$(VERSION)
  endif
 diff --git a/configure.ac b/configure.ac
-index 583adc7e16a..744c5bebd39 100644
+index 7ed4fa578f3..d5dac4bf8bc 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -7810,6 +7810,12 @@ PY_STDLIB_MOD([xxlimited_35], [test "$TEST_MODULES" = yes], [test "$ac_cv_func_d
+@@ -7927,6 +7927,12 @@ PY_STDLIB_MOD([xxlimited_35], [test "$TEST_MODULES" = yes], [test "$ac_cv_func_d
  # substitute multiline block, must come after last PY_STDLIB_MOD()
  AC_SUBST([MODULE_BLOCK])
  
@@ -83,5 +83,5 @@ index 583adc7e16a..744c5bebd39 100644
  AC_CONFIG_FILES(m4_normalize([
    Makefile.pre
 -- 
-2.34.1
+2.50.1
 
diff --git a/package/python3/0004-configure.ac-move-PY_STDLIB_MOD_SET_NA-further-up.patch b/package/python3/0004-configure.ac-move-PY_STDLIB_MOD_SET_NA-further-up.patch
index 4a1f0008cd..c52ff62831 100644
--- a/package/python3/0004-configure.ac-move-PY_STDLIB_MOD_SET_NA-further-up.patch
+++ b/package/python3/0004-configure.ac-move-PY_STDLIB_MOD_SET_NA-further-up.patch
@@ -1,4 +1,4 @@
-From 3de626186e6abeb23f0c3c0f6442058884e4a3f6 Mon Sep 17 00:00:00 2001
+From 930c4763ac46d180880615eceeb68698e9b35e85 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 Date: Tue, 6 Feb 2024 22:46:59 +0100
 Subject: [PATCH] configure.ac: move PY_STDLIB_MOD_SET_NA further up
@@ -16,7 +16,7 @@ Signed-off-by: Vincent Fazio <vfazio@gmail.com>
  1 file changed, 6 insertions(+), 7 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 744c5bebd39..8d56a24ffcb 100644
+index d5dac4bf8bc..6635aaa134d 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -95,6 +95,12 @@ AC_DEFUN([PY_CHECK_EMSCRIPTEN_PORT], [
@@ -32,7 +32,7 @@ index 744c5bebd39..8d56a24ffcb 100644
  AC_SUBST([BASECPPFLAGS])
  if test "$srcdir" != . -a "$srcdir" != "$(pwd)"; then
      # If we're building out-of-tree, we need to make sure the following
-@@ -7478,13 +7484,6 @@ AS_VAR_IF([ac_cv_libatomic_needed], [yes],
+@@ -7595,13 +7601,6 @@ AS_VAR_IF([ac_cv_libatomic_needed], [yes],
             LIBATOMIC=${LIBATOMIC-"-latomic"}])
  _RESTORE_VAR([CPPFLAGS])
  
@@ -47,5 +47,5 @@ index 744c5bebd39..8d56a24ffcb 100644
  dnl Modules that are not available on some platforms
  AS_CASE([$ac_sys_system],
 -- 
-2.34.1
+2.50.1
 
diff --git a/package/python3/0005-Add-option-to-disable-the-sqlite3-module.patch b/package/python3/0005-Add-option-to-disable-the-sqlite3-module.patch
index 57182a4299..df79837145 100644
--- a/package/python3/0005-Add-option-to-disable-the-sqlite3-module.patch
+++ b/package/python3/0005-Add-option-to-disable-the-sqlite3-module.patch
@@ -1,4 +1,4 @@
-From bd588150572c48da6dbb2f65eb21587f0f20dfaf Mon Sep 17 00:00:00 2001
+From 8f6beca556599479705444af7cc7c49b2b964af8 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 Date: Tue, 6 Feb 2024 22:12:20 +0100
 Subject: [PATCH] Add option to disable the sqlite3 module
@@ -20,10 +20,10 @@ Signed-off-by: Vincent Fazio <vfazio@gmail.com>
  2 files changed, 11 insertions(+), 1 deletion(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index e88f89b91b1..88a48eb5333 100644
+index 2d067730633..a45a76cce45 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -2330,7 +2330,6 @@ LIBSUBDIRS=	asyncio \
+@@ -2336,7 +2336,6 @@ LIBSUBDIRS=	asyncio \
  		pathlib \
  		re \
  		site-packages \
@@ -31,7 +31,7 @@ index e88f89b91b1..88a48eb5333 100644
  		sysconfig \
  		tkinter \
  		tomllib \
-@@ -2493,6 +2492,10 @@ ifeq (@IDLE@,yes)
+@@ -2500,6 +2499,10 @@ ifeq (@IDLE@,yes)
  LIBSUBDIRS += idlelib idlelib/Icons
  endif
  
@@ -43,10 +43,10 @@ index e88f89b91b1..88a48eb5333 100644
  
  .PHONY: libinstall
 diff --git a/configure.ac b/configure.ac
-index 8d56a24ffcb..b6d5bb3d9c5 100644
+index 6635aaa134d..8153b738b2f 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -4667,6 +4667,13 @@ AS_VAR_IF([posix_threads], [stub], [
+@@ -4755,6 +4755,13 @@ AS_VAR_IF([posix_threads], [stub], [
    AC_DEFINE([HAVE_PTHREAD_STUBS], [1], [Define if platform requires stubbed pthreads support])
  ])
  
@@ -61,5 +61,5 @@ index 8d56a24ffcb..b6d5bb3d9c5 100644
  
  AC_ARG_ENABLE(pydoc,
 -- 
-2.34.1
+2.50.1
 
diff --git a/package/python3/0006-Add-an-option-to-disable-the-tk-module.patch b/package/python3/0006-Add-an-option-to-disable-the-tk-module.patch
index 054a676b03..e67f06f78c 100644
--- a/package/python3/0006-Add-an-option-to-disable-the-tk-module.patch
+++ b/package/python3/0006-Add-an-option-to-disable-the-tk-module.patch
@@ -1,4 +1,4 @@
-From bd14e6f232232c11b67477a5d8f0caf174a089d0 Mon Sep 17 00:00:00 2001
+From b53a2758ac431bc2493a460e6c886561e2397518 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 22 Feb 2017 17:23:42 -0800
 Subject: [PATCH] Add an option to disable the tk module
@@ -25,10 +25,10 @@ Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
  2 files changed, 12 insertions(+), 3 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 0f394d6ece4..a44307a0fb1 100644
+index a45a76cce45..76d67ce7185 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -2331,7 +2331,6 @@ LIBSUBDIRS=	asyncio \
+@@ -2337,7 +2337,6 @@ LIBSUBDIRS=	asyncio \
  		re \
  		site-packages \
  		sysconfig \
@@ -36,7 +36,7 @@ index 0f394d6ece4..a44307a0fb1 100644
  		tomllib \
  		turtledemo \
  		unittest \
-@@ -2439,7 +2438,6 @@ TESTSUBDIRS=	idlelib/idle_test \
+@@ -2445,7 +2444,6 @@ TESTSUBDIRS=	idlelib/idle_test \
  		test/test_pydoc \
  		test/test_pyrepl \
  		test/test_sqlite3 \
@@ -44,7 +44,7 @@ index 0f394d6ece4..a44307a0fb1 100644
  		test/test_tomllib \
  		test/test_tomllib/data \
  		test/test_tomllib/data/invalid \
-@@ -2461,7 +2459,6 @@ TESTSUBDIRS=	idlelib/idle_test \
+@@ -2467,7 +2465,6 @@ TESTSUBDIRS=	idlelib/idle_test \
  		test/test_tools \
  		test/test_tools/i18n_data \
  		test/test_tools/msgfmt_data \
@@ -52,7 +52,7 @@ index 0f394d6ece4..a44307a0fb1 100644
  		test/test_unittest \
  		test/test_unittest/testmock \
  		test/test_warnings \
-@@ -2483,6 +2480,11 @@ TESTSUBDIRS=	idlelib/idle_test \
+@@ -2489,6 +2486,11 @@ TESTSUBDIRS=	idlelib/idle_test \
  		test/xmltestdata/c14n-20 \
  		test/zipimport_data
  
@@ -65,10 +65,10 @@ index 0f394d6ece4..a44307a0fb1 100644
  
  ifeq (@PYDOC@,yes)
 diff --git a/configure.ac b/configure.ac
-index b6d5bb3d9c5..a1a91e094cd 100644
+index 8153b738b2f..0cf06a50c71 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -4680,6 +4680,13 @@ AC_ARG_ENABLE(pydoc,
+@@ -4768,6 +4768,13 @@ AC_ARG_ENABLE(pydoc,
  	AS_HELP_STRING([--disable-pydoc], [disable pydoc]),
  	[ PYDOC="${enableval}" ], [ PYDOC=yes ])
  
@@ -83,5 +83,5 @@ index b6d5bb3d9c5..a1a91e094cd 100644
  AH_TEMPLATE([ENABLE_IPV6], [Define if --enable-ipv6 is specified])
  AC_MSG_CHECKING([if --enable-ipv6 is specified])
 -- 
-2.34.1
+2.50.1
 
diff --git a/package/python3/0007-Add-an-option-to-disable-the-curses-module.patch b/package/python3/0007-Add-an-option-to-disable-the-curses-module.patch
index a71ee5a53a..05bb126ba7 100644
--- a/package/python3/0007-Add-an-option-to-disable-the-curses-module.patch
+++ b/package/python3/0007-Add-an-option-to-disable-the-curses-module.patch
@@ -1,4 +1,4 @@
-From 7ec209bfb172ba5382c010954057fd32e4f21cf6 Mon Sep 17 00:00:00 2001
+From baef276faa676d1b0faf64a91fa627b5f8fcc5e0 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 22 Feb 2017 17:31:51 -0800
 Subject: [PATCH] Add an option to disable the curses module
@@ -19,10 +19,10 @@ Signed-off-by: Vincent Fazio <vfazio@gmail.com>
  2 files changed, 11 insertions(+), 1 deletion(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 6d6631cbe31..a4531d1f0fc 100644
+index 76d67ce7185..bfb6cb65354 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -2316,7 +2316,6 @@ LIBSUBDIRS=	asyncio \
+@@ -2322,7 +2322,6 @@ LIBSUBDIRS=	asyncio \
  		concurrent concurrent/futures \
  		csv \
  		ctypes ctypes/macholib \
@@ -30,7 +30,7 @@ index 6d6631cbe31..a4531d1f0fc 100644
  		dbm \
  		email email/mime \
  		encodings \
-@@ -2484,6 +2483,10 @@ LIBSUBDIRS += tkinter
+@@ -2491,6 +2490,10 @@ LIBSUBDIRS += tkinter
  TESTSUBDIRS += test/test_tkinter test/test_ttk
  endif
  
@@ -42,10 +42,10 @@ index 6d6631cbe31..a4531d1f0fc 100644
  
  ifeq (@PYDOC@,yes)
 diff --git a/configure.ac b/configure.ac
-index a1a91e094cd..30ad6f1e68d 100644
+index 0cf06a50c71..0895dc57808 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -4674,6 +4674,13 @@ AC_ARG_ENABLE(sqlite3,
+@@ -4762,6 +4762,13 @@ AC_ARG_ENABLE(sqlite3,
  AS_IF([test "$SQLITE3" = "no"],
        [PY_STDLIB_MOD_SET_NA([_sqlite3])])
  
@@ -60,5 +60,5 @@ index a1a91e094cd..30ad6f1e68d 100644
  
  AC_ARG_ENABLE(pydoc,
 -- 
-2.34.1
+2.50.1
 
diff --git a/package/python3/0008-Add-an-option-to-disable-expat.patch b/package/python3/0008-Add-an-option-to-disable-expat.patch
index 5c2fad4d0b..8f3143d61b 100644
--- a/package/python3/0008-Add-an-option-to-disable-expat.patch
+++ b/package/python3/0008-Add-an-option-to-disable-expat.patch
@@ -1,4 +1,4 @@
-From fb7d73d6e3c4cdc9cb272120845103b1aa965240 Mon Sep 17 00:00:00 2001
+From 2a7412e43554830ffbc831454de8df903e765b73 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 22 Feb 2017 17:40:45 -0800
 Subject: [PATCH] Add an option to disable expat
@@ -25,10 +25,10 @@ Signed-off-by: Vincent Fazio <vfazio@gmail.com>
  2 files changed, 17 insertions(+), 12 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index a4531d1f0fc..f6719bd19b3 100644
+index bfb6cb65354..7a662ea4b32 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -2336,7 +2336,6 @@ LIBSUBDIRS=	asyncio \
+@@ -2342,7 +2342,6 @@ LIBSUBDIRS=	asyncio \
  		urllib \
  		venv venv/scripts venv/scripts/common venv/scripts/posix \
  		wsgiref \
@@ -36,7 +36,7 @@ index a4531d1f0fc..f6719bd19b3 100644
  		xmlrpc \
  		zipfile zipfile/_path \
  		zoneinfo \
-@@ -2501,6 +2500,10 @@ ifeq (@SQLITE3@,yes)
+@@ -2508,6 +2507,10 @@ ifeq (@SQLITE3@,yes)
  LIBSUBDIRS += sqlite3
  endif
  
@@ -48,10 +48,10 @@ index a4531d1f0fc..f6719bd19b3 100644
  
  .PHONY: libinstall
 diff --git a/configure.ac b/configure.ac
-index 30ad6f1e68d..370eb94730f 100644
+index 0895dc57808..34e4d5dd244 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3970,17 +3970,19 @@ LIBS="$withval $LIBS"
+@@ -4058,17 +4058,19 @@ LIBS="$withval $LIBS"
  [AC_MSG_RESULT([no])])
  
  # Check for use of the system expat library
@@ -83,5 +83,5 @@ index 30ad6f1e68d..370eb94730f 100644
    LIBEXPAT_LDFLAGS=${LIBEXPAT_LDFLAGS-"-lexpat"}
    LIBEXPAT_INTERNAL=
 -- 
-2.34.1
+2.50.1
 
diff --git a/package/python3/0009-3.13-gh-130577-tarfile-now-validates-archives-to-ens.patch b/package/python3/0009-3.13-gh-130577-tarfile-now-validates-archives-to-ens.patch
deleted file mode 100644
index 1848ec2745..0000000000
--- a/package/python3/0009-3.13-gh-130577-tarfile-now-validates-archives-to-ens.patch
+++ /dev/null
@@ -1,221 +0,0 @@
-From cdae923ffe187d6ef916c0f665a31249619193fe Mon Sep 17 00:00:00 2001
-From: "Miss Islington (bot)"
- <31488909+miss-islington@users.noreply.github.com>
-Date: Mon, 28 Jul 2025 17:59:33 +0200
-Subject: [PATCH] [3.13] gh-130577: tarfile now validates archives to ensure
- member offsets are non-negative (GH-137027) (#137170)
-
-gh-130577: tarfile now validates archives to ensure member offsets are non-negative (GH-137027)
-(cherry picked from commit 7040aa54f14676938970e10c5f74ea93cd56aa38)
-
-Upstream: https://github.com/python/cpython/commit/cdae923ffe187d6ef916c0f665a31249619193fe
-Co-authored-by: Alexander Urieles <aeurielesn@users.noreply.github.com>
-Co-authored-by: Gregory P. Smith <greg@krypto.org>
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- Lib/tarfile.py                                |   3 +
- Lib/test/test_tarfile.py                      | 156 ++++++++++++++++++
- ...-07-23-00-35-29.gh-issue-130577.c7EITy.rst |   3 +
- 3 files changed, 162 insertions(+)
- create mode 100644 Misc/NEWS.d/next/Library/2025-07-23-00-35-29.gh-issue-130577.c7EITy.rst
-
-diff --git a/Lib/tarfile.py b/Lib/tarfile.py
-index 0980f6a8175..9ff9df696de 100755
---- a/Lib/tarfile.py
-+++ b/Lib/tarfile.py
-@@ -1636,6 +1636,9 @@ def _block(self, count):
-         """Round up a byte count by BLOCKSIZE and return it,
-            e.g. _block(834) => 1024.
-         """
-+        # Only non-negative offsets are allowed
-+        if count < 0:
-+            raise InvalidHeaderError("invalid offset")
-         blocks, remainder = divmod(count, BLOCKSIZE)
-         if remainder:
-             blocks += 1
-diff --git a/Lib/test/test_tarfile.py b/Lib/test/test_tarfile.py
-index ac31be0f050..7024be46de5 100644
---- a/Lib/test/test_tarfile.py
-+++ b/Lib/test/test_tarfile.py
-@@ -50,6 +50,7 @@ def sha256sum(data):
- xzname = os.path.join(TEMPDIR, "testtar.tar.xz")
- tmpname = os.path.join(TEMPDIR, "tmp.tar")
- dotlessname = os.path.join(TEMPDIR, "testtar")
-+SPACE = b" "
- 
- sha256_regtype = (
-     "e09e4bc8b3c9d9177e77256353b36c159f5f040531bbd4b024a8f9b9196c71ce"
-@@ -4578,6 +4579,161 @@ def extractall(self, ar):
-         ar.extractall(self.testdir, filter='fully_trusted')
- 
- 
-+class OffsetValidationTests(unittest.TestCase):
-+    tarname = tmpname
-+    invalid_posix_header = (
-+        # name: 100 bytes
-+        tarfile.NUL * tarfile.LENGTH_NAME
-+        # mode, space, null terminator: 8 bytes
-+        + b"000755" + SPACE + tarfile.NUL
-+        # uid, space, null terminator: 8 bytes
-+        + b"000001" + SPACE + tarfile.NUL
-+        # gid, space, null terminator: 8 bytes
-+        + b"000001" + SPACE + tarfile.NUL
-+        # size, space: 12 bytes
-+        + b"\xff" * 11 + SPACE
-+        # mtime, space: 12 bytes
-+        + tarfile.NUL * 11 + SPACE
-+        # chksum: 8 bytes
-+        + b"0011407" + tarfile.NUL
-+        # type: 1 byte
-+        + tarfile.REGTYPE
-+        # linkname: 100 bytes
-+        + tarfile.NUL * tarfile.LENGTH_LINK
-+        # magic: 6 bytes, version: 2 bytes
-+        + tarfile.POSIX_MAGIC
-+        # uname: 32 bytes
-+        + tarfile.NUL * 32
-+        # gname: 32 bytes
-+        + tarfile.NUL * 32
-+        # devmajor, space, null terminator: 8 bytes
-+        + tarfile.NUL * 6 + SPACE + tarfile.NUL
-+        # devminor, space, null terminator: 8 bytes
-+        + tarfile.NUL * 6 + SPACE + tarfile.NUL
-+        # prefix: 155 bytes
-+        + tarfile.NUL * tarfile.LENGTH_PREFIX
-+        # padding: 12 bytes
-+        + tarfile.NUL * 12
-+    )
-+    invalid_gnu_header = (
-+        # name: 100 bytes
-+        tarfile.NUL * tarfile.LENGTH_NAME
-+        # mode, null terminator: 8 bytes
-+        + b"0000755" + tarfile.NUL
-+        # uid, null terminator: 8 bytes
-+        + b"0000001" + tarfile.NUL
-+        # gid, space, null terminator: 8 bytes
-+        + b"0000001" + tarfile.NUL
-+        # size, space: 12 bytes
-+        + b"\xff" * 11 + SPACE
-+        # mtime, space: 12 bytes
-+        + tarfile.NUL * 11 + SPACE
-+        # chksum: 8 bytes
-+        + b"0011327" + tarfile.NUL
-+        # type: 1 byte
-+        + tarfile.REGTYPE
-+        # linkname: 100 bytes
-+        + tarfile.NUL * tarfile.LENGTH_LINK
-+        # magic: 8 bytes
-+        + tarfile.GNU_MAGIC
-+        # uname: 32 bytes
-+        + tarfile.NUL * 32
-+        # gname: 32 bytes
-+        + tarfile.NUL * 32
-+        # devmajor, null terminator: 8 bytes
-+        + tarfile.NUL * 8
-+        # devminor, null terminator: 8 bytes
-+        + tarfile.NUL * 8
-+        # padding: 167 bytes
-+        + tarfile.NUL * 167
-+    )
-+    invalid_v7_header = (
-+        # name: 100 bytes
-+        tarfile.NUL * tarfile.LENGTH_NAME
-+        # mode, space, null terminator: 8 bytes
-+        + b"000755" + SPACE + tarfile.NUL
-+        # uid, space, null terminator: 8 bytes
-+        + b"000001" + SPACE + tarfile.NUL
-+        # gid, space, null terminator: 8 bytes
-+        + b"000001" + SPACE + tarfile.NUL
-+        # size, space: 12 bytes
-+        + b"\xff" * 11 + SPACE
-+        # mtime, space: 12 bytes
-+        + tarfile.NUL * 11 + SPACE
-+        # chksum: 8 bytes
-+        + b"0010070" + tarfile.NUL
-+        # type: 1 byte
-+        + tarfile.REGTYPE
-+        # linkname: 100 bytes
-+        + tarfile.NUL * tarfile.LENGTH_LINK
-+        # padding: 255 bytes
-+        + tarfile.NUL * 255
-+    )
-+    valid_gnu_header = tarfile.TarInfo("filename").tobuf(tarfile.GNU_FORMAT)
-+    data_block = b"\xff" * tarfile.BLOCKSIZE
-+
-+    def _write_buffer(self, buffer):
-+        with open(self.tarname, "wb") as f:
-+            f.write(buffer)
-+
-+    def _get_members(self, ignore_zeros=None):
-+        with open(self.tarname, "rb") as f:
-+            with tarfile.open(
-+                mode="r", fileobj=f, ignore_zeros=ignore_zeros
-+            ) as tar:
-+                return tar.getmembers()
-+
-+    def _assert_raises_read_error_exception(self):
-+        with self.assertRaisesRegex(
-+            tarfile.ReadError, "file could not be opened successfully"
-+        ):
-+            self._get_members()
-+
-+    def test_invalid_offset_header_validations(self):
-+        for tar_format, invalid_header in (
-+            ("posix", self.invalid_posix_header),
-+            ("gnu", self.invalid_gnu_header),
-+            ("v7", self.invalid_v7_header),
-+        ):
-+            with self.subTest(format=tar_format):
-+                self._write_buffer(invalid_header)
-+                self._assert_raises_read_error_exception()
-+
-+    def test_early_stop_at_invalid_offset_header(self):
-+        buffer = self.valid_gnu_header + self.invalid_gnu_header + self.valid_gnu_header
-+        self._write_buffer(buffer)
-+        members = self._get_members()
-+        self.assertEqual(len(members), 1)
-+        self.assertEqual(members[0].name, "filename")
-+        self.assertEqual(members[0].offset, 0)
-+
-+    def test_ignore_invalid_archive(self):
-+        # 3 invalid headers with their respective data
-+        buffer = (self.invalid_gnu_header + self.data_block) * 3
-+        self._write_buffer(buffer)
-+        members = self._get_members(ignore_zeros=True)
-+        self.assertEqual(len(members), 0)
-+
-+    def test_ignore_invalid_offset_headers(self):
-+        for first_block, second_block, expected_offset in (
-+            (
-+                (self.valid_gnu_header),
-+                (self.invalid_gnu_header + self.data_block),
-+                0,
-+            ),
-+            (
-+                (self.invalid_gnu_header + self.data_block),
-+                (self.valid_gnu_header),
-+                1024,
-+            ),
-+        ):
-+            self._write_buffer(first_block + second_block)
-+            members = self._get_members(ignore_zeros=True)
-+            self.assertEqual(len(members), 1)
-+            self.assertEqual(members[0].name, "filename")
-+            self.assertEqual(members[0].offset, expected_offset)
-+
-+
- def setUpModule():
-     os_helper.unlink(TEMPDIR)
-     os.makedirs(TEMPDIR)
-diff --git a/Misc/NEWS.d/next/Library/2025-07-23-00-35-29.gh-issue-130577.c7EITy.rst b/Misc/NEWS.d/next/Library/2025-07-23-00-35-29.gh-issue-130577.c7EITy.rst
-new file mode 100644
-index 00000000000..342cabbc865
---- /dev/null
-+++ b/Misc/NEWS.d/next/Library/2025-07-23-00-35-29.gh-issue-130577.c7EITy.rst
-@@ -0,0 +1,3 @@
-+:mod:`tarfile` now validates archives to ensure member offsets are
-+non-negative.  (Contributed by Alexander Enrique Urieles Nieto in
-+:gh:`130577`.)
--- 
-2.39.5
-
diff --git a/package/python3/python3.hash b/package/python3/python3.hash
index 2ca8ad4930..8d9e67685f 100644
--- a/package/python3/python3.hash
+++ b/package/python3/python3.hash
@@ -1,5 +1,5 @@
-# From https://www.python.org/downloads/release/python-3135/
-md5  dbaa8833aa736eddbb18a6a6ae0c10fa  Python-3.13.5.tar.xz
+# From https://www.python.org/downloads/release/python-3137/
+md5  256cdb3bbf45cdce7499e52ba6c36ea3  Python-3.13.7.tar.xz
 # Locally computed
-sha256  93e583f243454e6e9e4588ca2c2662206ad961659863277afcdb96801647d640  Python-3.13.5.tar.xz
+sha256  5462f9099dfd30e238def83c71d91897d8caa5ff6ebc7a50f14d4802cdaaa79a  Python-3.13.7.tar.xz
 sha256  78b12c3a81360b357002334f0e70ea0e92eebf7a9b358805c03c48484945f3bb  LICENSE
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 337e1401de..012a46edcb 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON3_VERSION_MAJOR = 3.13
-PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).5
+PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).7
 PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
 PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
 PYTHON3_LICENSE = Python-2.0, others
@@ -13,9 +13,6 @@ PYTHON3_LICENSE_FILES = LICENSE
 PYTHON3_CPE_ID_VENDOR = python
 PYTHON3_CPE_ID_PRODUCT = python
 
-# 0009-3.13-gh-130577-tarfile-now-validates-archives-to-ens.patch
-PYTHON3_IGNORE_CVES += CVE-2025-8194
-
 # This host Python is installed in $(HOST_DIR), as it is needed when
 # cross-compiling third-party Python modules.
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
