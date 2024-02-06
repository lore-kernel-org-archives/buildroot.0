Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF1A9C4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 17:16:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B20A381F7C;
	Tue,  6 Feb 2024 17:16:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ac5a6nBLXlBA; Tue,  6 Feb 2024 17:16:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B851C81F81
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B851C81F81;
	Tue,  6 Feb 2024 17:16:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5F6271BF3A1
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 17:16:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4CA3281F81
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 17:16:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LzU1S4GBcvNp for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 17:16:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6622F81F7C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6622F81F7C
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 17:16:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4F6D583A39; Tue,  6 Feb 2024 17:16:37 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 6 Feb 2024 18:15:25 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fbea83fc47046653778e0cf49863b2c4a3bac8e7
X-Git-Newrev: 06e1a3620e5268951be089d2b150c1802de7de4c
X-Patchwork-Hint: ignore
Message-Id: <20240206171637.4F6D583A39@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-ml-dtypes: bump to version
 0.3.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=06e1a3620e5268951be089d2b150c1802de7de4c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Migrate from distutils which is being deprecated to setuptools.

Drop python-pybind which is no longer required:
https://github.com/jax-ml/ml_dtypes/blob/v0.3.2/CHANGELOG.md#032---2024-01-03

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-ml-dtypes/Config.in             | 1 -
 package/python-ml-dtypes/python-ml-dtypes.hash | 4 ++--
 package/python-ml-dtypes/python-ml-dtypes.mk   | 9 ++++-----
 3 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/python-ml-dtypes/Config.in b/package/python-ml-dtypes/Config.in
index 72506896df..8791564b19 100644
--- a/package/python-ml-dtypes/Config.in
+++ b/package/python-ml-dtypes/Config.in
@@ -5,7 +5,6 @@ config BR2_PACKAGE_PYTHON_ML_DTYPES
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_9 # python-numpy
 	depends on BR2_HOST_GCC_AT_LEAST_9 # host-python-numpy
 	select BR2_PACKAGE_PYTHON_NUMPY
-	select BR2_PACKAGE_PYTHON_PYBIND
 	help
 	  ml_dtypes is a stand-alone implementation of several NumPy
 	  dtype extensions used in machine learning libraries.
diff --git a/package/python-ml-dtypes/python-ml-dtypes.hash b/package/python-ml-dtypes/python-ml-dtypes.hash
index a440268e39..53bfacb528 100644
--- a/package/python-ml-dtypes/python-ml-dtypes.hash
+++ b/package/python-ml-dtypes/python-ml-dtypes.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/ml_dtypes/json
-md5  6adbb05530819bdb4a78d2372d187fe2  ml_dtypes-0.3.1.tar.gz
-sha256  60778f99194b4c4f36ba42da200b35ef851ce4d4af698aaf70f5b91fe70fc611  ml_dtypes-0.3.1.tar.gz
+md5  438c04dc0d941ec1b3b71667225c74c8  ml_dtypes-0.3.2.tar.gz
+sha256  533059bc5f1764fac071ef54598db358c167c51a718f68f5bb55e3dee79d2967  ml_dtypes-0.3.2.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-ml-dtypes/python-ml-dtypes.mk b/package/python-ml-dtypes/python-ml-dtypes.mk
index 92d23bece4..676137ecf1 100644
--- a/package/python-ml-dtypes/python-ml-dtypes.mk
+++ b/package/python-ml-dtypes/python-ml-dtypes.mk
@@ -4,16 +4,15 @@
 #
 ################################################################################
 
-PYTHON_ML_DTYPES_VERSION = 0.3.1
+PYTHON_ML_DTYPES_VERSION = 0.3.2
 PYTHON_ML_DTYPES_SOURCE = ml_dtypes-$(PYTHON_ML_DTYPES_VERSION).tar.gz
-PYTHON_ML_DTYPES_SITE = https://files.pythonhosted.org/packages/16/6e/9a7a51ee1ca24b8e92109128260c5aec8340c8fe5572e9ceecddae559abe
+PYTHON_ML_DTYPES_SITE = https://files.pythonhosted.org/packages/39/7d/8d85fcba868758b3a546e6914e727abd8f29ea6918079f816975c9eecd63
 PYTHON_ML_DTYPES_LICENSE = Apache-2.0
 PYTHON_ML_DTYPES_LICENSE_FILES = LICENSE
-PYTHON_ML_DTYPES_SETUP_TYPE = distutils
+PYTHON_ML_DTYPES_SETUP_TYPE = setuptools
 
 PYTHON_ML_DTYPES_DEPENDENCIES = \
 	host-python-numpy \
-	python-numpy \
-	python-pybind
+	python-numpy
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
