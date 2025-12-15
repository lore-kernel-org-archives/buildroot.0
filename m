Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15A8FD5B866
	for <buildroot@archiver.kernel.org>; Mon, 15 Dec 2025 21:10:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D4D8F40AD6;
	Mon, 15 Dec 2025 21:10:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7OcZhFI3g0bg; Mon, 15 Dec 2025 21:10:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 018B740AE1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765833011;
	bh=JcI6IwEMIeZ/VKBCW1zjiRhFvVXP3fMy7QqGaRrS9nc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ZpMgCWxff00P+QnHHeSauJXUqkyH470FERWviJ6o2GbAFA86P6Pp9WnQV+YqmCWu5
	 kq3EI0/IcgLfHq2dLIMkvPbm6bpiK+jKTKDPVDT226csUYdqHdNwjOkzoXfh3EwHX2
	 yQoZ2ytT9o3V1fb01a/76ILZcSrm1tuY0ojx2C5VvzV+j3tFXJVe4eLY0mYJcH59jN
	 bon8scwX8wuXtflutnjT4MlZY7or3t/J/JthAgzTPIbV5IepEuIEafDSAwOSdvSXfx
	 4myuvdatkqEsUFAWBUeAXO5ZhAcP4ueurREipmRfMZK4PHo+BzQYQ8xRJ6pt8krnwD
	 iMcP9wctsDTjw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 018B740AE1;
	Mon, 15 Dec 2025 21:10:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 53A10255
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 21:10:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 326B480F81
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 21:10:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sigixa1GbbHN for <buildroot@buildroot.org>;
 Mon, 15 Dec 2025 21:10:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C0F3580FAF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C0F3580FAF
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 21:10:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B437C86FB3; Mon, 15 Dec 2025 21:10:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 15 Dec 2025 20:48:44 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e1af66521756a93a737d4884559cb552b3dc2b4a
X-Git-Newrev: 2da3485d3c6bfc50a656a5a01d8289d82c2cd813
X-Patchwork-Hint: ignore
Message-Id: <20251215211000.B437C86FB3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-ml-dtypes: bump version to
 0.5.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=2da3485d3c6bfc50a656a5a01d8289d82c2cd813
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/jax-ml/ml_dtypes/blob/v0.5.4/CHANGELOG.md

Added runtime comment found by scanpypi.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-ml-dtypes/Config.in             | 2 +-
 package/python-ml-dtypes/python-ml-dtypes.hash | 6 +++---
 package/python-ml-dtypes/python-ml-dtypes.mk   | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-ml-dtypes/Config.in b/package/python-ml-dtypes/Config.in
index 7dce2fea42..a8b351d2e3 100644
--- a/package/python-ml-dtypes/Config.in
+++ b/package/python-ml-dtypes/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_PYTHON_ML_DTYPES
 	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # python-numpy
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_9 # python-numpy
 	depends on BR2_HOST_GCC_AT_LEAST_9 # host-python-numpy
-	select BR2_PACKAGE_PYTHON_NUMPY
+	select BR2_PACKAGE_PYTHON_NUMPY # runtime
 	help
 	  ml_dtypes is a stand-alone implementation of several NumPy
 	  dtype extensions used in machine learning libraries.
diff --git a/package/python-ml-dtypes/python-ml-dtypes.hash b/package/python-ml-dtypes/python-ml-dtypes.hash
index 9f81056cd0..2c5e3a0f75 100644
--- a/package/python-ml-dtypes/python-ml-dtypes.hash
+++ b/package/python-ml-dtypes/python-ml-dtypes.hash
@@ -1,5 +1,5 @@
-# md5, sha256 from https://pypi.org/pypi/ml_dtypes/json
-md5  410474c03a1754e6b5197a24040e3f3c  ml_dtypes-0.5.1.tar.gz
-sha256  ac5b58559bb84a95848ed6984eb8013249f90b6bab62aa5acbad876e256002c9  ml_dtypes-0.5.1.tar.gz
+# md5, sha256 from https://pypi.org/pypi/ml-dtypes/json
+md5  bfecfff98424dc51007956eb14ce500d  ml_dtypes-0.5.4.tar.gz
+sha256  8ab06a50fb9bf9666dd0fe5dfb4676fa2b0ac0f31ecff72a6c3af8e22c063453  ml_dtypes-0.5.4.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-ml-dtypes/python-ml-dtypes.mk b/package/python-ml-dtypes/python-ml-dtypes.mk
index ab50069696..e83131c993 100644
--- a/package/python-ml-dtypes/python-ml-dtypes.mk
+++ b/package/python-ml-dtypes/python-ml-dtypes.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ML_DTYPES_VERSION = 0.5.1
+PYTHON_ML_DTYPES_VERSION = 0.5.4
 PYTHON_ML_DTYPES_SOURCE = ml_dtypes-$(PYTHON_ML_DTYPES_VERSION).tar.gz
-PYTHON_ML_DTYPES_SITE = https://files.pythonhosted.org/packages/32/49/6e67c334872d2c114df3020e579f3718c333198f8312290e09ec0216703a
+PYTHON_ML_DTYPES_SITE = https://files.pythonhosted.org/packages/0e/4a/c27b42ed9b1c7d13d9ba8b6905dece787d6259152f2309338aed29b2447b
 PYTHON_ML_DTYPES_LICENSE = Apache-2.0
 PYTHON_ML_DTYPES_LICENSE_FILES = LICENSE
 PYTHON_ML_DTYPES_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
