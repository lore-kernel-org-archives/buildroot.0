Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D836C67871
	for <buildroot@archiver.kernel.org>; Mon, 24 Oct 2022 21:44:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 007EE404F9;
	Mon, 24 Oct 2022 21:44:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 007EE404F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P1cySWbbtJOL; Mon, 24 Oct 2022 21:44:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D242E40438;
	Mon, 24 Oct 2022 21:44:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D242E40438
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0E5411BF973
 for <buildroot@lists.busybox.net>; Mon, 24 Oct 2022 21:43:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DEBDA81328
 for <buildroot@lists.busybox.net>; Mon, 24 Oct 2022 21:43:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DEBDA81328
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PdvsSiiCHt_8 for <buildroot@lists.busybox.net>;
 Mon, 24 Oct 2022 21:43:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 948D481326
 for <buildroot@buildroot.org>; Mon, 24 Oct 2022 21:43:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 948D481326
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 807C887048; Mon, 24 Oct 2022 21:43:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 24 Oct 2022 23:27:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3583e3f4013aca98e6360749c9d2154f6d699639
X-Git-Newrev: 58cc3977e83487bdaa1df232cf7adf6383d49cd7
X-Patchwork-Hint: ignore
Message-Id: <20221024214302.807C887048@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lirc-tools: bump to version 0.10.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=58cc3977e83487bdaa1df232cf7adf6383d49cd7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Drop first to third patches (already in version)
- Add a patch to disable documentation and avoid a build failure without
  doxygen

https://sourceforge.net/p/lirc/git/ci/lirc-0.10.2/tree/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../lirc-tools/0001-Fix-build-without-Python.patch | 63 ----------------------
 ...ins-devinput.c-fix-build-with-musl-1.2.0.patch} |  0
 .../0002-Fix-python-client-cross-compile.patch     | 47 ----------------
 .../0002-configure-add-disable-doc-option.patch    | 52 ++++++++++++++++++
 ...Fix-lirc-version-detection-when-cross-com.patch | 51 ------------------
 package/lirc-tools/lirc-tools.hash                 |  8 +--
 package/lirc-tools/lirc-tools.mk                   |  2 +-
 7 files changed, 57 insertions(+), 166 deletions(-)

diff --git a/package/lirc-tools/0001-Fix-build-without-Python.patch b/package/lirc-tools/0001-Fix-build-without-Python.patch
deleted file mode 100644
index b1940eac0d..0000000000
--- a/package/lirc-tools/0001-Fix-build-without-Python.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-From 71f329d997d949d3c12d62d2f1473a1c99ee49b0 Mon Sep 17 00:00:00 2001
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Sun, 27 Aug 2017 21:30:37 +0300
-Subject: [PATCH] Fix build without Python
-
-Don't define HAVE_PYTHON35 when PYTHON_LIBS is empty.
-
-Also, don't build Python dependent code when HAVE_PYTHON35 is not
-defined.
-
-This fixes build failures like:
-
-Makefile:1616: recipe for target 'python-pkg/dist/lirc-0.10.0.tar.gz' failed
-make[3]: *** [python-pkg/dist/lirc-0.10.0.tar.gz] Error 1
-python-pkg/lirc/_client.c:1:20: fatal error: Python.h: No such file or directory
- #include <Python.h>
-                    ^
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: commit 74a2bcab6b
-
- Makefile.am  | 2 ++
- configure.ac | 3 ++-
- 2 files changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index 9f3dd14340cc..d8164fcd44cf 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -104,6 +104,7 @@ dist_py_pkg_doc_DATA    = python-pkg/doc/Doxyfile \
- 
- libpython               = $(libdir)/python$(PYTHON_VERSION)
- pydir                   = $(libpython)/site-packages/lirc
-+if HAVE_PYTHON35
- py_LTLIBRARIES          = python-pkg/lib/_client.la
- python_pkg_lib__client_la_SOURCES = \
-                           python-pkg/lirc/_client.c
-@@ -116,6 +117,7 @@ python_pkg_lib__client_la_LDFLAGS  = \
-                           $(PYTHON_LIBS)
- python_pkg_lib__client_la_LIBADD = \
-                           lib/liblirc_client.la
-+endif
- 
- pylint: .phony
- 	$(MAKE) -C tools pylint
-diff --git a/configure.ac b/configure.ac
-index 4108688433f8..07d901deafdf 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -50,7 +50,8 @@ test -z "$PYTHON_LIBS" && \
- test -n "$PYTHON_LIBS" || \
-     AC_MSG_WARN([No python package found (missing devel package?)])
- python_version_nodots=$(echo $PYTHON_VERSION | tr -d '.')
--AM_CONDITIONAL(HAVE_PYTHON35, [test $python_version_nodots -ge 35])
-+AM_CONDITIONAL(HAVE_PYTHON35, [test -n "$PYTHON_LIBS" && \
-+			       test $python_version_nodots -ge 35])
- CFLAGS="$CFLAGS $PYTHON_CFLAGS"
- 
- 
--- 
-2.14.1
-
diff --git a/package/lirc-tools/0004-plugins-devinput.c-fix-build-with-musl-1.2.0.patch b/package/lirc-tools/0001-plugins-devinput.c-fix-build-with-musl-1.2.0.patch
similarity index 100%
rename from package/lirc-tools/0004-plugins-devinput.c-fix-build-with-musl-1.2.0.patch
rename to package/lirc-tools/0001-plugins-devinput.c-fix-build-with-musl-1.2.0.patch
diff --git a/package/lirc-tools/0002-Fix-python-client-cross-compile.patch b/package/lirc-tools/0002-Fix-python-client-cross-compile.patch
deleted file mode 100644
index 02deefaf98..0000000000
--- a/package/lirc-tools/0002-Fix-python-client-cross-compile.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 13c4ffcfde07f659a836fba4a604dc1c5024bb90 Mon Sep 17 00:00:00 2001
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Tue, 29 Aug 2017 11:37:36 +0300
-Subject: [PATCH] Fix python client cross compile
-
-The setup.py setuptools wrapper needs to use a version of python built
-specifically for cross compiling to cross compile successfully. Allow
-setting that in the environment using the SETUPTOOLS_ENV variable.
-
-Fixes the following build failure:
-
-/usr/bin/ld: skipping incompatible .../lirc-tools-0.10.0/lib/.libs/liblirc_client.so when searching for -llirc_client
-/usr/bin/ld: cannot find -llirc_client
-collect2: error: ld returned 1 exit status
-error: command '/usr/bin/gcc' failed with exit status 1
-Makefile:1578: recipe for target 'all-local' failed
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: https://sourceforge.net/p/lirc/tickets/308/
-
- Makefile.am | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/Makefile.am b/Makefile.am
-index d8164fcd44cf..a16be4278ae2 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -131,6 +131,7 @@ pep8: $(py_PYTHON)
- if HAVE_PYTHON35
- all-local:
- 	cd python-pkg; \
-+	    $(SETUPTOOLS_ENV) \
- 	    CFLAGS="-I$(abs_top_srcdir)/lib -I$(abs_builddir)/lib" \
- 	    LDFLAGS=-L$(abs_builddir)/lib/.libs $(PYTHON) setup.py \
- 	    $(if $(VERBOSE),,-q) build
-@@ -179,6 +180,7 @@ $(abs_builddir)/python-pkg/setup.py:
- $(PYTHON_TARBALL): $(abs_builddir)/python-pkg/setup.py
- 	cp $(top_builddir)/VERSION $(abs_builddir)/python-pkg
- 	cd $(abs_builddir)/python-pkg; CFLAGS=-I$(abs_top_srcdir)/lib \
-+	    $(SETUPTOOLS_ENV) \
- 	    LDFLAGS=-L$(abs_builddir)/lib/.libs $(PYTHON) setup.py -q sdist
- 
- $(top_builddir)/python-pkg/VERSION: VERSION
--- 
-2.14.1
-
diff --git a/package/lirc-tools/0002-configure-add-disable-doc-option.patch b/package/lirc-tools/0002-configure-add-disable-doc-option.patch
new file mode 100644
index 0000000000..fab485ffef
--- /dev/null
+++ b/package/lirc-tools/0002-configure-add-disable-doc-option.patch
@@ -0,0 +1,52 @@
+From e9d5cbc01e3c0d6a31e2dba2f224b7f3dd21db37 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 23 Oct 2022 16:10:50 +0200
+Subject: [PATCH] configure: add --disable-doc option
+
+Allow the user to disable documentation through --disable-doc
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ Makefile.am  | 6 +++++-
+ configure.ac | 8 ++++++++
+ 2 files changed, 13 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 6718af13..58a321d8 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -45,7 +45,11 @@ if WITH_SYSTEMDSYSTEMUNITDIR
+     SYSTEMD_DIR         = systemd
+ endif
+ 
+-SUBDIRS                 = lib daemons tools plugins configs doc $(SYSTEMD_DIR)
++if HAVE_DOC
++    DOC_DIR             = doc
++endif
++
++SUBDIRS                 = lib daemons tools plugins configs $(DOC_DIR) $(SYSTEMD_DIR)
+ 
+ if INSTALL_ETC
+ 
+diff --git a/configure.ac b/configure.ac
+index d28c6732..f3384c95 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -486,6 +486,14 @@ AC_ARG_VAR(SETUPTOOLS_ENV,
+ )
+ 
+ 
++AC_ARG_ENABLE(doc,
++  [  --enable-doc       Build and install documentation (default=yes)],
++  [ enable_doc="${enableval}" ],
++  [ enable_doc=yes]
++)
++AM_CONDITIONAL([HAVE_DOC], [test x$enable_doc = xyes])
++
++
+ suffix=$(echo "$VERSION" | sed 's/.*-//')
+ AM_CONDITIONAL(DEVEL, [test x$suffix = xdevel])
+ 
+-- 
+2.35.1
+
diff --git a/package/lirc-tools/0003-python-pkg-Fix-lirc-version-detection-when-cross-com.patch b/package/lirc-tools/0003-python-pkg-Fix-lirc-version-detection-when-cross-com.patch
deleted file mode 100644
index 04fbfe6ea2..0000000000
--- a/package/lirc-tools/0003-python-pkg-Fix-lirc-version-detection-when-cross-com.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 732fd31610a6790a927ea9ed6d660796a1641254 Mon Sep 17 00:00:00 2001
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Thu, 7 Sep 2017 08:12:01 +0200
-Subject: [PATCH] build: Fix lirc version detection when cross compiling.
-
-The setup.py script that runs on the host can't use the client library
-built for target. So setup.py falls back to a wrong hard-coded VERSION
-value.
-
-Instead of importing the target library, use exec() to read
-lirc/config.py directly for its VERSION value.
-
-Fixes build failure:
-
-/usr/bin/install -c -m 644 ./python-pkg/dist/lirc-0.10.0.tar.gz \
-    '.../output/host/arm-buildroot-linux-musleabihf/sysroot/usr/share/lirc'
-/usr/bin/install: cannot stat './python-pkg/dist/lirc-0.10.0.tar.gz': \
-    No such file or directory
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: commit 732fd31610a6
-
- python-pkg/setup.py | 9 +++------
- 1 file changed, 3 insertions(+), 6 deletions(-)
-
-diff --git a/python-pkg/setup.py b/python-pkg/setup.py
-index e9b33690f828..a2d92e0432aa 100644
---- a/python-pkg/setup.py
-+++ b/python-pkg/setup.py
-@@ -6,14 +6,11 @@ import subprocess
- import os.path
- import os
- 
--try:
--    import lirc.config
--    VERSION = lirc.config.VERSION.replace('-devel','')
--except ImportError:
--    VERSION='0.0.0'
--
- from setuptools import setup, Extension
- 
-+exec(open("lirc/config.py").read())
-+VERSION = VERSION.replace('-devel','')
-+
- if 'CFLAGS' in os.environ:
-     cflags = os.environ['CFLAGS'].split()
-     if 'LDFLAGS' in os.environ:
--- 
-2.14.1
-
diff --git a/package/lirc-tools/lirc-tools.hash b/package/lirc-tools/lirc-tools.hash
index 187768db47..4808508cca 100644
--- a/package/lirc-tools/lirc-tools.hash
+++ b/package/lirc-tools/lirc-tools.hash
@@ -1,6 +1,6 @@
-# hash from https://sourceforge.net/projects/lirc/files/LIRC/0.10.1/
-sha1  9d6f6d18ac566a96ef4ca1d6909a4e8bc517d48a  lirc-0.10.1.tar.bz2
-md5  86c3f8e4efaba10571addb8313d1e040  lirc-0.10.1.tar.bz2
+# hash from https://sourceforge.net/projects/lirc/files/LIRC/0.10.2/
+sha1  02092890205891b6de5a699294485a1eedba46c5  lirc-0.10.2.tar.bz2
+md5  cb96cfb0af8067c0062e2f5a100f426a  lirc-0.10.2.tar.bz2
 # Locally computed
-sha256  8b753c60df2a7f5dcda2db72c38e448ca300c3b4f6000c1501fcb0bd5df414f2  lirc-0.10.1.tar.bz2
+sha256  3d44ec8274881cf262f160805641f0827ffcc20ade0d85e7e6f3b90e0d3d222a  lirc-0.10.2.tar.bz2
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/lirc-tools/lirc-tools.mk b/package/lirc-tools/lirc-tools.mk
index 05f20f5726..5263330741 100644
--- a/package/lirc-tools/lirc-tools.mk
+++ b/package/lirc-tools/lirc-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIRC_TOOLS_VERSION = 0.10.1
+LIRC_TOOLS_VERSION = 0.10.2
 LIRC_TOOLS_SOURCE = lirc-$(LIRC_TOOLS_VERSION).tar.bz2
 LIRC_TOOLS_SITE = http://downloads.sourceforge.net/project/lirc/LIRC/$(LIRC_TOOLS_VERSION)
 LIRC_TOOLS_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
