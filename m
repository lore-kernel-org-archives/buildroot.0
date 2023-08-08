Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA14DC04FE1
	for <buildroot@archiver.kernel.org>; Tue,  8 Aug 2023 18:54:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7DF6A81B26;
	Tue,  8 Aug 2023 18:54:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7DF6A81B26
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jadD0Xg0Qa-p; Tue,  8 Aug 2023 18:54:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4184182144;
	Tue,  8 Aug 2023 18:54:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4184182144
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 31FFD1BF330
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 18:54:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 171F0410B8
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 18:54:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 171F0410B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Skh0B-rqUC0N for <buildroot@lists.busybox.net>;
 Tue,  8 Aug 2023 18:54:25 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4C82F409E2
 for <buildroot@buildroot.org>; Tue,  8 Aug 2023 18:54:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C82F409E2
Received: from fli4l.lan.fli4l (p4fd6c649.dip0.t-ipconnect.de [79.214.198.73])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E1EA6A4C1112;
 Tue,  8 Aug 2023 20:51:10 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:48850)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qTRnS-0005AS-1j;
 Tue, 08 Aug 2023 20:51:10 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  8 Aug 2023 20:51:08 +0200
Message-Id: <20230808185108.3787835-17-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230808185108.3787835-1-bernd@kuhls.net>
References: <20230808185108.3787835-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1691520670;
 bh=pRs6DRZrJjzCwg+3kvmcCgkHbtSKJeUDbyYhXyOl+5U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=W1tpNEC5kBixmiUYdz8onLqyAtbO6Bk1ungwAkqLl/2KZvPbFWIw98/fh2KCWUMq+
 umMROuIdpS6G4zY80D6OmByNZrvyXktLi8iheesjuTssM3a1pX8gz1XAYROAC23Hlm
 MlF24LsaWRZB3/YzL4CfZ499duPLE1G7K9gUNIIZvowKL/RRdUcPjttOas/MwpVsmX
 +RLUqhByiMlB7xRpiE8BNA0jEZLKumdlK8/g0y7PizKwiplF8QUHlQqJr8rxxvS9yN
 0T2/aTw/touVsGwGWkJuc1YELYCKt4WRMTtYVG7lK2iM5rsozLm9WTxdYw37L1l5zq
 cc6N4g3SnW0lw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=W1tpNEC5
Subject: [Buildroot] [PATCH/next 16/16] package/python3: Remove
 infrastructure to disable the build of certain extensions
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

All modules are now excluded using features of the upstream build system,
partly by backported patches from Python 3.12 branch.

Renumber remaining patches.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...re-to-disable-the-build-of-certain-e.patch | 108 ------------------
 ...-header-paths-for-cross-compilation.patch} |   0
 ...ok-in-usr-lib-termcap-for-libraries.patch} |   0
 ...h => 0005-Don-t-add-multiarch-paths.patch} |   0
 ...> 0006-Abort-on-failed-module-build.patch} |   0
 ...tch => 0007-Serial-ioctl-workaround.patch} |   0
 ...-shebang-of-Python-scripts-for-cros.patch} |   0
 ...g.sh.in-ensure-sed-invocations-only.patch} |   0
 ...0010-Add-an-option-to-disable-pydoc.patch} |   0
 ...11-Add-an-option-to-disable-lib2to3.patch} |   0
 ... 0012-Add-an-option-to-disable-IDLE.patch} |   0
 ...hon-config.sh-don-t-reassign-prefix.patch} |   0
 ...p-CC-print-multiarch-output-for-mus.patch} |   0
 ...fix-building-on-older-distributions.patch} |   0
 ...ng-doesn-t-set-errno-when-encryptio.patch} |   0
 15 files changed, 108 deletions(-)
 delete mode 100644 package/python3/0003-Add-infrastructure-to-disable-the-build-of-certain-e.patch
 rename package/python3/{0004-Adjust-library-header-paths-for-cross-compilation.patch => 0003-Adjust-library-header-paths-for-cross-compilation.patch} (100%)
 rename package/python3/{0005-Don-t-look-in-usr-lib-termcap-for-libraries.patch => 0004-Don-t-look-in-usr-lib-termcap-for-libraries.patch} (100%)
 rename package/python3/{0006-Don-t-add-multiarch-paths.patch => 0005-Don-t-add-multiarch-paths.patch} (100%)
 rename package/python3/{0007-Abort-on-failed-module-build.patch => 0006-Abort-on-failed-module-build.patch} (100%)
 rename package/python3/{0008-Serial-ioctl-workaround.patch => 0007-Serial-ioctl-workaround.patch} (100%)
 rename package/python3/{0009-Do-not-adjust-the-shebang-of-Python-scripts-for-cros.patch => 0008-Do-not-adjust-the-shebang-of-Python-scripts-for-cros.patch} (100%)
 rename package/python3/{0010-Misc-python-config.sh.in-ensure-sed-invocations-only.patch => 0009-Misc-python-config.sh.in-ensure-sed-invocations-only.patch} (100%)
 rename package/python3/{0011-Add-an-option-to-disable-pydoc.patch => 0010-Add-an-option-to-disable-pydoc.patch} (100%)
 rename package/python3/{0012-Add-an-option-to-disable-lib2to3.patch => 0011-Add-an-option-to-disable-lib2to3.patch} (100%)
 rename package/python3/{0020-Add-an-option-to-disable-IDLE.patch => 0012-Add-an-option-to-disable-IDLE.patch} (100%)
 rename package/python3/{0026-python-config.sh-don-t-reassign-prefix.patch => 0013-python-config.sh-don-t-reassign-prefix.patch} (100%)
 rename package/python3/{0029-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch => 0014-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch} (100%)
 rename package/python3/{0028-fix-building-on-older-distributions.patch => 0015-fix-building-on-older-distributions.patch} (100%)
 rename package/python3/{0031-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch => 0016-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch} (100%)

diff --git a/package/python3/0003-Add-infrastructure-to-disable-the-build-of-certain-e.patch b/package/python3/0003-Add-infrastructure-to-disable-the-build-of-certain-e.patch
deleted file mode 100644
index 5b3911374e..0000000000
--- a/package/python3/0003-Add-infrastructure-to-disable-the-build-of-certain-e.patch
+++ /dev/null
@@ -1,108 +0,0 @@
-From 8e02cebdac536dfb6748da2c50656a26f70d9da7 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Wed, 22 Feb 2017 16:33:22 -0800
-Subject: [PATCH] Add infrastructure to disable the build of certain extensions
-
-Some of the extensions part of the Python core have dependencies on
-external libraries (sqlite, tk, etc.) or are relatively big and not
-necessarly always useful (CJK codecs for example). By extensions, we
-mean part of Python modules that are written in C and therefore
-compiled to binary code.
-
-Therefore, we introduce a small infrastructure that allows to disable
-some of those extensions. This can be done inside the configure.ac by
-adding values to the DISABLED_EXTENSIONS variable (which is a
-word-separated list of extensions).
-
-The implementation works as follow :
-
- * configure.ac defines a DISABLED_EXTENSIONS variable, which is
-   substituted (so that when Makefile.pre is generated from
-   Makefile.pre.in, the value of the variable is substituted). For
-   now, this DISABLED_EXTENSIONS variable is empty, later patches will
-   use it.
-
- * Makefile.pre.in passes the DISABLED_EXTENSIONS value down to the
-   variables passed in the environment when calling the setup.py
-   script that actually builds and installs those extensions.
-
- * setup.py is modified so that the existing "disabled_module_list" is
-   filled with those pre-disabled extensions listed in
-   DISABLED_EXTENSIONS.
-
-Patch ported to python2.7 by Maxime Ripard <ripard@archos.com>, and
-then extended by Thomas Petazzoni
-<thomas.petazzoni@free-electrons.com>.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-[ Andrey Smirnov: ported to Python 3.6 ]
-Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
----
- Makefile.pre.in | 6 +++++-
- configure.ac    | 2 ++
- setup.py        | 5 ++++-
- 3 files changed, 11 insertions(+), 2 deletions(-)
-
-diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 2957c8e5a1..c1cfb96767 100644
---- a/Makefile.pre.in
-+++ b/Makefile.pre.in
-@@ -239,6 +239,8 @@ FILEMODE=	644
- # configure script arguments
- CONFIG_ARGS=	@CONFIG_ARGS@
- 
-+# disabled extensions
-+DISABLED_EXTENSIONS=	@DISABLED_EXTENSIONS@
- 
- # Subdirectories with code
- SRCDIRS= 	@SRCDIRS@
-@@ -739,6 +741,7 @@ sharedmods: $(PYTHON_FOR_BUILD_DEPS) pybuilddir.txt @LIBMPDEC_INTERNAL@ @LIBEXPA
- 	    *) quiet="";; \
- 	esac; \
- 	echo "$(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' \
-+		DISABLED_EXTENSIONS="$(DISABLED_EXTENSIONS)" \
- 		$(PYTHON_FOR_BUILD) $(srcdir)/setup.py $$quiet build"; \
- 	$(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' \
- 		$(PYTHON_FOR_BUILD) $(srcdir)/setup.py $$quiet build
-@@ -2228,7 +2231,8 @@ libainstall: all python-config
- # Install the dynamically loadable modules
- # This goes into $(exec_prefix)
- sharedinstall: all
--	$(RUNSHARED) $(PYTHON_FOR_BUILD) $(srcdir)/setup.py install \
-+	$(RUNSHARED) DISABLED_EXTENSIONS="$(DISABLED_EXTENSIONS)" \
-+		$(PYTHON_FOR_BUILD) $(srcdir)/setup.py install \
- 	   	--prefix=$(prefix) \
- 		--install-scripts=$(BINDIR) \
- 		--install-platlib=$(DESTSHARED) \
-diff --git a/configure.ac b/configure.ac
-index 830885fcb3..5a6a1fe608 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -3562,6 +3562,8 @@ LIBS="$withval $LIBS"
- ],
- [AC_MSG_RESULT(no)])
- 
-+AC_SUBST(DISABLED_EXTENSIONS)
-+
- # Check for use of the system expat library
- AC_MSG_CHECKING(for --with-system-expat)
- AC_ARG_WITH(system_expat,
-diff --git a/setup.py b/setup.py
-index 15d0d4576a..e496ee34c2 100644
---- a/setup.py
-+++ b/setup.py
-@@ -56,7 +56,10 @@
- 
- 
- # This global variable is used to hold the list of modules to be disabled.
--DISABLED_MODULE_LIST = []
-+try:
-+    DISABLED_MODULE_LIST = sysconfig.get_config_var("DISABLED_EXTENSIONS").split(" ")
-+except KeyError:
-+    DISABLED_MODULE_LIST = list()
- 
- # --list-module-names option used by Tools/scripts/generate_module_names.py
- LIST_MODULE_NAMES = False
--- 
-2.34.1
-
diff --git a/package/python3/0004-Adjust-library-header-paths-for-cross-compilation.patch b/package/python3/0003-Adjust-library-header-paths-for-cross-compilation.patch
similarity index 100%
rename from package/python3/0004-Adjust-library-header-paths-for-cross-compilation.patch
rename to package/python3/0003-Adjust-library-header-paths-for-cross-compilation.patch
diff --git a/package/python3/0005-Don-t-look-in-usr-lib-termcap-for-libraries.patch b/package/python3/0004-Don-t-look-in-usr-lib-termcap-for-libraries.patch
similarity index 100%
rename from package/python3/0005-Don-t-look-in-usr-lib-termcap-for-libraries.patch
rename to package/python3/0004-Don-t-look-in-usr-lib-termcap-for-libraries.patch
diff --git a/package/python3/0006-Don-t-add-multiarch-paths.patch b/package/python3/0005-Don-t-add-multiarch-paths.patch
similarity index 100%
rename from package/python3/0006-Don-t-add-multiarch-paths.patch
rename to package/python3/0005-Don-t-add-multiarch-paths.patch
diff --git a/package/python3/0007-Abort-on-failed-module-build.patch b/package/python3/0006-Abort-on-failed-module-build.patch
similarity index 100%
rename from package/python3/0007-Abort-on-failed-module-build.patch
rename to package/python3/0006-Abort-on-failed-module-build.patch
diff --git a/package/python3/0008-Serial-ioctl-workaround.patch b/package/python3/0007-Serial-ioctl-workaround.patch
similarity index 100%
rename from package/python3/0008-Serial-ioctl-workaround.patch
rename to package/python3/0007-Serial-ioctl-workaround.patch
diff --git a/package/python3/0009-Do-not-adjust-the-shebang-of-Python-scripts-for-cros.patch b/package/python3/0008-Do-not-adjust-the-shebang-of-Python-scripts-for-cros.patch
similarity index 100%
rename from package/python3/0009-Do-not-adjust-the-shebang-of-Python-scripts-for-cros.patch
rename to package/python3/0008-Do-not-adjust-the-shebang-of-Python-scripts-for-cros.patch
diff --git a/package/python3/0010-Misc-python-config.sh.in-ensure-sed-invocations-only.patch b/package/python3/0009-Misc-python-config.sh.in-ensure-sed-invocations-only.patch
similarity index 100%
rename from package/python3/0010-Misc-python-config.sh.in-ensure-sed-invocations-only.patch
rename to package/python3/0009-Misc-python-config.sh.in-ensure-sed-invocations-only.patch
diff --git a/package/python3/0011-Add-an-option-to-disable-pydoc.patch b/package/python3/0010-Add-an-option-to-disable-pydoc.patch
similarity index 100%
rename from package/python3/0011-Add-an-option-to-disable-pydoc.patch
rename to package/python3/0010-Add-an-option-to-disable-pydoc.patch
diff --git a/package/python3/0012-Add-an-option-to-disable-lib2to3.patch b/package/python3/0011-Add-an-option-to-disable-lib2to3.patch
similarity index 100%
rename from package/python3/0012-Add-an-option-to-disable-lib2to3.patch
rename to package/python3/0011-Add-an-option-to-disable-lib2to3.patch
diff --git a/package/python3/0020-Add-an-option-to-disable-IDLE.patch b/package/python3/0012-Add-an-option-to-disable-IDLE.patch
similarity index 100%
rename from package/python3/0020-Add-an-option-to-disable-IDLE.patch
rename to package/python3/0012-Add-an-option-to-disable-IDLE.patch
diff --git a/package/python3/0026-python-config.sh-don-t-reassign-prefix.patch b/package/python3/0013-python-config.sh-don-t-reassign-prefix.patch
similarity index 100%
rename from package/python3/0026-python-config.sh-don-t-reassign-prefix.patch
rename to package/python3/0013-python-config.sh-don-t-reassign-prefix.patch
diff --git a/package/python3/0029-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch b/package/python3/0014-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch
similarity index 100%
rename from package/python3/0029-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch
rename to package/python3/0014-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch
diff --git a/package/python3/0028-fix-building-on-older-distributions.patch b/package/python3/0015-fix-building-on-older-distributions.patch
similarity index 100%
rename from package/python3/0028-fix-building-on-older-distributions.patch
rename to package/python3/0015-fix-building-on-older-distributions.patch
diff --git a/package/python3/0031-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch b/package/python3/0016-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch
similarity index 100%
rename from package/python3/0031-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch
rename to package/python3/0016-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
