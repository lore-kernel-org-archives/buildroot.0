Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0E0BE77371
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 12:44:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ABBCA83E11;
	Sat, 30 Sep 2023 12:44:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ABBCA83E11
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mreFoWa6hpCi; Sat, 30 Sep 2023 12:44:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A27E83DF7;
	Sat, 30 Sep 2023 12:44:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A27E83DF7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3C64E1BF870
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 12:44:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1495B4195C
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 12:44:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1495B4195C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hQfz_qDNM43m for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 12:44:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C592841950
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 12:44:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C592841950
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AD8578399B; Sat, 30 Sep 2023 12:44:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 Sep 2023 12:24:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c77e25c3f113c44d753dec308334e52e4c0bec6c
X-Git-Newrev: ca63464e3777ca2596b4d396accb6a384ccf8514
X-Patchwork-Hint: ignore
Message-Id: <20230930124406.AD8578399B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-numpy: bump to version
 1.25.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=ca63464e3777ca2596b4d396accb6a384ccf8514
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Migrate to meson package infrastructure.

License has changed due to date update:
https://github.com/numpy/numpy/commit/c1ffdbc0c29d48ece717acb5bfbf811c935b41f6

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-numpy/python-numpy.hash |  6 +++---
 package/python-numpy/python-numpy.mk   | 31 ++++++++++++++-----------------
 2 files changed, 17 insertions(+), 20 deletions(-)

diff --git a/package/python-numpy/python-numpy.hash b/package/python-numpy/python-numpy.hash
index 9ac9280c78..6629cebbce 100644
--- a/package/python-numpy/python-numpy.hash
+++ b/package/python-numpy/python-numpy.hash
@@ -1,7 +1,7 @@
-# Copied from https://github.com/numpy/numpy/releases/tag/v1.23.5
-sha256  1b1766d6f397c18153d40015ddfc79ddb715cabadc04d2d228d4e5a8bc4ded1a  numpy-1.23.5.tar.gz
+# Copied from https://github.com/numpy/numpy/releases/tag/v1.25.0
+sha256  f1accae9a28dc3cda46a91de86acf69de0d1b5f4edd44a9b0c3ceb8036dfff19  numpy-1.25.0.tar.gz
 # License files, locally calculated
-sha256  0f88787955e7131224f53a8c3f3e859dc502408e3a539a4dcf61fb7888b5b984  LICENSE.txt
+sha256  1034d3bd61783f3b5e7ec3e7ca818f4da4135132323a0ef99f4c0edb3c7f6bd2  LICENSE.txt
 sha256  c27d0a8026bdb8876562b720ab24d1688e3827a89f6083cd6e7e8caa9584aba3  numpy/core/src/multiarray/dragon4.c
 sha256  fbc539f47d0cf83bc61378080fb873d5c14630126cacbfe754035c3926daa5ec  numpy/core/include/numpy/libdivide/LICENSE.txt
 sha256  a14cc25e10d40a3aa705b7de2fb764a6535d8ee9b2db4e1724900585457dfd55  numpy/linalg/lapack_lite/LICENSE.txt
diff --git a/package/python-numpy/python-numpy.mk b/package/python-numpy/python-numpy.mk
index 812bfdae4a..b52e0da17d 100644
--- a/package/python-numpy/python-numpy.mk
+++ b/package/python-numpy/python-numpy.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_NUMPY_VERSION = 1.23.5
+PYTHON_NUMPY_VERSION = 1.25.0
 PYTHON_NUMPY_SOURCE = numpy-$(PYTHON_NUMPY_VERSION).tar.gz
 PYTHON_NUMPY_SITE = https://github.com/numpy/numpy/releases/download/v$(PYTHON_NUMPY_VERSION)
 PYTHON_NUMPY_LICENSE = BSD-3-Clause, MIT, Zlib
@@ -15,30 +15,27 @@ PYTHON_NUMPY_LICENSE_FILES = \
 	numpy/linalg/lapack_lite/LICENSE.txt \
 	tools/npy_tempita/license.txt
 
-PYTHON_NUMPY_SETUP_TYPE = setuptools
-PYTHON_NUMPY_DEPENDENCIES = host-python-cython
+PYTHON_NUMPY_DEPENDENCIES = host-python-cython python3
 HOST_PYTHON_NUMPY_DEPENDENCIES = host-python-cython
 
+PYTHON_NUMPY_CONF_ENV += \
+	_PYTHON_SYSCONFIGDATA_NAME=$(PKG_PYTHON_SYSCONFIGDATA_NAME) \
+	PYTHONPATH=$(PYTHON3_PATH)
+
 ifeq ($(BR2_PACKAGE_LAPACK),y)
 PYTHON_NUMPY_DEPENDENCIES += lapack
+PYTHON_NUMPY_CONF_OPTS += -Dlapack=lapack
 else
-PYTHON_NUMPY_ENV += BLAS=None LAPACK=None
+PYTHON_NUMPY_CONF_OPTS += -Dlapack=""
 endif
 
-ifeq ($(BR2_TOOLCHAIN_HAS_FORTRAN),y)
-PYTHON_NUMPY_BUILD_OPTS = --fcompiler=gnu95
-PYTHON_NUMPY_ENV += F90=$(TARGET_FC)
+ifeq ($(BR2_PACKAGE_OPENBLAS),y)
+PYTHON_NUMPY_DEPENDENCIES += openblas
+PYTHON_NUMPY_CONF_OPTS += -Dblas=openblas
 else
-PYTHON_NUMPY_BUILD_OPTS = --fcompiler=None
+PYTHON_NUMPY_CONF_OPTS += -Dblas=""
 endif
 
-define PYTHON_NUMPY_CONFIGURE_CMDS
-	-rm -f $(@D)/site.cfg
-	echo "[DEFAULT]" >> $(@D)/site.cfg
-	echo "library_dirs = $(STAGING_DIR)/usr/lib" >> $(@D)/site.cfg
-	echo "include_dirs = $(STAGING_DIR)/usr/include" >> $(@D)/site.cfg
-endef
-
 # Fixup the npymath.ini prefix path with actual target staging area where
 # numpy core was built. Without this, target builds using numpy distutils
 # extensions like python-scipy, python-numba cannot find -lnpymath since
@@ -55,5 +52,5 @@ PYTHON_NUMPY_POST_INSTALL_STAGING_HOOKS += PYTHON_NUMPY_FIXUP_NPY_PKG_CONFIG_FIL
 # in the staging area.
 PYTHON_NUMPY_INSTALL_STAGING = YES
 
-$(eval $(python-package))
-$(eval $(host-python-package))
+$(eval $(meson-package))
+$(eval $(host-meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
