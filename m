Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E17C6C433EF
	for <buildroot@archiver.kernel.org>; Mon, 24 Jan 2022 11:17:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8813D410A6;
	Mon, 24 Jan 2022 11:17:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qaOwgCJF4-Pl; Mon, 24 Jan 2022 11:17:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A3BC5409E3;
	Mon, 24 Jan 2022 11:17:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5B6691BF215
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 11:17:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 49B7181902
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 11:17:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NY3VNvbNWlmv for <buildroot@lists.busybox.net>;
 Mon, 24 Jan 2022 11:17:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 263BF818CD
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 11:17:29 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id z199so4517846iof.10
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 03:17:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rRoO5dxHm80YT37gyMFnLKXCfkMjoIB/upFmXDkd5O4=;
 b=MgV+PeIJTz2cwEsH8K//Zyo+n3INW/dUJCf8Y+1d4DuY1jlZAvD7Nia7/2KNeXUSEn
 Ze+OO/L2uvHGfTDpOiphDvbvfVWDYPtbZ5fDA/6JOZJ746rEWCVu2t5xPbqve2UznBbk
 tnxbIkv0nIi3WpA1+6KOcc3nT42nzg9c914wLO8IG3c3v+NB7DPUnLIeIfS9YMSqBiZ1
 C39b0u+NMqzqg9Bv94MTEUI2CoBxDrOFZn3kHI8PqJ1SOscK4QmOgHtj9WWDLtbxgmby
 m/o2r/IIRQgPDPkGow5ysn7Rqo/4TiDXE4dVJmLfMMKkd+LV1kWBKWTk/nKCdHcHBTzi
 Rpbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rRoO5dxHm80YT37gyMFnLKXCfkMjoIB/upFmXDkd5O4=;
 b=NKpKqJn5tjZQ1Glh46dRTQz6D217dCpxL9rs73dhWjvA4c2dUzD82yuZPyvDq1IxN/
 li+Q3A9X9nAM6AYFCDny+pnXuElVeoOHYKdZe4DVE5jvSEMNfZNCGCBcoqhpbC7R+mCc
 C8tqkr/siPINLxGShkEJarJmWyYDz6O9mxer9Gvzx1kou9jxFp/MlgYHusiyKFVtxsz9
 sdwOPoT1gZLSeDYdy1ezFnnNvUMHXqgo96fqz2H7tAi5waJvQgo3n2fIqB/b0CAw+QZ7
 YhHzNJOFk/hUmfOGQ9U1A+XVWYoTG8CITkWaeOX3cE7fqKazlGGnuct5EOwoXQuk3IWE
 Wxlw==
X-Gm-Message-State: AOAM533YHKdDbDCufvFD4aVW+yc1xE3trZ0Z8VPyJspBg1K0tbz1yDm8
 y2Lvngy4GL0aEOqfe0AAxY5QtYldr1A=
X-Google-Smtp-Source: ABdhPJykRADfM5Hzorx2Fam23VgXe1u4auhaP2nF3fhUWGEF/6HNVP69okVHPYoG4YRBrrNuAP9g4g==
X-Received: by 2002:a6b:d80a:: with SMTP id y10mr7811352iob.181.1643023048057; 
 Mon, 24 Jan 2022 03:17:28 -0800 (PST)
Received: from james-x399.localdomain (97-118-239-242.hlrn.qwest.net.
 [97.118.239.242])
 by smtp.gmail.com with ESMTPSA id o11sm7644009ilu.36.2022.01.24.03.17.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 03:17:27 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 24 Jan 2022 04:17:25 -0700
Message-Id: <20220124111725.544497-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-pyyaml: bump to version 6.0
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
Cc: Geoffrey Ragot <geoffreyragot@gmail.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Asaf Kahlon <asafka7@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop python2 support and propagate dependency changes.

Ensure optimized cython build is enabled and add host cython
dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/libcamera/libcamera.mk             |  2 +-
 package/mongodb/mongodb.mk                 |  2 +-
 package/python-pyyaml/Config.in            |  1 +
 package/python-pyyaml/python-pyyaml.hash   |  4 ++--
 package/python-pyyaml/python-pyyaml.mk     |  9 +++++----
 package/python3-pyyaml/python3-pyyaml.hash |  1 -
 package/python3-pyyaml/python3-pyyaml.mk   | 20 --------------------
 7 files changed, 10 insertions(+), 29 deletions(-)
 delete mode 120000 package/python3-pyyaml/python3-pyyaml.hash
 delete mode 100644 package/python3-pyyaml/python3-pyyaml.mk

diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
index 0052ca558a..524cf07e03 100644
--- a/package/libcamera/libcamera.mk
+++ b/package/libcamera/libcamera.mk
@@ -12,7 +12,7 @@ LIBCAMERA_DEPENDENCIES = \
 	host-pkgconf \
 	host-python-jinja2 \
 	host-python3-ply \
-	host-python3-pyyaml \
+	host-python-pyyaml \
 	gnutls
 LIBCAMERA_CONF_OPTS = \
 	-Dandroid=disabled \
diff --git a/package/mongodb/mongodb.mk b/package/mongodb/mongodb.mk
index c33c3c2eb7..92656dd7a4 100644
--- a/package/mongodb/mongodb.mk
+++ b/package/mongodb/mongodb.mk
@@ -18,7 +18,7 @@ MONGODB_DEPENDENCIES = \
 	boost \
 	host-python3-cheetah \
 	host-python3-psutil \
-	host-python3-pyyaml \
+	host-python-pyyaml \
 	host-python3-regex \
 	host-python-requests \
 	host-scons \
diff --git a/package/python-pyyaml/Config.in b/package/python-pyyaml/Config.in
index 45e818b7e7..eb073b9c03 100644
--- a/package/python-pyyaml/Config.in
+++ b/package/python-pyyaml/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_PYYAML
 	bool "python-pyyaml"
+	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_LIBYAML
 	help
 	  The PyYAML package contains binding to the libyaml API.
diff --git a/package/python-pyyaml/python-pyyaml.hash b/package/python-pyyaml/python-pyyaml.hash
index 82b2f4f880..f8b5332565 100644
--- a/package/python-pyyaml/python-pyyaml.hash
+++ b/package/python-pyyaml/python-pyyaml.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/PyYAML/json
-md5  46e25294c7efec23d4072ed6a7777f46  PyYAML-5.4.1.tar.gz
-sha256  607774cbba28732bfa802b54baa7484215f530991055bb562efbed5b2f20a45e  PyYAML-5.4.1.tar.gz
+md5  1d19c798f25e58e3e582f0f8c977dbb8  PyYAML-6.0.tar.gz
+sha256  68fb519c14306fec9720a2a5b45bc9f0c8d1b9c72adf45c37baedfcd949c35a2  PyYAML-6.0.tar.gz
 # Locally computed sha256 checksums
 sha256  8d3928f9dc4490fd635707cb88eb26bd764102a7282954307d3e5167a577e8a4  LICENSE
diff --git a/package/python-pyyaml/python-pyyaml.mk b/package/python-pyyaml/python-pyyaml.mk
index c9013de8ec..8f5a2d269e 100644
--- a/package/python-pyyaml/python-pyyaml.mk
+++ b/package/python-pyyaml/python-pyyaml.mk
@@ -4,17 +4,18 @@
 #
 ################################################################################
 
-# Please keep in sync package/python3-pyyaml/python3-pyyaml.mk
-PYTHON_PYYAML_VERSION = 5.4.1
+PYTHON_PYYAML_VERSION = 6.0
 PYTHON_PYYAML_SOURCE = PyYAML-$(PYTHON_PYYAML_VERSION).tar.gz
-PYTHON_PYYAML_SITE = https://files.pythonhosted.org/packages/a0/a4/d63f2d7597e1a4b55aa3b4d6c5b029991d3b824b5bd331af8d4ab1ed687d
+PYTHON_PYYAML_SITE = https://files.pythonhosted.org/packages/36/2b/61d51a2c4f25ef062ae3f74576b01638bebad5e045f747ff12643df63844
 PYTHON_PYYAML_SETUP_TYPE = setuptools
 PYTHON_PYYAML_LICENSE = MIT
 PYTHON_PYYAML_LICENSE_FILES = LICENSE
 PYTHON_PYYAML_CPE_ID_VENDOR = pyyaml
 PYTHON_PYYAML_CPE_ID_PRODUCT = pyyaml
-PYTHON_PYYAML_DEPENDENCIES = libyaml
+PYTHON_PYYAML_DEPENDENCIES = host-python-cython libyaml
+PYTHON_PYYAML_ENV = PYYAML_FORCE_CYTHON=1
 HOST_PYTHON_PYYAML_DEPENDENCIES = host-libyaml
+HOST_PYTHON_PYYAML_NEEDS_HOST_PYTHON = python3
 
 $(eval $(python-package))
 $(eval $(host-python-package))
diff --git a/package/python3-pyyaml/python3-pyyaml.hash b/package/python3-pyyaml/python3-pyyaml.hash
deleted file mode 120000
index afa4932ecb..0000000000
--- a/package/python3-pyyaml/python3-pyyaml.hash
+++ /dev/null
@@ -1 +0,0 @@
-../python-pyyaml/python-pyyaml.hash
\ No newline at end of file
diff --git a/package/python3-pyyaml/python3-pyyaml.mk b/package/python3-pyyaml/python3-pyyaml.mk
deleted file mode 100644
index f758341502..0000000000
--- a/package/python3-pyyaml/python3-pyyaml.mk
+++ /dev/null
@@ -1,20 +0,0 @@
-################################################################################
-#
-# python3-pyyaml
-#
-################################################################################
-
-# Please keep in sync with package/python-pyyaml/python-pyyaml.mk
-PYTHON3_PYYAML_VERSION = 5.4.1
-PYTHON3_PYYAML_SOURCE = PyYAML-$(PYTHON3_PYYAML_VERSION).tar.gz
-PYTHON3_PYYAML_SITE = https://files.pythonhosted.org/packages/a0/a4/d63f2d7597e1a4b55aa3b4d6c5b029991d3b824b5bd331af8d4ab1ed687d
-PYTHON3_PYYAML_SETUP_TYPE = setuptools
-PYTHON3_PYYAML_LICENSE = MIT
-PYTHON3_PYYAML_LICENSE_FILES = LICENSE
-PYTHON3_PYYAML_CPE_ID_VENDOR = pyyaml
-PYTHON3_PYYAML_CPE_ID_PRODUCT = pyyaml
-HOST_PYTHON3_PYYAML_DL_SUBDIR = python-pyyaml
-HOST_PYTHON3_PYYAML_NEEDS_HOST_PYTHON = python3
-HOST_PYTHON3_PYYAML_DEPENDENCIES = host-libyaml
-
-$(eval $(host-python-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
