Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66479C433EF
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 20:41:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0AB4881324;
	Thu, 30 Dec 2021 20:41:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YPY3lxSclSAv; Thu, 30 Dec 2021 20:41:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 837EA81461;
	Thu, 30 Dec 2021 20:41:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1F3501BF361
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 20:41:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0D428827DD
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 20:41:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VCo3QNbenDMP for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 20:41:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EE654827E0
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 20:41:15 +0000 (UTC)
Received: by mail-pg1-x532.google.com with SMTP id l10so22290879pgm.7
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 12:41:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=16pS+5C7mvyWpvsRNO27HMZq1MX/0OpkxonKauN6Oro=;
 b=NH2SMW5Y/3ohMu8yHd7XUv2VzUejcTKPqVUl3PA4L8kDxuXbGCaQ1eqT769sGVOlo4
 +FoflyV540/tOomBU7vhDpIgF5VXc4d+ZC4wbCJVgPq3kGbv8aln3Ou9dLYMzcBOKRPR
 yoQjBSFnDZdohhkOYIRL7gI68KATufuh7eaOjy1M6DJ4SS0ZoyWYsmt6Cean+djgfP9E
 ixi1Zeo5sgTp712mrGhnwKEghVMdDmTG2dD1G6qn2y4G2/INzgOo+qA2fp15qkHtOqQj
 AKH/SejL2NmolxVdKUTPvLhbAWjKauwBeuMhcy/IPakPULmkM7mpm4BE2N0Rz0MEL2Ny
 TzzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=16pS+5C7mvyWpvsRNO27HMZq1MX/0OpkxonKauN6Oro=;
 b=1HKu+x+8qsREYmEnFanynP0+CPGK+ngq7zqYXgjDOPVN2cLZpN+tAjhQ2fKIYZnMc1
 jDswPJ/efHU50VkfAg8xDoUb1oQz1uteOMrtbbjdyHAqqk6bElSRvBd8Whr/ACsORmys
 s+XwRW1P5Airw/5f0w54rt5ZRtZiwOC6U3EzKylJ94dPKzZ6DeJwjOPHV7OA70iFJXtV
 J4PLp5TTEHw/FjtUfYzFd1/sh8bZh+cDZcxHQP6CFkKiYJxnoNHxDp7Yqj3Qy9ZBjLrm
 0UTDvNMcM8ghFt49UT3Hce2s/H79GBSNisuZqcm/aP5x6mRrJ/fEpjlB01uX6BBnNci5
 bb1Q==
X-Gm-Message-State: AOAM533so9HK7u6YBBAinIrV4kBlqtzYUihTFuIZh7cLxfyNT5XaDDlS
 SodTcvhEViY3ILtQO60pMpwnSiIaukY=
X-Google-Smtp-Source: ABdhPJwWoVOVbNiGjIquzTO7l1rJzuyU2myRgK8g68TLRzkAGe69XSGRNOzgbwDuB/36aq9YOzKVuw==
X-Received: by 2002:a63:9819:: with SMTP id q25mr22395260pgd.605.1640896874629; 
 Thu, 30 Dec 2021 12:41:14 -0800 (PST)
Received: from localhost.localdomain ([47.149.13.137])
 by smtp.gmail.com with ESMTPSA id ot7sm33315078pjb.12.2021.12.30.12.41.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Dec 2021 12:41:14 -0800 (PST)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 30 Dec 2021 12:41:02 -0800
Message-Id: <20211230204103.282138-2-aduskett@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211230204103.282138-1-aduskett@gmail.com>
References: <20211230204103.282138-1-aduskett@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 2/3] package/python3: bump to version 3.10.1
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
Cc: Adam Duskett <aduskett@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Remove 0013-Add-an-option-to-disable-installation-of-test-module.patch as
  it is now upstreamed.

- Refactor and rename all other patches as necessary.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 ...e-the-build-of-pyc-files-conditional.patch |  14 +--
 ...taddrinfo-configure-test-when-cross-.patch |   8 +-
 ...re-to-disable-the-build-of-certain-e.patch |  26 ++--
 ...y-header-paths-for-cross-compilation.patch |  54 ++++----
 ...ook-in-usr-lib-termcap-for-libraries.patch |   8 +-
 .../0006-Don-t-add-multiarch-paths.patch      |   8 +-
 .../0007-Abort-on-failed-module-build.patch   |   8 +-
 .../0008-Serial-ioctl-workaround.patch        |   4 +-
 ...e-shebang-of-Python-scripts-for-cros.patch |   4 +-
 ...ig.sh.in-ensure-sed-invocations-only.patch |   4 +-
 ...locale-and-set-to-default-when-addin.patch |  12 +-
 ...Add-importlib-fix-for-PEP-3147-issue.patch |  12 +-
 ...-disable-installation-of-test-module.patch | 117 ------------------
 ...0013-Add-an-option-to-disable-pydoc.patch} |  51 ++++----
 ...14-Add-an-option-to-disable-lib2to3.patch} |  85 +++++++------
 ...ption-to-disable-the-sqlite3-module.patch} |  48 +++----
 ...d-an-option-to-disable-the-tk-module.patch |  74 +++++++++++
 ...option-to-disable-the-curses-module.patch} |  39 +++---
 ...d-an-option-to-disable-the-tk-module.patch |  73 -----------
 ...0018-Add-an-option-to-disable-expat.patch} |  45 +++----
 ...Add-an-option-to-disable-CJK-codecs.patch} |   8 +-
 ...> 0020-Add-an-option-to-disable-NIS.patch} |   8 +-
 ...dd-an-option-to-disable-unicodedata.patch} |   8 +-
 ... 0022-Add-an-option-to-disable-IDLE.patch} |  53 ++++----
 ...23-Add-an-option-to-disable-decimal.patch} |  14 +--
 ...n-to-disable-the-ossaudiodev-module.patch} |   8 +-
 ...n-option-to-disable-openssl-support.patch} |   8 +-
 ...tion-to-disable-the-readline-module.patch} |   8 +-
 ...o-disable-zlib-bzip2-and-xz-modules.patch} |   8 +-
 ...hon-config.sh-don-t-reassign-prefix.patch} |   6 +-
 ...-Fix-cross-compiling-the-uuid-module.patch |  43 +++++++
 ...Add-an-option-to-disable-uuid-module.patch |   8 +-
 ...-fix-building-on-older-distributions.patch |   4 +-
 ...up-CC-print-multiarch-output-for-mus.patch |   9 +-
 ...ion-to-disable-the-berkeleydb-module.patch |   8 +-
 ...-ng-doesn-t-set-errno-when-encryptio.patch |   4 +-
 ...teration-error-in-_ExecutorManagerTh.patch |  29 -----
 package/python3/python3.hash                  |   8 +-
 package/python3/python3.mk                    |   4 +-
 39 files changed, 425 insertions(+), 515 deletions(-)
 delete mode 100644 package/python3/0013-Add-an-option-to-disable-installation-of-test-module.patch
 rename package/python3/{0014-Add-an-option-to-disable-pydoc.patch => 0013-Add-an-option-to-disable-pydoc.patch} (72%)
 rename package/python3/{0015-Add-an-option-to-disable-lib2to3.patch => 0014-Add-an-option-to-disable-lib2to3.patch} (65%)
 rename package/python3/{0016-Add-option-to-disable-the-sqlite3-module.patch => 0015-Add-option-to-disable-the-sqlite3-module.patch} (60%)
 create mode 100644 package/python3/0016-Add-an-option-to-disable-the-tk-module.patch
 rename package/python3/{0018-Add-an-option-to-disable-the-curses-module.patch => 0017-Add-an-option-to-disable-the-curses-module.patch} (60%)
 delete mode 100644 package/python3/0017-Add-an-option-to-disable-the-tk-module.patch
 rename package/python3/{0019-Add-an-option-to-disable-expat.patch => 0018-Add-an-option-to-disable-expat.patch} (74%)
 rename package/python3/{0020-Add-an-option-to-disable-CJK-codecs.patch => 0019-Add-an-option-to-disable-CJK-codecs.patch} (82%)
 rename package/python3/{0021-Add-an-option-to-disable-NIS.patch => 0020-Add-an-option-to-disable-NIS.patch} (84%)
 rename package/python3/{0022-Add-an-option-to-disable-unicodedata.patch => 0021-Add-an-option-to-disable-unicodedata.patch} (83%)
 rename package/python3/{0023-Add-an-option-to-disable-IDLE.patch => 0022-Add-an-option-to-disable-IDLE.patch} (67%)
 rename package/python3/{0024-Add-an-option-to-disable-decimal.patch => 0023-Add-an-option-to-disable-decimal.patch} (89%)
 rename package/python3/{0025-Add-an-option-to-disable-the-ossaudiodev-module.patch => 0024-Add-an-option-to-disable-the-ossaudiodev-module.patch} (85%)
 rename package/python3/{0026-Add-an-option-to-disable-openssl-support.patch => 0025-Add-an-option-to-disable-openssl-support.patch} (83%)
 rename package/python3/{0027-Add-an-option-to-disable-the-readline-module.patch => 0026-Add-an-option-to-disable-the-readline-module.patch} (82%)
 rename package/python3/{0028-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch => 0027-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch} (87%)
 rename package/python3/{0029-python-config.sh-don-t-reassign-prefix.patch => 0028-python-config.sh-don-t-reassign-prefix.patch} (94%)
 create mode 100644 package/python3/0029-Fix-cross-compiling-the-uuid-module.patch
 delete mode 100644 package/python3/0035-Fix-dictionary-iteration-error-in-_ExecutorManagerTh.patch

diff --git a/package/python3/0001-Make-the-build-of-pyc-files-conditional.patch b/package/python3/0001-Make-the-build-of-pyc-files-conditional.patch
index e40d8c8cd9..d3b5368903 100644
--- a/package/python3/0001-Make-the-build-of-pyc-files-conditional.patch
+++ b/package/python3/0001-Make-the-build-of-pyc-files-conditional.patch
@@ -1,4 +1,4 @@
-From f63cc3031e775b556443c0f5b2725e530823dc49 Mon Sep 17 00:00:00 2001
+From 322724e166d7ec0393aec577c12fdf6ef2b61e1d Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 22 Feb 2017 16:21:31 -0800
 Subject: [PATCH] Make the build of pyc files conditional
@@ -15,10 +15,10 @@ Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
  2 files changed, 8 insertions(+)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 11230fa563..1ed9ad65d2 100644
+index 77f91e72b1..0c809f3d8a 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1549,6 +1549,7 @@ libinstall:	build_all $(srcdir)/Modules/xxmodule.c
+@@ -1600,6 +1600,7 @@ libinstall:	build_all $(srcdir)/Modules/xxmodule.c
  		$(INSTALL_DATA) $(srcdir)/Modules/xxmodule.c \
  			$(DESTDIR)$(LIBDEST)/distutils/tests ; \
  	fi
@@ -26,7 +26,7 @@ index 11230fa563..1ed9ad65d2 100644
  	-PYTHONPATH=$(DESTDIR)$(LIBDEST)  $(RUNSHARED) \
  		$(PYTHON_FOR_BUILD) -Wi $(DESTDIR)$(LIBDEST)/compileall.py \
  		-j0 -d $(LIBDEST) -f \
-@@ -1576,6 +1577,7 @@ libinstall:	build_all $(srcdir)/Modules/xxmodule.c
+@@ -1627,6 +1628,7 @@ libinstall:	build_all $(srcdir)/Modules/xxmodule.c
  		$(PYTHON_FOR_BUILD) -Wi -OO $(DESTDIR)$(LIBDEST)/compileall.py \
  		-j0 -d $(LIBDEST)/site-packages -f \
  		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
@@ -35,10 +35,10 @@ index 11230fa563..1ed9ad65d2 100644
  		$(PYTHON_FOR_BUILD) -m lib2to3.pgen2.driver $(DESTDIR)$(LIBDEST)/lib2to3/Grammar.txt
  	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
 diff --git a/configure.ac b/configure.ac
-index 823252be69..4e08118c46 100644
+index d60f05251a..1ee5a09588 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1123,6 +1123,12 @@ fi
+@@ -1110,6 +1110,12 @@ fi
  
  AC_MSG_CHECKING(LDLIBRARY)
  
@@ -52,5 +52,5 @@ index 823252be69..4e08118c46 100644
  # library that we build, but we do not want to link against it (we
  # will find it with a -framework option). For this reason there is an
 -- 
-2.20.1
+2.25.1
 
diff --git a/package/python3/0002-Disable-buggy_getaddrinfo-configure-test-when-cross-.patch b/package/python3/0002-Disable-buggy_getaddrinfo-configure-test-when-cross-.patch
index 7ddbb8a28a..411b8dae4e 100644
--- a/package/python3/0002-Disable-buggy_getaddrinfo-configure-test-when-cross-.patch
+++ b/package/python3/0002-Disable-buggy_getaddrinfo-configure-test-when-cross-.patch
@@ -1,4 +1,4 @@
-From 7948fb08b18260811ce64806eec2bef465316b75 Mon Sep 17 00:00:00 2001
+From 72e20220f3a592b3ab9f440fbe74efa9f9e82d49 Mon Sep 17 00:00:00 2001
 From: Vanya Sergeev <vsergeev@gmail.com>
 Date: Wed, 23 Dec 2015 11:30:33 +0100
 Subject: [PATCH] Disable buggy_getaddrinfo configure test when cross-compiling
@@ -10,10 +10,10 @@ Signed-off-by: Vanya Sergeev <vsergeev@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 4e08118c46..40b1f9bac1 100644
+index 1ee5a09588..c2445edc88 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -4217,7 +4217,7 @@ fi
+@@ -4230,7 +4230,7 @@ fi
  
  AC_MSG_RESULT($ac_cv_buggy_getaddrinfo)
  
@@ -23,5 +23,5 @@ index 4e08118c46..40b1f9bac1 100644
  	if test $ipv6 = yes
  	then
 -- 
-2.20.1
+2.25.1
 
diff --git a/package/python3/0003-Add-infrastructure-to-disable-the-build-of-certain-e.patch b/package/python3/0003-Add-infrastructure-to-disable-the-build-of-certain-e.patch
index 7f84f9a1e4..7ac0f39d06 100644
--- a/package/python3/0003-Add-infrastructure-to-disable-the-build-of-certain-e.patch
+++ b/package/python3/0003-Add-infrastructure-to-disable-the-build-of-certain-e.patch
@@ -1,4 +1,4 @@
-From 9da015fd909bd50a24479bba9a94cb3d1228043d Mon Sep 17 00:00:00 2001
+From df7c95b4ceecf390b961d843a556c470ac9080b2 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 22 Feb 2017 16:33:22 -0800
 Subject: [PATCH] Add infrastructure to disable the build of certain extensions
@@ -44,10 +44,10 @@ Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
  3 files changed, 11 insertions(+), 2 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 1ed9ad65d2..6eacfd6961 100644
+index 0c809f3d8a..7c3dde8dd4 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -215,6 +215,8 @@ FILEMODE=	644
+@@ -218,6 +218,8 @@ FILEMODE=	644
  # configure script arguments
  CONFIG_ARGS=	@CONFIG_ARGS@
  
@@ -56,7 +56,7 @@ index 1ed9ad65d2..6eacfd6961 100644
  
  # Subdirectories with code
  SRCDIRS= 	@SRCDIRS@
-@@ -631,6 +633,7 @@ sharedmods: $(BUILDPYTHON) pybuilddir.txt Modules/_math.o
+@@ -628,6 +630,7 @@ sharedmods: $(BUILDPYTHON) pybuilddir.txt Modules/_math.o
  	esac; \
  	echo "$(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' \
  		_TCLTK_INCLUDES='$(TCLTK_INCLUDES)' _TCLTK_LIBS='$(TCLTK_LIBS)' \
@@ -64,7 +64,7 @@ index 1ed9ad65d2..6eacfd6961 100644
  		$(PYTHON_FOR_BUILD) $(srcdir)/setup.py $$quiet build"; \
  	$(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' \
  		_TCLTK_INCLUDES='$(TCLTK_INCLUDES)' _TCLTK_LIBS='$(TCLTK_LIBS)' \
-@@ -1695,7 +1698,8 @@ libainstall:	@DEF_MAKE_RULE@ python-config
+@@ -1748,7 +1751,8 @@ libainstall:	@DEF_MAKE_RULE@ python-config
  # Install the dynamically loadable modules
  # This goes into $(exec_prefix)
  sharedinstall: sharedmods
@@ -75,10 +75,10 @@ index 1ed9ad65d2..6eacfd6961 100644
  		--install-scripts=$(BINDIR) \
  		--install-platlib=$(DESTSHARED) \
 diff --git a/configure.ac b/configure.ac
-index 40b1f9bac1..5b897d8e46 100644
+index c2445edc88..73d66167de 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3088,6 +3088,8 @@ LIBS="$withval $LIBS"
+@@ -3091,6 +3091,8 @@ LIBS="$withval $LIBS"
  
  PKG_PROG_PKG_CONFIG
  
@@ -88,11 +88,11 @@ index 40b1f9bac1..5b897d8e46 100644
  AC_MSG_CHECKING(for --with-system-expat)
  AC_ARG_WITH(system_expat,
 diff --git a/setup.py b/setup.py
-index 9a5887b59f..b88d0bb007 100644
+index 770866bca7..b6c829b3a5 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -44,7 +44,10 @@ from distutils.spawn import find_executable
- TEST_EXTENSIONS = True
+@@ -58,7 +58,10 @@ with warnings.catch_warnings():
+ TEST_EXTENSIONS = (sysconfig.get_config_var('TEST_MODULES') == 'yes')
  
  # This global variable is used to hold the list of modules to be disabled.
 -DISABLED_MODULE_LIST = []
@@ -101,8 +101,8 @@ index 9a5887b59f..b88d0bb007 100644
 +except KeyError:
 +    DISABLED_MODULE_LIST = list()
  
- 
- def get_platform():
+ # --list-module-names option used by Tools/scripts/generate_module_names.py
+ LIST_MODULE_NAMES = False
 -- 
-2.20.1
+2.25.1
 
diff --git a/package/python3/0004-Adjust-library-header-paths-for-cross-compilation.patch b/package/python3/0004-Adjust-library-header-paths-for-cross-compilation.patch
index d64e881379..0311348405 100644
--- a/package/python3/0004-Adjust-library-header-paths-for-cross-compilation.patch
+++ b/package/python3/0004-Adjust-library-header-paths-for-cross-compilation.patch
@@ -1,4 +1,4 @@
-From 8d2bc6a84a253c7ba2995a3e3be17ea113c228e2 Mon Sep 17 00:00:00 2001
+From 61af65485f1dade4aa08d0cf2b24082aeda24c51 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 23 Dec 2015 11:33:14 +0100
 Subject: [PATCH] Adjust library/header paths for cross-compilation
@@ -15,13 +15,15 @@ values, and get correct header/library paths when cross-compiling
 third-party Python modules.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
+Refresh for 3.10.0
 ---
  Lib/distutils/command/build_ext.py |  5 ++++-
- Lib/distutils/sysconfig.py         | 15 +++++++++++----
+ Lib/sysconfig.py                   | 15 +++++++++++----
  2 files changed, 15 insertions(+), 5 deletions(-)
 
 diff --git a/Lib/distutils/command/build_ext.py b/Lib/distutils/command/build_ext.py
-index 1a9bd1200f..3cf7d6746e 100644
+index 1a9bd12..3cf7d67 100644
 --- a/Lib/distutils/command/build_ext.py
 +++ b/Lib/distutils/command/build_ext.py
 @@ -234,7 +234,10 @@ class build_ext(Command):
@@ -36,32 +38,32 @@ index 1a9bd1200f..3cf7d6746e 100644
              else:
                  # building python standard extensions
                  self.library_dirs.append('.')
-diff --git a/Lib/distutils/sysconfig.py b/Lib/distutils/sysconfig.py
-index 37feae5df7..e9c3a27856 100644
---- a/Lib/distutils/sysconfig.py
-+++ b/Lib/distutils/sysconfig.py
-@@ -17,10 +17,17 @@ import sys
- from .errors import DistutilsPlatformError
- 
- # These are needed in a couple of spots, so just compute them once.
--PREFIX = os.path.normpath(sys.prefix)
--EXEC_PREFIX = os.path.normpath(sys.exec_prefix)
--BASE_PREFIX = os.path.normpath(sys.base_prefix)
--BASE_EXEC_PREFIX = os.path.normpath(sys.base_exec_prefix)
+diff --git a/Lib/sysconfig.py b/Lib/sysconfig.py
+index 95b48f6..9fb1956 100644
+--- a/Lib/sysconfig.py
++++ b/Lib/sysconfig.py
+@@ -123,10 +123,17 @@ _SCHEME_KEYS = ('stdlib', 'platstdlib', 'purelib', 'platlib', 'include',
+ _PY_VERSION = sys.version.split()[0]
+ _PY_VERSION_SHORT = f'{sys.version_info[0]}.{sys.version_info[1]}'
+ _PY_VERSION_SHORT_NO_DOT = f'{sys.version_info[0]}{sys.version_info[1]}'
+-_PREFIX = os.path.normpath(sys.prefix)
+-_BASE_PREFIX = os.path.normpath(sys.base_prefix)
+-_EXEC_PREFIX = os.path.normpath(sys.exec_prefix)
+-_BASE_EXEC_PREFIX = os.path.normpath(sys.base_exec_prefix)
 +if "_python_sysroot" in os.environ:
 +    _sysroot=os.environ.get('_python_sysroot')
-+    PREFIX = os.path.normpath(_sysroot + os.environ.get('_python_prefix'))
-+    EXEC_PREFIX = os.path.normpath(_sysroot + os.environ.get('_python_exec_prefix'))
-+    BASE_PREFIX = PREFIX
-+    BASE_EXEC_PREFIX = EXEC_PREFIX
++    _PREFIX = os.path.normpath(_sysroot + os.environ.get('_python_prefix'))
++    _EXEC_PREFIX = os.path.normpath(_sysroot + os.environ.get('_python_exec_prefix'))
++    _BASE_PREFIX = _PREFIX
++    _BASE_EXEC_PREFIX = _EXEC_PREFIX
 +else:
-+    PREFIX = os.path.normpath(sys.prefix)
-+    EXEC_PREFIX = os.path.normpath(sys.exec_prefix)
-+    BASE_PREFIX = os.path.normpath(sys.base_prefix)
-+    BASE_EXEC_PREFIX = os.path.normpath(sys.base_exec_prefix)
++    _PREFIX = os.path.normpath(sys.prefix)
++    _EXEC_PREFIX = os.path.normpath(sys.exec_prefix)
++    _BASE_PREFIX = os.path.normpath(sys.base_prefix)
++    _BASE_EXEC_PREFIX = os.path.normpath(sys.base_exec_prefix)
+ _CONFIG_VARS = None
+ _USER_BASE = None
  
- # Path to the base directory of the project. On Windows the binary may
- # live in project/PCbuild/win32 or project/PCbuild/amd64.
 -- 
-2.20.1
+2.30.2
 
diff --git a/package/python3/0005-Don-t-look-in-usr-lib-termcap-for-libraries.patch b/package/python3/0005-Don-t-look-in-usr-lib-termcap-for-libraries.patch
index 2ea2d1d9d6..3e224995a5 100644
--- a/package/python3/0005-Don-t-look-in-usr-lib-termcap-for-libraries.patch
+++ b/package/python3/0005-Don-t-look-in-usr-lib-termcap-for-libraries.patch
@@ -1,4 +1,4 @@
-From 09c17b0194209cae8e057866670e4f4039a5be16 Mon Sep 17 00:00:00 2001
+From 60d71e37d167ea89445250be436170a6cfee84e7 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 23 Dec 2015 11:36:00 +0100
 Subject: [PATCH] Don't look in /usr/lib/termcap for libraries
@@ -9,10 +9,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  1 file changed, 1 insertion(+), 4 deletions(-)
 
 diff --git a/setup.py b/setup.py
-index b88d0bb007..254c351519 100644
+index 66d372a..e632b6f 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -1044,12 +1044,9 @@ class PyBuildExt(build_ext):
+@@ -1147,12 +1147,9 @@ class PyBuildExt(build_ext):
                  pass # Issue 7384: Already linked against curses or tinfo.
              elif curses_library:
                  readline_libs.append(curses_library)
@@ -27,5 +27,5 @@ index b88d0bb007..254c351519 100644
                                 libraries=readline_libs))
          else:
 -- 
-2.20.1
+2.25.1
 
diff --git a/package/python3/0006-Don-t-add-multiarch-paths.patch b/package/python3/0006-Don-t-add-multiarch-paths.patch
index 23424d86d3..48d8cc790e 100644
--- a/package/python3/0006-Don-t-add-multiarch-paths.patch
+++ b/package/python3/0006-Don-t-add-multiarch-paths.patch
@@ -1,4 +1,4 @@
-From e87dececb9bc2f4b1cba7f31d67ca2aaecbb52d8 Mon Sep 17 00:00:00 2001
+From f5933b8f973cd11698b52d535a10d0474e49f5a5 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 23 Dec 2015 11:36:27 +0100
 Subject: [PATCH] Don't add multiarch paths
@@ -17,10 +17,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/setup.py b/setup.py
-index 254c351519..5bf39f8a51 100644
+index ec3ba60607..e27620035c 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -737,10 +737,10 @@ class PyBuildExt(build_ext):
+@@ -830,10 +830,10 @@ class PyBuildExt(build_ext):
          if not CROSS_COMPILING:
              add_dir_to_list(self.compiler.library_dirs, '/usr/local/lib')
              add_dir_to_list(self.compiler.include_dirs, '/usr/local/include')
@@ -33,5 +33,5 @@ index 254c351519..5bf39f8a51 100644
  
      def init_inc_lib_dirs(self):
 -- 
-2.20.1
+2.25.1
 
diff --git a/package/python3/0007-Abort-on-failed-module-build.patch b/package/python3/0007-Abort-on-failed-module-build.patch
index 7e0dfad115..32e2261a05 100644
--- a/package/python3/0007-Abort-on-failed-module-build.patch
+++ b/package/python3/0007-Abort-on-failed-module-build.patch
@@ -1,4 +1,4 @@
-From cb4a3bc238ffbc8389c2820f24e72c2b36422b3f Mon Sep 17 00:00:00 2001
+From 188c0ebfdb71f5252fa7701013b8d1209f28aef7 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 23 Dec 2015 11:43:24 +0100
 Subject: [PATCH] Abort on failed module build
@@ -14,10 +14,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/setup.py b/setup.py
-index 5bf39f8a51..36d94432da 100644
+index e27620035c..d3f0e663f2 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -524,6 +524,7 @@ class PyBuildExt(build_ext):
+@@ -561,6 +561,7 @@ class PyBuildExt(build_ext):
              print("Failed to build these modules:")
              print_three_column(failed)
              print()
@@ -26,5 +26,5 @@ index 5bf39f8a51..36d94432da 100644
          if self.failed_on_import:
              failed = self.failed_on_import[:]
 -- 
-2.20.1
+2.25.1
 
diff --git a/package/python3/0008-Serial-ioctl-workaround.patch b/package/python3/0008-Serial-ioctl-workaround.patch
index 568dcd9503..df31cd6220 100644
--- a/package/python3/0008-Serial-ioctl-workaround.patch
+++ b/package/python3/0008-Serial-ioctl-workaround.patch
@@ -1,4 +1,4 @@
-From 0b62a3634d343e4e3be6541d298d58eb81cf1458 Mon Sep 17 00:00:00 2001
+From 9e6211b0d6d4610e5fb7d2c7e1152eb7c64d968b Mon Sep 17 00:00:00 2001
 From: Baruch Siach <baruch@tkos.co.il>
 Date: Wed, 23 Dec 2015 11:44:02 +0100
 Subject: [PATCH] Serial ioctl() workaround
@@ -29,5 +29,5 @@ index 75e5e52320..eefbddfe69 100644
  /* HP-UX requires that this be included to pick up MDCD, MCTS, MDSR,
   * MDTR, MRI, and MRTS (apparently used internally by some things
 -- 
-2.20.1
+2.25.1
 
diff --git a/package/python3/0009-Do-not-adjust-the-shebang-of-Python-scripts-for-cros.patch b/package/python3/0009-Do-not-adjust-the-shebang-of-Python-scripts-for-cros.patch
index 2bb1d7e2ff..8a77fe3708 100644
--- a/package/python3/0009-Do-not-adjust-the-shebang-of-Python-scripts-for-cros.patch
+++ b/package/python3/0009-Do-not-adjust-the-shebang-of-Python-scripts-for-cros.patch
@@ -1,4 +1,4 @@
-From 64bdc89106e6bd76e9b204d9cfef0adb7bfb0f4a Mon Sep 17 00:00:00 2001
+From cb595a591c71e0bf7c63a3706b0be45ac6a642e3 Mon Sep 17 00:00:00 2001
 From: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
 Date: Wed, 23 Dec 2015 11:44:30 +0100
 Subject: [PATCH] Do not adjust the shebang of Python scripts for
@@ -31,5 +31,5 @@ index ccc70e6465..d6d54195c1 100644
                           self.build_dir)
                  updated_files.append(outfile)
 -- 
-2.20.1
+2.25.1
 
diff --git a/package/python3/0010-Misc-python-config.sh.in-ensure-sed-invocations-only.patch b/package/python3/0010-Misc-python-config.sh.in-ensure-sed-invocations-only.patch
index cdacfd5b51..a1f9ab6cd9 100644
--- a/package/python3/0010-Misc-python-config.sh.in-ensure-sed-invocations-only.patch
+++ b/package/python3/0010-Misc-python-config.sh.in-ensure-sed-invocations-only.patch
@@ -1,4 +1,4 @@
-From e9f8466944c5000d9b43d25d38ef9eaa8cb0afae Mon Sep 17 00:00:00 2001
+From eb51497e4b5799f8ab0277426d3e54414acb9d4b Mon Sep 17 00:00:00 2001
 From: Peter Korsgaard <peter@korsgaard.com>
 Date: Thu, 20 Nov 2014 13:24:59 +0100
 Subject: [PATCH] Misc/python-config.sh.in: ensure sed invocations only match
@@ -63,5 +63,5 @@ index 2602fe24c0..a1bc3cd5f7 100644
  PYTHONFRAMEWORK="@PYTHONFRAMEWORK@"
  INCDIR="-I$includedir/python${VERSION}${ABIFLAGS}"
 -- 
-2.20.1
+2.25.1
 
diff --git a/package/python3/0011-Override-system-locale-and-set-to-default-when-addin.patch b/package/python3/0011-Override-system-locale-and-set-to-default-when-addin.patch
index 8c3ddd0042..4d021d86a4 100644
--- a/package/python3/0011-Override-system-locale-and-set-to-default-when-addin.patch
+++ b/package/python3/0011-Override-system-locale-and-set-to-default-when-addin.patch
@@ -1,4 +1,4 @@
-From 6615a314ac7a2bc7efea945677934d6afd3b61d6 Mon Sep 17 00:00:00 2001
+From e4ae670e3489544a49dabd1618c32fe73504a7ba Mon Sep 17 00:00:00 2001
 From: Samuel Cabrero <samuelcabrero@gmail.com>
 Date: Wed, 23 Dec 2015 11:45:48 +0100
 Subject: [PATCH] Override system locale and set to default when adding gcc
@@ -22,18 +22,18 @@ Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/setup.py b/setup.py
-index 36d94432da..506f6107de 100644
+index d3f0e663f2..926c16f58f 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -683,7 +683,7 @@ class PyBuildExt(build_ext):
+@@ -761,7 +761,7 @@ class PyBuildExt(build_ext):
          tmpfile = os.path.join(self.build_temp, 'ccpaths')
          if not os.path.exists(self.build_temp):
              os.makedirs(self.build_temp)
--        ret = run_command('%s -E -v - </dev/null 2>%s 1>/dev/null' % (cc, tmpfile))
-+        ret = run_command('LC_ALL=C %s -E -v - </dev/null 2>%s 1>/dev/null' % (cc, tmpfile))
+-        ret = run_command('%s -E -v - </dev/null 2>%s 1>/dev/null' % (CC, tmpfile))
++        ret = run_command('LC_ALL=C %s -E -v - </dev/null 2>%s 1>/dev/null' % (CC, tmpfile))
          is_gcc = False
          is_clang = False
          in_incdirs = False
 -- 
-2.20.1
+2.25.1
 
diff --git a/package/python3/0012-Add-importlib-fix-for-PEP-3147-issue.patch b/package/python3/0012-Add-importlib-fix-for-PEP-3147-issue.patch
index 5cb7c85246..b18f94ab4e 100644
--- a/package/python3/0012-Add-importlib-fix-for-PEP-3147-issue.patch
+++ b/package/python3/0012-Add-importlib-fix-for-PEP-3147-issue.patch
@@ -1,4 +1,4 @@
-From cda5c7447403440d679a3cd29d8dc38bb15eca33 Mon Sep 17 00:00:00 2001
+From e2ea659eac1849db471d3c01a0d0af9d6fca2e9a Mon Sep 17 00:00:00 2001
 From: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
 Date: Wed, 22 Feb 2017 16:48:49 -0800
 Subject: [PATCH] Add importlib fix for PEP 3147 issue
@@ -25,10 +25,10 @@ Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
  1 file changed, 5 insertions(+), 39 deletions(-)
 
 diff --git a/Lib/importlib/_bootstrap_external.py b/Lib/importlib/_bootstrap_external.py
-index fe31f437da..71e64aef30 100644
+index 25a3f8c0e0..2cb9a9aa52 100644
 --- a/Lib/importlib/_bootstrap_external.py
 +++ b/Lib/importlib/_bootstrap_external.py
-@@ -373,8 +373,6 @@ def cache_from_source(path, debug_override=None, *, optimization=None):
+@@ -392,8 +392,6 @@ def cache_from_source(path, debug_override=None, *, optimization=None):
      a True value is the same as setting 'optimization' to the empty string
      while a False value is equivalent to setting 'optimization' to '1'.
  
@@ -37,7 +37,7 @@ index fe31f437da..71e64aef30 100644
      """
      if debug_override is not None:
          _warnings.warn('the debug_override parameter is deprecated; use '
-@@ -386,10 +384,7 @@ def cache_from_source(path, debug_override=None, *, optimization=None):
+@@ -405,10 +403,7 @@ def cache_from_source(path, debug_override=None, *, optimization=None):
      path = _os.fspath(path)
      head, tail = _path_split(path)
      base, sep, rest = tail.rpartition('.')
@@ -49,7 +49,7 @@ index fe31f437da..71e64aef30 100644
      if optimization is None:
          if sys.flags.optimize == 0:
              optimization = ''
-@@ -426,46 +421,17 @@ def cache_from_source(path, debug_override=None, *, optimization=None):
+@@ -445,46 +440,17 @@ def cache_from_source(path, debug_override=None, *, optimization=None):
              head.lstrip(path_separators),
              filename,
          )
@@ -101,5 +101,5 @@ index fe31f437da..71e64aef30 100644
  
  
 -- 
-2.20.1
+2.25.1
 
diff --git a/package/python3/0013-Add-an-option-to-disable-installation-of-test-module.patch b/package/python3/0013-Add-an-option-to-disable-installation-of-test-module.patch
deleted file mode 100644
index 6cbffdf9e0..0000000000
--- a/package/python3/0013-Add-an-option-to-disable-installation-of-test-module.patch
+++ /dev/null
@@ -1,117 +0,0 @@
-From 5c6722b6790ee6b8828a7f8a90b7fd173b77867f Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Wed, 22 Feb 2017 17:01:18 -0800
-Subject: [PATCH] Add an option to disable installation of test modules
-
-The Python standard distribution comes with many test modules, that
-are not necessarly useful on embedded targets.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Signed-off-by: Samuel Martin <s.martin49@gmail.com>
-[ Andrey Smirnov: ported to Python 3.6 ]
-Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
-[james.hilliard1@gmail.com: adapt to python 3.9]
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
----
- Makefile.pre.in | 56 ++++++++++++++++++++++++++++++++-----------------
- configure.ac    |  5 +++++
- 2 files changed, 42 insertions(+), 19 deletions(-)
-
-diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 6eacfd6961..bbc779ee6a 100644
---- a/Makefile.pre.in
-+++ b/Makefile.pre.in
-@@ -1405,8 +1405,29 @@ maninstall:	altmaninstall
- 
- # Install the library
- XMLLIBSUBDIRS=  xml xml/dom xml/etree xml/parsers xml/sax
--LIBSUBDIRS=	tkinter tkinter/test tkinter/test/test_tkinter \
--		tkinter/test/test_ttk site-packages test \
-+
-+LIBSUBDIRS=	tkinter site-packages \
-+		asyncio \
-+		collections concurrent concurrent/futures encodings \
-+		email email/mime \
-+		ensurepip ensurepip/_bundled \
-+		html json http dbm xmlrpc \
-+		sqlite3 \
-+		logging csv wsgiref urllib \
-+		lib2to3 lib2to3/fixes lib2to3/pgen2 \
-+		ctypes ctypes/macholib \
-+		idlelib idlelib/Icons \
-+		distutils distutils/command $(XMLLIBSUBDIRS) \
-+		importlib \
-+		turtledemo \
-+		multiprocessing multiprocessing/dummy \
-+		unittest \
-+		venv venv/scripts venv/scripts/common venv/scripts/posix \
-+		curses pydoc_data \
-+		zoneinfo
-+
-+TESTSUBDIRS=	tkinter/test tkinter/test/test_tkinter \
-+		tkinter/test/test_ttk test \
- 		test/audiodata \
- 		test/capath test/data \
- 		test/cjkencodings test/decimaltestdata \
-@@ -1467,28 +1488,25 @@ LIBSUBDIRS=	tkinter tkinter/test tkinter/test/test_tkinter \
- 		test/test_importlib/zipdata02 \
- 		test/test_zoneinfo test/test_zoneinfo/data \
- 		test/ziptestdata \
--		asyncio \
- 		test/test_asyncio \
--		collections concurrent concurrent/futures encodings \
--		email email/mime test/test_email test/test_email/data \
--		ensurepip ensurepip/_bundled \
--		html json test/test_json http dbm xmlrpc \
--		sqlite3 sqlite3/test \
--		logging csv wsgiref urllib \
--		lib2to3 lib2to3/fixes lib2to3/pgen2 lib2to3/tests \
-+		test/test_email test/test_email/data \
-+		test/test_json \
-+		sqlite3/test \
-+		lib2to3/tests \
- 		lib2to3/tests/data lib2to3/tests/data/fixers \
- 		lib2to3/tests/data/fixers/myfixes \
--		ctypes ctypes/test ctypes/macholib \
--		idlelib idlelib/Icons idlelib/idle_test \
--		distutils distutils/command distutils/tests $(XMLLIBSUBDIRS) \
-+		ctypes/test \
-+		idlelib/idle_test \
-+		distutils/tests \
- 		test/test_peg_generator \
-+		test/test_importlib test/test_importlib/builtin \
- 		test/test_tools test/test_warnings test/test_warnings/data \
--		turtledemo \
--		multiprocessing multiprocessing/dummy \
--		unittest unittest/test unittest/test/testmock \
--		venv venv/scripts venv/scripts/common venv/scripts/posix \
--		curses pydoc_data \
--		zoneinfo
-+		unittest/test unittest/test/testmock
-+
-+ifeq (@TEST_MODULES@,yes)
-+LIBSUBDIRS += $(TESTSUBDIRS)
-+endif
-+
- libinstall:	build_all $(srcdir)/Modules/xxmodule.c
- 	@for i in $(SCRIPTDIR) $(LIBDEST); \
- 	do \
-diff --git a/configure.ac b/configure.ac
-index 5b897d8e46..bebad207f8 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -3365,6 +3365,11 @@ if test "$posix_threads" = "yes"; then
-       AC_CHECK_FUNCS(pthread_getcpuclockid)
- fi
- 
-+AC_SUBST(TEST_MODULES)
-+
-+AC_ARG_ENABLE(test-modules,
-+	AS_HELP_STRING([--disable-test-modules], [disable test modules]),
-+	[ TEST_MODULES="${enableval}" ], [ TEST_MODULES=yes ])
- 
- # Check for enable-ipv6
- AH_TEMPLATE(ENABLE_IPV6, [Define if --enable-ipv6 is specified])
--- 
-2.20.1
-
diff --git a/package/python3/0014-Add-an-option-to-disable-pydoc.patch b/package/python3/0013-Add-an-option-to-disable-pydoc.patch
similarity index 72%
rename from package/python3/0014-Add-an-option-to-disable-pydoc.patch
rename to package/python3/0013-Add-an-option-to-disable-pydoc.patch
index 66b05d5e52..a843c8c126 100644
--- a/package/python3/0014-Add-an-option-to-disable-pydoc.patch
+++ b/package/python3/0013-Add-an-option-to-disable-pydoc.patch
@@ -1,4 +1,4 @@
-From 57e14d395860a781d0b43b1ef3e2a4a8b04bbf80 Mon Sep 17 00:00:00 2001
+From a65e5d3caf8e076d531191164c23c6240461f675 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 22 Feb 2017 17:07:56 -0800
 Subject: [PATCH] Add an option to disable pydoc
@@ -10,17 +10,19 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Signed-off-by: Samuel Martin <s.martin49@gmail.com>
 [ Andrey Smirnov: ported to Python 3.6 ]
 Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
+[ Adam Duskett: ported to Python 3.10.0 ]
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
 ---
- Makefile.pre.in | 8 +++++++-
+ Makefile.pre.in | 7 ++++++-
  configure.ac    | 6 ++++++
  setup.py        | 9 +++++++--
- 3 files changed, 20 insertions(+), 3 deletions(-)
+ 3 files changed, 19 insertions(+), 3 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index bbc779ee6a..dd83413f17 100644
+index c0d5511..32b3df7 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1373,7 +1373,9 @@ bininstall: altbininstall
+@@ -1391,7 +1391,9 @@ bininstall: altbininstall
  	-rm -f $(DESTDIR)$(BINDIR)/idle3
  	(cd $(DESTDIR)$(BINDIR); $(LN) -s idle$(VERSION) idle3)
  	-rm -f $(DESTDIR)$(BINDIR)/pydoc3
@@ -30,31 +32,30 @@ index bbc779ee6a..dd83413f17 100644
  	-rm -f $(DESTDIR)$(BINDIR)/2to3
  	(cd $(DESTDIR)$(BINDIR); $(LN) -s 2to3-$(VERSION) 2to3)
  	if test "x$(LIPO_32BIT_FLAGS)" != "x" ; then \
-@@ -1423,7 +1425,7 @@ LIBSUBDIRS=	tkinter site-packages \
+@@ -1442,7 +1444,6 @@ LIBSUBDIRS=	asyncio \
+ 		lib2to3 lib2to3/fixes lib2to3/pgen2 \
+ 		logging \
  		multiprocessing multiprocessing/dummy \
- 		unittest \
- 		venv venv/scripts venv/scripts/common venv/scripts/posix \
--		curses pydoc_data \
-+		curses \
- 		zoneinfo
- 
- TESTSUBDIRS=	tkinter/test tkinter/test/test_tkinter \
-@@ -1507,6 +1509,10 @@ ifeq (@TEST_MODULES@,yes)
- LIBSUBDIRS += $(TESTSUBDIRS)
- endif
+-		pydoc_data \
+ 		site-packages \
+ 		sqlite3 \
+ 		tkinter \
+@@ -1530,6 +1531,10 @@ TESTSUBDIRS=	ctypes/test \
+ 		tkinter/test/test_ttk \
+ 		unittest/test unittest/test/testmock
  
 +ifeq (@PYDOC@,yes)
 +LIBSUBDIRS += pydoc_data
 +endif
 +
+ TEST_MODULES=@TEST_MODULES@
  libinstall:	build_all $(srcdir)/Modules/xxmodule.c
  	@for i in $(SCRIPTDIR) $(LIBDEST); \
- 	do \
 diff --git a/configure.ac b/configure.ac
-index bebad207f8..b748ad7957 100644
+index 083a12d..9079531 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3365,6 +3365,12 @@ if test "$posix_threads" = "yes"; then
+@@ -3373,6 +3373,12 @@ if test "$posix_threads" = "yes"; then
        AC_CHECK_FUNCS(pthread_getcpuclockid)
  fi
  
@@ -64,14 +65,14 @@ index bebad207f8..b748ad7957 100644
 +	AS_HELP_STRING([--disable-pydoc], [disable pydoc]),
 +	[ PYDOC="${enableval}" ], [ PYDOC=yes ])
 +
- AC_SUBST(TEST_MODULES)
  
- AC_ARG_ENABLE(test-modules,
+ # Check for enable-ipv6
+ AH_TEMPLATE(ENABLE_IPV6, [Define if --enable-ipv6 is specified])
 diff --git a/setup.py b/setup.py
-index 506f6107de..dcbc109c30 100644
+index d00d389..d23f148 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -2572,6 +2572,12 @@ def main():
+@@ -2721,6 +2721,12 @@ def main():
      # turn off warnings when deprecated modules are imported
      import warnings
      warnings.filterwarnings("ignore",category=DeprecationWarning)
@@ -84,7 +85,7 @@ index 506f6107de..dcbc109c30 100644
      setup(# PyPI Metadata (PEP 301)
            name = "Python",
            version = sys.version.split()[0],
-@@ -2596,8 +2602,7 @@ def main():
+@@ -2746,8 +2752,7 @@ def main():
            # If you change the scripts installed here, you also need to
            # check the PyBuildScripts command above, and change the links
            # created by the bininstall target in Makefile.pre.in
@@ -95,5 +96,5 @@ index 506f6107de..dcbc109c30 100644
  
  # --install-platlib
 -- 
-2.20.1
+2.30.2
 
diff --git a/package/python3/0015-Add-an-option-to-disable-lib2to3.patch b/package/python3/0014-Add-an-option-to-disable-lib2to3.patch
similarity index 65%
rename from package/python3/0015-Add-an-option-to-disable-lib2to3.patch
rename to package/python3/0014-Add-an-option-to-disable-lib2to3.patch
index 5e30e53788..c8f2e528bf 100644
--- a/package/python3/0015-Add-an-option-to-disable-lib2to3.patch
+++ b/package/python3/0014-Add-an-option-to-disable-lib2to3.patch
@@ -1,4 +1,4 @@
-From bc0681be87109e3e5c35e0bdd225143607350fb6 Mon Sep 17 00:00:00 2001
+From f034b1b0f33a7bd4dde23f0bc1fa8e00e3518c9d Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 22 Feb 2017 17:15:31 -0800
 Subject: [PATCH] Add an option to disable lib2to3
@@ -10,17 +10,19 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Signed-off-by: Samuel Martin <s.martin49@gmail.com>
 [ Andrey Smirnov: ported to Python 3.6 ]
 Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
+[ Adam Duskett: ported to Python 3.10.0 ]
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
 ---
- Makefile.pre.in | 16 ++++++++++++----
- configure.ac    |  6 ++++++
- setup.py        |  5 +++--
- 3 files changed, 21 insertions(+), 6 deletions(-)
+ Makefile.pre.in | 17 ++++++++++++-----
+ configure.ac    |  5 +++++
+ setup.py        |  6 +++---
+ 3 files changed, 20 insertions(+), 8 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index dd83413f17..6324970733 100644
+index 28cf88e..63fa9fb 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1377,7 +1377,9 @@ ifeq (@PYDOC@,yes)
+@@ -1395,7 +1395,9 @@ ifeq (@PYDOC@,yes)
  	(cd $(DESTDIR)$(BINDIR); $(LN) -s pydoc$(VERSION) pydoc3)
  endif
  	-rm -f $(DESTDIR)$(BINDIR)/2to3
@@ -30,27 +32,28 @@ index dd83413f17..6324970733 100644
  	if test "x$(LIPO_32BIT_FLAGS)" != "x" ; then \
  		rm -f $(DESTDIR)$(BINDIR)/python3-32$(EXE); \
  		(cd $(DESTDIR)$(BINDIR); $(LN) -s python$(VERSION)-32$(EXE) python3-32$(EXE)) \
-@@ -1416,7 +1418,6 @@ LIBSUBDIRS=	tkinter site-packages \
- 		html json http dbm xmlrpc \
- 		sqlite3 \
- 		logging csv wsgiref urllib \
--		lib2to3 lib2to3/fixes lib2to3/pgen2 \
- 		ctypes ctypes/macholib \
+@@ -1441,7 +1443,6 @@ LIBSUBDIRS=	asyncio \
  		idlelib idlelib/Icons \
- 		distutils distutils/command $(XMLLIBSUBDIRS) \
-@@ -1494,9 +1495,6 @@ TESTSUBDIRS=	tkinter/test tkinter/test/test_tkinter \
- 		test/test_email test/test_email/data \
- 		test/test_json \
- 		sqlite3/test \
+ 		importlib importlib/metadata \
+ 		json \
+-		lib2to3 lib2to3/fixes lib2to3/pgen2 \
+ 		logging \
+ 		multiprocessing multiprocessing/dummy \
+ 		site-packages \
+@@ -1458,10 +1459,6 @@ LIBSUBDIRS=	asyncio \
+ TESTSUBDIRS=	ctypes/test \
+ 		distutils/tests \
+ 		idlelib/idle_test \
 -		lib2to3/tests \
--		lib2to3/tests/data lib2to3/tests/data/fixers \
+-		lib2to3/tests/data \
+-		lib2to3/tests/data/fixers \
 -		lib2to3/tests/data/fixers/myfixes \
- 		ctypes/test \
- 		idlelib/idle_test \
- 		distutils/tests \
-@@ -1505,6 +1503,14 @@ TESTSUBDIRS=	tkinter/test tkinter/test/test_tkinter \
- 		test/test_tools test/test_warnings test/test_warnings/data \
- 		unittest/test unittest/test/testmock
+ 		sqlite3/test \
+ 		test test/audiodata \
+ 		test/capath test/cjkencodings \
+@@ -1535,6 +1532,14 @@ ifeq (@PYDOC@,yes)
+ LIBSUBDIRS += pydoc_data
+ endif
  
 +ifeq (@LIB2TO3@,yes)
 +LIBSUBDIRS += lib2to3 lib2to3/fixes lib2to3/pgen2
@@ -60,10 +63,10 @@ index dd83413f17..6324970733 100644
 +	lib2to3/tests/data/fixers/myfixes
 +endif
 +
- ifeq (@TEST_MODULES@,yes)
- LIBSUBDIRS += $(TESTSUBDIRS)
- endif
-@@ -1605,10 +1611,12 @@ ifeq (@PYC_BUILD@,yes)
+ TEST_MODULES=@TEST_MODULES@
+ libinstall:	build_all $(srcdir)/Modules/xxmodule.c
+ 	@for i in $(SCRIPTDIR) $(LIBDEST); \
+@@ -1637,10 +1642,12 @@ ifeq (@PYC_BUILD@,yes)
  		-j0 -d $(LIBDEST)/site-packages -f \
  		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
  endif
@@ -77,27 +80,26 @@ index dd83413f17..6324970733 100644
  # bpo-21536: Misc/python-config.sh is generated in the build directory
  # from $(srcdir)Misc/python-config.sh.in.
 diff --git a/configure.ac b/configure.ac
-index b748ad7957..58e9a8fe7a 100644
+index 9079531..34c2ba9 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3377,6 +3377,12 @@ AC_ARG_ENABLE(test-modules,
- 	AS_HELP_STRING([--disable-test-modules], [disable test modules]),
- 	[ TEST_MODULES="${enableval}" ], [ TEST_MODULES=yes ])
+@@ -6014,6 +6014,11 @@ else
+ fi
+ AC_SUBST(TEST_MODULES)
  
 +AC_SUBST(LIB2TO3)
 +
 +AC_ARG_ENABLE(lib2to3,
 +	AS_HELP_STRING([--disable-lib2to3], [disable lib2to3]),
 +	[ LIB2TO3="${enableval}" ], [ LIB2TO3=yes ])
-+
- # Check for enable-ipv6
- AH_TEMPLATE(ENABLE_IPV6, [Define if --enable-ipv6 is specified])
- AC_MSG_CHECKING([if --enable-ipv6 is specified])
+ 
+ # generate output files
+ AC_CONFIG_FILES(Makefile.pre Misc/python.pc Misc/python-embed.pc Misc/python-config.sh)
 diff --git a/setup.py b/setup.py
-index dcbc109c30..8d6348f560 100644
+index d23f148..663fd44 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -2573,10 +2573,11 @@ def main():
+@@ -2722,11 +2722,11 @@ def main():
      import warnings
      warnings.filterwarnings("ignore",category=DeprecationWarning)
  
@@ -106,11 +108,12 @@ index dcbc109c30..8d6348f560 100644
 +    scripts = ['Tools/scripts/idle3', 'Lib/smtpd.py']
      if not '--disable-pydoc' in sysconfig.get_config_var("CONFIG_ARGS"):
          scripts += [ 'Tools/scripts/pydoc3' ]
+-
 +    if not '--disable-lib2to3' in sysconfig.get_config_var("CONFIG_ARGS"):
 +        scripts += [ 'Tools/scripts/2to3' ]
- 
      setup(# PyPI Metadata (PEP 301)
            name = "Python",
+           version = sys.version.split()[0],
 -- 
-2.20.1
+2.30.2
 
diff --git a/package/python3/0016-Add-option-to-disable-the-sqlite3-module.patch b/package/python3/0015-Add-option-to-disable-the-sqlite3-module.patch
similarity index 60%
rename from package/python3/0016-Add-option-to-disable-the-sqlite3-module.patch
rename to package/python3/0015-Add-option-to-disable-the-sqlite3-module.patch
index 0208bce231..81fa52bb73 100644
--- a/package/python3/0016-Add-option-to-disable-the-sqlite3-module.patch
+++ b/package/python3/0015-Add-option-to-disable-the-sqlite3-module.patch
@@ -1,4 +1,4 @@
-From fdef81b6f4280eb26bc620ed8dd3c4dc2018dd29 Mon Sep 17 00:00:00 2001
+From dd2722dec08eb9c72c36313e93661eeca3ad64d8 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 22 Feb 2017 17:20:45 -0800
 Subject: [PATCH] Add option to disable the sqlite3 module
@@ -7,32 +7,34 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Signed-off-by: Samuel Martin <s.martin49@gmail.com>
 [ Andrey Smirnov: ported to Python 3.6 ]
 Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
+[ Adam Duskett: ported to Python 3.10.0 ]
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
 ---
  Makefile.pre.in | 7 +++++--
  configure.ac    | 9 +++++++++
  2 files changed, 14 insertions(+), 2 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 6324970733..f700b780fb 100644
+index 5847029..5628860 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1416,7 +1416,6 @@ LIBSUBDIRS=	tkinter site-packages \
- 		email email/mime \
- 		ensurepip ensurepip/_bundled \
- 		html json http dbm xmlrpc \
+@@ -1446,7 +1446,6 @@ LIBSUBDIRS=	asyncio \
+ 		logging \
+ 		multiprocessing multiprocessing/dummy \
+ 		site-packages \
 -		sqlite3 \
- 		logging csv wsgiref urllib \
- 		ctypes ctypes/macholib \
- 		idlelib idlelib/Icons \
-@@ -1494,7 +1493,6 @@ TESTSUBDIRS=	tkinter/test tkinter/test/test_tkinter \
- 		test/test_asyncio \
- 		test/test_email test/test_email/data \
- 		test/test_json \
--		sqlite3/test \
- 		ctypes/test \
- 		idlelib/idle_test \
+ 		tkinter \
+ 		turtledemo \
+ 		unittest \
+@@ -1459,7 +1458,6 @@ LIBSUBDIRS=	asyncio \
+ TESTSUBDIRS=	ctypes/test \
  		distutils/tests \
-@@ -1511,6 +1509,11 @@ TESTSUBDIRS += lib2to3/tests			\
+ 		idlelib/idle_test \
+-		sqlite3/test \
+ 		test test/audiodata \
+ 		test/capath test/cjkencodings \
+ 		test/data test/decimaltestdata \
+@@ -1540,6 +1538,11 @@ TESTSUBDIRS += lib2to3/tests			\
  	lib2to3/tests/data/fixers/myfixes
  endif
  
@@ -41,14 +43,14 @@ index 6324970733..f700b780fb 100644
 +TESTSUBDIRS += sqlite3/test
 +endif
 +
- ifeq (@TEST_MODULES@,yes)
- LIBSUBDIRS += $(TESTSUBDIRS)
- endif
+ TEST_MODULES=@TEST_MODULES@
+ libinstall:	build_all $(srcdir)/Modules/xxmodule.c
+ 	@for i in $(SCRIPTDIR) $(LIBDEST); \
 diff --git a/configure.ac b/configure.ac
-index 58e9a8fe7a..644ed6d895 100644
+index 34c2ba9..dfee472 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3365,6 +3365,15 @@ if test "$posix_threads" = "yes"; then
+@@ -3373,6 +3373,15 @@ if test "$posix_threads" = "yes"; then
        AC_CHECK_FUNCS(pthread_getcpuclockid)
  fi
  
@@ -65,5 +67,5 @@ index 58e9a8fe7a..644ed6d895 100644
  
  AC_ARG_ENABLE(pydoc,
 -- 
-2.20.1
+2.30.2
 
diff --git a/package/python3/0016-Add-an-option-to-disable-the-tk-module.patch b/package/python3/0016-Add-an-option-to-disable-the-tk-module.patch
new file mode 100644
index 0000000000..db79f5691f
--- /dev/null
+++ b/package/python3/0016-Add-an-option-to-disable-the-tk-module.patch
@@ -0,0 +1,74 @@
+From ad6b66b34f71ff6b60b3be5f6fd3e781cdeecd59 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Wed, 22 Feb 2017 17:23:42 -0800
+Subject: [PATCH] Add an option to disable the tk module
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+[ Andrey Smirnov: ported to Python 3.6 ]
+Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
+[ Adam Duskett: ported to Python 3.10.0 ]
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
+---
+ Makefile.pre.in | 10 +++++++---
+ configure.ac    |  9 +++++++++
+ 2 files changed, 16 insertions(+), 3 deletions(-)
+
+diff --git a/Makefile.pre.in b/Makefile.pre.in
+index 5628860..c968113 100644
+--- a/Makefile.pre.in
++++ b/Makefile.pre.in
+@@ -1446,7 +1446,6 @@ LIBSUBDIRS=	asyncio \
+ 		logging \
+ 		multiprocessing multiprocessing/dummy \
+ 		site-packages \
+-		tkinter \
+ 		turtledemo \
+ 		unittest \
+ 		urllib \
+@@ -1522,8 +1521,6 @@ TESTSUBDIRS=	ctypes/test \
+ 		test/tracedmodules \
+ 		test/xmltestdata test/xmltestdata/c14n-20 \
+ 		test/ziptestdata \
+-		tkinter/test tkinter/test/test_tkinter \
+-		tkinter/test/test_ttk \
+ 		unittest/test unittest/test/testmock
+ 
+ ifeq (@PYDOC@,yes)
+@@ -1543,6 +1540,13 @@ LIBSUBDIRS += sqlite3
+ TESTSUBDIRS += sqlite3/test
+ endif
+ 
++ifeq (@TK@,yes)
++LIBSUBDIRS += tkinter
++TESTSUBDIRS += tkinter/test tkinter/test/test_tkinter \
++	tkinter/test/test_ttk
++endif
++
++
+ TEST_MODULES=@TEST_MODULES@
+ libinstall:	build_all $(srcdir)/Modules/xxmodule.c
+ 	@for i in $(SCRIPTDIR) $(LIBDEST); \
+diff --git a/configure.ac b/configure.ac
+index dfee472..dc76dff 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -3382,6 +3382,15 @@ if test "$SQLITE3" = "no" ; then
+    DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _sqlite3"
+ fi
+ 
++AC_SUBST(TK)
++AC_ARG_ENABLE(tk,
++	AS_HELP_STRING([--disable-tk], [disable tk]),
++	[ TK="${enableval}" ], [ TK=yes ])
++
++if test "$TK" = "no"; then
++   DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _tkinter"
++fi
++
+ AC_SUBST(PYDOC)
+ 
+ AC_ARG_ENABLE(pydoc,
+-- 
+2.30.2
+
diff --git a/package/python3/0018-Add-an-option-to-disable-the-curses-module.patch b/package/python3/0017-Add-an-option-to-disable-the-curses-module.patch
similarity index 60%
rename from package/python3/0018-Add-an-option-to-disable-the-curses-module.patch
rename to package/python3/0017-Add-an-option-to-disable-the-curses-module.patch
index 16d2c1d383..35d92fb7d1 100644
--- a/package/python3/0018-Add-an-option-to-disable-the-curses-module.patch
+++ b/package/python3/0017-Add-an-option-to-disable-the-curses-module.patch
@@ -1,4 +1,4 @@
-From 7dea1b79fbb905dd69862862f327cc0f25cd93c2 Mon Sep 17 00:00:00 2001
+From 962deb43f5f340a8472d432ae8e6d61186f9040e Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 22 Feb 2017 17:31:51 -0800
 Subject: [PATCH] Add an option to disable the curses module
@@ -7,39 +7,40 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Signed-off-by: Samuel Martin <s.martin49@gmail.com>
 [ Andrey Smirnov: ported to Python 3.6 ]
 Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
+[ Adam Duskett: ported to Python 3.10.0 ]
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
 ---
- Makefile.pre.in | 5 ++++-
+ Makefile.pre.in |  4 +++-
  configure.ac    | 9 +++++++++
- 2 files changed, 13 insertions(+), 1 deletion(-)
+ 2 files changed, 12 insertions(+), 1 deletion(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 4fcf8b5a96..2e45a41140 100644
+index c968113..f89f155 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1425,7 +1425,6 @@ LIBSUBDIRS=	site-packages \
- 		multiprocessing multiprocessing/dummy \
- 		unittest \
- 		venv venv/scripts venv/scripts/common venv/scripts/posix \
+@@ -1432,7 +1432,6 @@ LIBSUBDIRS=	asyncio \
+ 		concurrent concurrent/futures \
+ 		csv \
+ 		ctypes ctypes/macholib \
 -		curses \
- 		zoneinfo
- 
- TESTSUBDIRS=	test \
-@@ -1506,6 +1505,10 @@ TESTSUBDIRS += tkinter/test tkinter/test/test_tkinter \
+ 		dbm \
+ 		distutils distutils/command \
+ 		email email/mime \
+@@ -1546,6 +1545,9 @@ TESTSUBDIRS += tkinter/test tkinter/test/test_tkinter \
  	tkinter/test/test_ttk
  endif
  
 +ifeq (@CURSES@,yes)
 +LIBSUBDIRS += curses
 +endif
-+
- ifeq (@LIB2TO3@,yes)
- LIBSUBDIRS += lib2to3 lib2to3/fixes lib2to3/pgen2
- TESTSUBDIRS += lib2to3/tests			\
+ 
+ TEST_MODULES=@TEST_MODULES@
+ libinstall:	build_all $(srcdir)/Modules/xxmodule.c
 diff --git a/configure.ac b/configure.ac
-index a4d06dcb50..f034cd4bcb 100644
+index dc76dff..4f1cda5 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3383,6 +3383,15 @@ if test "$TK" = "no"; then
+@@ -3391,6 +3391,15 @@ if test "$TK" = "no"; then
     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _tkinter"
  fi
  
@@ -56,5 +57,5 @@ index a4d06dcb50..f034cd4bcb 100644
  
  AC_ARG_ENABLE(pydoc,
 -- 
-2.20.1
+2.30.2
 
diff --git a/package/python3/0017-Add-an-option-to-disable-the-tk-module.patch b/package/python3/0017-Add-an-option-to-disable-the-tk-module.patch
deleted file mode 100644
index b3a4d202e8..0000000000
--- a/package/python3/0017-Add-an-option-to-disable-the-tk-module.patch
+++ /dev/null
@@ -1,73 +0,0 @@
-From 8b77e7ce6723e11c1891befe7e6413d8328e8f67 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Wed, 22 Feb 2017 17:23:42 -0800
-Subject: [PATCH] Add an option to disable the tk module
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Signed-off-by: Samuel Martin <s.martin49@gmail.com>
-[ Andrey Smirnov: ported to Python 3.6 ]
-Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
----
- Makefile.pre.in | 11 ++++++++---
- configure.ac    |  9 +++++++++
- 2 files changed, 17 insertions(+), 3 deletions(-)
-
-diff --git a/Makefile.pre.in b/Makefile.pre.in
-index f700b780fb..4fcf8b5a96 100644
---- a/Makefile.pre.in
-+++ b/Makefile.pre.in
-@@ -1410,7 +1410,7 @@ maninstall:	altmaninstall
- # Install the library
- XMLLIBSUBDIRS=  xml xml/dom xml/etree xml/parsers xml/sax
- 
--LIBSUBDIRS=	tkinter site-packages \
-+LIBSUBDIRS=	site-packages \
- 		asyncio \
- 		collections concurrent concurrent/futures encodings \
- 		email email/mime \
-@@ -1428,8 +1428,7 @@ LIBSUBDIRS=	tkinter site-packages \
- 		curses \
- 		zoneinfo
- 
--TESTSUBDIRS=	tkinter/test tkinter/test/test_tkinter \
--		tkinter/test/test_ttk test \
-+TESTSUBDIRS=	test \
- 		test/audiodata \
- 		test/capath test/data \
- 		test/cjkencodings test/decimaltestdata \
-@@ -1501,6 +1500,12 @@ TESTSUBDIRS=	tkinter/test tkinter/test/test_tkinter \
- 		test/test_tools test/test_warnings test/test_warnings/data \
- 		unittest/test unittest/test/testmock
- 
-+ifeq (@TK@,yes)
-+LIBSUBDIRS += tkinter
-+TESTSUBDIRS += tkinter/test tkinter/test/test_tkinter \
-+	tkinter/test/test_ttk
-+endif
-+
- ifeq (@LIB2TO3@,yes)
- LIBSUBDIRS += lib2to3 lib2to3/fixes lib2to3/pgen2
- TESTSUBDIRS += lib2to3/tests			\
-diff --git a/configure.ac b/configure.ac
-index 644ed6d895..a4d06dcb50 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -3374,6 +3374,15 @@ if test "$SQLITE3" = "no" ; then
-    DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _sqlite3"
- fi
- 
-+AC_SUBST(TK)
-+AC_ARG_ENABLE(tk,
-+	AS_HELP_STRING([--disable-tk], [disable tk]),
-+	[ TK="${enableval}" ], [ TK=yes ])
-+
-+if test "$TK" = "no"; then
-+   DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _tkinter"
-+fi
-+
- AC_SUBST(PYDOC)
- 
- AC_ARG_ENABLE(pydoc,
--- 
-2.20.1
-
diff --git a/package/python3/0019-Add-an-option-to-disable-expat.patch b/package/python3/0018-Add-an-option-to-disable-expat.patch
similarity index 74%
rename from package/python3/0019-Add-an-option-to-disable-expat.patch
rename to package/python3/0018-Add-an-option-to-disable-expat.patch
index 79e86bd85a..83c89e1f68 100644
--- a/package/python3/0019-Add-an-option-to-disable-expat.patch
+++ b/package/python3/0018-Add-an-option-to-disable-expat.patch
@@ -1,4 +1,4 @@
-From e86dc4209f71d6dc4bfa74fcc2c963b678def39f Mon Sep 17 00:00:00 2001
+From 7e0e7dc25f50acd6922493ae620ee5cbf107a79a Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 22 Feb 2017 17:40:45 -0800
 Subject: [PATCH] Add an option to disable expat
@@ -13,26 +13,27 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Signed-off-by: Samuel Martin <s.martin49@gmail.com>
 [ Andrey Smirnov: ported to Python 3.6 ]
 Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
+[ Adam Duskett: ported to Python 3.10.0 ]
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
 ---
- Makefile.pre.in |  6 +++++-
+ Makefile.pre.in |  5 ++++-
  configure.ac    | 18 +++++++++++++-----
  setup.py        |  2 +-
- 3 files changed, 19 insertions(+), 7 deletions(-)
+ 3 files changed, 18 insertions(+), 7 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 2e45a41140..4981087723 100644
+index f89f155..08c5e8a 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1419,7 +1419,7 @@ LIBSUBDIRS=	site-packages \
- 		logging csv wsgiref urllib \
- 		ctypes ctypes/macholib \
- 		idlelib idlelib/Icons \
--		distutils distutils/command $(XMLLIBSUBDIRS) \
-+		distutils distutils/command \
- 		importlib \
- 		turtledemo \
- 		multiprocessing multiprocessing/dummy \
-@@ -1509,6 +1509,10 @@ ifeq (@CURSES@,yes)
+@@ -1450,7 +1450,6 @@ LIBSUBDIRS=	asyncio \
+ 		urllib \
+ 		venv venv/scripts venv/scripts/common venv/scripts/posix \
+ 		wsgiref \
+-		$(XMLLIBSUBDIRS) \
+ 		xmlrpc \
+ 		zoneinfo
+ TESTSUBDIRS=	ctypes/test \
+@@ -1549,6 +1548,10 @@ ifeq (@CURSES@,yes)
  LIBSUBDIRS += curses
  endif
  
@@ -40,14 +41,14 @@ index 2e45a41140..4981087723 100644
 +LIBSUBDIRS += $(XMLLIBSUBDIRS)
 +endif
 +
- ifeq (@LIB2TO3@,yes)
- LIBSUBDIRS += lib2to3 lib2to3/fixes lib2to3/pgen2
- TESTSUBDIRS += lib2to3/tests			\
+ TEST_MODULES=@TEST_MODULES@
+ libinstall:	build_all $(srcdir)/Modules/xxmodule.c
+ 	@for i in $(SCRIPTDIR) $(LIBDEST); \
 diff --git a/configure.ac b/configure.ac
-index f034cd4bcb..c90c92c2de 100644
+index 4f1cda5..e99a174 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3091,13 +3091,21 @@ PKG_PROG_PKG_CONFIG
+@@ -3094,13 +3094,21 @@ PKG_PROG_PKG_CONFIG
  AC_SUBST(DISABLED_EXTENSIONS)
  
  # Check for use of the system expat library
@@ -75,10 +76,10 @@ index f034cd4bcb..c90c92c2de 100644
  # Check for use of the system libffi library
  AC_MSG_CHECKING(for --with-system-ffi)
 diff --git a/setup.py b/setup.py
-index 8d6348f560..0d6fe717da 100644
+index 663fd44..e30ed52 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -1671,7 +1671,7 @@ class PyBuildExt(build_ext):
+@@ -1764,7 +1764,7 @@ class PyBuildExt(build_ext):
          #
          # More information on Expat can be found at www.libexpat.org.
          #
@@ -88,5 +89,5 @@ index 8d6348f560..0d6fe717da 100644
              define_macros = []
              extra_compile_args = []
 -- 
-2.20.1
+2.30.2
 
diff --git a/package/python3/0020-Add-an-option-to-disable-CJK-codecs.patch b/package/python3/0019-Add-an-option-to-disable-CJK-codecs.patch
similarity index 82%
rename from package/python3/0020-Add-an-option-to-disable-CJK-codecs.patch
rename to package/python3/0019-Add-an-option-to-disable-CJK-codecs.patch
index aa1a1499be..2afcf4526d 100644
--- a/package/python3/0020-Add-an-option-to-disable-CJK-codecs.patch
+++ b/package/python3/0019-Add-an-option-to-disable-CJK-codecs.patch
@@ -1,4 +1,4 @@
-From ede026befe4094635d268e293bfccb9118f19a1c Mon Sep 17 00:00:00 2001
+From 2c0d31bb91fc7f94283c3ab632925fbbe24e94d6 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 23 Dec 2015 11:49:55 +0100
 Subject: [PATCH] Add an option to disable CJK codecs
@@ -9,10 +9,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  1 file changed, 6 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index c90c92c2de..d9029f5463 100644
+index 9ef0ecd42f..18e6fd70a0 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3382,6 +3382,12 @@ if test "$SQLITE3" = "no" ; then
+@@ -3390,6 +3390,12 @@ if test "$SQLITE3" = "no" ; then
     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _sqlite3"
  fi
  
@@ -26,5 +26,5 @@ index c90c92c2de..d9029f5463 100644
  AC_ARG_ENABLE(tk,
  	AS_HELP_STRING([--disable-tk], [disable tk]),
 -- 
-2.20.1
+2.25.1
 
diff --git a/package/python3/0021-Add-an-option-to-disable-NIS.patch b/package/python3/0020-Add-an-option-to-disable-NIS.patch
similarity index 84%
rename from package/python3/0021-Add-an-option-to-disable-NIS.patch
rename to package/python3/0020-Add-an-option-to-disable-NIS.patch
index 2a80e00099..d8fe3616c0 100644
--- a/package/python3/0021-Add-an-option-to-disable-NIS.patch
+++ b/package/python3/0020-Add-an-option-to-disable-NIS.patch
@@ -1,4 +1,4 @@
-From 1c1acbd3ca7f1184710326fab2d557fed4a216e3 Mon Sep 17 00:00:00 2001
+From 2041d0c8dba87991edaf088b16e37b5189a3466d Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 23 Dec 2015 11:50:11 +0100
 Subject: [PATCH] Add an option to disable NIS
@@ -12,10 +12,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  1 file changed, 6 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index d9029f5463..82d9ec77fa 100644
+index 18e6fd70a0..46d2a8131e 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3388,6 +3388,12 @@ AC_ARG_ENABLE(codecs-cjk,
+@@ -3396,6 +3396,12 @@ AC_ARG_ENABLE(codecs-cjk,
  		DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _codecs_kr _codecs_jp _codecs_cn _codecs_tw _codecs_hk _codecs_iso2022"
  	fi])
  
@@ -29,5 +29,5 @@ index d9029f5463..82d9ec77fa 100644
  AC_ARG_ENABLE(tk,
  	AS_HELP_STRING([--disable-tk], [disable tk]),
 -- 
-2.20.1
+2.25.1
 
diff --git a/package/python3/0022-Add-an-option-to-disable-unicodedata.patch b/package/python3/0021-Add-an-option-to-disable-unicodedata.patch
similarity index 83%
rename from package/python3/0022-Add-an-option-to-disable-unicodedata.patch
rename to package/python3/0021-Add-an-option-to-disable-unicodedata.patch
index c4bcbdf133..3519377b5e 100644
--- a/package/python3/0022-Add-an-option-to-disable-unicodedata.patch
+++ b/package/python3/0021-Add-an-option-to-disable-unicodedata.patch
@@ -1,4 +1,4 @@
-From 9fb4ebe3375ff3fc924d423b6b3400bf2cf82fb6 Mon Sep 17 00:00:00 2001
+From dd82a401ff6ba4ba116bf4d520e981a1808ed443 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 23 Dec 2015 11:50:27 +0100
 Subject: [PATCH] Add an option to disable unicodedata
@@ -9,10 +9,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  1 file changed, 6 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index 82d9ec77fa..55d257515f 100644
+index 46d2a8131e..5844e3b73f 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3394,6 +3394,12 @@ AC_ARG_ENABLE(nis,
+@@ -3402,6 +3402,12 @@ AC_ARG_ENABLE(nis,
      	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} nis"
    	  fi])
  
@@ -26,5 +26,5 @@ index 82d9ec77fa..55d257515f 100644
  AC_ARG_ENABLE(tk,
  	AS_HELP_STRING([--disable-tk], [disable tk]),
 -- 
-2.20.1
+2.25.1
 
diff --git a/package/python3/0023-Add-an-option-to-disable-IDLE.patch b/package/python3/0022-Add-an-option-to-disable-IDLE.patch
similarity index 67%
rename from package/python3/0023-Add-an-option-to-disable-IDLE.patch
rename to package/python3/0022-Add-an-option-to-disable-IDLE.patch
index 9235674a55..f09037f7db 100644
--- a/package/python3/0023-Add-an-option-to-disable-IDLE.patch
+++ b/package/python3/0022-Add-an-option-to-disable-IDLE.patch
@@ -1,4 +1,4 @@
-From e3b96113ae2b5a0c3f775d5a9550dbbcffb702dd Mon Sep 17 00:00:00 2001
+From f1b15834045d0641c43014b970721df066fa71f7 Mon Sep 17 00:00:00 2001
 From: Maxime Ripard <maxime.ripard@free-electrons.com>
 Date: Wed, 22 Feb 2017 17:45:14 -0800
 Subject: [PATCH] Add an option to disable IDLE
@@ -9,17 +9,19 @@ much sense to have it into our build.
 Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
 [ Andrey Smirnov: ported to Python 3.6 ]
 Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
+[ Adam Duskett: ported to Python 3.10.0 ]
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
 ---
  Makefile.pre.in | 7 ++++++-
  configure.ac    | 6 ++++++
- setup.py        | 4 +++-
- 3 files changed, 15 insertions(+), 2 deletions(-)
+ setup.py        | 5 ++++-
+ 3 files changed, 16 insertions(+), 2 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 4981087723..222c386f59 100644
+index 08c5e8a..461c5e3 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1371,7 +1371,9 @@ bininstall: altbininstall
+@@ -1389,7 +1389,9 @@ bininstall: altbininstall
  	-rm -f $(DESTDIR)$(LIBPC)/python3-embed.pc
  	(cd $(DESTDIR)$(LIBPC); $(LN) -s python-$(VERSION)-embed.pc python3-embed.pc)
  	-rm -f $(DESTDIR)$(BINDIR)/idle3
@@ -29,15 +31,15 @@ index 4981087723..222c386f59 100644
  	-rm -f $(DESTDIR)$(BINDIR)/pydoc3
  ifeq (@PYDOC@,yes)
  	(cd $(DESTDIR)$(BINDIR); $(LN) -s pydoc$(VERSION) pydoc3)
-@@ -1418,7 +1420,6 @@ LIBSUBDIRS=	site-packages \
- 		html json http dbm xmlrpc \
- 		logging csv wsgiref urllib \
- 		ctypes ctypes/macholib \
+@@ -1439,7 +1441,6 @@ LIBSUBDIRS=	asyncio \
+ 		ensurepip ensurepip/_bundled \
+ 		html \
+ 		http \
 -		idlelib idlelib/Icons \
- 		distutils distutils/command \
- 		importlib \
- 		turtledemo \
-@@ -1513,6 +1514,10 @@ ifeq (@EXPAT@,yes)
+ 		importlib importlib/metadata \
+ 		json \
+ 		logging \
+@@ -1552,6 +1553,10 @@ ifeq (@EXPAT@,yes)
  LIBSUBDIRS += $(XMLLIBSUBDIRS)
  endif
  
@@ -45,14 +47,14 @@ index 4981087723..222c386f59 100644
 +LIBSUBDIRS += idlelib idlelib/Icons
 +endif
 +
- ifeq (@LIB2TO3@,yes)
- LIBSUBDIRS += lib2to3 lib2to3/fixes lib2to3/pgen2
- TESTSUBDIRS += lib2to3/tests			\
+ TEST_MODULES=@TEST_MODULES@
+ libinstall:	build_all $(srcdir)/Modules/xxmodule.c
+ 	@for i in $(SCRIPTDIR) $(LIBDEST); \
 diff --git a/configure.ac b/configure.ac
-index 55d257515f..2efd7a6de0 100644
+index e99a174..baaa743 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3436,6 +3436,12 @@ AC_ARG_ENABLE(lib2to3,
+@@ -6073,6 +6073,12 @@ AC_ARG_ENABLE(lib2to3,
  	AS_HELP_STRING([--disable-lib2to3], [disable lib2to3]),
  	[ LIB2TO3="${enableval}" ], [ LIB2TO3=yes ])
  
@@ -62,14 +64,14 @@ index 55d257515f..2efd7a6de0 100644
 +	AS_HELP_STRING([--disable-idle3], [disable idle3 IDE]),
 +	[ IDLE="${enableval}" ], [ IDLE=yes ])
 +
- # Check for enable-ipv6
- AH_TEMPLATE(ENABLE_IPV6, [Define if --enable-ipv6 is specified])
- AC_MSG_CHECKING([if --enable-ipv6 is specified])
+ # generate output files
+ AC_CONFIG_FILES(Makefile.pre Misc/python.pc Misc/python-embed.pc Misc/python-config.sh)
+ AC_CONFIG_FILES([Modules/ld_so_aix], [chmod +x Modules/ld_so_aix])
 diff --git a/setup.py b/setup.py
-index 0d6fe717da..4f8cfcd28d 100644
+index e30ed52..4dff249 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -2573,11 +2573,13 @@ def main():
+@@ -2722,11 +2722,14 @@ def main():
      import warnings
      warnings.filterwarnings("ignore",category=DeprecationWarning)
  
@@ -81,9 +83,10 @@ index 0d6fe717da..4f8cfcd28d 100644
          scripts += [ 'Tools/scripts/2to3' ]
 +    if not '--disable-idle3' in sysconfig.get_config_var("CONFIG_ARGS"):
 +        scripts += [ 'Tools/scripts/idle3' ]
- 
++
      setup(# PyPI Metadata (PEP 301)
            name = "Python",
+           version = sys.version.split()[0],
 -- 
-2.20.1
+2.30.2
 
diff --git a/package/python3/0024-Add-an-option-to-disable-decimal.patch b/package/python3/0023-Add-an-option-to-disable-decimal.patch
similarity index 89%
rename from package/python3/0024-Add-an-option-to-disable-decimal.patch
rename to package/python3/0023-Add-an-option-to-disable-decimal.patch
index 963dcec70e..fd1887d603 100644
--- a/package/python3/0024-Add-an-option-to-disable-decimal.patch
+++ b/package/python3/0023-Add-an-option-to-disable-decimal.patch
@@ -1,4 +1,4 @@
-From 2eb05b69bb21df7884686ca2620612ac0f95b894 Mon Sep 17 00:00:00 2001
+From d5fe81cbd51da2a84ed89d1e4c80d921d4efce26 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 23 Dec 2015 11:51:31 +0100
 Subject: [PATCH] Add an option to disable decimal
@@ -19,10 +19,10 @@ Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
  2 files changed, 13 insertions(+), 6 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 2efd7a6de0..86fd03cdbb 100644
+index 7bd4623ccd..e513ef6a20 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3142,13 +3142,20 @@ fi
+@@ -3145,13 +3145,20 @@ fi
  AC_SUBST(LIBFFI_INCLUDEDIR)
  
  # Check for use of the system libmpdec library
@@ -49,18 +49,18 @@ index 2efd7a6de0..86fd03cdbb 100644
  # Check whether _decimal should use a coroutine-local or thread-local context
  AC_MSG_CHECKING(for --with-decimal-contextvar)
 diff --git a/setup.py b/setup.py
-index 4f8cfcd28d..b471234473 100644
+index c4ee989ba3..3d0c74bb7f 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -2202,7 +2202,7 @@ class PyBuildExt(build_ext):
+@@ -2321,7 +2321,7 @@ class PyBuildExt(build_ext):
          # Stefan Krah's _decimal module
          extra_compile_args = []
          undef_macros = []
 -        if '--with-system-libmpdec' in sysconfig.get_config_var("CONFIG_ARGS"):
 +        if '--with-libmpdec=system' in sysconfig.get_config_var("CONFIG_ARGS"):
              include_dirs = []
-             libraries = [':libmpdec.so.2']
+             libraries = ['mpdec']
              sources = ['_decimal/_decimal.c']
 -- 
-2.20.1
+2.25.1
 
diff --git a/package/python3/0025-Add-an-option-to-disable-the-ossaudiodev-module.patch b/package/python3/0024-Add-an-option-to-disable-the-ossaudiodev-module.patch
similarity index 85%
rename from package/python3/0025-Add-an-option-to-disable-the-ossaudiodev-module.patch
rename to package/python3/0024-Add-an-option-to-disable-the-ossaudiodev-module.patch
index d7a9ab6481..0459b5a14d 100644
--- a/package/python3/0025-Add-an-option-to-disable-the-ossaudiodev-module.patch
+++ b/package/python3/0024-Add-an-option-to-disable-the-ossaudiodev-module.patch
@@ -1,4 +1,4 @@
-From 1773ef327247ff2a6e7ce737637748b67c90419f Mon Sep 17 00:00:00 2001
+From 9bedc56d2a4b8856162650a11c1fcb6ec38f160b Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 23 Dec 2015 11:51:58 +0100
 Subject: [PATCH] Add an option to disable the ossaudiodev module
@@ -9,10 +9,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  1 file changed, 6 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index 86fd03cdbb..7ba4ea8d5d 100644
+index e513ef6a20..c07505e89e 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3172,6 +3172,12 @@ fi
+@@ -3175,6 +3175,12 @@ fi
  
  AC_MSG_RESULT($with_decimal_contextvar)
  
@@ -26,5 +26,5 @@ index 86fd03cdbb..7ba4ea8d5d 100644
  AC_MSG_CHECKING(for --enable-loadable-sqlite-extensions)
  AC_ARG_ENABLE(loadable-sqlite-extensions,
 -- 
-2.20.1
+2.25.1
 
diff --git a/package/python3/0026-Add-an-option-to-disable-openssl-support.patch b/package/python3/0025-Add-an-option-to-disable-openssl-support.patch
similarity index 83%
rename from package/python3/0026-Add-an-option-to-disable-openssl-support.patch
rename to package/python3/0025-Add-an-option-to-disable-openssl-support.patch
index 33c6ad94b8..4801a27300 100644
--- a/package/python3/0026-Add-an-option-to-disable-openssl-support.patch
+++ b/package/python3/0025-Add-an-option-to-disable-openssl-support.patch
@@ -1,4 +1,4 @@
-From 9fb639fba83cddfbda20819d58df77bdccf6ba1d Mon Sep 17 00:00:00 2001
+From 90ed5c692b8b5596ca0b3ae1436276c8181251d8 Mon Sep 17 00:00:00 2001
 From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
 Date: Wed, 22 Feb 2017 17:55:59 -0800
 Subject: [PATCH] Add an option to disable openssl support.
@@ -9,10 +9,10 @@ Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
  1 file changed, 6 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index 7ba4ea8d5d..96e7e1feed 100644
+index 08c148c..a81a24c 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3413,6 +3413,12 @@ AC_ARG_ENABLE(unicodedata,
+@@ -3421,6 +3421,12 @@ AC_ARG_ENABLE(unicodedata,
      	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} unicodedata"
    	  fi])
  
@@ -26,5 +26,5 @@ index 7ba4ea8d5d..96e7e1feed 100644
  AC_ARG_ENABLE(tk,
  	AS_HELP_STRING([--disable-tk], [disable tk]),
 -- 
-2.20.1
+2.30.2
 
diff --git a/package/python3/0027-Add-an-option-to-disable-the-readline-module.patch b/package/python3/0026-Add-an-option-to-disable-the-readline-module.patch
similarity index 82%
rename from package/python3/0027-Add-an-option-to-disable-the-readline-module.patch
rename to package/python3/0026-Add-an-option-to-disable-the-readline-module.patch
index f59af5e9a1..adb04d69ea 100644
--- a/package/python3/0027-Add-an-option-to-disable-the-readline-module.patch
+++ b/package/python3/0026-Add-an-option-to-disable-the-readline-module.patch
@@ -1,4 +1,4 @@
-From c246223473b49a719b765520068aaf812f1fe6ca Mon Sep 17 00:00:00 2001
+From 049e7a51e1ffd0d28d6608c707ab4b54e816d338 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Tue, 7 Mar 2017 23:29:05 +0100
 Subject: [PATCH] Add an option to disable the readline module
@@ -9,10 +9,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  1 file changed, 6 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index 96e7e1feed..d5732b2474 100644
+index a81a24c..41a21ff 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3419,6 +3419,12 @@ AC_ARG_ENABLE(openssl,
+@@ -3427,6 +3427,12 @@ AC_ARG_ENABLE(openssl,
  	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} ssl _ssl _hashlib"
  	  fi])
  
@@ -26,5 +26,5 @@ index 96e7e1feed..d5732b2474 100644
  AC_ARG_ENABLE(tk,
  	AS_HELP_STRING([--disable-tk], [disable tk]),
 -- 
-2.20.1
+2.30.2
 
diff --git a/package/python3/0028-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch b/package/python3/0027-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch
similarity index 87%
rename from package/python3/0028-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch
rename to package/python3/0027-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch
index a2a30ab614..d466bc3a76 100644
--- a/package/python3/0028-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch
+++ b/package/python3/0027-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch
@@ -1,4 +1,4 @@
-From 4d87cebaff75a19cd7ccf20f1c89abec5a5bce8d Mon Sep 17 00:00:00 2001
+From 146730a04dfe98e3d7971ebf5410801ceae88e11 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Tue, 7 Mar 2017 23:31:11 +0100
 Subject: [PATCH] Add options to disable zlib, bzip2 and xz modules
@@ -9,10 +9,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  1 file changed, 18 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index d5732b2474..3eadf17306 100644
+index 41a21ff..fa81bc7 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3425,6 +3425,24 @@ AC_ARG_ENABLE(readline,
+@@ -3433,6 +3433,24 @@ AC_ARG_ENABLE(readline,
  	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} readline"
  	  fi])
  
@@ -38,5 +38,5 @@ index d5732b2474..3eadf17306 100644
  AC_ARG_ENABLE(tk,
  	AS_HELP_STRING([--disable-tk], [disable tk]),
 -- 
-2.20.1
+2.30.2
 
diff --git a/package/python3/0029-python-config.sh-don-t-reassign-prefix.patch b/package/python3/0028-python-config.sh-don-t-reassign-prefix.patch
similarity index 94%
rename from package/python3/0029-python-config.sh-don-t-reassign-prefix.patch
rename to package/python3/0028-python-config.sh-don-t-reassign-prefix.patch
index 870ec74d74..814a9d42e5 100644
--- a/package/python3/0029-python-config.sh-don-t-reassign-prefix.patch
+++ b/package/python3/0028-python-config.sh-don-t-reassign-prefix.patch
@@ -1,4 +1,4 @@
-From 1ab6b1fb17c1988baca6b9c578f8de33c44c1a17 Mon Sep 17 00:00:00 2001
+From 106d9378c61e7fa9cad0a63ba068668d54cd11b8 Mon Sep 17 00:00:00 2001
 From: Matt Weber <matthew.weber@rockwellcollins.com>
 Date: Fri, 6 Oct 2017 09:54:15 -0500
 Subject: [PATCH] python-config.sh: don't reassign ${prefix}
@@ -27,7 +27,7 @@ Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/Misc/python-config.sh.in b/Misc/python-config.sh.in
-index a1bc3cd5f7..164d2d3603 100644
+index a1bc3cd..164d2d3 100644
 --- a/Misc/python-config.sh.in
 +++ b/Misc/python-config.sh.in
 @@ -31,7 +31,7 @@ prefix_real=$(installed_prefix "$0")
@@ -49,5 +49,5 @@ index a1bc3cd5f7..164d2d3603 100644
  SO="@EXT_SUFFIX@"
  PYTHONFRAMEWORK="@PYTHONFRAMEWORK@"
 -- 
-2.20.1
+2.30.2
 
diff --git a/package/python3/0029-Fix-cross-compiling-the-uuid-module.patch b/package/python3/0029-Fix-cross-compiling-the-uuid-module.patch
new file mode 100644
index 0000000000..d19aedb6c1
--- /dev/null
+++ b/package/python3/0029-Fix-cross-compiling-the-uuid-module.patch
@@ -0,0 +1,43 @@
+From d7b90b157eddefbd0ed59e35c90b083c0c03b644 Mon Sep 17 00:00:00 2001
+From: Adam Duskett <aduskett@gmail.com>
+Date: Fri, 20 Jul 2018 10:17:39 -0400
+Subject: [PATCH] Fix cross compiling the uuid module
+
+Python 3.7 has a new _uuid module, however, the include directory
+search path for uuid.h is hardcoded to /usr/include/uuid, which should
+not be used when cross-compiling.
+
+To fix this, use the same solution as the one used by the NIS
+detection: append "uuid" to each of the include directories in
+"inc_dirs", instead of hardcoding /usr/include/uuid.
+
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
+[Thomas: drop STAGING_DIR based solution, use a solution similar to
+the one used for the NIS detection.]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ setup.py | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/setup.py b/setup.py
+index 3d0c74bb7f..c7be85f352 100644
+--- a/setup.py
++++ b/setup.py
+@@ -1866,10 +1866,10 @@ class PyBuildExt(build_ext):
+ 
+     def detect_uuid(self):
+         # Build the _uuid module if possible
+-        uuid_h = sysconfig.get_config_var("HAVE_UUID_H")
+-        uuid_uuid_h = sysconfig.get_config_var("HAVE_UUID_UUID_H")
+-        if uuid_h or uuid_uuid_h:
+-            if sysconfig.get_config_var("HAVE_LIBUUID"):
++        uuid_h = find_file("uuid.h", self.inc_dirs,
++                               [os.path.join(inc_dir, 'uuid') for inc_dir in self.inc_dirs])
++        if uuid_h is not None:
++            if self.compiler.find_library_file(self.lib_dirs, 'uuid'):
+                 uuid_libs = ["uuid"]
+             else:
+                 uuid_libs = []
+-- 
+2.25.1
+
diff --git a/package/python3/0030-Add-an-option-to-disable-uuid-module.patch b/package/python3/0030-Add-an-option-to-disable-uuid-module.patch
index af56742d9e..fc4b64dc64 100644
--- a/package/python3/0030-Add-an-option-to-disable-uuid-module.patch
+++ b/package/python3/0030-Add-an-option-to-disable-uuid-module.patch
@@ -1,4 +1,4 @@
-From 20ff7301b496efe529e2b313cac4d7af626f5051 Mon Sep 17 00:00:00 2001
+From 3bb693408eda77dda145ec5fecee56ea73031e9f Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 Date: Sat, 18 Aug 2018 10:54:56 +0200
 Subject: [PATCH] Add an option to disable uuid module
@@ -9,10 +9,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
  1 file changed, 9 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index 3eadf17306..7812dc5102 100644
+index fa81bc7..4e733f6 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3461,6 +3461,15 @@ if test "$CURSES" = "no"; then
+@@ -3469,6 +3469,15 @@ if test "$CURSES" = "no"; then
     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _curses _curses_panel"
  fi
  
@@ -29,5 +29,5 @@ index 3eadf17306..7812dc5102 100644
  
  AC_ARG_ENABLE(pydoc,
 -- 
-2.20.1
+2.30.2
 
diff --git a/package/python3/0031-fix-building-on-older-distributions.patch b/package/python3/0031-fix-building-on-older-distributions.patch
index a8b3465111..fb59e593f4 100644
--- a/package/python3/0031-fix-building-on-older-distributions.patch
+++ b/package/python3/0031-fix-building-on-older-distributions.patch
@@ -1,4 +1,4 @@
-From c9548b8e80eecdd6d0798817698c77649f005b42 Mon Sep 17 00:00:00 2001
+From 94c62f96ca61f1a28124c837d7ec5ed0b9ae8786 Mon Sep 17 00:00:00 2001
 From: Adam Duskett <aduskett@gmail.com>
 Date: Thu, 16 Aug 2018 14:52:37 -0700
 Subject: [PATCH] fix building on older distributions
@@ -34,5 +34,5 @@ index 224585c69b..ef458c0c63 100644
          os.unlink(new_path)
  
 -- 
-2.20.1
+2.25.1
 
diff --git a/package/python3/0032-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch b/package/python3/0032-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch
index ec7ecb6a35..7fe2516e98 100644
--- a/package/python3/0032-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch
+++ b/package/python3/0032-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch
@@ -1,4 +1,4 @@
-From ffe8fb3065973204fce95130c32578163755b71e Mon Sep 17 00:00:00 2001
+From edc0757c56090364e0a95aabfa9f645a16a27569 Mon Sep 17 00:00:00 2001
 From: Peter Korsgaard <peter@korsgaard.com>
 Date: Fri, 2 Aug 2019 15:53:16 +0200
 Subject: [PATCH] configure.ac: fixup $CC --print-multiarch output for
@@ -23,17 +23,16 @@ non-multiarch toolchain on some architectures (E.G.  PowerPC), but as a
 workaround, rewrite the --print-multiarch output to match older GCC versions
 to keep the configure script happy.
 
-[Peter: update for 3.9.9, which made the MULTIARCH logic !darwin]
 Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 ---
  configure.ac | 4 +++-
  1 file changed, 3 insertions(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 7812dc5102..0ce52b9a7d 100644
+index 615c16aced..241298e6cf 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -883,7 +883,9 @@ fi
+@@ -873,7 +873,9 @@ fi
  rm -f conftest.c conftest.out
  
  if test x$PLATFORM_TRIPLET != xdarwin; then
@@ -45,5 +44,5 @@ index 7812dc5102..0ce52b9a7d 100644
  AC_SUBST(MULTIARCH)
  
 -- 
-2.20.1
+2.25.1
 
diff --git a/package/python3/0033-Add-an-option-to-disable-the-berkeleydb-module.patch b/package/python3/0033-Add-an-option-to-disable-the-berkeleydb-module.patch
index c253f09690..0c0d51a7eb 100644
--- a/package/python3/0033-Add-an-option-to-disable-the-berkeleydb-module.patch
+++ b/package/python3/0033-Add-an-option-to-disable-the-berkeleydb-module.patch
@@ -1,4 +1,4 @@
-From 368a582879f3d757e3527071fd95a956bb272bd8 Mon Sep 17 00:00:00 2001
+From cf4d7fd9f7cb6c1ced32ee323b2b5755640051b7 Mon Sep 17 00:00:00 2001
 From: Bernd Kuhls <bernd.kuhls@t-online.de>
 Date: Sat, 11 Apr 2020 22:01:40 +0200
 Subject: [PATCH] Add an option to disable the berkeleydb module
@@ -9,10 +9,10 @@ Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
  1 file changed, 6 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index 0ce52b9a7d..30a4e5fb2e 100644
+index 4e733f6..1e52f30 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3472,6 +3472,12 @@ if test "$UUID" = "no"; then
+@@ -3480,6 +3480,12 @@ if test "$UUID" = "no"; then
     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _uuid"
  fi
  
@@ -26,5 +26,5 @@ index 0ce52b9a7d..30a4e5fb2e 100644
  
  AC_ARG_ENABLE(pydoc,
 -- 
-2.20.1
+2.30.2
 
diff --git a/package/python3/0034-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch b/package/python3/0034-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch
index 44eb450808..880277eb1d 100644
--- a/package/python3/0034-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch
+++ b/package/python3/0034-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch
@@ -1,4 +1,4 @@
-From 09ded6ff285e12221114b281d35fe8f9484a9ea5 Mon Sep 17 00:00:00 2001
+From 3c83eedcc2df3ecf6c4a17953ca24dff60c1378e Mon Sep 17 00:00:00 2001
 From: Romain Naour <romain.naour@gmail.com>
 Date: Thu, 12 Nov 2020 00:16:18 +0100
 Subject: [PATCH] lib/crypt: uClibc-ng doesn't set errno when encryption method
@@ -36,5 +36,5 @@ index 33dbc46bb3..4692a5270c 100644
          raise
      if result and len(result) == method.total_size:
 -- 
-2.20.1
+2.25.4
 
diff --git a/package/python3/0035-Fix-dictionary-iteration-error-in-_ExecutorManagerTh.patch b/package/python3/0035-Fix-dictionary-iteration-error-in-_ExecutorManagerTh.patch
deleted file mode 100644
index b524795d75..0000000000
--- a/package/python3/0035-Fix-dictionary-iteration-error-in-_ExecutorManagerTh.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 234364f756e3083164ec9bfcd4867855048372b4 Mon Sep 17 00:00:00 2001
-From: Jakub Kulik <kulikjak@gmail.com>
-Date: Mon, 15 Mar 2021 08:49:28 +0100
-Subject: [PATCH] Fix dictionary iteration error in _ExecutorManagerThread
-
-[Thomas: Taken from upstream pull request
-https://github.com/python/cpython/pull/24868, which is aimed at fixing
-https://bugs.python.org/issue43498]
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- Lib/concurrent/futures/process.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Lib/concurrent/futures/process.py b/Lib/concurrent/futures/process.py
-index 90bc98bf2e..e3b36dff57 100644
---- a/Lib/concurrent/futures/process.py
-+++ b/Lib/concurrent/futures/process.py
-@@ -373,7 +373,7 @@ class _ExecutorManagerThread(threading.Thread):
-         assert not self.thread_wakeup._closed
-         wakeup_reader = self.thread_wakeup._reader
-         readers = [result_reader, wakeup_reader]
--        worker_sentinels = [p.sentinel for p in self.processes.values()]
-+        worker_sentinels = [p.sentinel for p in self.processes.copy().values()]
-         ready = mp.connection.wait(readers + worker_sentinels)
- 
-         cause = None
--- 
-2.20.1
-
diff --git a/package/python3/python3.hash b/package/python3/python3.hash
index 15e68ca9f1..fa4b334877 100644
--- a/package/python3/python3.hash
+++ b/package/python3/python3.hash
@@ -1,5 +1,5 @@
-# From https://www.python.org/downloads/release/python-399/
-md5  11d12076311563252a995201248d17e5  Python-3.9.9.tar.xz
+# From https://www.python.org/downloads/release/python-3101/
+md5  789210934745a65247a3ebf5da9adb64  Python-3.10.1.tar.xz
 # Locally computed
-sha256  06828c04a573c073a4e51c4292a27c1be4ae26621c3edc7cf9318418ce3b6d27  Python-3.9.9.tar.xz
-sha256  599826df92bfdcd2702eac691072498bb096c55af04ee984cf90f70ed77b5a70  LICENSE
+sha256  a7f1265b6e1a5de1ec5c3ec7019ab53413469934758311e9d240c46e5ae6e177  Python-3.10.1.tar.xz
+sha256  d0285b61e1a8e420c7deb95836738a5d4a0d26463138b17601f5971212684c4b  LICENSE
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 6f063529b2..6d629ae96e 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON3_VERSION_MAJOR = 3.9
-PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).9
+PYTHON3_VERSION_MAJOR = 3.10
+PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).1
 PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
 PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
 PYTHON3_LICENSE = Python-2.0, others
-- 
2.33.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
