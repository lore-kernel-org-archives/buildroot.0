Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9D3AC10F1A
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 13:40:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5852E606FF;
	Thu,  9 May 2024 13:40:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pjS0id3SMcXF; Thu,  9 May 2024 13:40:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4886D61083
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4886D61083;
	Thu,  9 May 2024 13:40:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 111D21BF3EE
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 13:40:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E2D7A83AC6
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 13:40:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z4DwRylCTT1Z for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 13:40:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 288A383AC5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 288A383AC5
 for <buildroot@buildroot.org>; Thu,  9 May 2024 13:40:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CB50B86B10; Thu,  9 May 2024 13:40:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 8 May 2024 18:44:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b37e4a5f56182c5b8e4ffce433eb652174a19da6
X-Git-Newrev: 2a23bd9effcff987a512e1e437d7c7ae47b62985
X-Patchwork-Hint: ignore
Message-Id: <20240509134004.CB50B86B10@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python3: renumber patches
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=2a23bd9effcff987a512e1e437d7c7ae47b62985
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Following the removal of a number of patches in commit
b37e4a5f56182c5b8e4ffce433eb652174a19da6 ("package/python3: drop
unnecessary patches"), this commit renumbers the renaming patches, and
refreshes them as well so they apply cleanly with "git am".

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                | 46 +++++++++++-----------
 ...1-Make-the-build-of-pyc-files-conditional.patch | 14 +++----
 ...gy_getaddrinfo-configure-test-when-cross-.patch |  8 ++--
 ...ructure-to-disable-the-build-of-certain-e.patch | 16 ++++----
 ...-t-look-in-usr-lib-termcap-for-libraries.patch} |  8 ++--
 ....patch => 0005-Don-t-add-multiarch-paths.patch} |  8 ++--
 ...tch => 0006-Abort-on-failed-module-build.patch} |  8 ++--
 ...nd.patch => 0007-Serial-ioctl-workaround.patch} |  6 +--
 ...h => 0008-Add-an-option-to-disable-pydoc.patch} | 26 ++++++------
 ...=> 0009-Add-an-option-to-disable-lib2to3.patch} | 26 ++++++------
 ...Add-option-to-disable-the-sqlite3-module.patch} | 14 +++----
 ...1-Add-an-option-to-disable-the-tk-module.patch} | 22 +++++------
 ...d-an-option-to-disable-the-curses-module.patch} | 14 +++----
 ...h => 0013-Add-an-option-to-disable-expat.patch} | 14 +++----
 ...0014-Add-an-option-to-disable-CJK-codecs.patch} |  8 ++--
 ...tch => 0015-Add-an-option-to-disable-NIS.patch} |  8 ++--
 ...016-Add-an-option-to-disable-unicodedata.patch} |  8 ++--
 ...ch => 0017-Add-an-option-to-disable-IDLE.patch} | 20 +++++-----
 ...=> 0018-Add-an-option-to-disable-decimal.patch} |  8 ++--
 ...option-to-disable-the-ossaudiodev-module.patch} |  8 ++--
 ...Add-an-option-to-disable-openssl-support.patch} |  8 ++--
 ...an-option-to-disable-the-readline-module.patch} |  8 ++--
 ...ons-to-disable-zlib-bzip2-and-xz-modules.patch} |  8 ++--
 ...023-Add-an-option-to-disable-uuid-module.patch} |  8 ++--
 ...-fixup-CC-print-multiarch-output-for-mus.patch} |  8 ++--
 ...-option-to-disable-the-berkeleydb-module.patch} |  8 ++--
 ...libc-ng-doesn-t-set-errno-when-encryptio.patch} |  6 +--
 ...x-cross-compiles-when-host-and-target-us.patch} | 18 ++++-----
 28 files changed, 181 insertions(+), 181 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 071a72b837..a54962b798 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1323,29 +1323,29 @@ package/python-ws4py/0001-Adjust-ws4py-for-Python-3.7-syntax.patch lib_patch.Ups
 package/python3/0001-Make-the-build-of-pyc-files-conditional.patch lib_patch.Upstream
 package/python3/0002-Disable-buggy_getaddrinfo-configure-test-when-cross-.patch lib_patch.Upstream
 package/python3/0003-Add-infrastructure-to-disable-the-build-of-certain-e.patch lib_patch.Upstream
-package/python3/0005-Don-t-look-in-usr-lib-termcap-for-libraries.patch lib_patch.Upstream
-package/python3/0006-Don-t-add-multiarch-paths.patch lib_patch.Upstream
-package/python3/0007-Abort-on-failed-module-build.patch lib_patch.Upstream
-package/python3/0008-Serial-ioctl-workaround.patch lib_patch.Upstream
-package/python3/0011-Add-an-option-to-disable-pydoc.patch lib_patch.Upstream
-package/python3/0012-Add-an-option-to-disable-lib2to3.patch lib_patch.Upstream
-package/python3/0013-Add-option-to-disable-the-sqlite3-module.patch lib_patch.Upstream
-package/python3/0014-Add-an-option-to-disable-the-tk-module.patch lib_patch.Upstream
-package/python3/0015-Add-an-option-to-disable-the-curses-module.patch lib_patch.Upstream
-package/python3/0016-Add-an-option-to-disable-expat.patch lib_patch.Upstream
-package/python3/0017-Add-an-option-to-disable-CJK-codecs.patch lib_patch.Upstream
-package/python3/0018-Add-an-option-to-disable-NIS.patch lib_patch.Upstream
-package/python3/0019-Add-an-option-to-disable-unicodedata.patch lib_patch.Upstream
-package/python3/0020-Add-an-option-to-disable-IDLE.patch lib_patch.Upstream
-package/python3/0021-Add-an-option-to-disable-decimal.patch lib_patch.Upstream
-package/python3/0022-Add-an-option-to-disable-the-ossaudiodev-module.patch lib_patch.Upstream
-package/python3/0023-Add-an-option-to-disable-openssl-support.patch lib_patch.Upstream
-package/python3/0024-Add-an-option-to-disable-the-readline-module.patch lib_patch.Upstream
-package/python3/0025-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch lib_patch.Upstream
-package/python3/0027-Add-an-option-to-disable-uuid-module.patch lib_patch.Upstream
-package/python3/0029-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch lib_patch.Upstream
-package/python3/0030-Add-an-option-to-disable-the-berkeleydb-module.patch lib_patch.Upstream
-package/python3/0031-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch lib_patch.Upstream
+package/python3/0004-Don-t-look-in-usr-lib-termcap-for-libraries.patch lib_patch.Upstream
+package/python3/0005-Don-t-add-multiarch-paths.patch lib_patch.Upstream
+package/python3/0006-Abort-on-failed-module-build.patch lib_patch.Upstream
+package/python3/0007-Serial-ioctl-workaround.patch lib_patch.Upstream
+package/python3/0008-Add-an-option-to-disable-pydoc.patch lib_patch.Upstream
+package/python3/0009-Add-an-option-to-disable-lib2to3.patch lib_patch.Upstream
+package/python3/0010-Add-option-to-disable-the-sqlite3-module.patch lib_patch.Upstream
+package/python3/0011-Add-an-option-to-disable-the-tk-module.patch lib_patch.Upstream
+package/python3/0012-Add-an-option-to-disable-the-curses-module.patch lib_patch.Upstream
+package/python3/0013-Add-an-option-to-disable-expat.patch lib_patch.Upstream
+package/python3/0014-Add-an-option-to-disable-CJK-codecs.patch lib_patch.Upstream
+package/python3/0015-Add-an-option-to-disable-NIS.patch lib_patch.Upstream
+package/python3/0016-Add-an-option-to-disable-unicodedata.patch lib_patch.Upstream
+package/python3/0017-Add-an-option-to-disable-IDLE.patch lib_patch.Upstream
+package/python3/0018-Add-an-option-to-disable-decimal.patch lib_patch.Upstream
+package/python3/0019-Add-an-option-to-disable-the-ossaudiodev-module.patch lib_patch.Upstream
+package/python3/0020-Add-an-option-to-disable-openssl-support.patch lib_patch.Upstream
+package/python3/0021-Add-an-option-to-disable-the-readline-module.patch lib_patch.Upstream
+package/python3/0022-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch lib_patch.Upstream
+package/python3/0023-Add-an-option-to-disable-uuid-module.patch lib_patch.Upstream
+package/python3/0024-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch lib_patch.Upstream
+package/python3/0025-Add-an-option-to-disable-the-berkeleydb-module.patch lib_patch.Upstream
+package/python3/0026-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch lib_patch.Upstream
 package/qemu/0002-softmmu-qemu-seccomp.c-add-missing-header-for-CLONE_.patch lib_patch.Upstream
 package/qextserialport/0001-Create-a-main-include-file-QExtSerialPort.patch lib_patch.Upstream
 package/qextserialport/0002-Tell-qmake-to-add-a-pkgconfig-file-to-ease-usage-wit.patch lib_patch.Upstream
diff --git a/package/python3/0001-Make-the-build-of-pyc-files-conditional.patch b/package/python3/0001-Make-the-build-of-pyc-files-conditional.patch
index 92aa7274ba..827b99d8e9 100644
--- a/package/python3/0001-Make-the-build-of-pyc-files-conditional.patch
+++ b/package/python3/0001-Make-the-build-of-pyc-files-conditional.patch
@@ -1,4 +1,4 @@
-From 51ed7f93cc0333efa8fccd9b88db713c48993df9 Mon Sep 17 00:00:00 2001
+From 9dd808909ea18f8e99272cbdf1e39151bff62037 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 22 Feb 2017 16:21:31 -0800
 Subject: [PATCH] Make the build of pyc files conditional
@@ -15,10 +15,10 @@ Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
  2 files changed, 8 insertions(+)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 8fbcd7ac17..2957c8e5a1 100644
+index 4d1921bf435..f90ec2eeb1d 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -2078,6 +2078,7 @@ libinstall:	all $(srcdir)/Modules/xxmodule.c
+@@ -2139,6 +2139,7 @@ libinstall:	all $(srcdir)/Modules/xxmodule.c
  		$(INSTALL_DATA) $(srcdir)/Modules/xxmodule.c \
  			$(DESTDIR)$(LIBDEST)/distutils/tests ; \
  	fi
@@ -26,7 +26,7 @@ index 8fbcd7ac17..2957c8e5a1 100644
  	-PYTHONPATH=$(DESTDIR)$(LIBDEST)  $(RUNSHARED) \
  		$(PYTHON_FOR_BUILD) -Wi $(DESTDIR)$(LIBDEST)/compileall.py \
  		-j0 -d $(LIBDEST) -f \
-@@ -2105,6 +2106,7 @@ libinstall:	all $(srcdir)/Modules/xxmodule.c
+@@ -2166,6 +2167,7 @@ libinstall:	all $(srcdir)/Modules/xxmodule.c
  		$(PYTHON_FOR_BUILD) -Wi -OO $(DESTDIR)$(LIBDEST)/compileall.py \
  		-j0 -d $(LIBDEST)/site-packages -f \
  		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
@@ -35,10 +35,10 @@ index 8fbcd7ac17..2957c8e5a1 100644
  		$(PYTHON_FOR_BUILD) -m lib2to3.pgen2.driver $(DESTDIR)$(LIBDEST)/lib2to3/Grammar.txt
  	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
 diff --git a/configure.ac b/configure.ac
-index ab5e1de6fa..0cf89ed641 100644
+index bbe7f891e7d..7b136bd2f0b 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1441,6 +1441,12 @@ fi
+@@ -1459,6 +1459,12 @@ fi
  
  AC_MSG_CHECKING(LDLIBRARY)
  
@@ -52,5 +52,5 @@ index ab5e1de6fa..0cf89ed641 100644
  # library that we build, but we do not want to link against it (we
  # will find it with a -framework option). For this reason there is an
 -- 
-2.34.1
+2.44.0
 
diff --git a/package/python3/0002-Disable-buggy_getaddrinfo-configure-test-when-cross-.patch b/package/python3/0002-Disable-buggy_getaddrinfo-configure-test-when-cross-.patch
index 5389cb5d15..e996823c47 100644
--- a/package/python3/0002-Disable-buggy_getaddrinfo-configure-test-when-cross-.patch
+++ b/package/python3/0002-Disable-buggy_getaddrinfo-configure-test-when-cross-.patch
@@ -1,4 +1,4 @@
-From b180ab302e2a82be239af334382436628b81381e Mon Sep 17 00:00:00 2001
+From 33cd52fb1295a6eb4dd42fbc73e565c5ce01bbd0 Mon Sep 17 00:00:00 2001
 From: Vanya Sergeev <vsergeev@gmail.com>
 Date: Wed, 23 Dec 2015 11:30:33 +0100
 Subject: [PATCH] Disable buggy_getaddrinfo configure test when cross-compiling
@@ -10,10 +10,10 @@ Signed-off-by: Vanya Sergeev <vsergeev@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 0cf89ed641..830885fcb3 100644
+index 7b136bd2f0b..1e84aa0bb7f 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -5086,7 +5086,7 @@ fi]))
+@@ -5137,7 +5137,7 @@ fi]))
  dnl if ac_cv_func_getaddrinfo
  ])
  
@@ -23,5 +23,5 @@ index 0cf89ed641..830885fcb3 100644
    AS_VAR_IF([ipv6], [yes], [
      AC_MSG_ERROR([m4_normalize([
 -- 
-2.34.1
+2.44.0
 
diff --git a/package/python3/0003-Add-infrastructure-to-disable-the-build-of-certain-e.patch b/package/python3/0003-Add-infrastructure-to-disable-the-build-of-certain-e.patch
index 5b3911374e..f0c13387e8 100644
--- a/package/python3/0003-Add-infrastructure-to-disable-the-build-of-certain-e.patch
+++ b/package/python3/0003-Add-infrastructure-to-disable-the-build-of-certain-e.patch
@@ -1,4 +1,4 @@
-From 8e02cebdac536dfb6748da2c50656a26f70d9da7 Mon Sep 17 00:00:00 2001
+From 533aa8d7eb7ad27428410371504c6b94183852c1 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 22 Feb 2017 16:33:22 -0800
 Subject: [PATCH] Add infrastructure to disable the build of certain extensions
@@ -44,7 +44,7 @@ Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
  3 files changed, 11 insertions(+), 2 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 2957c8e5a1..c1cfb96767 100644
+index f90ec2eeb1d..5a40b7c5484 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
 @@ -239,6 +239,8 @@ FILEMODE=	644
@@ -56,7 +56,7 @@ index 2957c8e5a1..c1cfb96767 100644
  
  # Subdirectories with code
  SRCDIRS= 	@SRCDIRS@
-@@ -739,6 +741,7 @@ sharedmods: $(PYTHON_FOR_BUILD_DEPS) pybuilddir.txt @LIBMPDEC_INTERNAL@ @LIBEXPA
+@@ -743,6 +745,7 @@ sharedmods: $(PYTHON_FOR_BUILD_DEPS) pybuilddir.txt @LIBMPDEC_INTERNAL@ @LIBEXPA
  	    *) quiet="";; \
  	esac; \
  	echo "$(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' \
@@ -64,7 +64,7 @@ index 2957c8e5a1..c1cfb96767 100644
  		$(PYTHON_FOR_BUILD) $(srcdir)/setup.py $$quiet build"; \
  	$(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' \
  		$(PYTHON_FOR_BUILD) $(srcdir)/setup.py $$quiet build
-@@ -2228,7 +2231,8 @@ libainstall: all python-config
+@@ -2289,7 +2292,8 @@ libainstall: all python-config
  # Install the dynamically loadable modules
  # This goes into $(exec_prefix)
  sharedinstall: all
@@ -75,10 +75,10 @@ index 2957c8e5a1..c1cfb96767 100644
  		--install-scripts=$(BINDIR) \
  		--install-platlib=$(DESTSHARED) \
 diff --git a/configure.ac b/configure.ac
-index 830885fcb3..5a6a1fe608 100644
+index 1e84aa0bb7f..b4d7d2cca6a 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3562,6 +3562,8 @@ LIBS="$withval $LIBS"
+@@ -3612,6 +3612,8 @@ LIBS="$withval $LIBS"
  ],
  [AC_MSG_RESULT(no)])
  
@@ -88,7 +88,7 @@ index 830885fcb3..5a6a1fe608 100644
  AC_MSG_CHECKING(for --with-system-expat)
  AC_ARG_WITH(system_expat,
 diff --git a/setup.py b/setup.py
-index 15d0d4576a..e496ee34c2 100644
+index ad8fb81b218..2e15fedeab2 100644
 --- a/setup.py
 +++ b/setup.py
 @@ -56,7 +56,10 @@
@@ -104,5 +104,5 @@ index 15d0d4576a..e496ee34c2 100644
  # --list-module-names option used by Tools/scripts/generate_module_names.py
  LIST_MODULE_NAMES = False
 -- 
-2.34.1
+2.44.0
 
diff --git a/package/python3/0005-Don-t-look-in-usr-lib-termcap-for-libraries.patch b/package/python3/0004-Don-t-look-in-usr-lib-termcap-for-libraries.patch
similarity index 87%
rename from package/python3/0005-Don-t-look-in-usr-lib-termcap-for-libraries.patch
rename to package/python3/0004-Don-t-look-in-usr-lib-termcap-for-libraries.patch
index 78b3ae596d..0e3a844354 100644
--- a/package/python3/0005-Don-t-look-in-usr-lib-termcap-for-libraries.patch
+++ b/package/python3/0004-Don-t-look-in-usr-lib-termcap-for-libraries.patch
@@ -1,4 +1,4 @@
-From 5d13e384b30a2c0b1c7b65718590b7fb0c3ba55e Mon Sep 17 00:00:00 2001
+From bd152d01185a371a04680bc772c6454678de34f5 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 23 Dec 2015 11:36:00 +0100
 Subject: [PATCH] Don't look in /usr/lib/termcap for libraries
@@ -9,10 +9,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  1 file changed, 1 insertion(+), 4 deletions(-)
 
 diff --git a/setup.py b/setup.py
-index e496ee34c2..1904898165 100644
+index 2e15fedeab2..b283ea3aeed 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -1107,12 +1107,9 @@ def detect_readline_curses(self):
+@@ -1111,12 +1111,9 @@ def detect_readline_curses(self):
                  pass # Issue 7384: Already linked against curses or tinfo.
              elif curses_library:
                  readline_libs.append(curses_library)
@@ -27,5 +27,5 @@ index e496ee34c2..1904898165 100644
          else:
              self.missing.append('readline')
 -- 
-2.34.1
+2.44.0
 
diff --git a/package/python3/0006-Don-t-add-multiarch-paths.patch b/package/python3/0005-Don-t-add-multiarch-paths.patch
similarity index 87%
rename from package/python3/0006-Don-t-add-multiarch-paths.patch
rename to package/python3/0005-Don-t-add-multiarch-paths.patch
index 749e295df1..4557fbb31e 100644
--- a/package/python3/0006-Don-t-add-multiarch-paths.patch
+++ b/package/python3/0005-Don-t-add-multiarch-paths.patch
@@ -1,4 +1,4 @@
-From ad463b5d58ae79f69b011fb048861bd874d34369 Mon Sep 17 00:00:00 2001
+From 3e953e494570ddb78823d12f66dae1759f4780a3 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 23 Dec 2015 11:36:27 +0100
 Subject: [PATCH] Don't add multiarch paths
@@ -17,10 +17,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/setup.py b/setup.py
-index 1904898165..32294546b6 100644
+index b283ea3aeed..585dd43828d 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -852,10 +852,10 @@ def configure_compiler(self):
+@@ -853,10 +853,10 @@ def configure_compiler(self):
          if not CROSS_COMPILING:
              add_dir_to_list(self.compiler.library_dirs, '/usr/local/lib')
              add_dir_to_list(self.compiler.include_dirs, '/usr/local/include')
@@ -33,5 +33,5 @@ index 1904898165..32294546b6 100644
  
      def init_inc_lib_dirs(self):
 -- 
-2.34.1
+2.44.0
 
diff --git a/package/python3/0007-Abort-on-failed-module-build.patch b/package/python3/0006-Abort-on-failed-module-build.patch
similarity index 83%
rename from package/python3/0007-Abort-on-failed-module-build.patch
rename to package/python3/0006-Abort-on-failed-module-build.patch
index a473896127..d3ec7c31e8 100644
--- a/package/python3/0007-Abort-on-failed-module-build.patch
+++ b/package/python3/0006-Abort-on-failed-module-build.patch
@@ -1,4 +1,4 @@
-From 60b1664a7acebadb1a3d6df871145147f33b5afe Mon Sep 17 00:00:00 2001
+From 60b62c7e2c1fca4dcaf288f747376bfde111283b Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 23 Dec 2015 11:43:24 +0100
 Subject: [PATCH] Abort on failed module build
@@ -14,10 +14,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/setup.py b/setup.py
-index 32294546b6..0e04944ce0 100644
+index 585dd43828d..53b066cb18b 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -579,6 +579,7 @@ def print_three_column(lst):
+@@ -580,6 +580,7 @@ def print_three_column(lst):
              print("Failed to build these modules:")
              print_three_column(failed)
              print()
@@ -26,5 +26,5 @@ index 32294546b6..0e04944ce0 100644
          if self.failed_on_import:
              failed = self.failed_on_import[:]
 -- 
-2.34.1
+2.44.0
 
diff --git a/package/python3/0008-Serial-ioctl-workaround.patch b/package/python3/0007-Serial-ioctl-workaround.patch
similarity index 88%
rename from package/python3/0008-Serial-ioctl-workaround.patch
rename to package/python3/0007-Serial-ioctl-workaround.patch
index 7722a04f38..34072f894e 100644
--- a/package/python3/0008-Serial-ioctl-workaround.patch
+++ b/package/python3/0007-Serial-ioctl-workaround.patch
@@ -1,4 +1,4 @@
-From 90f3075b629d90d942da1d22ef7563f7149f4f6c Mon Sep 17 00:00:00 2001
+From 0061a02bbe82c9b3b631d3b820bab0ba18482ebc Mon Sep 17 00:00:00 2001
 From: Baruch Siach <baruch@tkos.co.il>
 Date: Wed, 23 Dec 2015 11:44:02 +0100
 Subject: [PATCH] Serial ioctl() workaround
@@ -15,7 +15,7 @@ Signed-off-by: Baruch Siach <baruch@tkos.co.il>
  1 file changed, 2 insertions(+)
 
 diff --git a/Modules/termios.c b/Modules/termios.c
-index 354e5ca18d..c08957c500 100644
+index 23771b2ce99..c1579af435d 100644
 --- a/Modules/termios.c
 +++ b/Modules/termios.c
 @@ -15,7 +15,9 @@
@@ -29,5 +29,5 @@ index 354e5ca18d..c08957c500 100644
  /* HP-UX requires that this be included to pick up MDCD, MCTS, MDSR,
   * MDTR, MRI, and MRTS (apparently used internally by some things
 -- 
-2.34.1
+2.44.0
 
diff --git a/package/python3/0011-Add-an-option-to-disable-pydoc.patch b/package/python3/0008-Add-an-option-to-disable-pydoc.patch
similarity index 84%
rename from package/python3/0011-Add-an-option-to-disable-pydoc.patch
rename to package/python3/0008-Add-an-option-to-disable-pydoc.patch
index f7bfd437bb..3c678bef1c 100644
--- a/package/python3/0011-Add-an-option-to-disable-pydoc.patch
+++ b/package/python3/0008-Add-an-option-to-disable-pydoc.patch
@@ -1,4 +1,4 @@
-From 38b7f7949258aeadf8bc45525be91340bb732a2a Mon Sep 17 00:00:00 2001
+From 77fcd90a1236d59d40aa32d3bc4bef4303eb4066 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 22 Feb 2017 17:07:56 -0800
 Subject: [PATCH] Add an option to disable pydoc
@@ -19,10 +19,10 @@ Signed-off-by: Adam Duskett <aduskett@gmail.com>
  3 files changed, 19 insertions(+), 3 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index c1cfb96767..403380e181 100644
+index 5a40b7c5484..e87bc1fcd32 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1864,7 +1864,9 @@ bininstall: altbininstall
+@@ -1877,7 +1877,9 @@ bininstall: commoninstall altbininstall
  	-rm -f $(DESTDIR)$(BINDIR)/idle3
  	(cd $(DESTDIR)$(BINDIR); $(LN) -s idle$(VERSION) idle3)
  	-rm -f $(DESTDIR)$(BINDIR)/pydoc3
@@ -32,7 +32,7 @@ index c1cfb96767..403380e181 100644
  	-rm -f $(DESTDIR)$(BINDIR)/2to3
  	(cd $(DESTDIR)$(BINDIR); $(LN) -s 2to3-$(VERSION) 2to3)
  	if test "x$(LIPO_32BIT_FLAGS)" != "x" ; then \
-@@ -1915,7 +1917,6 @@ LIBSUBDIRS=	asyncio \
+@@ -1928,7 +1930,6 @@ LIBSUBDIRS=	asyncio \
  		lib2to3 lib2to3/fixes lib2to3/pgen2 \
  		logging \
  		multiprocessing multiprocessing/dummy \
@@ -40,9 +40,9 @@ index c1cfb96767..403380e181 100644
  		re \
  		site-packages \
  		sqlite3 \
-@@ -2008,6 +2009,10 @@ TESTSUBDIRS=	ctypes/test \
- 		tkinter/test/test_ttk \
- 		unittest/test unittest/test/testmock
+@@ -2069,6 +2070,10 @@ TESTSUBDIRS=	ctypes/test \
+ 		unittest/test \
+ 		unittest/test/testmock
  
 +ifeq (@PYDOC@,yes)
 +LIBSUBDIRS += pydoc_data
@@ -52,10 +52,10 @@ index c1cfb96767..403380e181 100644
  libinstall:	all $(srcdir)/Modules/xxmodule.c
  	@for i in $(SCRIPTDIR) $(LIBDEST); \
 diff --git a/configure.ac b/configure.ac
-index 5a6a1fe608..f68ea72321 100644
+index b4d7d2cca6a..d56d8f9d1c5 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -4171,6 +4171,12 @@ AS_VAR_IF([posix_threads], [stub], [
+@@ -4222,6 +4222,12 @@ AS_VAR_IF([posix_threads], [stub], [
    AC_DEFINE([HAVE_PTHREAD_STUBS], [1], [Define if platform requires stubbed pthreads support])
  ])
  
@@ -69,10 +69,10 @@ index 5a6a1fe608..f68ea72321 100644
  AH_TEMPLATE(ENABLE_IPV6, [Define if --enable-ipv6 is specified])
  AC_MSG_CHECKING([if --enable-ipv6 is specified])
 diff --git a/setup.py b/setup.py
-index 0e04944ce0..3e55f5b2e0 100644
+index 53b066cb18b..d8647724650 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -1593,6 +1593,12 @@ class DummyProcess:
+@@ -1597,6 +1597,12 @@ class DummyProcess:
      # turn off warnings when deprecated modules are imported
      import warnings
      warnings.filterwarnings("ignore",category=DeprecationWarning)
@@ -85,7 +85,7 @@ index 0e04944ce0..3e55f5b2e0 100644
      setup(# PyPI Metadata (PEP 301)
            name = "Python",
            version = sys.version.split()[0],
-@@ -1617,8 +1623,7 @@ class DummyProcess:
+@@ -1621,8 +1627,7 @@ class DummyProcess:
            # If you change the scripts installed here, you also need to
            # check the PyBuildScripts command above, and change the links
            # created by the bininstall target in Makefile.pre.in
@@ -96,5 +96,5 @@ index 0e04944ce0..3e55f5b2e0 100644
  
  # --install-platlib
 -- 
-2.34.1
+2.44.0
 
diff --git a/package/python3/0012-Add-an-option-to-disable-lib2to3.patch b/package/python3/0009-Add-an-option-to-disable-lib2to3.patch
similarity index 87%
rename from package/python3/0012-Add-an-option-to-disable-lib2to3.patch
rename to package/python3/0009-Add-an-option-to-disable-lib2to3.patch
index 228b86a90b..13cb273bf8 100644
--- a/package/python3/0012-Add-an-option-to-disable-lib2to3.patch
+++ b/package/python3/0009-Add-an-option-to-disable-lib2to3.patch
@@ -1,4 +1,4 @@
-From 0e4f0a525ea0a68f6d4c5349c301da2e9b0c8ac9 Mon Sep 17 00:00:00 2001
+From 18e19402fab3939223a58481734e685d25c3102b Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 22 Feb 2017 17:15:31 -0800
 Subject: [PATCH] Add an option to disable lib2to3
@@ -21,10 +21,10 @@ Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
  3 files changed, 21 insertions(+), 8 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 403380e181..f5d0573067 100644
+index e87bc1fcd32..1a0ab0de426 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1868,7 +1868,9 @@ ifeq (@PYDOC@,yes)
+@@ -1881,7 +1881,9 @@ ifeq (@PYDOC@,yes)
  	(cd $(DESTDIR)$(BINDIR); $(LN) -s pydoc$(VERSION) pydoc3)
  endif
  	-rm -f $(DESTDIR)$(BINDIR)/2to3
@@ -34,7 +34,7 @@ index 403380e181..f5d0573067 100644
  	if test "x$(LIPO_32BIT_FLAGS)" != "x" ; then \
  		rm -f $(DESTDIR)$(BINDIR)/python3-32$(EXE); \
  		(cd $(DESTDIR)$(BINDIR); $(LN) -s python$(VERSION)-32$(EXE) python3-32$(EXE)) \
-@@ -1914,7 +1916,6 @@ LIBSUBDIRS=	asyncio \
+@@ -1927,7 +1929,6 @@ LIBSUBDIRS=	asyncio \
  		idlelib idlelib/Icons \
  		importlib importlib/resources importlib/metadata \
  		json \
@@ -42,7 +42,7 @@ index 403380e181..f5d0573067 100644
  		logging \
  		multiprocessing multiprocessing/dummy \
  		re \
-@@ -1934,10 +1935,6 @@ LIBSUBDIRS=	asyncio \
+@@ -1947,10 +1948,6 @@ LIBSUBDIRS=	asyncio \
  TESTSUBDIRS=	ctypes/test \
  		distutils/tests \
  		idlelib/idle_test \
@@ -52,8 +52,8 @@ index 403380e181..f5d0573067 100644
 -		lib2to3/tests/data/fixers/myfixes \
  		test \
  		test/audiodata \
- 		test/capath \
-@@ -2013,6 +2010,14 @@ ifeq (@PYDOC@,yes)
+ 		test/certdata \
+@@ -2074,6 +2071,14 @@ ifeq (@PYDOC@,yes)
  LIBSUBDIRS += pydoc_data
  endif
  
@@ -68,7 +68,7 @@ index 403380e181..f5d0573067 100644
  TEST_MODULES=@TEST_MODULES@
  libinstall:	all $(srcdir)/Modules/xxmodule.c
  	@for i in $(SCRIPTDIR) $(LIBDEST); \
-@@ -2115,10 +2120,12 @@ ifeq (@PYC_BUILD@,yes)
+@@ -2176,10 +2181,12 @@ ifeq (@PYC_BUILD@,yes)
  		-j0 -d $(LIBDEST)/site-packages -f \
  		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
  endif
@@ -82,10 +82,10 @@ index 403380e181..f5d0573067 100644
  # bpo-21536: Misc/python-config.sh is generated in the build directory
  # from $(srcdir)Misc/python-config.sh.in.
 diff --git a/configure.ac b/configure.ac
-index f68ea72321..d8e10cf2b2 100644
+index d56d8f9d1c5..bf91fb2f824 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -7078,6 +7078,12 @@ PY_STDLIB_MOD([xxlimited_35], [test "$with_trace_refs" = "no"], [test "$ac_cv_fu
+@@ -7147,6 +7147,12 @@ PY_STDLIB_MOD([xxlimited_35], [test "$with_trace_refs" = "no"], [test "$ac_cv_fu
  # substitute multiline block, must come after last PY_STDLIB_MOD()
  AC_SUBST([MODULE_BLOCK])
  
@@ -99,10 +99,10 @@ index f68ea72321..d8e10cf2b2 100644
  AC_CONFIG_FILES(Makefile.pre Misc/python.pc Misc/python-embed.pc Misc/python-config.sh)
  AC_CONFIG_FILES([Modules/Setup.bootstrap Modules/Setup.stdlib])
 diff --git a/setup.py b/setup.py
-index 3e55f5b2e0..c490b0b08f 100644
+index d8647724650..e02591dae10 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -1594,11 +1594,11 @@ class DummyProcess:
+@@ -1598,11 +1598,11 @@ class DummyProcess:
      import warnings
      warnings.filterwarnings("ignore",category=DeprecationWarning)
  
@@ -118,5 +118,5 @@ index 3e55f5b2e0..c490b0b08f 100644
            name = "Python",
            version = sys.version.split()[0],
 -- 
-2.34.1
+2.44.0
 
diff --git a/package/python3/0013-Add-option-to-disable-the-sqlite3-module.patch b/package/python3/0010-Add-option-to-disable-the-sqlite3-module.patch
similarity index 82%
rename from package/python3/0013-Add-option-to-disable-the-sqlite3-module.patch
rename to package/python3/0010-Add-option-to-disable-the-sqlite3-module.patch
index 795ea3b898..5ed282208b 100644
--- a/package/python3/0013-Add-option-to-disable-the-sqlite3-module.patch
+++ b/package/python3/0010-Add-option-to-disable-the-sqlite3-module.patch
@@ -1,4 +1,4 @@
-From ef8c030e01b1be8be582e90c31298a5863094858 Mon Sep 17 00:00:00 2001
+From aba9392bf6bf68cfd63b1cecfdd3e96d5de2a0b7 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 22 Feb 2017 17:20:45 -0800
 Subject: [PATCH] Add option to disable the sqlite3 module
@@ -15,10 +15,10 @@ Signed-off-by: Adam Duskett <aduskett@gmail.com>
  2 files changed, 13 insertions(+), 1 deletion(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index f5d0573067..9f4cdf14cf 100644
+index 1a0ab0de426..1c7b38ce4f6 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1920,7 +1920,6 @@ LIBSUBDIRS=	asyncio \
+@@ -1933,7 +1933,6 @@ LIBSUBDIRS=	asyncio \
  		multiprocessing multiprocessing/dummy \
  		re \
  		site-packages \
@@ -26,7 +26,7 @@ index f5d0573067..9f4cdf14cf 100644
  		tkinter \
  		tomllib \
  		turtledemo \
-@@ -2018,6 +2017,10 @@ TESTSUBDIRS += lib2to3/tests			\
+@@ -2079,6 +2078,10 @@ TESTSUBDIRS += lib2to3/tests			\
  	lib2to3/tests/data/fixers/myfixes
  endif
  
@@ -38,10 +38,10 @@ index f5d0573067..9f4cdf14cf 100644
  libinstall:	all $(srcdir)/Modules/xxmodule.c
  	@for i in $(SCRIPTDIR) $(LIBDEST); \
 diff --git a/configure.ac b/configure.ac
-index d8e10cf2b2..4cc0951ab9 100644
+index bf91fb2f824..0013afc9aad 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -4171,6 +4171,15 @@ AS_VAR_IF([posix_threads], [stub], [
+@@ -4222,6 +4222,15 @@ AS_VAR_IF([posix_threads], [stub], [
    AC_DEFINE([HAVE_PTHREAD_STUBS], [1], [Define if platform requires stubbed pthreads support])
  ])
  
@@ -58,5 +58,5 @@ index d8e10cf2b2..4cc0951ab9 100644
  
  AC_ARG_ENABLE(pydoc,
 -- 
-2.34.1
+2.44.0
 
diff --git a/package/python3/0014-Add-an-option-to-disable-the-tk-module.patch b/package/python3/0011-Add-an-option-to-disable-the-tk-module.patch
similarity index 79%
rename from package/python3/0014-Add-an-option-to-disable-the-tk-module.patch
rename to package/python3/0011-Add-an-option-to-disable-the-tk-module.patch
index b89e1d27bc..2d5c002e0f 100644
--- a/package/python3/0014-Add-an-option-to-disable-the-tk-module.patch
+++ b/package/python3/0011-Add-an-option-to-disable-the-tk-module.patch
@@ -1,4 +1,4 @@
-From bbbfe699d648a5cb191203b16e1786e8cf4ea908 Mon Sep 17 00:00:00 2001
+From 61535b58452a18d6654a02fd25bfbc562bbbdbea Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 22 Feb 2017 17:23:42 -0800
 Subject: [PATCH] Add an option to disable the tk module
@@ -12,15 +12,15 @@ Signed-off-by: Adam Duskett <aduskett@gmail.com>
 [ Bernd Kuhls: ported to Python 3.11.4]
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 ---
- Makefile.pre.in | 10 +++++++---
+ Makefile.pre.in | 11 +++++++----
  configure.ac    |  9 +++++++++
- 2 files changed, 16 insertions(+), 3 deletions(-)
+ 2 files changed, 16 insertions(+), 4 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 9f4cdf14cf..4f83911200 100644
+index 1c7b38ce4f6..6ab184fe5f8 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1920,7 +1920,6 @@ LIBSUBDIRS=	asyncio \
+@@ -1933,7 +1933,6 @@ LIBSUBDIRS=	asyncio \
  		multiprocessing multiprocessing/dummy \
  		re \
  		site-packages \
@@ -28,7 +28,7 @@ index 9f4cdf14cf..4f83911200 100644
  		tomllib \
  		turtledemo \
  		unittest \
-@@ -2038,9 +2038,6 @@
+@@ -2060,9 +2059,6 @@ TESTSUBDIRS=	ctypes/test \
  		test/xmltestdata \
  		test/xmltestdata/c14n-20 \
  		test/ziptestdata \
@@ -37,8 +37,8 @@ index 9f4cdf14cf..4f83911200 100644
 -		tkinter/test/test_ttk \
  		unittest/test \
  		unittest/test/testmock
- ifeq (@PYDOC@,yes)
-@@ -2021,6 +2018,13 @@ ifeq (@SQLITE3@,yes)
+ 
+@@ -2082,6 +2078,13 @@ ifeq (@SQLITE3@,yes)
  LIBSUBDIRS += sqlite3
  endif
  
@@ -53,10 +53,10 @@ index 9f4cdf14cf..4f83911200 100644
  libinstall:	all $(srcdir)/Modules/xxmodule.c
  	@for i in $(SCRIPTDIR) $(LIBDEST); \
 diff --git a/configure.ac b/configure.ac
-index 4cc0951ab9..f4ce506801 100644
+index 0013afc9aad..342b295bcdd 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -4180,6 +4180,15 @@ if test "$SQLITE3" = "no" ; then
+@@ -4231,6 +4231,15 @@ if test "$SQLITE3" = "no" ; then
     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _sqlite3"
  fi
  
@@ -73,5 +73,5 @@ index 4cc0951ab9..f4ce506801 100644
  
  AC_ARG_ENABLE(pydoc,
 -- 
-2.34.1
+2.44.0
 
diff --git a/package/python3/0015-Add-an-option-to-disable-the-curses-module.patch b/package/python3/0012-Add-an-option-to-disable-the-curses-module.patch
similarity index 82%
rename from package/python3/0015-Add-an-option-to-disable-the-curses-module.patch
rename to package/python3/0012-Add-an-option-to-disable-the-curses-module.patch
index da6f891104..0b15dfb01c 100644
--- a/package/python3/0015-Add-an-option-to-disable-the-curses-module.patch
+++ b/package/python3/0012-Add-an-option-to-disable-the-curses-module.patch
@@ -1,4 +1,4 @@
-From 03e28cdd46dac1b7e4e9c8bbd2ea44b09e514205 Mon Sep 17 00:00:00 2001
+From d843bceff915b2a50b36a9db8552e0db5bd90f6d Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 22 Feb 2017 17:31:51 -0800
 Subject: [PATCH] Add an option to disable the curses module
@@ -15,10 +15,10 @@ Signed-off-by: Adam Duskett <aduskett@gmail.com>
  2 files changed, 12 insertions(+), 1 deletion(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 4f83911200..8e879b35c6 100644
+index 6ab184fe5f8..09408c3471f 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1905,7 +1905,6 @@ LIBSUBDIRS=	asyncio \
+@@ -1918,7 +1918,6 @@ LIBSUBDIRS=	asyncio \
  		concurrent concurrent/futures \
  		csv \
  		ctypes ctypes/macholib \
@@ -26,7 +26,7 @@ index 4f83911200..8e879b35c6 100644
  		dbm \
  		distutils distutils/command \
  		email email/mime \
-@@ -2024,6 +2023,9 @@ TESTSUBDIRS += tkinter/test tkinter/test/test_tkinter \
+@@ -2084,6 +2083,9 @@ TESTSUBDIRS += tkinter/test tkinter/test/test_tkinter \
  	tkinter/test/test_ttk
  endif
  
@@ -37,10 +37,10 @@ index 4f83911200..8e879b35c6 100644
  TEST_MODULES=@TEST_MODULES@
  libinstall:	all $(srcdir)/Modules/xxmodule.c
 diff --git a/configure.ac b/configure.ac
-index f4ce506801..0ae9863cd6 100644
+index 342b295bcdd..5d52c813ba6 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -4189,6 +4189,15 @@ if test "$TK" = "no"; then
+@@ -4240,6 +4240,15 @@ if test "$TK" = "no"; then
     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _tkinter"
  fi
  
@@ -57,5 +57,5 @@ index f4ce506801..0ae9863cd6 100644
  
  AC_ARG_ENABLE(pydoc,
 -- 
-2.34.1
+2.44.0
 
diff --git a/package/python3/0016-Add-an-option-to-disable-expat.patch b/package/python3/0013-Add-an-option-to-disable-expat.patch
similarity index 89%
rename from package/python3/0016-Add-an-option-to-disable-expat.patch
rename to package/python3/0013-Add-an-option-to-disable-expat.patch
index c30740762a..03d8271e5d 100644
--- a/package/python3/0016-Add-an-option-to-disable-expat.patch
+++ b/package/python3/0013-Add-an-option-to-disable-expat.patch
@@ -1,4 +1,4 @@
-From c9a2ea3edacf57746517600ccc11c254a9fd6c48 Mon Sep 17 00:00:00 2001
+From 3ed9d35554631a1e0c438636b60b6b9b699cba4b Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 22 Feb 2017 17:40:45 -0800
 Subject: [PATCH] Add an option to disable expat
@@ -21,10 +21,10 @@ Signed-off-by: Adam Duskett <aduskett@gmail.com>
  2 files changed, 18 insertions(+), 7 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 8e879b35c6..80d617cf7f 100644
+index 09408c3471f..8e5f6762d20 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1925,7 +1925,6 @@ LIBSUBDIRS=	asyncio \
+@@ -1938,7 +1938,6 @@ LIBSUBDIRS=	asyncio \
  		urllib \
  		venv venv/scripts venv/scripts/common venv/scripts/posix \
  		wsgiref \
@@ -32,7 +32,7 @@ index 8e879b35c6..80d617cf7f 100644
  		xmlrpc \
  		zoneinfo \
  		__phello__
-@@ -2027,6 +2026,10 @@ ifeq (@CURSES@,yes)
+@@ -2087,6 +2086,10 @@ ifeq (@CURSES@,yes)
  LIBSUBDIRS += curses
  endif
  
@@ -44,10 +44,10 @@ index 8e879b35c6..80d617cf7f 100644
  libinstall:	all $(srcdir)/Modules/xxmodule.c
  	@for i in $(SCRIPTDIR) $(LIBDEST); \
 diff --git a/configure.ac b/configure.ac
-index 0ae9863cd6..201cad0bfc 100644
+index 5d52c813ba6..6e577f19b8c 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3565,15 +3565,23 @@ LIBS="$withval $LIBS"
+@@ -3615,15 +3615,23 @@ LIBS="$withval $LIBS"
  AC_SUBST(DISABLED_EXTENSIONS)
  
  # Check for use of the system expat library
@@ -78,5 +78,5 @@ index 0ae9863cd6..201cad0bfc 100644
    LIBEXPAT_LDFLAGS=${LIBEXPAT_LDFLAGS-"-lexpat"}
    LIBEXPAT_INTERNAL=
 -- 
-2.34.1
+2.44.0
 
diff --git a/package/python3/0017-Add-an-option-to-disable-CJK-codecs.patch b/package/python3/0014-Add-an-option-to-disable-CJK-codecs.patch
similarity index 82%
rename from package/python3/0017-Add-an-option-to-disable-CJK-codecs.patch
rename to package/python3/0014-Add-an-option-to-disable-CJK-codecs.patch
index 63a07fb514..7e13a07a1d 100644
--- a/package/python3/0017-Add-an-option-to-disable-CJK-codecs.patch
+++ b/package/python3/0014-Add-an-option-to-disable-CJK-codecs.patch
@@ -1,4 +1,4 @@
-From d8ef6a7a9f2b954cf1c1e37fc3c35055b42af0f5 Mon Sep 17 00:00:00 2001
+From 494fae96f273517c43c65a5d9ea6b7d968352443 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 23 Dec 2015 11:49:55 +0100
 Subject: [PATCH] Add an option to disable CJK codecs
@@ -9,10 +9,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  1 file changed, 6 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index 201cad0bfc..ecdd7dbc07 100644
+index 6e577f19b8c..13ffcf2637e 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -4188,6 +4188,12 @@ if test "$SQLITE3" = "no" ; then
+@@ -4239,6 +4239,12 @@ if test "$SQLITE3" = "no" ; then
     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _sqlite3"
  fi
  
@@ -26,5 +26,5 @@ index 201cad0bfc..ecdd7dbc07 100644
  AC_ARG_ENABLE(tk,
  	AS_HELP_STRING([--disable-tk], [disable tk]),
 -- 
-2.34.1
+2.44.0
 
diff --git a/package/python3/0018-Add-an-option-to-disable-NIS.patch b/package/python3/0015-Add-an-option-to-disable-NIS.patch
similarity index 84%
rename from package/python3/0018-Add-an-option-to-disable-NIS.patch
rename to package/python3/0015-Add-an-option-to-disable-NIS.patch
index 977955d1cb..ee382ace7e 100644
--- a/package/python3/0018-Add-an-option-to-disable-NIS.patch
+++ b/package/python3/0015-Add-an-option-to-disable-NIS.patch
@@ -1,4 +1,4 @@
-From 09fc9f72ebe60bb65e80732a6bd4f12a84159f6d Mon Sep 17 00:00:00 2001
+From 3f4f9bee66236e2052f9ff027e867a61ec56a585 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 23 Dec 2015 11:50:11 +0100
 Subject: [PATCH] Add an option to disable NIS
@@ -12,10 +12,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  1 file changed, 6 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index ecdd7dbc07..1bdde7f69d 100644
+index 13ffcf2637e..2faadb34f65 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -4194,6 +4194,12 @@ AC_ARG_ENABLE(codecs-cjk,
+@@ -4245,6 +4245,12 @@ AC_ARG_ENABLE(codecs-cjk,
  		DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _codecs_kr _codecs_jp _codecs_cn _codecs_tw _codecs_hk _codecs_iso2022"
  	fi])
  
@@ -29,5 +29,5 @@ index ecdd7dbc07..1bdde7f69d 100644
  AC_ARG_ENABLE(tk,
  	AS_HELP_STRING([--disable-tk], [disable tk]),
 -- 
-2.34.1
+2.44.0
 
diff --git a/package/python3/0019-Add-an-option-to-disable-unicodedata.patch b/package/python3/0016-Add-an-option-to-disable-unicodedata.patch
similarity index 83%
rename from package/python3/0019-Add-an-option-to-disable-unicodedata.patch
rename to package/python3/0016-Add-an-option-to-disable-unicodedata.patch
index 74702b67a5..f5e57c127e 100644
--- a/package/python3/0019-Add-an-option-to-disable-unicodedata.patch
+++ b/package/python3/0016-Add-an-option-to-disable-unicodedata.patch
@@ -1,4 +1,4 @@
-From 4fe7f375a3d171d294caebdd7b7ce49bbc9ad9f3 Mon Sep 17 00:00:00 2001
+From 15490e1576d5836a7afc5a3eca75e087bb3f032e Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 23 Dec 2015 11:50:27 +0100
 Subject: [PATCH] Add an option to disable unicodedata
@@ -9,10 +9,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  1 file changed, 6 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index 1bdde7f69d..ba4b0e0c1c 100644
+index 2faadb34f65..cb7e980e5b5 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -4200,6 +4200,12 @@ AC_ARG_ENABLE(nis,
+@@ -4251,6 +4251,12 @@ AC_ARG_ENABLE(nis,
      	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} nis"
    	  fi])
  
@@ -26,5 +26,5 @@ index 1bdde7f69d..ba4b0e0c1c 100644
  AC_ARG_ENABLE(tk,
  	AS_HELP_STRING([--disable-tk], [disable tk]),
 -- 
-2.34.1
+2.44.0
 
diff --git a/package/python3/0020-Add-an-option-to-disable-IDLE.patch b/package/python3/0017-Add-an-option-to-disable-IDLE.patch
similarity index 86%
rename from package/python3/0020-Add-an-option-to-disable-IDLE.patch
rename to package/python3/0017-Add-an-option-to-disable-IDLE.patch
index 09b5f13cdb..f0af3f53f4 100644
--- a/package/python3/0020-Add-an-option-to-disable-IDLE.patch
+++ b/package/python3/0017-Add-an-option-to-disable-IDLE.patch
@@ -1,4 +1,4 @@
-From 2c9dbd6d49744aa8da8ebf8d0187d6b06f93c2b5 Mon Sep 17 00:00:00 2001
+From f74c580b9e5bd8c710627b48cea4e152426e71e6 Mon Sep 17 00:00:00 2001
 From: Maxime Ripard <maxime.ripard@free-electrons.com>
 Date: Wed, 22 Feb 2017 17:45:14 -0800
 Subject: [PATCH] Add an option to disable IDLE
@@ -18,10 +18,10 @@ Signed-off-by: Adam Duskett <aduskett@gmail.com>
  3 files changed, 16 insertions(+), 2 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 80d617cf7f..8d1ba1356c 100644
+index 8e5f6762d20..4e407cbcfa9 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1862,7 +1862,9 @@ bininstall: altbininstall
+@@ -1875,7 +1875,9 @@ bininstall: commoninstall altbininstall
  	-rm -f $(DESTDIR)$(LIBPC)/python3-embed.pc
  	(cd $(DESTDIR)$(LIBPC); $(LN) -s python-$(VERSION)-embed.pc python3-embed.pc)
  	-rm -f $(DESTDIR)$(BINDIR)/idle3
@@ -31,7 +31,7 @@ index 80d617cf7f..8d1ba1356c 100644
  	-rm -f $(DESTDIR)$(BINDIR)/pydoc3
  ifeq (@PYDOC@,yes)
  	(cd $(DESTDIR)$(BINDIR); $(LN) -s pydoc$(VERSION) pydoc3)
-@@ -1912,7 +1914,6 @@ LIBSUBDIRS=	asyncio \
+@@ -1925,7 +1927,6 @@ LIBSUBDIRS=	asyncio \
  		ensurepip ensurepip/_bundled \
  		html \
  		http \
@@ -39,7 +39,7 @@ index 80d617cf7f..8d1ba1356c 100644
  		importlib importlib/resources importlib/metadata \
  		json \
  		logging \
-@@ -2030,6 +2031,10 @@ ifeq (@EXPAT@,yes)
+@@ -2090,6 +2091,10 @@ ifeq (@EXPAT@,yes)
  LIBSUBDIRS += $(XMLLIBSUBDIRS)
  endif
  
@@ -51,10 +51,10 @@ index 80d617cf7f..8d1ba1356c 100644
  libinstall:	all $(srcdir)/Modules/xxmodule.c
  	@for i in $(SCRIPTDIR) $(LIBDEST); \
 diff --git a/configure.ac b/configure.ac
-index ba4b0e0c1c..5e6d72f7db 100644
+index cb7e980e5b5..fe497ec9dfb 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -7137,6 +7137,12 @@ AC_ARG_ENABLE(lib2to3,
+@@ -7206,6 +7206,12 @@ AC_ARG_ENABLE(lib2to3,
  	AS_HELP_STRING([--disable-lib2to3], [disable lib2to3]),
  	[ LIB2TO3="${enableval}" ], [ LIB2TO3=yes ])
  
@@ -68,10 +68,10 @@ index ba4b0e0c1c..5e6d72f7db 100644
  AC_CONFIG_FILES(Makefile.pre Misc/python.pc Misc/python-embed.pc Misc/python-config.sh)
  AC_CONFIG_FILES([Modules/Setup.bootstrap Modules/Setup.stdlib])
 diff --git a/setup.py b/setup.py
-index c490b0b08f..4d49a792f7 100644
+index e02591dae10..ada914c5501 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -1594,11 +1594,14 @@ class DummyProcess:
+@@ -1598,11 +1598,14 @@ class DummyProcess:
      import warnings
      warnings.filterwarnings("ignore",category=DeprecationWarning)
  
@@ -88,5 +88,5 @@ index c490b0b08f..4d49a792f7 100644
            name = "Python",
            version = sys.version.split()[0],
 -- 
-2.34.1
+2.44.0
 
diff --git a/package/python3/0021-Add-an-option-to-disable-decimal.patch b/package/python3/0018-Add-an-option-to-disable-decimal.patch
similarity index 93%
rename from package/python3/0021-Add-an-option-to-disable-decimal.patch
rename to package/python3/0018-Add-an-option-to-disable-decimal.patch
index d683565f94..dc966b915d 100644
--- a/package/python3/0021-Add-an-option-to-disable-decimal.patch
+++ b/package/python3/0018-Add-an-option-to-disable-decimal.patch
@@ -1,4 +1,4 @@
-From 7091fdf77f612425c178a75148560f9c3514e8b8 Mon Sep 17 00:00:00 2001
+From 12b5db4e25182962eb0b8bc21479a743c35a158c Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 23 Dec 2015 11:51:31 +0100
 Subject: [PATCH] Add an option to disable decimal
@@ -18,10 +18,10 @@ Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
  1 file changed, 13 insertions(+), 6 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 5e6d72f7db..e6b1f1e9de 100644
+index fe497ec9dfb..20b3c2459f4 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3630,14 +3630,21 @@ fi
+@@ -3680,14 +3680,21 @@ fi
  AC_SUBST(LIBFFI_INCLUDEDIR)
  
  # Check for use of the system libmpdec library
@@ -50,5 +50,5 @@ index 5e6d72f7db..e6b1f1e9de 100644
    LIBMPDEC_LDFLAGS=${LIBMPDEC_LDFLAGS-"-lmpdec"}
    LIBMPDEC_INTERNAL=
 -- 
-2.34.1
+2.44.0
 
diff --git a/package/python3/0022-Add-an-option-to-disable-the-ossaudiodev-module.patch b/package/python3/0019-Add-an-option-to-disable-the-ossaudiodev-module.patch
similarity index 84%
rename from package/python3/0022-Add-an-option-to-disable-the-ossaudiodev-module.patch
rename to package/python3/0019-Add-an-option-to-disable-the-ossaudiodev-module.patch
index 56713a7f8f..d05e0a8a48 100644
--- a/package/python3/0022-Add-an-option-to-disable-the-ossaudiodev-module.patch
+++ b/package/python3/0019-Add-an-option-to-disable-the-ossaudiodev-module.patch
@@ -1,4 +1,4 @@
-From d48d9da534cec7891ae444b4ab94a76ac67f5daa Mon Sep 17 00:00:00 2001
+From 17d7b6d56cf554dcc6fcb263e1fd2b9e3dbf4320 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 23 Dec 2015 11:51:58 +0100
 Subject: [PATCH] Add an option to disable the ossaudiodev module
@@ -9,10 +9,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  1 file changed, 6 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index e6b1f1e9de..db33d567ad 100644
+index 20b3c2459f4..87853f47329 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3678,6 +3678,12 @@ fi
+@@ -3728,6 +3728,12 @@ fi
  
  AC_MSG_RESULT($with_decimal_contextvar)
  
@@ -26,5 +26,5 @@ index e6b1f1e9de..db33d567ad 100644
  AC_MSG_CHECKING(for decimal libmpdec machine)
  AS_CASE([$ac_sys_system],
 -- 
-2.34.1
+2.44.0
 
diff --git a/package/python3/0023-Add-an-option-to-disable-openssl-support.patch b/package/python3/0020-Add-an-option-to-disable-openssl-support.patch
similarity index 82%
rename from package/python3/0023-Add-an-option-to-disable-openssl-support.patch
rename to package/python3/0020-Add-an-option-to-disable-openssl-support.patch
index d4c9fd43be..6e95ae49a4 100644
--- a/package/python3/0023-Add-an-option-to-disable-openssl-support.patch
+++ b/package/python3/0020-Add-an-option-to-disable-openssl-support.patch
@@ -1,4 +1,4 @@
-From 25c900e81a2fc0bbe35e7c94e2e5028cfbf6582a Mon Sep 17 00:00:00 2001
+From 959521c99fed46efab9bf0a1ae4b77b2365cf0d1 Mon Sep 17 00:00:00 2001
 From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
 Date: Wed, 22 Feb 2017 17:55:59 -0800
 Subject: [PATCH] Add an option to disable openssl support.
@@ -9,10 +9,10 @@ Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
  1 file changed, 6 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index db33d567ad..42fe6c8f5a 100644
+index 87853f47329..3f8f0419767 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -4219,6 +4219,12 @@ AC_ARG_ENABLE(unicodedata,
+@@ -4270,6 +4270,12 @@ AC_ARG_ENABLE(unicodedata,
      	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} unicodedata"
    	  fi])
  
@@ -26,5 +26,5 @@ index db33d567ad..42fe6c8f5a 100644
  AC_ARG_ENABLE(tk,
  	AS_HELP_STRING([--disable-tk], [disable tk]),
 -- 
-2.34.1
+2.44.0
 
diff --git a/package/python3/0024-Add-an-option-to-disable-the-readline-module.patch b/package/python3/0021-Add-an-option-to-disable-the-readline-module.patch
similarity index 82%
rename from package/python3/0024-Add-an-option-to-disable-the-readline-module.patch
rename to package/python3/0021-Add-an-option-to-disable-the-readline-module.patch
index 9250007dae..48b7f949ad 100644
--- a/package/python3/0024-Add-an-option-to-disable-the-readline-module.patch
+++ b/package/python3/0021-Add-an-option-to-disable-the-readline-module.patch
@@ -1,4 +1,4 @@
-From 9082468ca620db77b670ccf568a96bbabb865f80 Mon Sep 17 00:00:00 2001
+From 3ea53d30005a06134a9ef05051493efb9c30712b Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Tue, 7 Mar 2017 23:29:05 +0100
 Subject: [PATCH] Add an option to disable the readline module
@@ -9,10 +9,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  1 file changed, 6 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index 42fe6c8f5a..19875d7d30 100644
+index 3f8f0419767..11a798b25bb 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -4225,6 +4225,12 @@ AC_ARG_ENABLE(openssl,
+@@ -4276,6 +4276,12 @@ AC_ARG_ENABLE(openssl,
  	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} ssl _ssl _hashlib"
  	  fi])
  
@@ -26,5 +26,5 @@ index 42fe6c8f5a..19875d7d30 100644
  AC_ARG_ENABLE(tk,
  	AS_HELP_STRING([--disable-tk], [disable tk]),
 -- 
-2.34.1
+2.44.0
 
diff --git a/package/python3/0025-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch b/package/python3/0022-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch
similarity index 87%
rename from package/python3/0025-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch
rename to package/python3/0022-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch
index 70a0d6cd15..a1c5856dd7 100644
--- a/package/python3/0025-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch
+++ b/package/python3/0022-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch
@@ -1,4 +1,4 @@
-From 988a335cb34b5fc25ea345ba04ff5ddffe2e946c Mon Sep 17 00:00:00 2001
+From 32dfbdc953a8c992c2b7a5562b899cbc3a7a6e70 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Tue, 7 Mar 2017 23:31:11 +0100
 Subject: [PATCH] Add options to disable zlib, bzip2 and xz modules
@@ -9,10 +9,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  1 file changed, 18 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index 19875d7d30..ca6c16491a 100644
+index 11a798b25bb..bd18ebe7582 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -4231,6 +4231,24 @@ AC_ARG_ENABLE(readline,
+@@ -4282,6 +4282,24 @@ AC_ARG_ENABLE(readline,
  	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} readline"
  	  fi])
  
@@ -38,5 +38,5 @@ index 19875d7d30..ca6c16491a 100644
  AC_ARG_ENABLE(tk,
  	AS_HELP_STRING([--disable-tk], [disable tk]),
 -- 
-2.34.1
+2.44.0
 
diff --git a/package/python3/0027-Add-an-option-to-disable-uuid-module.patch b/package/python3/0023-Add-an-option-to-disable-uuid-module.patch
similarity index 81%
rename from package/python3/0027-Add-an-option-to-disable-uuid-module.patch
rename to package/python3/0023-Add-an-option-to-disable-uuid-module.patch
index a9501ec189..ef791c5eff 100644
--- a/package/python3/0027-Add-an-option-to-disable-uuid-module.patch
+++ b/package/python3/0023-Add-an-option-to-disable-uuid-module.patch
@@ -1,4 +1,4 @@
-From 58027d25c3cabcf654cb0b31a61d7cbd53dc68c0 Mon Sep 17 00:00:00 2001
+From 1bf575c16a957dfc5ee6913b462d24a4e882698e Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 Date: Sat, 18 Aug 2018 10:54:56 +0200
 Subject: [PATCH] Add an option to disable uuid module
@@ -9,10 +9,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
  1 file changed, 9 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index ca6c16491a..ed03b27fb1 100644
+index bd18ebe7582..6205e6782cf 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -4267,6 +4267,15 @@ if test "$CURSES" = "no"; then
+@@ -4318,6 +4318,15 @@ if test "$CURSES" = "no"; then
     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _curses _curses_panel"
  fi
  
@@ -29,5 +29,5 @@ index ca6c16491a..ed03b27fb1 100644
  
  AC_ARG_ENABLE(pydoc,
 -- 
-2.34.1
+2.44.0
 
diff --git a/package/python3/0029-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch b/package/python3/0024-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch
similarity index 91%
rename from package/python3/0029-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch
rename to package/python3/0024-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch
index 5253076d90..1b7b972bdf 100644
--- a/package/python3/0029-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch
+++ b/package/python3/0024-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch
@@ -1,4 +1,4 @@
-From 07b950aadd570b9f96a1f128505a959b32f40962 Mon Sep 17 00:00:00 2001
+From a1495856f48a8ce256d972f656184e38baced12e Mon Sep 17 00:00:00 2001
 From: Peter Korsgaard <peter@korsgaard.com>
 Date: Fri, 2 Aug 2019 15:53:16 +0200
 Subject: [PATCH] configure.ac: fixup $CC --print-multiarch output for
@@ -30,10 +30,10 @@ Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
  1 file changed, 5 insertions(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index ed03b27fb1..841fd6732c 100644
+index 6205e6782cf..da884ddf441 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1086,7 +1086,11 @@ AC_MSG_CHECKING([for multiarch])
+@@ -1104,7 +1104,11 @@ AC_MSG_CHECKING([for multiarch])
  AS_CASE([$ac_sys_system],
    [Darwin*], [MULTIARCH=""],
    [FreeBSD*], [MULTIARCH=""],
@@ -47,5 +47,5 @@ index ed03b27fb1..841fd6732c 100644
  AC_SUBST([MULTIARCH])
  AC_MSG_RESULT([$MULTIARCH])
 -- 
-2.34.1
+2.44.0
 
diff --git a/package/python3/0030-Add-an-option-to-disable-the-berkeleydb-module.patch b/package/python3/0025-Add-an-option-to-disable-the-berkeleydb-module.patch
similarity index 80%
rename from package/python3/0030-Add-an-option-to-disable-the-berkeleydb-module.patch
rename to package/python3/0025-Add-an-option-to-disable-the-berkeleydb-module.patch
index 5fb436db59..80a0077c65 100644
--- a/package/python3/0030-Add-an-option-to-disable-the-berkeleydb-module.patch
+++ b/package/python3/0025-Add-an-option-to-disable-the-berkeleydb-module.patch
@@ -1,4 +1,4 @@
-From 67e9793d070ac5c8e83abbe95b9208533ffeadd0 Mon Sep 17 00:00:00 2001
+From 7ee16a7096ccf9001f30b9076f562229efb9bcf3 Mon Sep 17 00:00:00 2001
 From: Bernd Kuhls <bernd.kuhls@t-online.de>
 Date: Sat, 11 Apr 2020 22:01:40 +0200
 Subject: [PATCH] Add an option to disable the berkeleydb module
@@ -9,10 +9,10 @@ Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
  1 file changed, 6 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index 841fd6732c..06c9a81f95 100644
+index da884ddf441..852cbaa6e4c 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -4280,6 +4280,12 @@ if test "$UUID" = "no"; then
+@@ -4331,6 +4331,12 @@ if test "$UUID" = "no"; then
     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _uuid"
  fi
  
@@ -26,5 +26,5 @@ index 841fd6732c..06c9a81f95 100644
  
  AC_ARG_ENABLE(pydoc,
 -- 
-2.34.1
+2.44.0
 
diff --git a/package/python3/0031-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch b/package/python3/0026-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch
similarity index 93%
rename from package/python3/0031-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch
rename to package/python3/0026-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch
index 712fd08fb1..b55e1a2813 100644
--- a/package/python3/0031-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch
+++ b/package/python3/0026-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch
@@ -1,4 +1,4 @@
-From 3edeed879871a10acbe802f4a68cff3d4869dbde Mon Sep 17 00:00:00 2001
+From d6706e827f703c63ab519d104c53833fa5cebe03 Mon Sep 17 00:00:00 2001
 From: Romain Naour <romain.naour@gmail.com>
 Date: Thu, 12 Nov 2020 00:16:18 +0100
 Subject: [PATCH] lib/crypt: uClibc-ng doesn't set errno when encryption method
@@ -23,7 +23,7 @@ Signed-off-by: Daniel Lang <d.lang@abatec.at>
  1 file changed, 3 insertions(+), 1 deletion(-)
 
 diff --git a/Lib/crypt.py b/Lib/crypt.py
-index de4a14a388..ba482487a7 100644
+index de4a14a3884..ba482487a7a 100644
 --- a/Lib/crypt.py
 +++ b/Lib/crypt.py
 @@ -98,7 +98,9 @@ def _add_method(name, *args, rounds=None):
@@ -38,5 +38,5 @@ index de4a14a388..ba482487a7 100644
          raise
      if result and len(result) == method.total_size:
 -- 
-2.34.1
+2.44.0
 
diff --git a/package/python3/0032-gh-115382-Fix-cross-compiles-when-host-and-target-us.patch b/package/python3/0027-gh-115382-Fix-cross-compiles-when-host-and-target-us.patch
similarity index 95%
rename from package/python3/0032-gh-115382-Fix-cross-compiles-when-host-and-target-us.patch
rename to package/python3/0027-gh-115382-Fix-cross-compiles-when-host-and-target-us.patch
index 4d5afeb3cb..6c66a3410b 100644
--- a/package/python3/0032-gh-115382-Fix-cross-compiles-when-host-and-target-us.patch
+++ b/package/python3/0027-gh-115382-Fix-cross-compiles-when-host-and-target-us.patch
@@ -1,4 +1,4 @@
-From 8d8cc9087fd44c097775ca0a9ebb6c877605baec Mon Sep 17 00:00:00 2001
+From ffe5a060a1b24bedc2aac5d60d6b3b7e40f55adc Mon Sep 17 00:00:00 2001
 From: Vincent Fazio <5265893+vfazio@users.noreply.github.com>
 Date: Wed, 28 Feb 2024 13:55:04 -0600
 Subject: [PATCH] gh-115382: Fix cross compiles when host and target use same
@@ -48,10 +48,10 @@ Upstream: https://github.com/python/cpython/pull/116294
  6 files changed, 19 insertions(+), 3 deletions(-)
 
 diff --git a/Lib/sysconfig.py b/Lib/sysconfig.py
-index 6328ec41af..744f715fe2 100644
+index ebe37118274..ba424236e11 100644
 --- a/Lib/sysconfig.py
 +++ b/Lib/sysconfig.py
-@@ -535,7 +535,20 @@ def _init_posix(vars):
+@@ -528,7 +528,20 @@ def _init_posix(vars):
      """Initialize the module as appropriate for POSIX systems."""
      # _sysconfigdata is generated at build time, see _generate_posix_vars()
      name = _get_sysconfigdata_name()
@@ -74,7 +74,7 @@ index 6328ec41af..744f715fe2 100644
      vars.update(build_time_vars)
  
 diff --git a/Lib/test/libregrtest/main.py b/Lib/test/libregrtest/main.py
-index a9725fa967..121e2e7393 100644
+index a9725fa9673..121e2e73938 100644
 --- a/Lib/test/libregrtest/main.py
 +++ b/Lib/test/libregrtest/main.py
 @@ -519,6 +519,7 @@ def _add_cross_compile_opts(self, regrtest_opts):
@@ -86,7 +86,7 @@ index a9725fa967..121e2e7393 100644
              }
              old_environ = os.environ
 diff --git a/Lib/test/pythoninfo.py b/Lib/test/pythoninfo.py
-index 74ebb5e5b8..fa7fbca34e 100644
+index 74ebb5e5b8a..fa7fbca34e1 100644
 --- a/Lib/test/pythoninfo.py
 +++ b/Lib/test/pythoninfo.py
 @@ -326,6 +326,7 @@ def format_groups(groups):
@@ -98,7 +98,7 @@ index 74ebb5e5b8..fa7fbca34e 100644
  
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
-index a1ad0ae251..0657162d1a 100755
+index cb3db60f9c2..5fc0cffa977 100755
 --- a/configure
 +++ b/configure
 @@ -3262,7 +3262,7 @@ fi
@@ -123,7 +123,7 @@ index a1ad0ae251..0657162d1a 100755
  $as_echo "$with_build_python" >&6; }
  
 diff --git a/configure.ac b/configure.ac
-index e5fb8bd99e..d444f5ec09 100644
+index 852cbaa6e4c..5ca316a948b 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -162,7 +162,7 @@ AC_ARG_WITH(
@@ -136,5 +136,5 @@ index e5fb8bd99e..d444f5ec09 100644
    ], [
      AS_VAR_IF([cross_compiling], [yes],
 -- 
-2.34.1
+2.44.0
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
