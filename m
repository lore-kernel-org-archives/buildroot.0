Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A846C3DA6E
	for <buildroot@archiver.kernel.org>; Wed, 20 Dec 2023 20:59:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0EA0043761;
	Wed, 20 Dec 2023 20:59:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0EA0043761
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NtEuoTXResp8; Wed, 20 Dec 2023 20:59:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C1B72436E6;
	Wed, 20 Dec 2023 20:59:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C1B72436E6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0D3BE1BF365
 for <buildroot@lists.busybox.net>; Wed, 20 Dec 2023 20:58:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D947A61048
 for <buildroot@lists.busybox.net>; Wed, 20 Dec 2023 20:58:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D947A61048
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2jKNlrNQq36k for <buildroot@lists.busybox.net>;
 Wed, 20 Dec 2023 20:58:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EBE8D61546
 for <buildroot@buildroot.org>; Wed, 20 Dec 2023 20:58:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EBE8D61546
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D91C287C94; Wed, 20 Dec 2023 20:58:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 20 Dec 2023 21:56:06 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1e7f0794bbb0075285dc3b4dab8484f12adbb886
X-Git-Newrev: 2b6c5314867ebf2f5e1370cacbfe139763bf30ec
X-Patchwork-Hint: ignore
Message-Id: <20231220205825.D91C287C94@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-matplotlib: bump to version
 3.8.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=2b6c5314867ebf2f5e1370cacbfe139763bf30ec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add new python-contourpy runtime dependency.

Add new python-pybind dependency.

Add new host-python-setuptools-scm build dependency.

Update setup.cfg to new mplsetup.cfg install location.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-matplotlib/Config.in              | 2 ++
 package/python-matplotlib/python-matplotlib.hash | 5 +++--
 package/python-matplotlib/python-matplotlib.mk   | 8 +++++---
 3 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/package/python-matplotlib/Config.in b/package/python-matplotlib/Config.in
index cc0d830f4f..b3d84e2b43 100644
--- a/package/python-matplotlib/Config.in
+++ b/package/python-matplotlib/Config.in
@@ -8,7 +8,9 @@ config BR2_PACKAGE_PYTHON_MATPLOTLIB
 	select BR2_PACKAGE_FREETYPE # runtime
 	select BR2_PACKAGE_LIBPNG # runtime
 	select BR2_PACKAGE_PYTHON_CERTIFI # runtime
+	select BR2_PACKAGE_PYTHON_CONTOURPY # runtime
 	select BR2_PACKAGE_PYTHON_CYCLER
+	select BR2_PACKAGE_PYTHON_PYBIND
 	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
 	select BR2_PACKAGE_PYTHON_DATEUTIL # runtime
 	select BR2_PACKAGE_PYTHON_KIWISOLVER # runtime
diff --git a/package/python-matplotlib/python-matplotlib.hash b/package/python-matplotlib/python-matplotlib.hash
index 0d7117811c..c2fb907e2c 100644
--- a/package/python-matplotlib/python-matplotlib.hash
+++ b/package/python-matplotlib/python-matplotlib.hash
@@ -1,4 +1,5 @@
-# sha256 from https://pypi.org/project/matplotlib/#files
-sha256  fc4f526dfdb31c9bd6b8ca06bf9fab663ca12f3ec9cdf4496fb44bc680140318  matplotlib-3.4.3.tar.gz
+# md5, sha256 from https://pypi.org/pypi/matplotlib/json
+md5  72896b8c240903ebddc47be6451d813b  matplotlib-3.8.2.tar.gz
+sha256  01a978b871b881ee76017152f1f1a0cbf6bd5f7b8ff8c96df0df1bd57d8755a1  matplotlib-3.8.2.tar.gz
 # Locally computed sha256 checksums
 sha256  5a1a81ea301728c8bba2933da832c0cd62229daf20893a024ab3d53244468dbc  LICENSE/LICENSE
diff --git a/package/python-matplotlib/python-matplotlib.mk b/package/python-matplotlib/python-matplotlib.mk
index 650aac9bd9..4fd2b5f432 100644
--- a/package/python-matplotlib/python-matplotlib.mk
+++ b/package/python-matplotlib/python-matplotlib.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MATPLOTLIB_VERSION = 3.4.3
+PYTHON_MATPLOTLIB_VERSION = 3.8.2
 PYTHON_MATPLOTLIB_SOURCE = matplotlib-$(PYTHON_MATPLOTLIB_VERSION).tar.gz
-PYTHON_MATPLOTLIB_SITE = https://files.pythonhosted.org/packages/21/37/197e68df384ff694f78d687a49ad39f96c67b8d75718bc61503e1676b617
+PYTHON_MATPLOTLIB_SITE = https://files.pythonhosted.org/packages/fb/ab/38a0e94cb01dacb50f06957c2bed1c83b8f9dac6618988a37b2487862944
 PYTHON_MATPLOTLIB_LICENSE = Python-2.0
 PYTHON_MATPLOTLIB_LICENSE_FILES = LICENSE/LICENSE
 PYTHON_MATPLOTLIB_DEPENDENCIES = \
@@ -14,8 +14,10 @@ PYTHON_MATPLOTLIB_DEPENDENCIES = \
 	host-pkgconf \
 	host-python-certifi \
 	host-python-numpy \
+	host-python-setuptools-scm \
 	libpng \
 	python-cycler \
+	python-pybind \
 	qhull
 PYTHON_MATPLOTLIB_SETUP_TYPE = setuptools
 
@@ -24,7 +26,7 @@ PYTHON_MATPLOTLIB_DEPENDENCIES += python-pyqt5
 endif
 
 define PYTHON_MATPLOTLIB_COPY_SETUP_CFG
-	cp $(PYTHON_MATPLOTLIB_PKGDIR)/setup.cfg $(@D)/setup.cfg
+	cp $(PYTHON_MATPLOTLIB_PKGDIR)/setup.cfg $(@D)/mplsetup.cfg
 endef
 PYTHON_MATPLOTLIB_PRE_CONFIGURE_HOOKS += PYTHON_MATPLOTLIB_COPY_SETUP_CFG
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
