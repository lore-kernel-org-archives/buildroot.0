Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BC6EC433F5
	for <buildroot@archiver.kernel.org>; Sat, 15 Jan 2022 15:38:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC93860AC5;
	Sat, 15 Jan 2022 15:38:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kx0kznSxaAKr; Sat, 15 Jan 2022 15:38:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 44E8B60B8A;
	Sat, 15 Jan 2022 15:38:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C5E271BF4E7
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 15:37:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AA7ED40883
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 15:37:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qEUWnLkiazXP for <buildroot@lists.busybox.net>;
 Sat, 15 Jan 2022 15:37:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 329EE40887
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 15:37:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id D6BA28147C; Sat, 15 Jan 2022 15:30:49 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 15 Jan 2022 16:25:34 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: e7f987493c49d56474682ac45b16be1b55cf1c32
X-Git-Newrev: 7b47598e7566fcc97d9819ffd745b936249ee0ee
X-Patchwork-Hint: ignore
Message-Id: <20220115153049.D6BA28147C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] package/python3: bump
 version to 3.9.9
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

commit: https://git.buildroot.net/buildroot/commit/?id=7b47598e7566fcc97d9819ffd745b936249ee0ee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

Drop 0030-Fix-cross-compiling-the-uuid-module.patch as the patched code has
been reworked upstream and python3 is built with --disable-uuid:

https://github.com/python/cpython/commit/91a51c5ffc3bd9da28a0000550530f6f2bcc25a2

Rework 0033-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch as
the MULTIARCH code is now conditional on !darwin:

https://github.com/python/cpython/commit/9901d153c201d852d27dc9d3074e283c26468f6d

Refresh and renumber remaining patches.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit ce81a6e6d2ee11b7cc23ad49252f5a696ab20299)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...1-Make-the-build-of-pyc-files-conditional.patch | 14 ++++----
 ...gy_getaddrinfo-configure-test-when-cross-.patch |  8 ++---
 ...ructure-to-disable-the-build-of-certain-e.patch | 18 +++++-----
 ...ibrary-header-paths-for-cross-compilation.patch |  4 +--
 ...n-t-look-in-usr-lib-termcap-for-libraries.patch |  8 ++---
 .../python3/0006-Don-t-add-multiarch-paths.patch   |  8 ++---
 .../0007-Abort-on-failed-module-build.patch        |  6 ++--
 package/python3/0008-Serial-ioctl-workaround.patch |  4 +--
 ...st-the-shebang-of-Python-scripts-for-cros.patch |  4 +--
 ...-config.sh.in-ensure-sed-invocations-only.patch |  4 +--
 ...stem-locale-and-set-to-default-when-addin.patch |  8 ++---
 ...0012-Add-importlib-fix-for-PEP-3147-issue.patch |  6 ++--
 ...on-to-disable-installation-of-test-module.patch | 14 ++++----
 .../0014-Add-an-option-to-disable-pydoc.patch      | 22 ++++++-------
 .../0015-Add-an-option-to-disable-lib2to3.patch    | 24 +++++++-------
 ...-Add-option-to-disable-the-sqlite3-module.patch | 16 ++++-----
 ...17-Add-an-option-to-disable-the-tk-module.patch | 16 ++++-----
 ...dd-an-option-to-disable-the-curses-module.patch | 14 ++++----
 .../0019-Add-an-option-to-disable-expat.patch      | 18 +++++-----
 .../0020-Add-an-option-to-disable-CJK-codecs.patch |  8 ++---
 .../0021-Add-an-option-to-disable-NIS.patch        |  8 ++---
 ...0022-Add-an-option-to-disable-unicodedata.patch |  8 ++---
 .../0023-Add-an-option-to-disable-IDLE.patch       | 20 ++++++------
 .../0024-Add-an-option-to-disable-decimal.patch    | 12 +++----
 ...-option-to-disable-the-ossaudiodev-module.patch |  8 ++---
 ...-Add-an-option-to-disable-openssl-support.patch |  8 ++---
 ...-an-option-to-disable-the-readline-module.patch |  8 ++---
 ...ions-to-disable-zlib-bzip2-and-xz-modules.patch |  8 ++---
 ...29-python-config.sh-don-t-reassign-prefix.patch |  4 +--
 ...030-Add-an-option-to-disable-uuid-module.patch} |  8 ++---
 .../0030-Fix-cross-compiling-the-uuid-module.patch | 38 ----------------------
 ...0031-fix-building-on-older-distributions.patch} |  4 +--
 ...-fixup-CC-print-multiarch-output-for-mus.patch} | 23 ++++++-------
 ...-option-to-disable-the-berkeleydb-module.patch} |  8 ++---
 ...libc-ng-doesn-t-set-errno-when-encryptio.patch} |  4 +--
 ...ry-iteration-error-in-_ExecutorManagerTh.patch} |  6 ++--
 package/python3/python3.hash                       |  6 ++--
 package/python3/python3.mk                         |  2 +-
 38 files changed, 185 insertions(+), 222 deletions(-)

diff --git a/package/python3/0001-Make-the-build-of-pyc-files-conditional.patch b/package/python3/0001-Make-the-build-of-pyc-files-conditional.patch
index 44902725d7..e40d8c8cd9 100644
--- a/package/python3/0001-Make-the-build-of-pyc-files-conditional.patch
+++ b/package/python3/0001-Make-the-build-of-pyc-files-conditional.patch
@@ -1,4 +1,4 @@
-From 322724e166d7ec0393aec577c12fdf6ef2b61e1d Mon Sep 17 00:00:00 2001
+From f63cc3031e775b556443c0f5b2725e530823dc49 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 22 Feb 2017 16:21:31 -0800
 Subject: [PATCH] Make the build of pyc files conditional
@@ -15,10 +15,10 @@ Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
  2 files changed, 8 insertions(+)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 77f91e72b1..0c809f3d8a 100644
+index 11230fa563..1ed9ad65d2 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1550,6 +1550,7 @@ libinstall:	build_all $(srcdir)/Modules/xxmodule.c
+@@ -1549,6 +1549,7 @@ libinstall:	build_all $(srcdir)/Modules/xxmodule.c
  		$(INSTALL_DATA) $(srcdir)/Modules/xxmodule.c \
  			$(DESTDIR)$(LIBDEST)/distutils/tests ; \
  	fi
@@ -26,7 +26,7 @@ index 77f91e72b1..0c809f3d8a 100644
  	-PYTHONPATH=$(DESTDIR)$(LIBDEST)  $(RUNSHARED) \
  		$(PYTHON_FOR_BUILD) -Wi $(DESTDIR)$(LIBDEST)/compileall.py \
  		-j0 -d $(LIBDEST) -f \
-@@ -1577,6 +1578,7 @@ libinstall:	build_all $(srcdir)/Modules/xxmodule.c
+@@ -1576,6 +1577,7 @@ libinstall:	build_all $(srcdir)/Modules/xxmodule.c
  		$(PYTHON_FOR_BUILD) -Wi -OO $(DESTDIR)$(LIBDEST)/compileall.py \
  		-j0 -d $(LIBDEST)/site-packages -f \
  		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
@@ -35,10 +35,10 @@ index 77f91e72b1..0c809f3d8a 100644
  		$(PYTHON_FOR_BUILD) -m lib2to3.pgen2.driver $(DESTDIR)$(LIBDEST)/lib2to3/Grammar.txt
  	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
 diff --git a/configure.ac b/configure.ac
-index d60f05251a..1ee5a09588 100644
+index 823252be69..4e08118c46 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1121,6 +1121,12 @@ fi
+@@ -1123,6 +1123,12 @@ fi
  
  AC_MSG_CHECKING(LDLIBRARY)
  
@@ -52,5 +52,5 @@ index d60f05251a..1ee5a09588 100644
  # library that we build, but we do not want to link against it (we
  # will find it with a -framework option). For this reason there is an
 -- 
-2.25.1
+2.20.1
 
diff --git a/package/python3/0002-Disable-buggy_getaddrinfo-configure-test-when-cross-.patch b/package/python3/0002-Disable-buggy_getaddrinfo-configure-test-when-cross-.patch
index 00177814cc..7ddbb8a28a 100644
--- a/package/python3/0002-Disable-buggy_getaddrinfo-configure-test-when-cross-.patch
+++ b/package/python3/0002-Disable-buggy_getaddrinfo-configure-test-when-cross-.patch
@@ -1,4 +1,4 @@
-From 72e20220f3a592b3ab9f440fbe74efa9f9e82d49 Mon Sep 17 00:00:00 2001
+From 7948fb08b18260811ce64806eec2bef465316b75 Mon Sep 17 00:00:00 2001
 From: Vanya Sergeev <vsergeev@gmail.com>
 Date: Wed, 23 Dec 2015 11:30:33 +0100
 Subject: [PATCH] Disable buggy_getaddrinfo configure test when cross-compiling
@@ -10,10 +10,10 @@ Signed-off-by: Vanya Sergeev <vsergeev@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 1ee5a09588..c2445edc88 100644
+index 4e08118c46..40b1f9bac1 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -4210,7 +4210,7 @@ fi
+@@ -4217,7 +4217,7 @@ fi
  
  AC_MSG_RESULT($ac_cv_buggy_getaddrinfo)
  
@@ -23,5 +23,5 @@ index 1ee5a09588..c2445edc88 100644
  	if test $ipv6 = yes
  	then
 -- 
-2.25.1
+2.20.1
 
diff --git a/package/python3/0003-Add-infrastructure-to-disable-the-build-of-certain-e.patch b/package/python3/0003-Add-infrastructure-to-disable-the-build-of-certain-e.patch
index 7cccc588e9..7f84f9a1e4 100644
--- a/package/python3/0003-Add-infrastructure-to-disable-the-build-of-certain-e.patch
+++ b/package/python3/0003-Add-infrastructure-to-disable-the-build-of-certain-e.patch
@@ -1,4 +1,4 @@
-From df7c95b4ceecf390b961d843a556c470ac9080b2 Mon Sep 17 00:00:00 2001
+From 9da015fd909bd50a24479bba9a94cb3d1228043d Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 22 Feb 2017 16:33:22 -0800
 Subject: [PATCH] Add infrastructure to disable the build of certain extensions
@@ -44,10 +44,10 @@ Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
  3 files changed, 11 insertions(+), 2 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 0c809f3d8a..7c3dde8dd4 100644
+index 1ed9ad65d2..6eacfd6961 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -216,6 +216,8 @@ FILEMODE=	644
+@@ -215,6 +215,8 @@ FILEMODE=	644
  # configure script arguments
  CONFIG_ARGS=	@CONFIG_ARGS@
  
@@ -56,7 +56,7 @@ index 0c809f3d8a..7c3dde8dd4 100644
  
  # Subdirectories with code
  SRCDIRS= 	@SRCDIRS@
-@@ -632,6 +634,7 @@ sharedmods: $(BUILDPYTHON) pybuilddir.txt Modules/_math.o
+@@ -631,6 +633,7 @@ sharedmods: $(BUILDPYTHON) pybuilddir.txt Modules/_math.o
  	esac; \
  	echo "$(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' \
  		_TCLTK_INCLUDES='$(TCLTK_INCLUDES)' _TCLTK_LIBS='$(TCLTK_LIBS)' \
@@ -64,7 +64,7 @@ index 0c809f3d8a..7c3dde8dd4 100644
  		$(PYTHON_FOR_BUILD) $(srcdir)/setup.py $$quiet build"; \
  	$(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' \
  		_TCLTK_INCLUDES='$(TCLTK_INCLUDES)' _TCLTK_LIBS='$(TCLTK_LIBS)' \
-@@ -1696,7 +1699,8 @@ libainstall:	@DEF_MAKE_RULE@ python-config
+@@ -1695,7 +1698,8 @@ libainstall:	@DEF_MAKE_RULE@ python-config
  # Install the dynamically loadable modules
  # This goes into $(exec_prefix)
  sharedinstall: sharedmods
@@ -75,10 +75,10 @@ index 0c809f3d8a..7c3dde8dd4 100644
  		--install-scripts=$(BINDIR) \
  		--install-platlib=$(DESTSHARED) \
 diff --git a/configure.ac b/configure.ac
-index c2445edc88..73d66167de 100644
+index 40b1f9bac1..5b897d8e46 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3081,6 +3081,8 @@ LIBS="$withval $LIBS"
+@@ -3088,6 +3088,8 @@ LIBS="$withval $LIBS"
  
  PKG_PROG_PKG_CONFIG
  
@@ -88,7 +88,7 @@ index c2445edc88..73d66167de 100644
  AC_MSG_CHECKING(for --with-system-expat)
  AC_ARG_WITH(system_expat,
 diff --git a/setup.py b/setup.py
-index 770866bca7..b6c829b3a5 100644
+index 9a5887b59f..b88d0bb007 100644
 --- a/setup.py
 +++ b/setup.py
 @@ -44,7 +44,10 @@ from distutils.spawn import find_executable
@@ -104,5 +104,5 @@ index 770866bca7..b6c829b3a5 100644
  
  def get_platform():
 -- 
-2.25.1
+2.20.1
 
diff --git a/package/python3/0004-Adjust-library-header-paths-for-cross-compilation.patch b/package/python3/0004-Adjust-library-header-paths-for-cross-compilation.patch
index 24f369f87f..d64e881379 100644
--- a/package/python3/0004-Adjust-library-header-paths-for-cross-compilation.patch
+++ b/package/python3/0004-Adjust-library-header-paths-for-cross-compilation.patch
@@ -1,4 +1,4 @@
-From 61af65485f1dade4aa08d0cf2b24082aeda24c51 Mon Sep 17 00:00:00 2001
+From 8d2bc6a84a253c7ba2995a3e3be17ea113c228e2 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 23 Dec 2015 11:33:14 +0100
 Subject: [PATCH] Adjust library/header paths for cross-compilation
@@ -63,5 +63,5 @@ index 37feae5df7..e9c3a27856 100644
  # Path to the base directory of the project. On Windows the binary may
  # live in project/PCbuild/win32 or project/PCbuild/amd64.
 -- 
-2.25.1
+2.20.1
 
diff --git a/package/python3/0005-Don-t-look-in-usr-lib-termcap-for-libraries.patch b/package/python3/0005-Don-t-look-in-usr-lib-termcap-for-libraries.patch
index c5abcfd786..2ea2d1d9d6 100644
--- a/package/python3/0005-Don-t-look-in-usr-lib-termcap-for-libraries.patch
+++ b/package/python3/0005-Don-t-look-in-usr-lib-termcap-for-libraries.patch
@@ -1,4 +1,4 @@
-From 60d71e37d167ea89445250be436170a6cfee84e7 Mon Sep 17 00:00:00 2001
+From 09c17b0194209cae8e057866670e4f4039a5be16 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 23 Dec 2015 11:36:00 +0100
 Subject: [PATCH] Don't look in /usr/lib/termcap for libraries
@@ -9,10 +9,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  1 file changed, 1 insertion(+), 4 deletions(-)
 
 diff --git a/setup.py b/setup.py
-index b6c829b3a5..ec3ba60607 100644
+index b88d0bb007..254c351519 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -1041,12 +1041,9 @@ class PyBuildExt(build_ext):
+@@ -1044,12 +1044,9 @@ class PyBuildExt(build_ext):
                  pass # Issue 7384: Already linked against curses or tinfo.
              elif curses_library:
                  readline_libs.append(curses_library)
@@ -27,5 +27,5 @@ index b6c829b3a5..ec3ba60607 100644
                                 libraries=readline_libs))
          else:
 -- 
-2.25.1
+2.20.1
 
diff --git a/package/python3/0006-Don-t-add-multiarch-paths.patch b/package/python3/0006-Don-t-add-multiarch-paths.patch
index bb861612b1..23424d86d3 100644
--- a/package/python3/0006-Don-t-add-multiarch-paths.patch
+++ b/package/python3/0006-Don-t-add-multiarch-paths.patch
@@ -1,4 +1,4 @@
-From f5933b8f973cd11698b52d535a10d0474e49f5a5 Mon Sep 17 00:00:00 2001
+From e87dececb9bc2f4b1cba7f31d67ca2aaecbb52d8 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 23 Dec 2015 11:36:27 +0100
 Subject: [PATCH] Don't add multiarch paths
@@ -17,10 +17,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/setup.py b/setup.py
-index ec3ba60607..e27620035c 100644
+index 254c351519..5bf39f8a51 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -734,10 +734,10 @@ class PyBuildExt(build_ext):
+@@ -737,10 +737,10 @@ class PyBuildExt(build_ext):
          if not CROSS_COMPILING:
              add_dir_to_list(self.compiler.library_dirs, '/usr/local/lib')
              add_dir_to_list(self.compiler.include_dirs, '/usr/local/include')
@@ -33,5 +33,5 @@ index ec3ba60607..e27620035c 100644
  
      def init_inc_lib_dirs(self):
 -- 
-2.25.1
+2.20.1
 
diff --git a/package/python3/0007-Abort-on-failed-module-build.patch b/package/python3/0007-Abort-on-failed-module-build.patch
index 856fcaac21..7e0dfad115 100644
--- a/package/python3/0007-Abort-on-failed-module-build.patch
+++ b/package/python3/0007-Abort-on-failed-module-build.patch
@@ -1,4 +1,4 @@
-From 188c0ebfdb71f5252fa7701013b8d1209f28aef7 Mon Sep 17 00:00:00 2001
+From cb4a3bc238ffbc8389c2820f24e72c2b36422b3f Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 23 Dec 2015 11:43:24 +0100
 Subject: [PATCH] Abort on failed module build
@@ -14,7 +14,7 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/setup.py b/setup.py
-index e27620035c..d3f0e663f2 100644
+index 5bf39f8a51..36d94432da 100644
 --- a/setup.py
 +++ b/setup.py
 @@ -524,6 +524,7 @@ class PyBuildExt(build_ext):
@@ -26,5 +26,5 @@ index e27620035c..d3f0e663f2 100644
          if self.failed_on_import:
              failed = self.failed_on_import[:]
 -- 
-2.25.1
+2.20.1
 
diff --git a/package/python3/0008-Serial-ioctl-workaround.patch b/package/python3/0008-Serial-ioctl-workaround.patch
index df31cd6220..568dcd9503 100644
--- a/package/python3/0008-Serial-ioctl-workaround.patch
+++ b/package/python3/0008-Serial-ioctl-workaround.patch
@@ -1,4 +1,4 @@
-From 9e6211b0d6d4610e5fb7d2c7e1152eb7c64d968b Mon Sep 17 00:00:00 2001
+From 0b62a3634d343e4e3be6541d298d58eb81cf1458 Mon Sep 17 00:00:00 2001
 From: Baruch Siach <baruch@tkos.co.il>
 Date: Wed, 23 Dec 2015 11:44:02 +0100
 Subject: [PATCH] Serial ioctl() workaround
@@ -29,5 +29,5 @@ index 75e5e52320..eefbddfe69 100644
  /* HP-UX requires that this be included to pick up MDCD, MCTS, MDSR,
   * MDTR, MRI, and MRTS (apparently used internally by some things
 -- 
-2.25.1
+2.20.1
 
diff --git a/package/python3/0009-Do-not-adjust-the-shebang-of-Python-scripts-for-cros.patch b/package/python3/0009-Do-not-adjust-the-shebang-of-Python-scripts-for-cros.patch
index 8a77fe3708..2bb1d7e2ff 100644
--- a/package/python3/0009-Do-not-adjust-the-shebang-of-Python-scripts-for-cros.patch
+++ b/package/python3/0009-Do-not-adjust-the-shebang-of-Python-scripts-for-cros.patch
@@ -1,4 +1,4 @@
-From cb595a591c71e0bf7c63a3706b0be45ac6a642e3 Mon Sep 17 00:00:00 2001
+From 64bdc89106e6bd76e9b204d9cfef0adb7bfb0f4a Mon Sep 17 00:00:00 2001
 From: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
 Date: Wed, 23 Dec 2015 11:44:30 +0100
 Subject: [PATCH] Do not adjust the shebang of Python scripts for
@@ -31,5 +31,5 @@ index ccc70e6465..d6d54195c1 100644
                           self.build_dir)
                  updated_files.append(outfile)
 -- 
-2.25.1
+2.20.1
 
diff --git a/package/python3/0010-Misc-python-config.sh.in-ensure-sed-invocations-only.patch b/package/python3/0010-Misc-python-config.sh.in-ensure-sed-invocations-only.patch
index a1f9ab6cd9..cdacfd5b51 100644
--- a/package/python3/0010-Misc-python-config.sh.in-ensure-sed-invocations-only.patch
+++ b/package/python3/0010-Misc-python-config.sh.in-ensure-sed-invocations-only.patch
@@ -1,4 +1,4 @@
-From eb51497e4b5799f8ab0277426d3e54414acb9d4b Mon Sep 17 00:00:00 2001
+From e9f8466944c5000d9b43d25d38ef9eaa8cb0afae Mon Sep 17 00:00:00 2001
 From: Peter Korsgaard <peter@korsgaard.com>
 Date: Thu, 20 Nov 2014 13:24:59 +0100
 Subject: [PATCH] Misc/python-config.sh.in: ensure sed invocations only match
@@ -63,5 +63,5 @@ index 2602fe24c0..a1bc3cd5f7 100644
  PYTHONFRAMEWORK="@PYTHONFRAMEWORK@"
  INCDIR="-I$includedir/python${VERSION}${ABIFLAGS}"
 -- 
-2.25.1
+2.20.1
 
diff --git a/package/python3/0011-Override-system-locale-and-set-to-default-when-addin.patch b/package/python3/0011-Override-system-locale-and-set-to-default-when-addin.patch
index 8b0d4f4c4d..8c3ddd0042 100644
--- a/package/python3/0011-Override-system-locale-and-set-to-default-when-addin.patch
+++ b/package/python3/0011-Override-system-locale-and-set-to-default-when-addin.patch
@@ -1,4 +1,4 @@
-From e4ae670e3489544a49dabd1618c32fe73504a7ba Mon Sep 17 00:00:00 2001
+From 6615a314ac7a2bc7efea945677934d6afd3b61d6 Mon Sep 17 00:00:00 2001
 From: Samuel Cabrero <samuelcabrero@gmail.com>
 Date: Wed, 23 Dec 2015 11:45:48 +0100
 Subject: [PATCH] Override system locale and set to default when adding gcc
@@ -22,10 +22,10 @@ Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/setup.py b/setup.py
-index d3f0e663f2..926c16f58f 100644
+index 36d94432da..506f6107de 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -680,7 +680,7 @@ class PyBuildExt(build_ext):
+@@ -683,7 +683,7 @@ class PyBuildExt(build_ext):
          tmpfile = os.path.join(self.build_temp, 'ccpaths')
          if not os.path.exists(self.build_temp):
              os.makedirs(self.build_temp)
@@ -35,5 +35,5 @@ index d3f0e663f2..926c16f58f 100644
          is_clang = False
          in_incdirs = False
 -- 
-2.25.1
+2.20.1
 
diff --git a/package/python3/0012-Add-importlib-fix-for-PEP-3147-issue.patch b/package/python3/0012-Add-importlib-fix-for-PEP-3147-issue.patch
index 7a885303cb..5cb7c85246 100644
--- a/package/python3/0012-Add-importlib-fix-for-PEP-3147-issue.patch
+++ b/package/python3/0012-Add-importlib-fix-for-PEP-3147-issue.patch
@@ -1,4 +1,4 @@
-From e2ea659eac1849db471d3c01a0d0af9d6fca2e9a Mon Sep 17 00:00:00 2001
+From cda5c7447403440d679a3cd29d8dc38bb15eca33 Mon Sep 17 00:00:00 2001
 From: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
 Date: Wed, 22 Feb 2017 16:48:49 -0800
 Subject: [PATCH] Add importlib fix for PEP 3147 issue
@@ -25,7 +25,7 @@ Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
  1 file changed, 5 insertions(+), 39 deletions(-)
 
 diff --git a/Lib/importlib/_bootstrap_external.py b/Lib/importlib/_bootstrap_external.py
-index 25a3f8c0e0..2cb9a9aa52 100644
+index fe31f437da..71e64aef30 100644
 --- a/Lib/importlib/_bootstrap_external.py
 +++ b/Lib/importlib/_bootstrap_external.py
 @@ -373,8 +373,6 @@ def cache_from_source(path, debug_override=None, *, optimization=None):
@@ -101,5 +101,5 @@ index 25a3f8c0e0..2cb9a9aa52 100644
  
  
 -- 
-2.25.1
+2.20.1
 
diff --git a/package/python3/0013-Add-an-option-to-disable-installation-of-test-module.patch b/package/python3/0013-Add-an-option-to-disable-installation-of-test-module.patch
index 8c1b989361..6cbffdf9e0 100644
--- a/package/python3/0013-Add-an-option-to-disable-installation-of-test-module.patch
+++ b/package/python3/0013-Add-an-option-to-disable-installation-of-test-module.patch
@@ -1,4 +1,4 @@
-From 0337342d413d13f437fd089de91faee70a8bf3f9 Mon Sep 17 00:00:00 2001
+From 5c6722b6790ee6b8828a7f8a90b7fd173b77867f Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 22 Feb 2017 17:01:18 -0800
 Subject: [PATCH] Add an option to disable installation of test modules
@@ -18,10 +18,10 @@ Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
  2 files changed, 42 insertions(+), 19 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 7c3dde8dd4..204f293d53 100644
+index 6eacfd6961..bbc779ee6a 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1406,8 +1406,29 @@ maninstall:	altmaninstall
+@@ -1405,8 +1405,29 @@ maninstall:	altmaninstall
  
  # Install the library
  XMLLIBSUBDIRS=  xml xml/dom xml/etree xml/parsers xml/sax
@@ -53,7 +53,7 @@ index 7c3dde8dd4..204f293d53 100644
  		test/audiodata \
  		test/capath test/data \
  		test/cjkencodings test/decimaltestdata \
-@@ -1468,28 +1489,25 @@ LIBSUBDIRS=	tkinter tkinter/test tkinter/test/test_tkinter \
+@@ -1467,28 +1488,25 @@ LIBSUBDIRS=	tkinter tkinter/test tkinter/test/test_tkinter \
  		test/test_importlib/zipdata02 \
  		test/test_zoneinfo test/test_zoneinfo/data \
  		test/ziptestdata \
@@ -97,10 +97,10 @@ index 7c3dde8dd4..204f293d53 100644
  	@for i in $(SCRIPTDIR) $(LIBDEST); \
  	do \
 diff --git a/configure.ac b/configure.ac
-index 73d66167de..92e28d02ee 100644
+index 5b897d8e46..bebad207f8 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3358,6 +3358,11 @@ if test "$posix_threads" = "yes"; then
+@@ -3365,6 +3365,11 @@ if test "$posix_threads" = "yes"; then
        AC_CHECK_FUNCS(pthread_getcpuclockid)
  fi
  
@@ -113,5 +113,5 @@ index 73d66167de..92e28d02ee 100644
  # Check for enable-ipv6
  AH_TEMPLATE(ENABLE_IPV6, [Define if --enable-ipv6 is specified])
 -- 
-2.25.1
+2.20.1
 
diff --git a/package/python3/0014-Add-an-option-to-disable-pydoc.patch b/package/python3/0014-Add-an-option-to-disable-pydoc.patch
index 0c928a0bb2..66b05d5e52 100644
--- a/package/python3/0014-Add-an-option-to-disable-pydoc.patch
+++ b/package/python3/0014-Add-an-option-to-disable-pydoc.patch
@@ -1,4 +1,4 @@
-From a65e5d3caf8e076d531191164c23c6240461f675 Mon Sep 17 00:00:00 2001
+From 57e14d395860a781d0b43b1ef3e2a4a8b04bbf80 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 22 Feb 2017 17:07:56 -0800
 Subject: [PATCH] Add an option to disable pydoc
@@ -17,10 +17,10 @@ Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
  3 files changed, 20 insertions(+), 3 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 204f293d53..63e3df0470 100644
+index bbc779ee6a..dd83413f17 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1374,7 +1374,9 @@ bininstall: altbininstall
+@@ -1373,7 +1373,9 @@ bininstall: altbininstall
  	-rm -f $(DESTDIR)$(BINDIR)/idle3
  	(cd $(DESTDIR)$(BINDIR); $(LN) -s idle$(VERSION) idle3)
  	-rm -f $(DESTDIR)$(BINDIR)/pydoc3
@@ -30,7 +30,7 @@ index 204f293d53..63e3df0470 100644
  	-rm -f $(DESTDIR)$(BINDIR)/2to3
  	(cd $(DESTDIR)$(BINDIR); $(LN) -s 2to3-$(VERSION) 2to3)
  	if test "x$(LIPO_32BIT_FLAGS)" != "x" ; then \
-@@ -1424,7 +1426,7 @@ LIBSUBDIRS=	tkinter site-packages \
+@@ -1423,7 +1425,7 @@ LIBSUBDIRS=	tkinter site-packages \
  		multiprocessing multiprocessing/dummy \
  		unittest \
  		venv venv/scripts venv/scripts/common venv/scripts/posix \
@@ -39,7 +39,7 @@ index 204f293d53..63e3df0470 100644
  		zoneinfo
  
  TESTSUBDIRS=	tkinter/test tkinter/test/test_tkinter \
-@@ -1508,6 +1510,10 @@ ifeq (@TEST_MODULES@,yes)
+@@ -1507,6 +1509,10 @@ ifeq (@TEST_MODULES@,yes)
  LIBSUBDIRS += $(TESTSUBDIRS)
  endif
  
@@ -51,10 +51,10 @@ index 204f293d53..63e3df0470 100644
  	@for i in $(SCRIPTDIR) $(LIBDEST); \
  	do \
 diff --git a/configure.ac b/configure.ac
-index 92e28d02ee..174ed85a7c 100644
+index bebad207f8..b748ad7957 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3358,6 +3358,12 @@ if test "$posix_threads" = "yes"; then
+@@ -3365,6 +3365,12 @@ if test "$posix_threads" = "yes"; then
        AC_CHECK_FUNCS(pthread_getcpuclockid)
  fi
  
@@ -68,10 +68,10 @@ index 92e28d02ee..174ed85a7c 100644
  
  AC_ARG_ENABLE(test-modules,
 diff --git a/setup.py b/setup.py
-index 926c16f58f..1fc5fac90c 100644
+index 506f6107de..dcbc109c30 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -2565,6 +2565,12 @@ def main():
+@@ -2572,6 +2572,12 @@ def main():
      # turn off warnings when deprecated modules are imported
      import warnings
      warnings.filterwarnings("ignore",category=DeprecationWarning)
@@ -84,7 +84,7 @@ index 926c16f58f..1fc5fac90c 100644
      setup(# PyPI Metadata (PEP 301)
            name = "Python",
            version = sys.version.split()[0],
-@@ -2589,8 +2595,7 @@ def main():
+@@ -2596,8 +2602,7 @@ def main():
            # If you change the scripts installed here, you also need to
            # check the PyBuildScripts command above, and change the links
            # created by the bininstall target in Makefile.pre.in
@@ -95,5 +95,5 @@ index 926c16f58f..1fc5fac90c 100644
  
  # --install-platlib
 -- 
-2.25.1
+2.20.1
 
diff --git a/package/python3/0015-Add-an-option-to-disable-lib2to3.patch b/package/python3/0015-Add-an-option-to-disable-lib2to3.patch
index fe94cdfded..5e30e53788 100644
--- a/package/python3/0015-Add-an-option-to-disable-lib2to3.patch
+++ b/package/python3/0015-Add-an-option-to-disable-lib2to3.patch
@@ -1,4 +1,4 @@
-From f034b1b0f33a7bd4dde23f0bc1fa8e00e3518c9d Mon Sep 17 00:00:00 2001
+From bc0681be87109e3e5c35e0bdd225143607350fb6 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 22 Feb 2017 17:15:31 -0800
 Subject: [PATCH] Add an option to disable lib2to3
@@ -17,10 +17,10 @@ Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
  3 files changed, 21 insertions(+), 6 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 63e3df0470..8b7de12999 100644
+index dd83413f17..6324970733 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1378,7 +1378,9 @@ ifeq (@PYDOC@,yes)
+@@ -1377,7 +1377,9 @@ ifeq (@PYDOC@,yes)
  	(cd $(DESTDIR)$(BINDIR); $(LN) -s pydoc$(VERSION) pydoc3)
  endif
  	-rm -f $(DESTDIR)$(BINDIR)/2to3
@@ -30,7 +30,7 @@ index 63e3df0470..8b7de12999 100644
  	if test "x$(LIPO_32BIT_FLAGS)" != "x" ; then \
  		rm -f $(DESTDIR)$(BINDIR)/python3-32$(EXE); \
  		(cd $(DESTDIR)$(BINDIR); $(LN) -s python$(VERSION)-32$(EXE) python3-32$(EXE)) \
-@@ -1417,7 +1419,6 @@ LIBSUBDIRS=	tkinter site-packages \
+@@ -1416,7 +1418,6 @@ LIBSUBDIRS=	tkinter site-packages \
  		html json http dbm xmlrpc \
  		sqlite3 \
  		logging csv wsgiref urllib \
@@ -38,7 +38,7 @@ index 63e3df0470..8b7de12999 100644
  		ctypes ctypes/macholib \
  		idlelib idlelib/Icons \
  		distutils distutils/command $(XMLLIBSUBDIRS) \
-@@ -1495,9 +1496,6 @@ TESTSUBDIRS=	tkinter/test tkinter/test/test_tkinter \
+@@ -1494,9 +1495,6 @@ TESTSUBDIRS=	tkinter/test tkinter/test/test_tkinter \
  		test/test_email test/test_email/data \
  		test/test_json \
  		sqlite3/test \
@@ -48,7 +48,7 @@ index 63e3df0470..8b7de12999 100644
  		ctypes/test \
  		idlelib/idle_test \
  		distutils/tests \
-@@ -1506,6 +1504,14 @@ TESTSUBDIRS=	tkinter/test tkinter/test/test_tkinter \
+@@ -1505,6 +1503,14 @@ TESTSUBDIRS=	tkinter/test tkinter/test/test_tkinter \
  		test/test_tools test/test_warnings test/test_warnings/data \
  		unittest/test unittest/test/testmock
  
@@ -63,7 +63,7 @@ index 63e3df0470..8b7de12999 100644
  ifeq (@TEST_MODULES@,yes)
  LIBSUBDIRS += $(TESTSUBDIRS)
  endif
-@@ -1606,10 +1612,12 @@ ifeq (@PYC_BUILD@,yes)
+@@ -1605,10 +1611,12 @@ ifeq (@PYC_BUILD@,yes)
  		-j0 -d $(LIBDEST)/site-packages -f \
  		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
  endif
@@ -77,10 +77,10 @@ index 63e3df0470..8b7de12999 100644
  # bpo-21536: Misc/python-config.sh is generated in the build directory
  # from $(srcdir)Misc/python-config.sh.in.
 diff --git a/configure.ac b/configure.ac
-index 174ed85a7c..f1f5e9a7b0 100644
+index b748ad7957..58e9a8fe7a 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3370,6 +3370,12 @@ AC_ARG_ENABLE(test-modules,
+@@ -3377,6 +3377,12 @@ AC_ARG_ENABLE(test-modules,
  	AS_HELP_STRING([--disable-test-modules], [disable test modules]),
  	[ TEST_MODULES="${enableval}" ], [ TEST_MODULES=yes ])
  
@@ -94,10 +94,10 @@ index 174ed85a7c..f1f5e9a7b0 100644
  AH_TEMPLATE(ENABLE_IPV6, [Define if --enable-ipv6 is specified])
  AC_MSG_CHECKING([if --enable-ipv6 is specified])
 diff --git a/setup.py b/setup.py
-index 1fc5fac90c..4063d7ffa5 100644
+index dcbc109c30..8d6348f560 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -2566,10 +2566,11 @@ def main():
+@@ -2573,10 +2573,11 @@ def main():
      import warnings
      warnings.filterwarnings("ignore",category=DeprecationWarning)
  
@@ -112,5 +112,5 @@ index 1fc5fac90c..4063d7ffa5 100644
      setup(# PyPI Metadata (PEP 301)
            name = "Python",
 -- 
-2.25.1
+2.20.1
 
diff --git a/package/python3/0016-Add-option-to-disable-the-sqlite3-module.patch b/package/python3/0016-Add-option-to-disable-the-sqlite3-module.patch
index d6c9bccd45..0208bce231 100644
--- a/package/python3/0016-Add-option-to-disable-the-sqlite3-module.patch
+++ b/package/python3/0016-Add-option-to-disable-the-sqlite3-module.patch
@@ -1,4 +1,4 @@
-From dd2722dec08eb9c72c36313e93661eeca3ad64d8 Mon Sep 17 00:00:00 2001
+From fdef81b6f4280eb26bc620ed8dd3c4dc2018dd29 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 22 Feb 2017 17:20:45 -0800
 Subject: [PATCH] Add option to disable the sqlite3 module
@@ -13,10 +13,10 @@ Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
  2 files changed, 14 insertions(+), 2 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 8b7de12999..d826d8ac4b 100644
+index 6324970733..f700b780fb 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1417,7 +1417,6 @@ LIBSUBDIRS=	tkinter site-packages \
+@@ -1416,7 +1416,6 @@ LIBSUBDIRS=	tkinter site-packages \
  		email email/mime \
  		ensurepip ensurepip/_bundled \
  		html json http dbm xmlrpc \
@@ -24,7 +24,7 @@ index 8b7de12999..d826d8ac4b 100644
  		logging csv wsgiref urllib \
  		ctypes ctypes/macholib \
  		idlelib idlelib/Icons \
-@@ -1495,7 +1494,6 @@ TESTSUBDIRS=	tkinter/test tkinter/test/test_tkinter \
+@@ -1494,7 +1493,6 @@ TESTSUBDIRS=	tkinter/test tkinter/test/test_tkinter \
  		test/test_asyncio \
  		test/test_email test/test_email/data \
  		test/test_json \
@@ -32,7 +32,7 @@ index 8b7de12999..d826d8ac4b 100644
  		ctypes/test \
  		idlelib/idle_test \
  		distutils/tests \
-@@ -1512,6 +1510,11 @@ TESTSUBDIRS += lib2to3/tests			\
+@@ -1511,6 +1509,11 @@ TESTSUBDIRS += lib2to3/tests			\
  	lib2to3/tests/data/fixers/myfixes
  endif
  
@@ -45,10 +45,10 @@ index 8b7de12999..d826d8ac4b 100644
  LIBSUBDIRS += $(TESTSUBDIRS)
  endif
 diff --git a/configure.ac b/configure.ac
-index f1f5e9a7b0..8b5c65974c 100644
+index 58e9a8fe7a..644ed6d895 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3358,6 +3358,15 @@ if test "$posix_threads" = "yes"; then
+@@ -3365,6 +3365,15 @@ if test "$posix_threads" = "yes"; then
        AC_CHECK_FUNCS(pthread_getcpuclockid)
  fi
  
@@ -65,5 +65,5 @@ index f1f5e9a7b0..8b5c65974c 100644
  
  AC_ARG_ENABLE(pydoc,
 -- 
-2.25.1
+2.20.1
 
diff --git a/package/python3/0017-Add-an-option-to-disable-the-tk-module.patch b/package/python3/0017-Add-an-option-to-disable-the-tk-module.patch
index b798eb56a5..b3a4d202e8 100644
--- a/package/python3/0017-Add-an-option-to-disable-the-tk-module.patch
+++ b/package/python3/0017-Add-an-option-to-disable-the-tk-module.patch
@@ -1,4 +1,4 @@
-From ad6b66b34f71ff6b60b3be5f6fd3e781cdeecd59 Mon Sep 17 00:00:00 2001
+From 8b77e7ce6723e11c1891befe7e6413d8328e8f67 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 22 Feb 2017 17:23:42 -0800
 Subject: [PATCH] Add an option to disable the tk module
@@ -13,10 +13,10 @@ Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
  2 files changed, 17 insertions(+), 3 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index d826d8ac4b..dc84384680 100644
+index f700b780fb..4fcf8b5a96 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1411,7 +1411,7 @@ maninstall:	altmaninstall
+@@ -1410,7 +1410,7 @@ maninstall:	altmaninstall
  # Install the library
  XMLLIBSUBDIRS=  xml xml/dom xml/etree xml/parsers xml/sax
  
@@ -25,7 +25,7 @@ index d826d8ac4b..dc84384680 100644
  		asyncio \
  		collections concurrent concurrent/futures encodings \
  		email email/mime \
-@@ -1429,8 +1429,7 @@ LIBSUBDIRS=	tkinter site-packages \
+@@ -1428,8 +1428,7 @@ LIBSUBDIRS=	tkinter site-packages \
  		curses \
  		zoneinfo
  
@@ -35,7 +35,7 @@ index d826d8ac4b..dc84384680 100644
  		test/audiodata \
  		test/capath test/data \
  		test/cjkencodings test/decimaltestdata \
-@@ -1502,6 +1501,12 @@ TESTSUBDIRS=	tkinter/test tkinter/test/test_tkinter \
+@@ -1501,6 +1500,12 @@ TESTSUBDIRS=	tkinter/test tkinter/test/test_tkinter \
  		test/test_tools test/test_warnings test/test_warnings/data \
  		unittest/test unittest/test/testmock
  
@@ -49,10 +49,10 @@ index d826d8ac4b..dc84384680 100644
  LIBSUBDIRS += lib2to3 lib2to3/fixes lib2to3/pgen2
  TESTSUBDIRS += lib2to3/tests			\
 diff --git a/configure.ac b/configure.ac
-index 8b5c65974c..4c72dae960 100644
+index 644ed6d895..a4d06dcb50 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3367,6 +3367,15 @@ if test "$SQLITE3" = "no" ; then
+@@ -3374,6 +3374,15 @@ if test "$SQLITE3" = "no" ; then
     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _sqlite3"
  fi
  
@@ -69,5 +69,5 @@ index 8b5c65974c..4c72dae960 100644
  
  AC_ARG_ENABLE(pydoc,
 -- 
-2.25.1
+2.20.1
 
diff --git a/package/python3/0018-Add-an-option-to-disable-the-curses-module.patch b/package/python3/0018-Add-an-option-to-disable-the-curses-module.patch
index 93dfac26ec..16d2c1d383 100644
--- a/package/python3/0018-Add-an-option-to-disable-the-curses-module.patch
+++ b/package/python3/0018-Add-an-option-to-disable-the-curses-module.patch
@@ -1,4 +1,4 @@
-From 962deb43f5f340a8472d432ae8e6d61186f9040e Mon Sep 17 00:00:00 2001
+From 7dea1b79fbb905dd69862862f327cc0f25cd93c2 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 22 Feb 2017 17:31:51 -0800
 Subject: [PATCH] Add an option to disable the curses module
@@ -13,10 +13,10 @@ Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
  2 files changed, 13 insertions(+), 1 deletion(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index dc84384680..2a82f3308f 100644
+index 4fcf8b5a96..2e45a41140 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1426,7 +1426,6 @@ LIBSUBDIRS=	site-packages \
+@@ -1425,7 +1425,6 @@ LIBSUBDIRS=	site-packages \
  		multiprocessing multiprocessing/dummy \
  		unittest \
  		venv venv/scripts venv/scripts/common venv/scripts/posix \
@@ -24,7 +24,7 @@ index dc84384680..2a82f3308f 100644
  		zoneinfo
  
  TESTSUBDIRS=	test \
-@@ -1507,6 +1506,10 @@ TESTSUBDIRS += tkinter/test tkinter/test/test_tkinter \
+@@ -1506,6 +1505,10 @@ TESTSUBDIRS += tkinter/test tkinter/test/test_tkinter \
  	tkinter/test/test_ttk
  endif
  
@@ -36,10 +36,10 @@ index dc84384680..2a82f3308f 100644
  LIBSUBDIRS += lib2to3 lib2to3/fixes lib2to3/pgen2
  TESTSUBDIRS += lib2to3/tests			\
 diff --git a/configure.ac b/configure.ac
-index 4c72dae960..acd98381a3 100644
+index a4d06dcb50..f034cd4bcb 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3376,6 +3376,15 @@ if test "$TK" = "no"; then
+@@ -3383,6 +3383,15 @@ if test "$TK" = "no"; then
     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _tkinter"
  fi
  
@@ -56,5 +56,5 @@ index 4c72dae960..acd98381a3 100644
  
  AC_ARG_ENABLE(pydoc,
 -- 
-2.25.1
+2.20.1
 
diff --git a/package/python3/0019-Add-an-option-to-disable-expat.patch b/package/python3/0019-Add-an-option-to-disable-expat.patch
index e7349058c8..79e86bd85a 100644
--- a/package/python3/0019-Add-an-option-to-disable-expat.patch
+++ b/package/python3/0019-Add-an-option-to-disable-expat.patch
@@ -1,4 +1,4 @@
-From 7e0e7dc25f50acd6922493ae620ee5cbf107a79a Mon Sep 17 00:00:00 2001
+From e86dc4209f71d6dc4bfa74fcc2c963b678def39f Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 22 Feb 2017 17:40:45 -0800
 Subject: [PATCH] Add an option to disable expat
@@ -20,10 +20,10 @@ Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
  3 files changed, 19 insertions(+), 7 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 2a82f3308f..e678c8817e 100644
+index 2e45a41140..4981087723 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1420,7 +1420,7 @@ LIBSUBDIRS=	site-packages \
+@@ -1419,7 +1419,7 @@ LIBSUBDIRS=	site-packages \
  		logging csv wsgiref urllib \
  		ctypes ctypes/macholib \
  		idlelib idlelib/Icons \
@@ -32,7 +32,7 @@ index 2a82f3308f..e678c8817e 100644
  		importlib \
  		turtledemo \
  		multiprocessing multiprocessing/dummy \
-@@ -1510,6 +1510,10 @@ ifeq (@CURSES@,yes)
+@@ -1509,6 +1509,10 @@ ifeq (@CURSES@,yes)
  LIBSUBDIRS += curses
  endif
  
@@ -44,10 +44,10 @@ index 2a82f3308f..e678c8817e 100644
  LIBSUBDIRS += lib2to3 lib2to3/fixes lib2to3/pgen2
  TESTSUBDIRS += lib2to3/tests			\
 diff --git a/configure.ac b/configure.ac
-index acd98381a3..9ef0ecd42f 100644
+index f034cd4bcb..c90c92c2de 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3084,13 +3084,21 @@ PKG_PROG_PKG_CONFIG
+@@ -3091,13 +3091,21 @@ PKG_PROG_PKG_CONFIG
  AC_SUBST(DISABLED_EXTENSIONS)
  
  # Check for use of the system expat library
@@ -75,10 +75,10 @@ index acd98381a3..9ef0ecd42f 100644
  # Check for use of the system libffi library
  AC_MSG_CHECKING(for --with-system-ffi)
 diff --git a/setup.py b/setup.py
-index 4063d7ffa5..211a160f29 100644
+index 8d6348f560..0d6fe717da 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -1666,7 +1666,7 @@ class PyBuildExt(build_ext):
+@@ -1671,7 +1671,7 @@ class PyBuildExt(build_ext):
          #
          # More information on Expat can be found at www.libexpat.org.
          #
@@ -88,5 +88,5 @@ index 4063d7ffa5..211a160f29 100644
              define_macros = []
              extra_compile_args = []
 -- 
-2.25.1
+2.20.1
 
diff --git a/package/python3/0020-Add-an-option-to-disable-CJK-codecs.patch b/package/python3/0020-Add-an-option-to-disable-CJK-codecs.patch
index 4e22543096..aa1a1499be 100644
--- a/package/python3/0020-Add-an-option-to-disable-CJK-codecs.patch
+++ b/package/python3/0020-Add-an-option-to-disable-CJK-codecs.patch
@@ -1,4 +1,4 @@
-From 2c0d31bb91fc7f94283c3ab632925fbbe24e94d6 Mon Sep 17 00:00:00 2001
+From ede026befe4094635d268e293bfccb9118f19a1c Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 23 Dec 2015 11:49:55 +0100
 Subject: [PATCH] Add an option to disable CJK codecs
@@ -9,10 +9,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  1 file changed, 6 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index 9ef0ecd42f..18e6fd70a0 100644
+index c90c92c2de..d9029f5463 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3375,6 +3375,12 @@ if test "$SQLITE3" = "no" ; then
+@@ -3382,6 +3382,12 @@ if test "$SQLITE3" = "no" ; then
     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _sqlite3"
  fi
  
@@ -26,5 +26,5 @@ index 9ef0ecd42f..18e6fd70a0 100644
  AC_ARG_ENABLE(tk,
  	AS_HELP_STRING([--disable-tk], [disable tk]),
 -- 
-2.25.1
+2.20.1
 
diff --git a/package/python3/0021-Add-an-option-to-disable-NIS.patch b/package/python3/0021-Add-an-option-to-disable-NIS.patch
index 9cd54df180..2a80e00099 100644
--- a/package/python3/0021-Add-an-option-to-disable-NIS.patch
+++ b/package/python3/0021-Add-an-option-to-disable-NIS.patch
@@ -1,4 +1,4 @@
-From 2041d0c8dba87991edaf088b16e37b5189a3466d Mon Sep 17 00:00:00 2001
+From 1c1acbd3ca7f1184710326fab2d557fed4a216e3 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 23 Dec 2015 11:50:11 +0100
 Subject: [PATCH] Add an option to disable NIS
@@ -12,10 +12,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  1 file changed, 6 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index 18e6fd70a0..46d2a8131e 100644
+index d9029f5463..82d9ec77fa 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3381,6 +3381,12 @@ AC_ARG_ENABLE(codecs-cjk,
+@@ -3388,6 +3388,12 @@ AC_ARG_ENABLE(codecs-cjk,
  		DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _codecs_kr _codecs_jp _codecs_cn _codecs_tw _codecs_hk _codecs_iso2022"
  	fi])
  
@@ -29,5 +29,5 @@ index 18e6fd70a0..46d2a8131e 100644
  AC_ARG_ENABLE(tk,
  	AS_HELP_STRING([--disable-tk], [disable tk]),
 -- 
-2.25.1
+2.20.1
 
diff --git a/package/python3/0022-Add-an-option-to-disable-unicodedata.patch b/package/python3/0022-Add-an-option-to-disable-unicodedata.patch
index 2ddf606a70..c4bcbdf133 100644
--- a/package/python3/0022-Add-an-option-to-disable-unicodedata.patch
+++ b/package/python3/0022-Add-an-option-to-disable-unicodedata.patch
@@ -1,4 +1,4 @@
-From dd82a401ff6ba4ba116bf4d520e981a1808ed443 Mon Sep 17 00:00:00 2001
+From 9fb4ebe3375ff3fc924d423b6b3400bf2cf82fb6 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 23 Dec 2015 11:50:27 +0100
 Subject: [PATCH] Add an option to disable unicodedata
@@ -9,10 +9,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  1 file changed, 6 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index 46d2a8131e..5844e3b73f 100644
+index 82d9ec77fa..55d257515f 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3387,6 +3387,12 @@ AC_ARG_ENABLE(nis,
+@@ -3394,6 +3394,12 @@ AC_ARG_ENABLE(nis,
      	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} nis"
    	  fi])
  
@@ -26,5 +26,5 @@ index 46d2a8131e..5844e3b73f 100644
  AC_ARG_ENABLE(tk,
  	AS_HELP_STRING([--disable-tk], [disable tk]),
 -- 
-2.25.1
+2.20.1
 
diff --git a/package/python3/0023-Add-an-option-to-disable-IDLE.patch b/package/python3/0023-Add-an-option-to-disable-IDLE.patch
index 0e35eea699..9235674a55 100644
--- a/package/python3/0023-Add-an-option-to-disable-IDLE.patch
+++ b/package/python3/0023-Add-an-option-to-disable-IDLE.patch
@@ -1,4 +1,4 @@
-From f1b15834045d0641c43014b970721df066fa71f7 Mon Sep 17 00:00:00 2001
+From e3b96113ae2b5a0c3f775d5a9550dbbcffb702dd Mon Sep 17 00:00:00 2001
 From: Maxime Ripard <maxime.ripard@free-electrons.com>
 Date: Wed, 22 Feb 2017 17:45:14 -0800
 Subject: [PATCH] Add an option to disable IDLE
@@ -16,10 +16,10 @@ Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
  3 files changed, 15 insertions(+), 2 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index e678c8817e..1148bd8708 100644
+index 4981087723..222c386f59 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1372,7 +1372,9 @@ bininstall: altbininstall
+@@ -1371,7 +1371,9 @@ bininstall: altbininstall
  	-rm -f $(DESTDIR)$(LIBPC)/python3-embed.pc
  	(cd $(DESTDIR)$(LIBPC); $(LN) -s python-$(VERSION)-embed.pc python3-embed.pc)
  	-rm -f $(DESTDIR)$(BINDIR)/idle3
@@ -29,7 +29,7 @@ index e678c8817e..1148bd8708 100644
  	-rm -f $(DESTDIR)$(BINDIR)/pydoc3
  ifeq (@PYDOC@,yes)
  	(cd $(DESTDIR)$(BINDIR); $(LN) -s pydoc$(VERSION) pydoc3)
-@@ -1419,7 +1421,6 @@ LIBSUBDIRS=	site-packages \
+@@ -1418,7 +1420,6 @@ LIBSUBDIRS=	site-packages \
  		html json http dbm xmlrpc \
  		logging csv wsgiref urllib \
  		ctypes ctypes/macholib \
@@ -37,7 +37,7 @@ index e678c8817e..1148bd8708 100644
  		distutils distutils/command \
  		importlib \
  		turtledemo \
-@@ -1514,6 +1515,10 @@ ifeq (@EXPAT@,yes)
+@@ -1513,6 +1514,10 @@ ifeq (@EXPAT@,yes)
  LIBSUBDIRS += $(XMLLIBSUBDIRS)
  endif
  
@@ -49,10 +49,10 @@ index e678c8817e..1148bd8708 100644
  LIBSUBDIRS += lib2to3 lib2to3/fixes lib2to3/pgen2
  TESTSUBDIRS += lib2to3/tests			\
 diff --git a/configure.ac b/configure.ac
-index 5844e3b73f..7bd4623ccd 100644
+index 55d257515f..2efd7a6de0 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3429,6 +3429,12 @@ AC_ARG_ENABLE(lib2to3,
+@@ -3436,6 +3436,12 @@ AC_ARG_ENABLE(lib2to3,
  	AS_HELP_STRING([--disable-lib2to3], [disable lib2to3]),
  	[ LIB2TO3="${enableval}" ], [ LIB2TO3=yes ])
  
@@ -66,10 +66,10 @@ index 5844e3b73f..7bd4623ccd 100644
  AH_TEMPLATE(ENABLE_IPV6, [Define if --enable-ipv6 is specified])
  AC_MSG_CHECKING([if --enable-ipv6 is specified])
 diff --git a/setup.py b/setup.py
-index 211a160f29..c4ee989ba3 100644
+index 0d6fe717da..4f8cfcd28d 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -2566,11 +2566,13 @@ def main():
+@@ -2573,11 +2573,13 @@ def main():
      import warnings
      warnings.filterwarnings("ignore",category=DeprecationWarning)
  
@@ -85,5 +85,5 @@ index 211a160f29..c4ee989ba3 100644
      setup(# PyPI Metadata (PEP 301)
            name = "Python",
 -- 
-2.25.1
+2.20.1
 
diff --git a/package/python3/0024-Add-an-option-to-disable-decimal.patch b/package/python3/0024-Add-an-option-to-disable-decimal.patch
index b5a12f7f38..963dcec70e 100644
--- a/package/python3/0024-Add-an-option-to-disable-decimal.patch
+++ b/package/python3/0024-Add-an-option-to-disable-decimal.patch
@@ -1,4 +1,4 @@
-From d5fe81cbd51da2a84ed89d1e4c80d921d4efce26 Mon Sep 17 00:00:00 2001
+From 2eb05b69bb21df7884686ca2620612ac0f95b894 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 23 Dec 2015 11:51:31 +0100
 Subject: [PATCH] Add an option to disable decimal
@@ -19,10 +19,10 @@ Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
  2 files changed, 13 insertions(+), 6 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 7bd4623ccd..e513ef6a20 100644
+index 2efd7a6de0..86fd03cdbb 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3135,13 +3135,20 @@ fi
+@@ -3142,13 +3142,20 @@ fi
  AC_SUBST(LIBFFI_INCLUDEDIR)
  
  # Check for use of the system libmpdec library
@@ -49,10 +49,10 @@ index 7bd4623ccd..e513ef6a20 100644
  # Check whether _decimal should use a coroutine-local or thread-local context
  AC_MSG_CHECKING(for --with-decimal-contextvar)
 diff --git a/setup.py b/setup.py
-index c4ee989ba3..3d0c74bb7f 100644
+index 4f8cfcd28d..b471234473 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -2195,7 +2195,7 @@ class PyBuildExt(build_ext):
+@@ -2202,7 +2202,7 @@ class PyBuildExt(build_ext):
          # Stefan Krah's _decimal module
          extra_compile_args = []
          undef_macros = []
@@ -62,5 +62,5 @@ index c4ee989ba3..3d0c74bb7f 100644
              libraries = [':libmpdec.so.2']
              sources = ['_decimal/_decimal.c']
 -- 
-2.25.1
+2.20.1
 
diff --git a/package/python3/0025-Add-an-option-to-disable-the-ossaudiodev-module.patch b/package/python3/0025-Add-an-option-to-disable-the-ossaudiodev-module.patch
index 0f68a08356..d7a9ab6481 100644
--- a/package/python3/0025-Add-an-option-to-disable-the-ossaudiodev-module.patch
+++ b/package/python3/0025-Add-an-option-to-disable-the-ossaudiodev-module.patch
@@ -1,4 +1,4 @@
-From 9bedc56d2a4b8856162650a11c1fcb6ec38f160b Mon Sep 17 00:00:00 2001
+From 1773ef327247ff2a6e7ce737637748b67c90419f Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 23 Dec 2015 11:51:58 +0100
 Subject: [PATCH] Add an option to disable the ossaudiodev module
@@ -9,10 +9,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  1 file changed, 6 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index e513ef6a20..c07505e89e 100644
+index 86fd03cdbb..7ba4ea8d5d 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3165,6 +3165,12 @@ fi
+@@ -3172,6 +3172,12 @@ fi
  
  AC_MSG_RESULT($with_decimal_contextvar)
  
@@ -26,5 +26,5 @@ index e513ef6a20..c07505e89e 100644
  AC_MSG_CHECKING(for --enable-loadable-sqlite-extensions)
  AC_ARG_ENABLE(loadable-sqlite-extensions,
 -- 
-2.25.1
+2.20.1
 
diff --git a/package/python3/0026-Add-an-option-to-disable-openssl-support.patch b/package/python3/0026-Add-an-option-to-disable-openssl-support.patch
index 44d1d3d6b3..33c6ad94b8 100644
--- a/package/python3/0026-Add-an-option-to-disable-openssl-support.patch
+++ b/package/python3/0026-Add-an-option-to-disable-openssl-support.patch
@@ -1,4 +1,4 @@
-From 90ed5c692b8b5596ca0b3ae1436276c8181251d8 Mon Sep 17 00:00:00 2001
+From 9fb639fba83cddfbda20819d58df77bdccf6ba1d Mon Sep 17 00:00:00 2001
 From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
 Date: Wed, 22 Feb 2017 17:55:59 -0800
 Subject: [PATCH] Add an option to disable openssl support.
@@ -9,10 +9,10 @@ Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
  1 file changed, 6 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index c07505e89e..612e32faf5 100644
+index 7ba4ea8d5d..96e7e1feed 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3406,6 +3406,12 @@ AC_ARG_ENABLE(unicodedata,
+@@ -3413,6 +3413,12 @@ AC_ARG_ENABLE(unicodedata,
      	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} unicodedata"
    	  fi])
  
@@ -26,5 +26,5 @@ index c07505e89e..612e32faf5 100644
  AC_ARG_ENABLE(tk,
  	AS_HELP_STRING([--disable-tk], [disable tk]),
 -- 
-2.25.1
+2.20.1
 
diff --git a/package/python3/0027-Add-an-option-to-disable-the-readline-module.patch b/package/python3/0027-Add-an-option-to-disable-the-readline-module.patch
index 1597a2a560..f59af5e9a1 100644
--- a/package/python3/0027-Add-an-option-to-disable-the-readline-module.patch
+++ b/package/python3/0027-Add-an-option-to-disable-the-readline-module.patch
@@ -1,4 +1,4 @@
-From 049e7a51e1ffd0d28d6608c707ab4b54e816d338 Mon Sep 17 00:00:00 2001
+From c246223473b49a719b765520068aaf812f1fe6ca Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Tue, 7 Mar 2017 23:29:05 +0100
 Subject: [PATCH] Add an option to disable the readline module
@@ -9,10 +9,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  1 file changed, 6 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index 612e32faf5..2a6aaeff60 100644
+index 96e7e1feed..d5732b2474 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3412,6 +3412,12 @@ AC_ARG_ENABLE(openssl,
+@@ -3419,6 +3419,12 @@ AC_ARG_ENABLE(openssl,
  	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} ssl _ssl _hashlib"
  	  fi])
  
@@ -26,5 +26,5 @@ index 612e32faf5..2a6aaeff60 100644
  AC_ARG_ENABLE(tk,
  	AS_HELP_STRING([--disable-tk], [disable tk]),
 -- 
-2.25.1
+2.20.1
 
diff --git a/package/python3/0028-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch b/package/python3/0028-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch
index a1d2ef3255..a2a30ab614 100644
--- a/package/python3/0028-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch
+++ b/package/python3/0028-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch
@@ -1,4 +1,4 @@
-From 146730a04dfe98e3d7971ebf5410801ceae88e11 Mon Sep 17 00:00:00 2001
+From 4d87cebaff75a19cd7ccf20f1c89abec5a5bce8d Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Tue, 7 Mar 2017 23:31:11 +0100
 Subject: [PATCH] Add options to disable zlib, bzip2 and xz modules
@@ -9,10 +9,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  1 file changed, 18 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index 2a6aaeff60..21479bbd7d 100644
+index d5732b2474..3eadf17306 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3418,6 +3418,24 @@ AC_ARG_ENABLE(readline,
+@@ -3425,6 +3425,24 @@ AC_ARG_ENABLE(readline,
  	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} readline"
  	  fi])
  
@@ -38,5 +38,5 @@ index 2a6aaeff60..21479bbd7d 100644
  AC_ARG_ENABLE(tk,
  	AS_HELP_STRING([--disable-tk], [disable tk]),
 -- 
-2.25.1
+2.20.1
 
diff --git a/package/python3/0029-python-config.sh-don-t-reassign-prefix.patch b/package/python3/0029-python-config.sh-don-t-reassign-prefix.patch
index 4478b40162..870ec74d74 100644
--- a/package/python3/0029-python-config.sh-don-t-reassign-prefix.patch
+++ b/package/python3/0029-python-config.sh-don-t-reassign-prefix.patch
@@ -1,4 +1,4 @@
-From 106d9378c61e7fa9cad0a63ba068668d54cd11b8 Mon Sep 17 00:00:00 2001
+From 1ab6b1fb17c1988baca6b9c578f8de33c44c1a17 Mon Sep 17 00:00:00 2001
 From: Matt Weber <matthew.weber@rockwellcollins.com>
 Date: Fri, 6 Oct 2017 09:54:15 -0500
 Subject: [PATCH] python-config.sh: don't reassign ${prefix}
@@ -49,5 +49,5 @@ index a1bc3cd5f7..164d2d3603 100644
  SO="@EXT_SUFFIX@"
  PYTHONFRAMEWORK="@PYTHONFRAMEWORK@"
 -- 
-2.25.1
+2.20.1
 
diff --git a/package/python3/0031-Add-an-option-to-disable-uuid-module.patch b/package/python3/0030-Add-an-option-to-disable-uuid-module.patch
similarity index 81%
rename from package/python3/0031-Add-an-option-to-disable-uuid-module.patch
rename to package/python3/0030-Add-an-option-to-disable-uuid-module.patch
index 92b24b211d..af56742d9e 100644
--- a/package/python3/0031-Add-an-option-to-disable-uuid-module.patch
+++ b/package/python3/0030-Add-an-option-to-disable-uuid-module.patch
@@ -1,4 +1,4 @@
-From 3bb693408eda77dda145ec5fecee56ea73031e9f Mon Sep 17 00:00:00 2001
+From 20ff7301b496efe529e2b313cac4d7af626f5051 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 Date: Sat, 18 Aug 2018 10:54:56 +0200
 Subject: [PATCH] Add an option to disable uuid module
@@ -9,10 +9,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
  1 file changed, 9 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index 21479bbd7d..615c16aced 100644
+index 3eadf17306..7812dc5102 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3454,6 +3454,15 @@ if test "$CURSES" = "no"; then
+@@ -3461,6 +3461,15 @@ if test "$CURSES" = "no"; then
     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _curses _curses_panel"
  fi
  
@@ -29,5 +29,5 @@ index 21479bbd7d..615c16aced 100644
  
  AC_ARG_ENABLE(pydoc,
 -- 
-2.25.1
+2.20.1
 
diff --git a/package/python3/0030-Fix-cross-compiling-the-uuid-module.patch b/package/python3/0030-Fix-cross-compiling-the-uuid-module.patch
deleted file mode 100644
index 1bf5fc6db4..0000000000
--- a/package/python3/0030-Fix-cross-compiling-the-uuid-module.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From d7b90b157eddefbd0ed59e35c90b083c0c03b644 Mon Sep 17 00:00:00 2001
-From: Adam Duskett <aduskett@gmail.com>
-Date: Fri, 20 Jul 2018 10:17:39 -0400
-Subject: [PATCH] Fix cross compiling the uuid module
-
-Python 3.7 has a new _uuid module, however, the include directory
-search path for uuid.h is hardcoded to /usr/include/uuid, which should
-not be used when cross-compiling.
-
-To fix this, use the same solution as the one used by the NIS
-detection: append "uuid" to each of the include directories in
-"inc_dirs", instead of hardcoding /usr/include/uuid.
-
-Signed-off-by: Adam Duskett <aduskett@gmail.com>
-[Thomas: drop STAGING_DIR based solution, use a solution similar to
-the one used for the NIS detection.]
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- setup.py | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/setup.py b/setup.py
-index 3d0c74bb7f..c7be85f352 100644
---- a/setup.py
-+++ b/setup.py
-@@ -1764,7 +1764,8 @@ class PyBuildExt(build_ext):
- 
-     def detect_uuid(self):
-         # Build the _uuid module if possible
--        uuid_incs = find_file("uuid.h", self.inc_dirs, ["/usr/include/uuid"])
-+        uuid_incs = find_file("uuid.h", self.inc_dirs,
-+                              [os.path.join(inc_dir, 'uuid') for inc_dir in self.inc_dirs])
-         if uuid_incs is not None:
-             if self.compiler.find_library_file(self.lib_dirs, 'uuid'):
-                 uuid_libs = ['uuid']
--- 
-2.25.1
-
diff --git a/package/python3/0032-fix-building-on-older-distributions.patch b/package/python3/0031-fix-building-on-older-distributions.patch
similarity index 94%
rename from package/python3/0032-fix-building-on-older-distributions.patch
rename to package/python3/0031-fix-building-on-older-distributions.patch
index fb59e593f4..a8b3465111 100644
--- a/package/python3/0032-fix-building-on-older-distributions.patch
+++ b/package/python3/0031-fix-building-on-older-distributions.patch
@@ -1,4 +1,4 @@
-From 94c62f96ca61f1a28124c837d7ec5ed0b9ae8786 Mon Sep 17 00:00:00 2001
+From c9548b8e80eecdd6d0798817698c77649f005b42 Mon Sep 17 00:00:00 2001
 From: Adam Duskett <aduskett@gmail.com>
 Date: Thu, 16 Aug 2018 14:52:37 -0700
 Subject: [PATCH] fix building on older distributions
@@ -34,5 +34,5 @@ index 224585c69b..ef458c0c63 100644
          os.unlink(new_path)
  
 -- 
-2.25.1
+2.20.1
 
diff --git a/package/python3/0033-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch b/package/python3/0032-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch
similarity index 71%
rename from package/python3/0033-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch
rename to package/python3/0032-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch
index f70990b254..ec7ecb6a35 100644
--- a/package/python3/0033-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch
+++ b/package/python3/0032-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch
@@ -1,4 +1,4 @@
-From edc0757c56090364e0a95aabfa9f645a16a27569 Mon Sep 17 00:00:00 2001
+From ffe8fb3065973204fce95130c32578163755b71e Mon Sep 17 00:00:00 2001
 From: Peter Korsgaard <peter@korsgaard.com>
 Date: Fri, 2 Aug 2019 15:53:16 +0200
 Subject: [PATCH] configure.ac: fixup $CC --print-multiarch output for
@@ -23,26 +23,27 @@ non-multiarch toolchain on some architectures (E.G.  PowerPC), but as a
 workaround, rewrite the --print-multiarch output to match older GCC versions
 to keep the configure script happy.
 
+[Peter: update for 3.9.9, which made the MULTIARCH logic !darwin]
 Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 ---
  configure.ac | 4 +++-
  1 file changed, 3 insertions(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 615c16aced..241298e6cf 100644
+index 7812dc5102..0ce52b9a7d 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -727,7 +727,9 @@ then
- fi
- 
+@@ -883,7 +883,9 @@ fi
+ rm -f conftest.c conftest.out
  
--MULTIARCH=$($CC --print-multiarch 2>/dev/null)
-+# GCC 8+ returns $arch-linux-{musl,uclibc} for musl/uClibc based
-+# toolchains confusing python. Fix that up
-+MULTIARCH=$($CC --print-multiarch 2>/dev/null | sed -E 's/-linux-(musl|uclibc)*$/-linux-gnu/')
+ if test x$PLATFORM_TRIPLET != xdarwin; then
+-  MULTIARCH=$($CC --print-multiarch 2>/dev/null)
++  # GCC 8+ returns $arch-linux-{musl,uclibc} for musl/uClibc based
++  # toolchains confusing python. Fix that up
++  MULTIARCH=$($CC --print-multiarch 2>/dev/null | sed -E 's/-linux-(musl|uclibc)*$/-linux-gnu/')
+ fi
  AC_SUBST(MULTIARCH)
  
- AC_MSG_CHECKING([for the platform triplet based on compiler characteristics])
 -- 
-2.25.1
+2.20.1
 
diff --git a/package/python3/0034-Add-an-option-to-disable-the-berkeleydb-module.patch b/package/python3/0033-Add-an-option-to-disable-the-berkeleydb-module.patch
similarity index 80%
rename from package/python3/0034-Add-an-option-to-disable-the-berkeleydb-module.patch
rename to package/python3/0033-Add-an-option-to-disable-the-berkeleydb-module.patch
index a4e8baf4dd..c253f09690 100644
--- a/package/python3/0034-Add-an-option-to-disable-the-berkeleydb-module.patch
+++ b/package/python3/0033-Add-an-option-to-disable-the-berkeleydb-module.patch
@@ -1,4 +1,4 @@
-From cf4d7fd9f7cb6c1ced32ee323b2b5755640051b7 Mon Sep 17 00:00:00 2001
+From 368a582879f3d757e3527071fd95a956bb272bd8 Mon Sep 17 00:00:00 2001
 From: Bernd Kuhls <bernd.kuhls@t-online.de>
 Date: Sat, 11 Apr 2020 22:01:40 +0200
 Subject: [PATCH] Add an option to disable the berkeleydb module
@@ -9,10 +9,10 @@ Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
  1 file changed, 6 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index 72c1d86e82..8c3912d237 100644
+index 0ce52b9a7d..30a4e5fb2e 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3465,6 +3465,12 @@ if test "$UUID" = "no"; then
+@@ -3472,6 +3472,12 @@ if test "$UUID" = "no"; then
     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _uuid"
  fi
  
@@ -26,5 +26,5 @@ index 72c1d86e82..8c3912d237 100644
  
  AC_ARG_ENABLE(pydoc,
 -- 
-2.25.0
+2.20.1
 
diff --git a/package/python3/0035-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch b/package/python3/0034-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch
similarity index 95%
rename from package/python3/0035-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch
rename to package/python3/0034-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch
index 880277eb1d..44eb450808 100644
--- a/package/python3/0035-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch
+++ b/package/python3/0034-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch
@@ -1,4 +1,4 @@
-From 3c83eedcc2df3ecf6c4a17953ca24dff60c1378e Mon Sep 17 00:00:00 2001
+From 09ded6ff285e12221114b281d35fe8f9484a9ea5 Mon Sep 17 00:00:00 2001
 From: Romain Naour <romain.naour@gmail.com>
 Date: Thu, 12 Nov 2020 00:16:18 +0100
 Subject: [PATCH] lib/crypt: uClibc-ng doesn't set errno when encryption method
@@ -36,5 +36,5 @@ index 33dbc46bb3..4692a5270c 100644
          raise
      if result and len(result) == method.total_size:
 -- 
-2.25.4
+2.20.1
 
diff --git a/package/python3/0036-Fix-dictionary-iteration-error-in-_ExecutorManagerTh.patch b/package/python3/0035-Fix-dictionary-iteration-error-in-_ExecutorManagerTh.patch
similarity index 90%
rename from package/python3/0036-Fix-dictionary-iteration-error-in-_ExecutorManagerTh.patch
rename to package/python3/0035-Fix-dictionary-iteration-error-in-_ExecutorManagerTh.patch
index fbe44c7753..b524795d75 100644
--- a/package/python3/0036-Fix-dictionary-iteration-error-in-_ExecutorManagerTh.patch
+++ b/package/python3/0035-Fix-dictionary-iteration-error-in-_ExecutorManagerTh.patch
@@ -1,4 +1,4 @@
-From 331966be70c371b268a4fcce9e97280cd869f137 Mon Sep 17 00:00:00 2001
+From 234364f756e3083164ec9bfcd4867855048372b4 Mon Sep 17 00:00:00 2001
 From: Jakub Kulik <kulikjak@gmail.com>
 Date: Mon, 15 Mar 2021 08:49:28 +0100
 Subject: [PATCH] Fix dictionary iteration error in _ExecutorManagerThread
@@ -12,7 +12,7 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Lib/concurrent/futures/process.py b/Lib/concurrent/futures/process.py
-index 90bc98bf2ec..e3b36dff572 100644
+index 90bc98bf2e..e3b36dff57 100644
 --- a/Lib/concurrent/futures/process.py
 +++ b/Lib/concurrent/futures/process.py
 @@ -373,7 +373,7 @@ class _ExecutorManagerThread(threading.Thread):
@@ -25,5 +25,5 @@ index 90bc98bf2ec..e3b36dff572 100644
  
          cause = None
 -- 
-2.31.1
+2.20.1
 
diff --git a/package/python3/python3.hash b/package/python3/python3.hash
index 444dbd982a..15e68ca9f1 100644
--- a/package/python3/python3.hash
+++ b/package/python3/python3.hash
@@ -1,5 +1,5 @@
-# From https://www.python.org/downloads/release/python-397/
-md5  fddb060b483bc01850a3f412eea1d954  Python-3.9.7.tar.xz
+# From https://www.python.org/downloads/release/python-399/
+md5  11d12076311563252a995201248d17e5  Python-3.9.9.tar.xz
 # Locally computed
-sha256  f8145616e68c00041d1a6399b76387390388f8359581abc24432bb969b5e3c57  Python-3.9.7.tar.xz
+sha256  06828c04a573c073a4e51c4292a27c1be4ae26621c3edc7cf9318418ce3b6d27  Python-3.9.9.tar.xz
 sha256  599826df92bfdcd2702eac691072498bb096c55af04ee984cf90f70ed77b5a70  LICENSE
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 779f6dcb6c..6f063529b2 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON3_VERSION_MAJOR = 3.9
-PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).7
+PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).9
 PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
 PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
 PYTHON3_LICENSE = Python-2.0, others
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
