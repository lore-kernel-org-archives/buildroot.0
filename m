Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A7E1C433F5
	for <buildroot@archiver.kernel.org>; Wed, 26 Jan 2022 21:56:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 49065417F2;
	Wed, 26 Jan 2022 21:56:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Bu8XH4iiwWwQ; Wed, 26 Jan 2022 21:56:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6BC86417EF;
	Wed, 26 Jan 2022 21:56:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CCF701BF4D6
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 21:56:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C9BE6417EF
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 21:56:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YJs96V2_8_RP for <buildroot@lists.busybox.net>;
 Wed, 26 Jan 2022 21:56:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 009484168C
 for <buildroot@buildroot.org>; Wed, 26 Jan 2022 21:56:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 872A780FF9; Wed, 26 Jan 2022 21:49:36 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 26 Jan 2022 22:56:26 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 163509a8e0d558e6339c5489f072dfe805e0cc34
X-Git-Newrev: 2d893f870f7c0be22b340cd5fca5ae0661c20182
X-Patchwork-Hint: ignore
Message-Id: <20220126214936.872A780FF9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pyyaml: bump to version 6.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=2d893f870f7c0be22b340cd5fca5ae0661c20182
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop python2 support and propagate dependency changes.

Ensure optimized cython build is enabled and add host cython
dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libcamera/libcamera.mk             |  2 +-
 package/mongodb/mongodb.mk                 |  2 +-
 package/python-pyyaml/Config.in            |  1 +
 package/python-pyyaml/python-pyyaml.hash   |  4 ++--
 package/python-pyyaml/python-pyyaml.mk     |  9 +++++----
 package/python3-pyyaml/python3-pyyaml.hash |  1 -
 package/python3-pyyaml/python3-pyyaml.mk   | 20 --------------------
 7 files changed, 10 insertions(+), 29 deletions(-)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
