Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6703C02198
	for <buildroot@archiver.kernel.org>; Fri, 14 Feb 2025 18:55:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A3E382F2D;
	Fri, 14 Feb 2025 18:55:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cDWDQm92DBu7; Fri, 14 Feb 2025 18:55:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6CC6C81EC7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6CC6C81EC7;
	Fri, 14 Feb 2025 18:55:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 86BAB1E7
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 18:55:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 67780404ED
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 18:55:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 81m-HfWR0Cp8 for <buildroot@buildroot.org>;
 Fri, 14 Feb 2025 18:55:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=162.248.234.2;
 helo=mail.xes-mad.com; envelope-from=vfazio@xes-inc.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6CDF84026F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6CDF84026F
Received: from mail.xes-mad.com (mail.xes-mad.com [162.248.234.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6CDF84026F
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 18:55:02 +0000 (UTC)
Received: from vfazio4.xes-mad.com (vfazio4.xes-mad.com [10.52.19.201])
 by mail.xes-mad.com (Postfix) with ESMTP id E2B22206CE;
 Fri, 14 Feb 2025 12:55:00 -0600 (CST)
From: Vincent Fazio <vfazio@xes-inc.com>
To: buildroot@buildroot.org
Date: Fri, 14 Feb 2025 12:54:52 -0600
Message-Id: <20250214185452.3820300-1-vfazio@xes-inc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=xes-inc.com; s=mail; 
 t=1739559300; bh=/OYXh6HqWR5VcumwfuOspd6K78iFpEQxJy6Sy++AWHo=;
 h=From:To:Cc:Subject:Date:From;
 b=AjC3UG3F6gqEJML620sijHM/sybR/nSZ2cIq3JdsqdzTh2/glRFjI7mpewImBcJYm
 o3G1KYFPqT4R5/j+BNHmeYAp33VYA+ZUgbRsGctfYWX6Ep+9aKPgN5DmfjEAUrmcrf
 lGU/ZhtXKry4R4AoXjS3m45h2slSCPo65AqeYiz4=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=xes-inc.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com
 header.a=rsa-sha256 header.s=mail header.b=AjC3UG3F
Subject: [Buildroot] [PATCH] package/python3: bump to 3.13.2
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
Cc: Vincent Fazio <vfazio@xes-inc.com>,
 James Hilliard <james.hilliard1@gmail.com>, Vincent Fazio <vfazio@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update CPython to 3.13.2.

The following patches have been removed:
  - Quirking ac_cv_buggy_getaddrinfo on cross compile
  * This is resolved by always assuming it's not bugged via
    ac_cv_buggy_getaddrinfo=no

  - Disabling lib2to3 in builds
  * CPython 3.13 no longer ships lib2to3

  - Fix cross compiles when host and target are on the same SOABI
  * This was fixed upstream [0]

  - Fixing the MULTIARCH value for musl/uClibc
  * CPython 3.13 moved to new platform triplet detection logic [1] which
    supports musl. uClibc does not generate a platform triplet so will
    not fail the check against MULTIARCH. See also [2].

There is one known issue [3] that may affect 32bit platforms that was
discovered while testing on musl libc.

[0]: https://github.com/python/cpython/commit/909d5ac2959ea88e1d3b38f35676a1c7e5dd44f6
[1]: https://github.com/python/cpython/commit/c163d7f0b67a568e9b64eeb9c1cbbaa127818596
[2]: https://github.com/python/cpython/issues/118942
[3]: https://github.com/python/cpython/issues/130115

Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
---
I have run Buildroot's suite of python tests on glibc and musl. Both
glibc and musl passed with the exception of scipy/numpy tests.

The uClibc tests are running as of this submission.

While CPython has no advertised uClibc support, tests are passing so
long as libc is built with TIME64 support, which is enabled by default
in 1.0.49 when the toolchain's kernel headers are >= 5.1 [4].

Note that the test suite is run on 32-bit ARM. Other platforms have
not been explicitly validated.

[4]: https://gitlab.com/buildroot.org/buildroot/-/commit/6a630519312f39faceb0039e7cf3ef2635a00101
---
 .checkpackageignore                           |  11 --
 ...e-the-build-of-pyc-files-conditional.patch |  35 +++--
 ...0002-Add-an-option-to-disable-pydoc.patch} |  30 ++--
 ...taddrinfo-configure-test-when-cross-.patch |  27 ----
 ... 0003-Add-an-option-to-disable-IDLE.patch} |  34 +++--
 ...004-Add-an-option-to-disable-lib2to3.patch | 114 --------------
 ...ove-PY_STDLIB_MOD_SET_NA-further-up.patch} |  27 ++--
 ...ption-to-disable-the-sqlite3-module.patch} |  22 +--
 ...-an-option-to-disable-the-tk-module.patch} |  30 ++--
 ...option-to-disable-the-curses-module.patch} |  18 ++-
 ...0008-Add-an-option-to-disable-expat.patch} |  31 ++--
 ...up-CC-print-multiarch-output-for-mus.patch |  53 -------
 ...oss-compiles-when-host-and-target-us.patch | 140 ------------------
 package/python3/python3.hash                  |   4 +-
 package/python3/python3.mk                    |   5 +-
 15 files changed, 137 insertions(+), 444 deletions(-)
 rename package/python3/{0003-Add-an-option-to-disable-pydoc.patch => 0002-Add-an-option-to-disable-pydoc.patch} (75%)
 delete mode 100644 package/python3/0002-Disable-buggy_getaddrinfo-configure-test-when-cross-.patch
 rename package/python3/{0005-Add-an-option-to-disable-IDLE.patch => 0003-Add-an-option-to-disable-IDLE.patch} (68%)
 delete mode 100644 package/python3/0004-Add-an-option-to-disable-lib2to3.patch
 rename package/python3/{0006-configure.ac-move-PY_STDLIB_MOD_SET_NA-further-up.patch => 0004-configure.ac-move-PY_STDLIB_MOD_SET_NA-further-up.patch} (62%)
 rename package/python3/{0007-Add-option-to-disable-the-sqlite3-module.patch => 0005-Add-option-to-disable-the-sqlite3-module.patch} (76%)
 rename package/python3/{0008-Add-an-option-to-disable-the-tk-module.patch => 0006-Add-an-option-to-disable-the-tk-module.patch} (76%)
 rename package/python3/{0009-Add-an-option-to-disable-the-curses-module.patch => 0007-Add-an-option-to-disable-the-curses-module.patch} (78%)
 rename package/python3/{0010-Add-an-option-to-disable-expat.patch => 0008-Add-an-option-to-disable-expat.patch} (82%)
 delete mode 100644 package/python3/0011-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch
 delete mode 100644 package/python3/0012-gh-115382-Fix-cross-compiles-when-host-and-target-us.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index ed29682bb7..5b308c3cba 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1015,17 +1015,6 @@ package/python-scipy/0001-build-sh4-FE.patch lib_patch.Upstream
 package/python-setuptools/0001-add-executable.patch lib_patch.Upstream
 package/python-sip/0001-remove-join-from-sip-h-files-string.patch lib_patch.Upstream
 package/python-web2py/S51web2py Shellcheck lib_sysv.Variables
-package/python3/0001-Make-the-build-of-pyc-files-conditional.patch lib_patch.Upstream
-package/python3/0002-Disable-buggy_getaddrinfo-configure-test-when-cross-.patch lib_patch.Upstream
-package/python3/0003-Add-an-option-to-disable-pydoc.patch lib_patch.Upstream
-package/python3/0004-Add-an-option-to-disable-lib2to3.patch lib_patch.Upstream
-package/python3/0005-Add-an-option-to-disable-IDLE.patch lib_patch.Upstream
-package/python3/0006-configure.ac-move-PY_STDLIB_MOD_SET_NA-further-up.patch lib_patch.Upstream
-package/python3/0007-Add-option-to-disable-the-sqlite3-module.patch lib_patch.Upstream
-package/python3/0008-Add-an-option-to-disable-the-tk-module.patch lib_patch.Upstream
-package/python3/0009-Add-an-option-to-disable-the-curses-module.patch lib_patch.Upstream
-package/python3/0010-Add-an-option-to-disable-expat.patch lib_patch.Upstream
-package/python3/0011-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch lib_patch.Upstream
 package/qextserialport/0001-Create-a-main-include-file-QExtSerialPort.patch lib_patch.Upstream
 package/qextserialport/0002-Tell-qmake-to-add-a-pkgconfig-file-to-ease-usage-wit.patch lib_patch.Upstream
 package/qt5/qt5base/0001-qtbase-Fix-build-error-when-using-EGL.patch lib_patch.Upstream
diff --git a/package/python3/0001-Make-the-build-of-pyc-files-conditional.patch b/package/python3/0001-Make-the-build-of-pyc-files-conditional.patch
index 83e2e22f52..9b31c39140 100644
--- a/package/python3/0001-Make-the-build-of-pyc-files-conditional.patch
+++ b/package/python3/0001-Make-the-build-of-pyc-files-conditional.patch
@@ -1,4 +1,4 @@
-From 057c836d1d6b61e490d9015fb4d679a54c5e9f2c Mon Sep 17 00:00:00 2001
+From 96a5a899445bee3bc1b750cc4aca730cc1733375 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 22 Feb 2017 16:21:31 -0800
 Subject: [PATCH] Make the build of pyc files conditional
@@ -6,41 +6,45 @@ Subject: [PATCH] Make the build of pyc files conditional
 This commit adds a new configure option --disable-pyc-build to disable
 the compilation of pyc.
 
+Upstream: N/A
+
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 [ Andrey Smrinov: ported to Python 3.6 ]
 Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
 [ Adam Duskett: ported to Python 3.12.0 ]
 Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
+[ Vincent Fazio: ported to Python 3.13.2 ]
+Signed-off-by: Vincent Fazio <vfazio@gmail.com>
 ---
  Makefile.pre.in | 2 ++
- configure.ac    | 6 ++++++
- 2 files changed, 8 insertions(+)
+ configure.ac    | 7 +++++++
+ 2 files changed, 9 insertions(+)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 083f4c750a0..2ff75f51571 100644
+index 46a37ded970..b9a2ab2b02b 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -2335,6 +2335,7 @@ libinstall:	all $(srcdir)/Modules/xxmodule.c
- 		$(DESTDIR)$(LIBDEST); \
- 	$(INSTALL_DATA) $(srcdir)/LICENSE $(DESTDIR)$(LIBDEST)/LICENSE.txt
+@@ -2563,6 +2563,7 @@ libinstall:	all $(srcdir)/Modules/xxmodule.c
+ 		patch --force --reject-file "$(abs_builddir)/app-store-compliance.rej" --strip 2 --directory "$(DESTDIR)$(LIBDEST)" --input "$(abs_srcdir)/$(APP_STORE_COMPLIANCE_PATCH)" || true ; \
+ 	fi
  	@ # Build PYC files for the 3 optimization levels (0, 1, 2)
 +ifeq (@PYC_BUILD@,yes)
  	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
  		$(PYTHON_FOR_BUILD) -Wi $(DESTDIR)$(LIBDEST)/compileall.py \
  		-o 0 -o 1 -o 2 $(COMPILEALL_OPTS) -d $(LIBDEST) -f \
-@@ -2344,6 +2345,7 @@ libinstall:	all $(srcdir)/Modules/xxmodule.c
+@@ -2572,6 +2573,7 @@ libinstall:	all $(srcdir)/Modules/xxmodule.c
  		$(PYTHON_FOR_BUILD) -Wi $(DESTDIR)$(LIBDEST)/compileall.py \
  		-o 0 -o 1 -o 2 $(COMPILEALL_OPTS) -d $(LIBDEST)/site-packages -f \
  		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
 +endif
- 	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
- 		$(PYTHON_FOR_BUILD) -m lib2to3.pgen2.driver $(DESTDIR)$(LIBDEST)/lib2to3/Grammar.txt
- 	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
+ 
+ # bpo-21536: Misc/python-config.sh is generated in the build directory
+ # from $(srcdir)Misc/python-config.sh.in.
 diff --git a/configure.ac b/configure.ac
-index 9270b5f7172..879e6a2d432 100644
+index 3fcb18922c5..c60381f9605 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1482,6 +1482,12 @@ fi
+@@ -1513,6 +1513,13 @@ fi
  
  AC_MSG_CHECKING([LDLIBRARY])
  
@@ -50,9 +54,10 @@ index 9270b5f7172..879e6a2d432 100644
 +	AS_HELP_STRING([--disable-pyc-build], [disable build of pyc files]),
 +	[ PYC_BUILD="${enableval}" ], [ PYC_BUILD=yes ])
 +
- # MacOSX framework builds need more magic. LDLIBRARY is the dynamic
++
+ # Apple framework builds need more magic. LDLIBRARY is the dynamic
  # library that we build, but we do not want to link against it (we
  # will find it with a -framework option). For this reason there is an
 -- 
-2.39.5
+2.34.1
 
diff --git a/package/python3/0003-Add-an-option-to-disable-pydoc.patch b/package/python3/0002-Add-an-option-to-disable-pydoc.patch
similarity index 75%
rename from package/python3/0003-Add-an-option-to-disable-pydoc.patch
rename to package/python3/0002-Add-an-option-to-disable-pydoc.patch
index 2eaf868965..9ee7d00fb3 100644
--- a/package/python3/0003-Add-an-option-to-disable-pydoc.patch
+++ b/package/python3/0002-Add-an-option-to-disable-pydoc.patch
@@ -1,4 +1,4 @@
-From c1c1a844c1819da38c0e03d1f23a97099b571b86 Mon Sep 17 00:00:00 2001
+From 7db6ccbed6dd0b47011d1dfecb040d447ccf4595 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 22 Feb 2017 17:07:56 -0800
 Subject: [PATCH] Add an option to disable pydoc
@@ -6,6 +6,8 @@ Subject: [PATCH] Add an option to disable pydoc
 It removes 0.5 MB of data from the target plus the pydoc script
 itself.
 
+Upstream: N/A
+
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Signed-off-by: Samuel Martin <s.martin49@gmail.com>
 [ Andrey Smirnov: ported to Python 3.6 ]
@@ -14,34 +16,36 @@ Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
 Signed-off-by: Adam Duskett <aduskett@gmail.com>
 [ Adam Duskett: ported to Python 3.12.1 ]
 Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
+[ Vincent Fazio: ported to Python 3.13.2 ]
+Signed-off-by: Vincent Fazio <vfazio@gmail.com>
 ---
  Makefile.pre.in | 9 ++++++++-
  configure.ac    | 6 ++++++
  2 files changed, 14 insertions(+), 1 deletion(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 2ff75f51571..401d130b804 100644
+index b9a2ab2b02b..4360b60165a 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -2050,7 +2050,9 @@ bininstall: commoninstall altbininstall
+@@ -2275,7 +2275,9 @@ bininstall: commoninstall altbininstall
  	-rm -f $(DESTDIR)$(BINDIR)/idle3
  	(cd $(DESTDIR)$(BINDIR); $(LN) -s idle$(VERSION) idle3)
  	-rm -f $(DESTDIR)$(BINDIR)/pydoc3
 +ifeq (@PYDOC@,yes)
  	(cd $(DESTDIR)$(BINDIR); $(LN) -s pydoc$(VERSION) pydoc3)
 +endif
- 	-rm -f $(DESTDIR)$(BINDIR)/2to3
- 	(cd $(DESTDIR)$(BINDIR); $(LN) -s 2to3-$(VERSION) 2to3)
  	if test "x$(LIPO_32BIT_FLAGS)" != "x" ; then \
-@@ -2102,7 +2104,6 @@ LIBSUBDIRS=	asyncio \
- 		lib2to3 lib2to3/fixes lib2to3/pgen2 \
+ 		rm -f $(DESTDIR)$(BINDIR)/python3-32$(EXE); \
+ 		(cd $(DESTDIR)$(BINDIR); $(LN) -s python$(VERSION)-32$(EXE) python3-32$(EXE)) \
+@@ -2325,7 +2327,6 @@ LIBSUBDIRS=	asyncio \
  		logging \
  		multiprocessing multiprocessing/dummy \
+ 		pathlib \
 -		pydoc_data \
  		re \
  		site-packages \
  		sqlite3 \
-@@ -2263,6 +2264,10 @@ TESTSUBDIRS=	idlelib/idle_test \
+@@ -2483,6 +2484,10 @@ TESTSUBDIRS=	idlelib/idle_test \
  
  COMPILEALL_OPTS=-j0
  
@@ -52,9 +56,9 @@ index 2ff75f51571..401d130b804 100644
  TEST_MODULES=@TEST_MODULES@
  
  .PHONY: libinstall
-@@ -2477,7 +2482,9 @@ libainstall: all scripts
+@@ -2710,7 +2715,9 @@ libainstall: all scripts
+ 	$(INSTALL_SCRIPT) python-config.py $(DESTDIR)$(LIBPL)/python-config.py
  	$(INSTALL_SCRIPT) python-config $(DESTDIR)$(BINDIR)/python$(LDVERSION)-config
- 	$(INSTALL_SCRIPT) $(SCRIPT_2TO3) $(DESTDIR)$(BINDIR)/2to3-$(VERSION)
  	$(INSTALL_SCRIPT) $(SCRIPT_IDLE) $(DESTDIR)$(BINDIR)/idle$(VERSION)
 +ifeq (@PYDOC@,yes)
  	$(INSTALL_SCRIPT) $(SCRIPT_PYDOC) $(DESTDIR)$(BINDIR)/pydoc$(VERSION)
@@ -63,10 +67,10 @@ index 2ff75f51571..401d130b804 100644
  		"`echo $(MACHDEP) | sed 's/^\(...\).*/\1/'`" = "aix" ]; then \
  		echo; echo "Installing support files for building shared extension modules on AIX:"; \
 diff --git a/configure.ac b/configure.ac
-index 7bc049863c3..ca226dcc5b9 100644
+index c60381f9605..583adc7e16a 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -4514,6 +4514,12 @@ AS_VAR_IF([posix_threads], [stub], [
+@@ -4661,6 +4661,12 @@ AS_VAR_IF([posix_threads], [stub], [
    AC_DEFINE([HAVE_PTHREAD_STUBS], [1], [Define if platform requires stubbed pthreads support])
  ])
  
@@ -80,5 +84,5 @@ index 7bc049863c3..ca226dcc5b9 100644
  AH_TEMPLATE([ENABLE_IPV6], [Define if --enable-ipv6 is specified])
  AC_MSG_CHECKING([if --enable-ipv6 is specified])
 -- 
-2.39.5
+2.34.1
 
diff --git a/package/python3/0002-Disable-buggy_getaddrinfo-configure-test-when-cross-.patch b/package/python3/0002-Disable-buggy_getaddrinfo-configure-test-when-cross-.patch
deleted file mode 100644
index 81db26fa45..0000000000
--- a/package/python3/0002-Disable-buggy_getaddrinfo-configure-test-when-cross-.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From cbdfde1abc7715f7c113e3c2144953d1d25cf8db Mon Sep 17 00:00:00 2001
-From: Vanya Sergeev <vsergeev@gmail.com>
-Date: Wed, 23 Dec 2015 11:30:33 +0100
-Subject: [PATCH] Disable buggy_getaddrinfo configure test when cross-compiling
- with IPv6 support
-
-Signed-off-by: Vanya Sergeev <vsergeev@gmail.com>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 879e6a2d432..7bc049863c3 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -5433,7 +5433,7 @@ fi]))
- dnl if ac_cv_func_getaddrinfo
- ])
- 
--if test "$ac_cv_func_getaddrinfo" = no -o "$ac_cv_buggy_getaddrinfo" = yes
-+if test "$ac_cv_func_getaddrinfo" = no || test "$cross_compiling" != "yes" -a "$ac_cv_buggy_getaddrinfo" = yes
- then
-   AS_VAR_IF([ipv6], [yes], [
-     AC_MSG_ERROR([m4_normalize([
--- 
-2.39.5
-
diff --git a/package/python3/0005-Add-an-option-to-disable-IDLE.patch b/package/python3/0003-Add-an-option-to-disable-IDLE.patch
similarity index 68%
rename from package/python3/0005-Add-an-option-to-disable-IDLE.patch
rename to package/python3/0003-Add-an-option-to-disable-IDLE.patch
index 5bcf66dea2..45b7d6e522 100644
--- a/package/python3/0005-Add-an-option-to-disable-IDLE.patch
+++ b/package/python3/0003-Add-an-option-to-disable-IDLE.patch
@@ -1,4 +1,4 @@
-From 5b4755f8d6bbeb68f2966464038c3e1f337868d3 Mon Sep 17 00:00:00 2001
+From 8da950588cd2597a6588a46374ad917d642c583d Mon Sep 17 00:00:00 2001
 From: Maxime Ripard <maxime.ripard@free-electrons.com>
 Date: Wed, 22 Feb 2017 17:45:14 -0800
 Subject: [PATCH] Add an option to disable IDLE
@@ -6,6 +6,8 @@ Subject: [PATCH] Add an option to disable IDLE
 IDLE is an IDE embedded into python, written using Tk, so it doesn't make
 much sense to have it into our build.
 
+Upstream: N/A
+
 Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
 [ Andrey Smirnov: ported to Python 3.6 ]
 Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
@@ -13,16 +15,18 @@ Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
 Signed-off-by: Adam Duskett <aduskett@gmail.com>
 [ Adam Duskett: ported to Python 3.12.1 ]
 Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
+[ Vincent Fazio: ported to Python 3.13.2 ]
+Signed-off-by: Vincent Fazio <vfazio@gmail.com>
 ---
  Makefile.pre.in | 9 ++++++++-
  configure.ac    | 6 ++++++
  2 files changed, 14 insertions(+), 1 deletion(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index b44ad736144..aceb52e31ce 100644
+index 4360b60165a..e88f89b91b1 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -2048,7 +2048,9 @@ bininstall: commoninstall altbininstall
+@@ -2273,7 +2273,9 @@ bininstall: commoninstall altbininstall
  	-rm -f $(DESTDIR)$(LIBPC)/python3-embed.pc
  	(cd $(DESTDIR)$(LIBPC); $(LN) -s python-$(VERSION)-embed.pc python3-embed.pc)
  	-rm -f $(DESTDIR)$(BINDIR)/idle3
@@ -32,7 +36,7 @@ index b44ad736144..aceb52e31ce 100644
  	-rm -f $(DESTDIR)$(BINDIR)/pydoc3
  ifeq (@PYDOC@,yes)
  	(cd $(DESTDIR)$(BINDIR); $(LN) -s pydoc$(VERSION) pydoc3)
-@@ -2100,7 +2102,6 @@ LIBSUBDIRS=	asyncio \
+@@ -2321,7 +2323,6 @@ LIBSUBDIRS=	asyncio \
  		ensurepip ensurepip/_bundled \
  		html \
  		http \
@@ -40,8 +44,8 @@ index b44ad736144..aceb52e31ce 100644
  		importlib importlib/resources importlib/metadata \
  		json \
  		logging \
-@@ -2273,6 +2274,10 @@ TESTSUBDIRS += test/test_lib2to3			\
- 		test/test_lib2to3/data/fixers/myfixes
+@@ -2488,6 +2489,10 @@ ifeq (@PYDOC@,yes)
+ LIBSUBDIRS += pydoc_data
  endif
  
 +ifeq (@IDLE@,yes)
@@ -51,10 +55,10 @@ index b44ad736144..aceb52e31ce 100644
  TEST_MODULES=@TEST_MODULES@
  
  .PHONY: libinstall
-@@ -2490,7 +2495,9 @@ libainstall: all scripts
- ifeq (@LIB2TO3@,yes)
- 	$(INSTALL_SCRIPT) $(SCRIPT_2TO3) $(DESTDIR)$(BINDIR)/2to3-$(VERSION)
- endif
+@@ -2714,7 +2719,9 @@ libainstall: all scripts
+ 	$(INSTALL_SCRIPT) $(srcdir)/install-sh $(DESTDIR)$(LIBPL)/install-sh
+ 	$(INSTALL_SCRIPT) python-config.py $(DESTDIR)$(LIBPL)/python-config.py
+ 	$(INSTALL_SCRIPT) python-config $(DESTDIR)$(BINDIR)/python$(LDVERSION)-config
 +ifeq (@IDLE@,yes)
  	$(INSTALL_SCRIPT) $(SCRIPT_IDLE) $(DESTDIR)$(BINDIR)/idle$(VERSION)
 +endif
@@ -62,12 +66,12 @@ index b44ad736144..aceb52e31ce 100644
  	$(INSTALL_SCRIPT) $(SCRIPT_PYDOC) $(DESTDIR)$(BINDIR)/pydoc$(VERSION)
  endif
 diff --git a/configure.ac b/configure.ac
-index 9b77582560d..becec336dc2 100644
+index 583adc7e16a..744c5bebd39 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -7578,6 +7578,12 @@ AC_ARG_ENABLE(lib2to3,
- 	AS_HELP_STRING([--disable-lib2to3], [disable lib2to3]),
- 	[ LIB2TO3="${enableval}" ], [ LIB2TO3=yes ])
+@@ -7810,6 +7810,12 @@ PY_STDLIB_MOD([xxlimited_35], [test "$TEST_MODULES" = yes], [test "$ac_cv_func_d
+ # substitute multiline block, must come after last PY_STDLIB_MOD()
+ AC_SUBST([MODULE_BLOCK])
  
 +AC_SUBST(IDLE)
 +
@@ -79,5 +83,5 @@ index 9b77582560d..becec336dc2 100644
  AC_CONFIG_FILES(m4_normalize([
    Makefile.pre
 -- 
-2.39.5
+2.34.1
 
diff --git a/package/python3/0004-Add-an-option-to-disable-lib2to3.patch b/package/python3/0004-Add-an-option-to-disable-lib2to3.patch
deleted file mode 100644
index 7dccf471c4..0000000000
--- a/package/python3/0004-Add-an-option-to-disable-lib2to3.patch
+++ /dev/null
@@ -1,114 +0,0 @@
-From 2a4b87bb00805156d40782a3197fbbf20937da6f Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Wed, 22 Feb 2017 17:15:31 -0800
-Subject: [PATCH] Add an option to disable lib2to3
-
-lib2to3 is a library to convert Python 2.x code to Python 3.x. As
-such, it is probably not very useful on embedded system targets.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Signed-off-by: Samuel Martin <s.martin49@gmail.com>
-[ Andrey Smirnov: ported to Python 3.6 ]
-Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
-[ Adam Duskett: ported to Python 3.10.0 ]
-Signed-off-by: Adam Duskett <aduskett@gmail.com>
-[ Bernd Kuhls: ported to Python 3.11.4]
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-[ Adam Duskett: ported to Python 3.12.1 ]
-Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
----
- Makefile.pre.in | 19 ++++++++++++++-----
- configure.ac    |  6 ++++++
- 2 files changed, 20 insertions(+), 5 deletions(-)
-
-diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 401d130b804..b44ad736144 100644
---- a/Makefile.pre.in
-+++ b/Makefile.pre.in
-@@ -2054,7 +2054,9 @@ ifeq (@PYDOC@,yes)
- 	(cd $(DESTDIR)$(BINDIR); $(LN) -s pydoc$(VERSION) pydoc3)
- endif
- 	-rm -f $(DESTDIR)$(BINDIR)/2to3
-+ifeq (@LIB2TO3@,yes)
- 	(cd $(DESTDIR)$(BINDIR); $(LN) -s 2to3-$(VERSION) 2to3)
-+endif
- 	if test "x$(LIPO_32BIT_FLAGS)" != "x" ; then \
- 		rm -f $(DESTDIR)$(BINDIR)/python3-32$(EXE); \
- 		(cd $(DESTDIR)$(BINDIR); $(LN) -s python$(VERSION)-32$(EXE) python3-32$(EXE)) \
-@@ -2101,7 +2103,6 @@ LIBSUBDIRS=	asyncio \
- 		idlelib idlelib/Icons \
- 		importlib importlib/resources importlib/metadata \
- 		json \
--		lib2to3 lib2to3/fixes lib2to3/pgen2 \
- 		logging \
- 		multiprocessing multiprocessing/dummy \
- 		re \
-@@ -2208,10 +2209,6 @@ TESTSUBDIRS=	idlelib/idle_test \
- 		test/test_importlib/resources/zipdata02 \
- 		test/test_importlib/source \
- 		test/test_json \
--		test/test_lib2to3 \
--		test/test_lib2to3/data \
--		test/test_lib2to3/data/fixers \
--		test/test_lib2to3/data/fixers/myfixes \
- 		test/test_module \
- 		test/test_peg_generator \
- 		test/test_pydoc \
-@@ -2268,6 +2265,14 @@ ifeq (@PYDOC@,yes)
- LIBSUBDIRS += pydoc_data
- endif
- 
-+ifeq (@LIB2TO3@,yes)
-+LIBSUBDIRS += lib2to3 lib2to3/fixes lib2to3/pgen2
-+TESTSUBDIRS += test/test_lib2to3			\
-+		test/test_lib2to3/data \
-+		test/test_lib2to3/data/fixers \
-+		test/test_lib2to3/data/fixers/myfixes
-+endif
-+
- TEST_MODULES=@TEST_MODULES@
- 
- .PHONY: libinstall
-@@ -2351,10 +2356,12 @@ ifeq (@PYC_BUILD@,yes)
- 		-o 0 -o 1 -o 2 $(COMPILEALL_OPTS) -d $(LIBDEST)/site-packages -f \
- 		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
- endif
-+ifeq (@LIB2TO3@,yes)
- 	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
- 		$(PYTHON_FOR_BUILD) -m lib2to3.pgen2.driver $(DESTDIR)$(LIBDEST)/lib2to3/Grammar.txt
- 	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
- 		$(PYTHON_FOR_BUILD) -m lib2to3.pgen2.driver $(DESTDIR)$(LIBDEST)/lib2to3/PatternGrammar.txt
-+endif
- 
- # bpo-21536: Misc/python-config.sh is generated in the build directory
- # from $(srcdir)Misc/python-config.sh.in.
-@@ -2480,7 +2487,9 @@ libainstall: all scripts
- 	$(INSTALL_SCRIPT) $(srcdir)/install-sh $(DESTDIR)$(LIBPL)/install-sh
- 	$(INSTALL_SCRIPT) python-config.py $(DESTDIR)$(LIBPL)/python-config.py
- 	$(INSTALL_SCRIPT) python-config $(DESTDIR)$(BINDIR)/python$(LDVERSION)-config
-+ifeq (@LIB2TO3@,yes)
- 	$(INSTALL_SCRIPT) $(SCRIPT_2TO3) $(DESTDIR)$(BINDIR)/2to3-$(VERSION)
-+endif
- 	$(INSTALL_SCRIPT) $(SCRIPT_IDLE) $(DESTDIR)$(BINDIR)/idle$(VERSION)
- ifeq (@PYDOC@,yes)
- 	$(INSTALL_SCRIPT) $(SCRIPT_PYDOC) $(DESTDIR)$(BINDIR)/pydoc$(VERSION)
-diff --git a/configure.ac b/configure.ac
-index ca226dcc5b9..9b77582560d 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -7572,6 +7572,12 @@ PY_STDLIB_MOD([xxlimited_35], [test "$with_trace_refs" = "no"], [test "$ac_cv_fu
- # substitute multiline block, must come after last PY_STDLIB_MOD()
- AC_SUBST([MODULE_BLOCK])
- 
-+AC_SUBST(LIB2TO3)
-+
-+AC_ARG_ENABLE(lib2to3,
-+	AS_HELP_STRING([--disable-lib2to3], [disable lib2to3]),
-+	[ LIB2TO3="${enableval}" ], [ LIB2TO3=yes ])
-+
- # generate output files
- AC_CONFIG_FILES(m4_normalize([
-   Makefile.pre
--- 
-2.39.5
-
diff --git a/package/python3/0006-configure.ac-move-PY_STDLIB_MOD_SET_NA-further-up.patch b/package/python3/0004-configure.ac-move-PY_STDLIB_MOD_SET_NA-further-up.patch
similarity index 62%
rename from package/python3/0006-configure.ac-move-PY_STDLIB_MOD_SET_NA-further-up.patch
rename to package/python3/0004-configure.ac-move-PY_STDLIB_MOD_SET_NA-further-up.patch
index baffece4a5..4a1f0008cd 100644
--- a/package/python3/0006-configure.ac-move-PY_STDLIB_MOD_SET_NA-further-up.patch
+++ b/package/python3/0004-configure.ac-move-PY_STDLIB_MOD_SET_NA-further-up.patch
@@ -1,4 +1,4 @@
-From 36fbff49ddfe4e91af5683290a68b717aea1b875 Mon Sep 17 00:00:00 2001
+From 3de626186e6abeb23f0c3c0f6442058884e4a3f6 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 Date: Tue, 6 Feb 2024 22:46:59 +0100
 Subject: [PATCH] configure.ac: move PY_STDLIB_MOD_SET_NA further up
@@ -6,19 +6,24 @@ Subject: [PATCH] configure.ac: move PY_STDLIB_MOD_SET_NA further up
 We will need PY_STDLIB_MOD_SET_NA in next patches further up in the
 configure.ac script.
 
+Upstream: N/A
+
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+[ Vincent Fazio: ported to Python 3.13.2 ]
+Signed-off-by: Vincent Fazio <vfazio@gmail.com>
 ---
- configure.ac | 10 +++++-----
- 1 file changed, 5 insertions(+), 5 deletions(-)
+ configure.ac | 13 ++++++-------
+ 1 file changed, 6 insertions(+), 7 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index becec336dc2..ab68cc3dd73 100644
+index 744c5bebd39..8d56a24ffcb 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -95,6 +95,11 @@ AC_DEFUN([PY_CHECK_EMSCRIPTEN_PORT], [
+@@ -95,6 +95,12 @@ AC_DEFUN([PY_CHECK_EMSCRIPTEN_PORT], [
    AS_VAR_POPDEF([py_libs])
  ])
  
++# stdlib
 +AC_DEFUN([PY_STDLIB_MOD_SET_NA], [
 +  m4_foreach([mod], [$@], [
 +    AS_VAR_SET([py_cv_module_]mod, [n/a])])
@@ -27,10 +32,12 @@ index becec336dc2..ab68cc3dd73 100644
  AC_SUBST([BASECPPFLAGS])
  if test "$srcdir" != . -a "$srcdir" != "$(pwd)"; then
      # If we're building out-of-tree, we need to make sure the following
-@@ -7261,11 +7266,6 @@ AC_ARG_ENABLE([test-modules],
- AC_MSG_RESULT([$TEST_MODULES])
- AC_SUBST([TEST_MODULES])
+@@ -7478,13 +7484,6 @@ AS_VAR_IF([ac_cv_libatomic_needed], [yes],
+            LIBATOMIC=${LIBATOMIC-"-latomic"}])
+ _RESTORE_VAR([CPPFLAGS])
  
+-
+-# stdlib
 -AC_DEFUN([PY_STDLIB_MOD_SET_NA], [
 -  m4_foreach([mod], [$@], [
 -    AS_VAR_SET([py_cv_module_]mod, [n/a])])
@@ -38,7 +45,7 @@ index becec336dc2..ab68cc3dd73 100644
 -
  # stdlib not available
  dnl Modules that are not available on some platforms
- dnl AIX has shadow passwords, but access is not via getspent()
+ AS_CASE([$ac_sys_system],
 -- 
-2.39.5
+2.34.1
 
diff --git a/package/python3/0007-Add-option-to-disable-the-sqlite3-module.patch b/package/python3/0005-Add-option-to-disable-the-sqlite3-module.patch
similarity index 76%
rename from package/python3/0007-Add-option-to-disable-the-sqlite3-module.patch
rename to package/python3/0005-Add-option-to-disable-the-sqlite3-module.patch
index 24138c2761..57182a4299 100644
--- a/package/python3/0007-Add-option-to-disable-the-sqlite3-module.patch
+++ b/package/python3/0005-Add-option-to-disable-the-sqlite3-module.patch
@@ -1,8 +1,10 @@
-From a24aee2ba81617baf01215b333c26434355bf91a Mon Sep 17 00:00:00 2001
+From bd588150572c48da6dbb2f65eb21587f0f20dfaf Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 Date: Tue, 6 Feb 2024 22:12:20 +0100
 Subject: [PATCH] Add option to disable the sqlite3 module
 
+Upstream: N/A
+
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Signed-off-by: Samuel Martin <s.martin49@gmail.com>
 [ Andrey Smirnov: ported to Python 3.6 ]
@@ -10,24 +12,26 @@ Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
 [ Adam Duskett: ported to Python 3.10.0 ]
 Signed-off-by: Adam Duskett <aduskett@gmail.com>
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+[ Vincent Fazio: ported to Python 3.13.2 ]
+Signed-off-by: Vincent Fazio <vfazio@gmail.com>
 ---
  Makefile.pre.in | 5 ++++-
  configure.ac    | 7 +++++++
  2 files changed, 11 insertions(+), 1 deletion(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index aceb52e31ce..7c5bcea59ba 100644
+index e88f89b91b1..88a48eb5333 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -2108,7 +2108,6 @@ LIBSUBDIRS=	asyncio \
- 		multiprocessing multiprocessing/dummy \
+@@ -2330,7 +2330,6 @@ LIBSUBDIRS=	asyncio \
+ 		pathlib \
  		re \
  		site-packages \
 -		sqlite3 \
+ 		sysconfig \
  		tkinter \
  		tomllib \
- 		turtledemo \
-@@ -2278,6 +2277,10 @@ ifeq (@IDLE@,yes)
+@@ -2493,6 +2492,10 @@ ifeq (@IDLE@,yes)
  LIBSUBDIRS += idlelib idlelib/Icons
  endif
  
@@ -39,10 +43,10 @@ index aceb52e31ce..7c5bcea59ba 100644
  
  .PHONY: libinstall
 diff --git a/configure.ac b/configure.ac
-index ab68cc3dd73..3fbcabe29c8 100644
+index 8d56a24ffcb..b6d5bb3d9c5 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -4519,6 +4519,13 @@ AS_VAR_IF([posix_threads], [stub], [
+@@ -4667,6 +4667,13 @@ AS_VAR_IF([posix_threads], [stub], [
    AC_DEFINE([HAVE_PTHREAD_STUBS], [1], [Define if platform requires stubbed pthreads support])
  ])
  
@@ -57,5 +61,5 @@ index ab68cc3dd73..3fbcabe29c8 100644
  
  AC_ARG_ENABLE(pydoc,
 -- 
-2.39.5
+2.34.1
 
diff --git a/package/python3/0008-Add-an-option-to-disable-the-tk-module.patch b/package/python3/0006-Add-an-option-to-disable-the-tk-module.patch
similarity index 76%
rename from package/python3/0008-Add-an-option-to-disable-the-tk-module.patch
rename to package/python3/0006-Add-an-option-to-disable-the-tk-module.patch
index 6fb80871cb..6dc5d9f837 100644
--- a/package/python3/0008-Add-an-option-to-disable-the-tk-module.patch
+++ b/package/python3/0006-Add-an-option-to-disable-the-tk-module.patch
@@ -1,8 +1,10 @@
-From 4d02905278ef62aaf9e984022033c3390d675948 Mon Sep 17 00:00:00 2001
+From 0b04847e1007f5d34b986eb12ae63f140d14b01e Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 22 Feb 2017 17:23:42 -0800
 Subject: [PATCH] Add an option to disable the tk module
 
+Upstream: N/A
+
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Signed-off-by: Samuel Martin <s.martin49@gmail.com>
 [ Andrey Smirnov: ported to Python 3.6 ]
@@ -13,32 +15,34 @@ Signed-off-by: Adam Duskett <aduskett@gmail.com>
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 [ Adam Duskett: ported to Python 3.12.1 ]
 Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
+[ Vincent Fazio: ported to Python 3.13.2 ]
+Signed-off-by: Vincent Fazio <vfazio@gmail.com>
 ---
  Makefile.pre.in | 8 +++++---
  configure.ac    | 7 +++++++
  2 files changed, 12 insertions(+), 3 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 7c5bcea59ba..5de6f63220d 100644
+index 88a48eb5333..6d6631cbe31 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -2108,7 +2108,6 @@ LIBSUBDIRS=	asyncio \
- 		multiprocessing multiprocessing/dummy \
+@@ -2331,7 +2331,6 @@ LIBSUBDIRS=	asyncio \
  		re \
  		site-packages \
+ 		sysconfig \
 -		tkinter \
  		tomllib \
  		turtledemo \
  		unittest \
-@@ -2213,7 +2212,6 @@ TESTSUBDIRS=	idlelib/idle_test \
- 		test/test_peg_generator \
+@@ -2439,7 +2438,6 @@ TESTSUBDIRS=	idlelib/idle_test \
  		test/test_pydoc \
+ 		test/test_pyrepl \
  		test/test_sqlite3 \
 -		test/test_tkinter \
  		test/test_tomllib \
  		test/test_tomllib/data \
  		test/test_tomllib/data/invalid \
-@@ -2234,7 +2232,6 @@ TESTSUBDIRS=	idlelib/idle_test \
+@@ -2460,7 +2458,6 @@ TESTSUBDIRS=	idlelib/idle_test \
  		test/test_tomllib/data/valid/multiline-basic-str \
  		test/test_tools \
  		test/test_tools/i18n_data \
@@ -46,9 +50,9 @@ index 7c5bcea59ba..5de6f63220d 100644
  		test/test_unittest \
  		test/test_unittest/testmock \
  		test/test_warnings \
-@@ -2259,6 +2256,11 @@ TESTSUBDIRS=	idlelib/idle_test \
- 		test/test_multiprocessing_forkserver \
- 		test/test_multiprocessing_spawn
+@@ -2482,6 +2479,11 @@ TESTSUBDIRS=	idlelib/idle_test \
+ 		test/xmltestdata/c14n-20 \
+ 		test/zipimport_data
  
 +ifeq (@TK@,yes)
 +LIBSUBDIRS += tkinter
@@ -59,10 +63,10 @@ index 7c5bcea59ba..5de6f63220d 100644
  
  ifeq (@PYDOC@,yes)
 diff --git a/configure.ac b/configure.ac
-index 3fbcabe29c8..4331ed4264f 100644
+index b6d5bb3d9c5..a1a91e094cd 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -4532,6 +4532,13 @@ AC_ARG_ENABLE(pydoc,
+@@ -4680,6 +4680,13 @@ AC_ARG_ENABLE(pydoc,
  	AS_HELP_STRING([--disable-pydoc], [disable pydoc]),
  	[ PYDOC="${enableval}" ], [ PYDOC=yes ])
  
@@ -77,5 +81,5 @@ index 3fbcabe29c8..4331ed4264f 100644
  AH_TEMPLATE([ENABLE_IPV6], [Define if --enable-ipv6 is specified])
  AC_MSG_CHECKING([if --enable-ipv6 is specified])
 -- 
-2.39.5
+2.34.1
 
diff --git a/package/python3/0009-Add-an-option-to-disable-the-curses-module.patch b/package/python3/0007-Add-an-option-to-disable-the-curses-module.patch
similarity index 78%
rename from package/python3/0009-Add-an-option-to-disable-the-curses-module.patch
rename to package/python3/0007-Add-an-option-to-disable-the-curses-module.patch
index 443005584d..a71ee5a53a 100644
--- a/package/python3/0009-Add-an-option-to-disable-the-curses-module.patch
+++ b/package/python3/0007-Add-an-option-to-disable-the-curses-module.patch
@@ -1,24 +1,28 @@
-From 32ecd62c7f1444652911d05c2c03152ff7fff6b5 Mon Sep 17 00:00:00 2001
+From 7ec209bfb172ba5382c010954057fd32e4f21cf6 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 22 Feb 2017 17:31:51 -0800
 Subject: [PATCH] Add an option to disable the curses module
 
+Upstream: N/A
+
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Signed-off-by: Samuel Martin <s.martin49@gmail.com>
 [ Andrey Smirnov: ported to Python 3.6 ]
 Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
 [ Adam Duskett: ported to Python 3.10.0 ]
 Signed-off-by: Adam Duskett <aduskett@gmail.com>
+[ Vincent Fazio: ported to Python 3.13.2 ]
+Signed-off-by: Vincent Fazio <vfazio@gmail.com>
 ---
  Makefile.pre.in | 5 ++++-
  configure.ac    | 7 +++++++
  2 files changed, 11 insertions(+), 1 deletion(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 5de6f63220d..2b0307b1282 100644
+index 6d6631cbe31..a4531d1f0fc 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -2095,7 +2095,6 @@ LIBSUBDIRS=	asyncio \
+@@ -2316,7 +2316,6 @@ LIBSUBDIRS=	asyncio \
  		concurrent concurrent/futures \
  		csv \
  		ctypes ctypes/macholib \
@@ -26,7 +30,7 @@ index 5de6f63220d..2b0307b1282 100644
  		dbm \
  		email email/mime \
  		encodings \
-@@ -2261,6 +2260,10 @@ LIBSUBDIRS += tkinter
+@@ -2484,6 +2483,10 @@ LIBSUBDIRS += tkinter
  TESTSUBDIRS += test/test_tkinter test/test_ttk
  endif
  
@@ -38,10 +42,10 @@ index 5de6f63220d..2b0307b1282 100644
  
  ifeq (@PYDOC@,yes)
 diff --git a/configure.ac b/configure.ac
-index 4331ed4264f..94bebbfd48e 100644
+index a1a91e094cd..30ad6f1e68d 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -4526,6 +4526,13 @@ AC_ARG_ENABLE(sqlite3,
+@@ -4674,6 +4674,13 @@ AC_ARG_ENABLE(sqlite3,
  AS_IF([test "$SQLITE3" = "no"],
        [PY_STDLIB_MOD_SET_NA([_sqlite3])])
  
@@ -56,5 +60,5 @@ index 4331ed4264f..94bebbfd48e 100644
  
  AC_ARG_ENABLE(pydoc,
 -- 
-2.39.5
+2.34.1
 
diff --git a/package/python3/0010-Add-an-option-to-disable-expat.patch b/package/python3/0008-Add-an-option-to-disable-expat.patch
similarity index 82%
rename from package/python3/0010-Add-an-option-to-disable-expat.patch
rename to package/python3/0008-Add-an-option-to-disable-expat.patch
index 803bf5f05a..cb81493039 100644
--- a/package/python3/0010-Add-an-option-to-disable-expat.patch
+++ b/package/python3/0008-Add-an-option-to-disable-expat.patch
@@ -1,8 +1,10 @@
-From 455e500067431c19770d637ee0769b450208550f Mon Sep 17 00:00:00 2001
+From 427866cb484c9bb925bdf0d916a3441354ba79cb Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 22 Feb 2017 17:40:45 -0800
 Subject: [PATCH] Add an option to disable expat
 
+Upstream: N/A
+
 This patch replaces the existing --with-system-expat option with a
 --with-expat={system,builtin,none} option, which allows to tell Python
 whether we want to use the system expat (already installed), the expat
@@ -15,16 +17,18 @@ Signed-off-by: Samuel Martin <s.martin49@gmail.com>
 Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
 [ Adam Duskett: ported to Python 3.10.0 ]
 Signed-off-by: Adam Duskett <aduskett@gmail.com>
+[ Vincent Fazio: ported to Python 3.13.2 ]
+Signed-off-by: Vincent Fazio <vfazio@gmail.com>
 ---
  Makefile.pre.in |  5 ++++-
- configure.ac    | 22 ++++++++++++----------
- 2 files changed, 16 insertions(+), 11 deletions(-)
+ configure.ac    | 24 +++++++++++++-----------
+ 2 files changed, 17 insertions(+), 12 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 2b0307b1282..fcddbf33e9e 100644
+index a4531d1f0fc..f6719bd19b3 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -2113,7 +2113,6 @@ LIBSUBDIRS=	asyncio \
+@@ -2336,7 +2336,6 @@ LIBSUBDIRS=	asyncio \
  		urllib \
  		venv venv/scripts venv/scripts/common venv/scripts/posix \
  		wsgiref \
@@ -32,7 +36,7 @@ index 2b0307b1282..fcddbf33e9e 100644
  		xmlrpc \
  		zipfile zipfile/_path \
  		zoneinfo \
-@@ -2286,6 +2285,10 @@ ifeq (@SQLITE3@,yes)
+@@ -2501,6 +2500,10 @@ ifeq (@SQLITE3@,yes)
  LIBSUBDIRS += sqlite3
  endif
  
@@ -44,10 +48,10 @@ index 2b0307b1282..fcddbf33e9e 100644
  
  .PHONY: libinstall
 diff --git a/configure.ac b/configure.ac
-index 94bebbfd48e..a2436c0733b 100644
+index 30ad6f1e68d..370eb94730f 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3826,17 +3826,19 @@ LIBS="$withval $LIBS"
+@@ -3970,17 +3970,19 @@ LIBS="$withval $LIBS"
  [AC_MSG_RESULT([no])])
  
  # Check for use of the system expat library
@@ -58,6 +62,10 @@ index 94bebbfd48e..a2436c0733b 100644
 -     [--with-system-expat],
 -     [build pyexpat module using an installed expat library, see Doc/library/pyexpat.rst (default is no)]
 -  )], [], [with_system_expat="no"])
+-
+-AC_MSG_RESULT([$with_system_expat])
+-
+-AS_VAR_IF([with_system_expat], [yes], [
 +AC_MSG_CHECKING(for --with-expat)
 +AC_ARG_WITH(expat,
 +            AS_HELP_STRING([--with-expat], [select which expat version to use: system, builtin, none]),
@@ -69,14 +77,11 @@ index 94bebbfd48e..a2436c0733b 100644
 +      [PY_STDLIB_MOD_SET_NA([pyexpat])
 +       EXPAT=no])
 +AC_SUBST(EXPAT)
- 
--AC_MSG_RESULT([$with_system_expat])
--
--AS_VAR_IF([with_system_expat], [yes], [
++
 +AS_VAR_IF([with_expat], [system], [
    LIBEXPAT_CFLAGS=${LIBEXPAT_CFLAGS-""}
    LIBEXPAT_LDFLAGS=${LIBEXPAT_LDFLAGS-"-lexpat"}
    LIBEXPAT_INTERNAL=
 -- 
-2.39.5
+2.34.1
 
diff --git a/package/python3/0011-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch b/package/python3/0011-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch
deleted file mode 100644
index b3848a69e0..0000000000
--- a/package/python3/0011-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From a52c5db8ffa6715b72ae6813a48491b8cf2ce86e Mon Sep 17 00:00:00 2001
-From: Peter Korsgaard <peter@korsgaard.com>
-Date: Fri, 2 Aug 2019 15:53:16 +0200
-Subject: [PATCH] configure.ac: fixup $CC --print-multiarch output for
- musl/uclibc GCC 8+ toolchains
-
-GCC commit 6834b83784dcf0364eb820e8 (multiarch support for non-glibc linux
-systems), which is part of GCC 8+, changed the multiarch logic to use
-$arch-linux-musl / $arch-linux-uclibc rather than $arch-linux-gnu.
-
-This then causes the python3 configure script to error out:
-
-checking for the platform triplet based on compiler characteristics... powerpc-linux-gnu
-configure: error: internal configure error for the platform triplet, please file a bug report
-
-http://autobuild.buildroot.net/results/cb4/cb49c539501342e45cbe5ade82e588fcdf51f05b
-
-As it requires that the --print-multiarch output (if not empty) matches the
-deduced triplet (which always uses -linux-gnu).
-
-It isn't quite clear why --print-multiarch returns something for a
-non-multiarch toolchain on some architectures (E.G.  PowerPC), but as a
-workaround, rewrite the --print-multiarch output to match older GCC versions
-to keep the configure script happy.
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
-[Peter: updated for 3.10.2]
-Signed-off-by: Vincent Fazio <vfazio@gmail.com>
-[Vincent: fixup offsets for 3.12.4]
----
- configure.ac | 6 +++++-
- 1 file changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index a2436c0733b..d779009f0a6 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1128,7 +1128,11 @@ AC_MSG_CHECKING([for multiarch])
- AS_CASE([$ac_sys_system],
-   [Darwin*], [MULTIARCH=""],
-   [FreeBSD*], [MULTIARCH=""],
--  [MULTIARCH=$($CC --print-multiarch 2>/dev/null)]
-+  [
-+  # GCC 8+ returns $arch-linux-{musl,uclibc} for musl/uClibc based
-+  # toolchains confusing python. Fix that up
-+  MULTIARCH=$($CC --print-multiarch 2>/dev/null | sed -E 's/-linux-(musl|uclibc)*$/-linux-gnu/')
-+  ]
- )
- AC_SUBST([MULTIARCH])
- AC_MSG_RESULT([$MULTIARCH])
--- 
-2.39.5
-
diff --git a/package/python3/0012-gh-115382-Fix-cross-compiles-when-host-and-target-us.patch b/package/python3/0012-gh-115382-Fix-cross-compiles-when-host-and-target-us.patch
deleted file mode 100644
index 642209faa6..0000000000
--- a/package/python3/0012-gh-115382-Fix-cross-compiles-when-host-and-target-us.patch
+++ /dev/null
@@ -1,140 +0,0 @@
-From 56149930c412fb35aac124bf91b838a5dd4ae72c Mon Sep 17 00:00:00 2001
-From: Vincent Fazio <5265893+vfazio@users.noreply.github.com>
-Date: Wed, 28 Feb 2024 13:55:04 -0600
-Subject: [PATCH] gh-115382: Fix cross compiles when host and target use same
- SOABI
-
-Previously, when a build was configured to use a host interpreter via
---with-build-python, the PYTHON_FOR_BUILD config value included a path
-in PYTHONPATH that pointed to the target's built external modules.
-
-For "normal" foreign architecture cross compiles, when loading compiled
-external libraries, the target libraries were processed first due to
-their precedence in sys.path. These libraries were then ruled out due to
-a mismatch in the SOABI so the import mechanism continued searching
-until it found the host's native modules.
-
-However, if the host interpreter and the target python were on the same
-version + SOABI combination, the host interpreter would attempt to load
-the target's external modules due to their precedence in sys.path.
-
-Despite the "match", the target build may have been linked against a
-different libc or may include unsupported instructions so loading or
-executing the target's external modules can lead to crashes.
-
-Now, the path to the target's external modules is no longer defined in
-PYTHONPATH to prevent accidentally loading these foreign modules.
-
-One caveat is that during certain build stages, the target's sysconfig
-module requires higher precedence than the host's version in order to
-accurately query the target build's configuration.
-
-This worked previously due to the target's sysconfig data module having
-precedence over the host's (see above). In order to keep this desired
-behavior, a new environment variable, _PYTHON_SYSCONFIGDATA_PATH, has
-been defined so sysconfig can search this directory for the target's
-sysconfig data.
-
-Signed-off-by: Vincent Fazio <vfazio@gmail.com>
-Upstream-issue: https://github.com/python/cpython/issues/115382
-Upstream: https://github.com/python/cpython/pull/116294
----
- Lib/sysconfig.py             | 15 ++++++++++++++-
- Lib/test/libregrtest/main.py |  1 +
- Lib/test/pythoninfo.py       |  1 +
- Tools/scripts/run_tests.py   |  1 +
- configure                    |  2 +-
- configure.ac                 |  2 +-
- 6 files changed, 19 insertions(+), 3 deletions(-)
-
-diff --git a/Lib/sysconfig.py b/Lib/sysconfig.py
-index 517b13acaf6..9b9ba869747 100644
---- a/Lib/sysconfig.py
-+++ b/Lib/sysconfig.py
-@@ -531,7 +531,20 @@ def _init_posix(vars):
-     """Initialize the module as appropriate for POSIX systems."""
-     # _sysconfigdata is generated at build time, see _generate_posix_vars()
-     name = _get_sysconfigdata_name()
--    _temp = __import__(name, globals(), locals(), ['build_time_vars'], 0)
-+
-+    # For cross builds, the path to the target's sysconfigdata must be specified
-+    # so it can be imported. It cannot be in PYTHONPATH, as foreign modules in
-+    # sys.path can cause crashes when loaded by the host interpreter.
-+    # Rely on truthiness as a valueless env variable is still an empty string.
-+    # See OS X note in _generate_posix_vars re _sysconfigdata.
-+    if (path := os.environ.get('_PYTHON_SYSCONFIGDATA_PATH')):
-+        from importlib.machinery import FileFinder, SourceFileLoader, SOURCE_SUFFIXES
-+        from importlib.util import module_from_spec
-+        spec = FileFinder(path, (SourceFileLoader, SOURCE_SUFFIXES)).find_spec(name)
-+        _temp = module_from_spec(spec)
-+        spec.loader.exec_module(_temp)
-+    else:
-+        _temp = __import__(name, globals(), locals(), ['build_time_vars'], 0)
-     build_time_vars = _temp.build_time_vars
-     vars.update(build_time_vars)
- 
-diff --git a/Lib/test/libregrtest/main.py b/Lib/test/libregrtest/main.py
-index 04404cbcd52..f97172ad680 100644
---- a/Lib/test/libregrtest/main.py
-+++ b/Lib/test/libregrtest/main.py
-@@ -576,6 +576,7 @@ def _add_cross_compile_opts(self, regrtest_opts):
-                 '_PYTHON_PROJECT_BASE',
-                 '_PYTHON_HOST_PLATFORM',
-                 '_PYTHON_SYSCONFIGDATA_NAME',
-+                "_PYTHON_SYSCONFIGDATA_PATH",
-                 'PYTHONPATH'
-             }
-             old_environ = os.environ
-diff --git a/Lib/test/pythoninfo.py b/Lib/test/pythoninfo.py
-index 6efeaad8126..d43e52c9e4c 100644
---- a/Lib/test/pythoninfo.py
-+++ b/Lib/test/pythoninfo.py
-@@ -326,6 +326,7 @@ def format_groups(groups):
-         "_PYTHON_HOST_PLATFORM",
-         "_PYTHON_PROJECT_BASE",
-         "_PYTHON_SYSCONFIGDATA_NAME",
-+        "_PYTHON_SYSCONFIGDATA_PATH",
-         "__PYVENV_LAUNCHER__",
- 
-         # Sanitizer options
-diff --git a/Tools/scripts/run_tests.py b/Tools/scripts/run_tests.py
-index 445a34ae3e8..4077a834245 100644
---- a/Tools/scripts/run_tests.py
-+++ b/Tools/scripts/run_tests.py
-@@ -42,6 +42,7 @@ def main(regrtest_args):
-             '_PYTHON_PROJECT_BASE',
-             '_PYTHON_HOST_PLATFORM',
-             '_PYTHON_SYSCONFIGDATA_NAME',
-+            "_PYTHON_SYSCONFIGDATA_PATH",
-             'PYTHONPATH'
-         }
-         environ = {
-diff --git a/configure b/configure
-index 241cf8f3d4a..484da8c43ef 100755
---- a/configure
-+++ b/configure
-@@ -3689,7 +3689,7 @@ fi
-     fi
-         ac_cv_prog_PYTHON_FOR_REGEN=$with_build_python
-     PYTHON_FOR_FREEZE="$with_build_python"
--    PYTHON_FOR_BUILD='_PYTHON_PROJECT_BASE=$(abs_builddir) _PYTHON_HOST_PLATFORM=$(_PYTHON_HOST_PLATFORM) PYTHONPATH=$(shell test -f pybuilddir.txt && echo $(abs_builddir)/`cat pybuilddir.txt`:)$(srcdir)/Lib _PYTHON_SYSCONFIGDATA_NAME=_sysconfigdata_$(ABIFLAGS)_$(MACHDEP)_$(MULTIARCH) '$with_build_python
-+    PYTHON_FOR_BUILD='_PYTHON_PROJECT_BASE=$(abs_builddir) _PYTHON_HOST_PLATFORM=$(_PYTHON_HOST_PLATFORM) PYTHONPATH=$(srcdir)/Lib _PYTHON_SYSCONFIGDATA_NAME=_sysconfigdata_$(ABIFLAGS)_$(MACHDEP)_$(MULTIARCH) _PYTHON_SYSCONFIGDATA_PATH=$(shell test -f pybuilddir.txt && echo $(abs_builddir)/`cat pybuilddir.txt`) '$with_build_python
-     { printf "%s\n" "$as_me:${as_lineno-$LINENO}: result: $with_build_python" >&5
- printf "%s\n" "$with_build_python" >&6; }
- 
-diff --git a/configure.ac b/configure.ac
-index d779009f0a6..a5a52a4e139 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -169,7 +169,7 @@ AC_ARG_WITH([build-python],
-     dnl Build Python interpreter is used for regeneration and freezing.
-     ac_cv_prog_PYTHON_FOR_REGEN=$with_build_python
-     PYTHON_FOR_FREEZE="$with_build_python"
--    PYTHON_FOR_BUILD='_PYTHON_PROJECT_BASE=$(abs_builddir) _PYTHON_HOST_PLATFORM=$(_PYTHON_HOST_PLATFORM) PYTHONPATH=$(shell test -f pybuilddir.txt && echo $(abs_builddir)/`cat pybuilddir.txt`:)$(srcdir)/Lib _PYTHON_SYSCONFIGDATA_NAME=_sysconfigdata_$(ABIFLAGS)_$(MACHDEP)_$(MULTIARCH) '$with_build_python
-+    PYTHON_FOR_BUILD='_PYTHON_PROJECT_BASE=$(abs_builddir) _PYTHON_HOST_PLATFORM=$(_PYTHON_HOST_PLATFORM) PYTHONPATH=$(srcdir)/Lib _PYTHON_SYSCONFIGDATA_NAME=_sysconfigdata_$(ABIFLAGS)_$(MACHDEP)_$(MULTIARCH) _PYTHON_SYSCONFIGDATA_PATH=$(shell test -f pybuilddir.txt && echo $(abs_builddir)/`cat pybuilddir.txt`) '$with_build_python
-     AC_MSG_RESULT([$with_build_python])
-   ], [
-     AS_VAR_IF([cross_compiling], [yes],
--- 
-2.39.5
-
diff --git a/package/python3/python3.hash b/package/python3/python3.hash
index 34e795b704..9ec306b4a1 100644
--- a/package/python3/python3.hash
+++ b/package/python3/python3.hash
@@ -1,5 +1,5 @@
 # From https://www.python.org/downloads/release/python-3129/
-md5  880942124f7d5c01e7b65cbad62dc873  Python-3.12.9.tar.xz
+md5  4c2d9202ab4db02c9d0999b14655dfe5  Python-3.13.2.tar.xz
 # Locally computed
-sha256  7220835d9f90b37c006e9842a8dff4580aaca4318674f947302b8d28f3f81112  Python-3.12.9.tar.xz
+sha256  d984bcc57cd67caab26f7def42e523b1c015bbc5dc07836cf4f0b63fa159eb56  Python-3.13.2.tar.xz
 sha256  3b2f81fe21d181c499c59a256c8e1968455d6689d269aa85373bfb6af41da3bf  LICENSE
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index b15c27053f..806617b8b6 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON3_VERSION_MAJOR = 3.12
-PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).9
+PYTHON3_VERSION_MAJOR = 3.13
+PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).2
 PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
 PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
 PYTHON3_LICENSE = Python-2.0, others
@@ -176,6 +176,7 @@ endif
 
 PYTHON3_CONF_ENV += \
 	ac_cv_have_long_long_format=yes \
+	ac_cv_buggy_getaddrinfo=no \
 	ac_cv_file__dev_ptmx=yes \
 	ac_cv_file__dev_ptc=yes \
 	ac_cv_working_tzset=yes \

base-commit: a93680be30bc35f7d2465ef576035fb937ea1d64
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
