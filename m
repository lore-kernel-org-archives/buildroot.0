Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD5DAC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:51:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8671B603E7
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:51:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8671B603E7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5CA1783AA4;
	Tue,  3 Aug 2021 21:51:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VxHcsO6GKl8E; Tue,  3 Aug 2021 21:51:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 66C8283B54;
	Tue,  3 Aug 2021 21:51:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 437F81BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0CCC240473
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PPHCIwHbkBtU for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 323EC40235
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 7BF648767D; Tue,  3 Aug 2021 21:09:55 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 24 Jun 2021 23:42:02 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 150038166fafae5c596e1e8ca7572bf8b6793a6d
X-Git-Newrev: c2767180bde9c45ba33e49e8509e1720d87f44f5
X-Patchwork-Hint: ignore
Message-Id: <20210803210955.7BF648767D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-augeas: new
 package
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=c2767180bde9c45ba33e49e8509e1720d87f44f5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

We backport an upstream patch that fixes the loading of the native
library by the FFI logic. Without this, "import augeas" doesn't work
as it goes into the ctypes.utils.find_library() logic that tries to
use a compiler on the target to find the augeas native library.

Based on initial work from Nicolas Carrier <nicolas.carrier@orolia.com>

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS                                         |   2 +
 package/Config.in                                  |   1 +
 .../0001-Use-CFFI-in-out-of-line-API-mode-49.patch | 101 +++++++++++++++++++++
 package/python-augeas/Config.in                    |   8 ++
 package/python-augeas/python-augeas.hash           |   3 +
 package/python-augeas/python-augeas.mk             |  21 +++++
 6 files changed, 136 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index f6621e9670..06d311a085 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1986,6 +1986,7 @@ F:	configs/galileo_defconfig
 
 N:	Nicolas Carrier <nicolas.carrier@orolia.com>
 F:	package/php-xdebug/
+F:	package/python-augeas/
 
 N:	Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
 F:	package/libgit2/
@@ -2672,6 +2673,7 @@ F:	package/pkg-autotools.mk
 F:	package/pkg-generic.mk
 F:	package/python/
 F:	package/python3/
+F:	package/python-augeas/
 F:	package/python-mad/
 F:	package/python-serial/
 F:	package/qextserialport/
diff --git a/package/Config.in b/package/Config.in
index cb8ece4919..35e6d4d493 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -908,6 +908,7 @@ menu "External python modules"
 	source "package/python-async-lru/Config.in"
 	source "package/python-async-timeout/Config.in"
 	source "package/python-attrs/Config.in"
+	source "package/python-augeas/Config.in"
 	source "package/python-autobahn/Config.in"
 	source "package/python-automat/Config.in"
 	source "package/python-avro/Config.in"
diff --git a/package/python-augeas/0001-Use-CFFI-in-out-of-line-API-mode-49.patch b/package/python-augeas/0001-Use-CFFI-in-out-of-line-API-mode-49.patch
new file mode 100644
index 0000000000..da9093d723
--- /dev/null
+++ b/package/python-augeas/0001-Use-CFFI-in-out-of-line-API-mode-49.patch
@@ -0,0 +1,101 @@
+From 9de73fefbe83c74840a93c039258845c49271b9b Mon Sep 17 00:00:00 2001
+From: Jeffery To <jeffery.to@gmail.com>
+Date: Sun, 8 Nov 2020 21:51:09 +0800
+Subject: [PATCH] Use CFFI in out-of-line API mode (#49)
+
+Currently, ffi.py is called during setup to generate augeas.py; this
+file would normally be used for out-of-line ABI mode. ffi.py is also
+imported at run-time, instead of the generated augeas.py, and used in
+in-line ABI mode.
+
+This changes usage of CFFI to out-of-line API mode (CFFI's "main mode of
+usage"): ffi.py is called during setup to generate _augeas.abi3.so (a C
+extension module); this generated module is imported at run-time.
+
+With this change, the headers/development files for augeas (i.e.
+libaugeas-dev on Debian, augeas-devel on Fedora, etc.) and the C
+compiler are required for build/setup. (These were not necessary
+previously.)
+
+Closes https://github.com/hercules-team/python-augeas/issues/48.
+
+Upstream: commit 712c2028568df7760bc98d95577e35709078bfea
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ augeas/__init__.py |  2 +-
+ augeas/ffi.py      | 27 ++++++++++++++++++++++-----
+ setup.py           |  1 +
+ 3 files changed, 24 insertions(+), 6 deletions(-)
+
+diff --git a/augeas/__init__.py b/augeas/__init__.py
+index 9bd97bf..1c0f580 100644
+--- a/augeas/__init__.py
++++ b/augeas/__init__.py
+@@ -32,7 +32,7 @@ format and the transformation into a tree.
+ 
+ from sys import version_info as _pyver
+ 
+-from augeas.ffi import ffi, lib
++from _augeas import ffi, lib
+ 
+ __author__ = "Nathaniel McCallum <nathaniel@natemccallum.com>"
+ __credits__ = """Jeff Schroeder <jeffschroeder@computer.org>
+diff --git a/augeas/ffi.py b/augeas/ffi.py
+index a24daf5..1931764 100644
+--- a/augeas/ffi.py
++++ b/augeas/ffi.py
+@@ -1,9 +1,28 @@
++import os
++import subprocess
++
+ from cffi import FFI
+ 
++def get_include_dirs():
++    XML2_CONFIG = os.environ.get('XML2_CONFIG', 'xml2-config')
++    PKG_CONFIG = os.environ.get('PKG_CONFIG', 'pkg-config')
++    try:
++        stdout = subprocess.check_output([XML2_CONFIG, '--cflags'])
++    except (OSError, subprocess.CalledProcessError):
++        try:
++            stdout = subprocess.check_output([PKG_CONFIG, '--cflags', 'libxml-2.0'])
++        except (OSError, subprocess.CalledProcessError):
++            stdout = b''
++    cflags = stdout.decode('utf-8').split()
++    return [cflag[2:] for cflag in cflags if cflag.startswith('-I')]
++
+ ffi = FFI()
+-ffi.set_source("augeas",
+-               None,
+-               libraries=['augeas'])
++ffi.set_source("_augeas",
++               """
++               #include <augeas.h>
++               """,
++               libraries=['augeas'],
++               include_dirs=get_include_dirs())
+ 
+ ffi.cdef("""
+ typedef struct augeas augeas;
+@@ -44,7 +63,5 @@ const char *aug_error_details(augeas *aug);
+ void free(void *);
+ """)
+ 
+-lib = ffi.dlopen("augeas")
+-
+ if __name__ == "__main__":
+     ffi.compile(verbose=True)
+diff --git a/setup.py b/setup.py
+index 7d55877..17f9516 100755
+--- a/setup.py
++++ b/setup.py
+@@ -22,6 +22,7 @@ setup(name=name,
+       setup_requires=["cffi>=1.0.0"],
+       cffi_modules=["augeas/ffi.py:ffi"],
+       install_requires=["cffi>=1.0.0"],
++      zip_safe=False,
+       url="http://augeas.net/",
+       classifiers=[
+           "Programming Language :: Python :: 2.7",
+-- 
+2.31.1
+
diff --git a/package/python-augeas/Config.in b/package/python-augeas/Config.in
new file mode 100644
index 0000000000..3503a83b3b
--- /dev/null
+++ b/package/python-augeas/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_AUGEAS
+	bool "python-augeas"
+	depends on BR2_PACKAGE_AUGEAS
+	select BR2_PACKAGE_PYTHON_CFFI # runtime
+	help
+	  Pure python bindings for Augeas.
+
+	  https://github.com/hercules-team/python-augeas
diff --git a/package/python-augeas/python-augeas.hash b/package/python-augeas/python-augeas.hash
new file mode 100644
index 0000000000..f4f4209875
--- /dev/null
+++ b/package/python-augeas/python-augeas.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  1a1d2cdaf2ad4c091ed5ec7976c52d16e14ecfbf40b1bdcaced2465255fb0f87  python-augeas-1.1.0.tar.gz
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/python-augeas/python-augeas.mk b/package/python-augeas/python-augeas.mk
new file mode 100644
index 0000000000..7adaa84f49
--- /dev/null
+++ b/package/python-augeas/python-augeas.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# python-augeas
+#
+################################################################################
+
+PYTHON_AUGEAS_VERSION = 1.1.0
+PYTHON_AUGEAS_SITE = $(call github,hercules-team,python-augeas,v$(PYTHON_AUGEAS_VERSION))
+PYTHON_AUGEAS_SETUP_TYPE = setuptools
+PYTHON_AUGEAS_LICENSE = LGPL-2.1+
+PYTHON_AUGEAS_LICENSE_FILES = COPYING
+PYTHON_AUGEAS_DEPENDENCIES = augeas host-python-cffi host-pkgconf
+# This will tell python-augeas to not call xml2-config, and instead
+# use pkg-config to find libxml2. libxml2 is an indirect dependency of
+# augeas, which is why it's not in our dependencies. It's odd that
+# python-augeas searches for libxml2, but that's what it
+# does. Question asked in the pull request at
+# https://github.com/hercules-team/python-augeas/pull/49.
+PYTHON_AUGEAS_ENV = XML2_CONFIG=/bin/false
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
