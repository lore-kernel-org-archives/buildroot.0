Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CED0C3ABCE
	for <buildroot@archiver.kernel.org>; Mon, 16 Sep 2024 10:02:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E632C61187;
	Mon, 16 Sep 2024 10:02:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mzHri8wKBLyY; Mon, 16 Sep 2024 10:02:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D7BC61198
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D7BC61198;
	Mon, 16 Sep 2024 10:02:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 767FA1BF397
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 10:01:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6442F403D5
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 10:01:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rFORarGi7RUu for <buildroot@lists.busybox.net>;
 Mon, 16 Sep 2024 10:01:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 246EB403DD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 246EB403DD
 for <buildroot@buildroot.org>; Mon, 16 Sep 2024 10:01:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1C7178266F; Mon, 16 Sep 2024 10:01:47 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 16 Sep 2024 11:54:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 20828475d1985367787f3c1d7326af89e1751b93
X-Git-Newrev: 860e746fc7aa90e798d29c0ebc11cc0f9b0b36a5
X-Patchwork-Hint: ignore
Message-Id: <20240916100147.1C7178266F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-matplotlib: bump to version
 3.9.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=860e746fc7aa90e798d29c0ebc11cc0f9b0b36a5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Migrate from setuptools to meson build system.

Add new python-fonttools runtime dependency.

Add new python-packaging runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-matplotlib/Config.in              |  2 ++
 package/python-matplotlib/python-matplotlib.hash |  4 ++--
 package/python-matplotlib/python-matplotlib.mk   | 20 ++++++++++----------
 package/python-matplotlib/setup.cfg              | 10 ----------
 4 files changed, 14 insertions(+), 22 deletions(-)

diff --git a/package/python-matplotlib/Config.in b/package/python-matplotlib/Config.in
index b3d84e2b43..13894004aa 100644
--- a/package/python-matplotlib/Config.in
+++ b/package/python-matplotlib/Config.in
@@ -13,8 +13,10 @@ config BR2_PACKAGE_PYTHON_MATPLOTLIB
 	select BR2_PACKAGE_PYTHON_PYBIND
 	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
 	select BR2_PACKAGE_PYTHON_DATEUTIL # runtime
+	select BR2_PACKAGE_PYTHON_FONTTOOLS # runtime
 	select BR2_PACKAGE_PYTHON_KIWISOLVER # runtime
 	select BR2_PACKAGE_PYTHON_NUMPY # runtime
+	select BR2_PACKAGE_PYTHON_PACKAGING # runtime
 	select BR2_PACKAGE_PYTHON_PILLOW # runtime
 	select BR2_PACKAGE_PYTHON_PYPARSING # runtime
 	select BR2_PACKAGE_PYTHON3_ZLIB # runtime
diff --git a/package/python-matplotlib/python-matplotlib.hash b/package/python-matplotlib/python-matplotlib.hash
index c2fb907e2c..2882997b8a 100644
--- a/package/python-matplotlib/python-matplotlib.hash
+++ b/package/python-matplotlib/python-matplotlib.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/matplotlib/json
-md5  72896b8c240903ebddc47be6451d813b  matplotlib-3.8.2.tar.gz
-sha256  01a978b871b881ee76017152f1f1a0cbf6bd5f7b8ff8c96df0df1bd57d8755a1  matplotlib-3.8.2.tar.gz
+md5  bb92dfd3c1e9c816100b91008be5e300  matplotlib-3.9.2.tar.gz
+sha256  96ab43906269ca64a6366934106fa01534454a69e471b7bf3d79083981aaab92  matplotlib-3.9.2.tar.gz
 # Locally computed sha256 checksums
 sha256  5a1a81ea301728c8bba2933da832c0cd62229daf20893a024ab3d53244468dbc  LICENSE/LICENSE
diff --git a/package/python-matplotlib/python-matplotlib.mk b/package/python-matplotlib/python-matplotlib.mk
index 5f5d53172e..7312d2b1ec 100644
--- a/package/python-matplotlib/python-matplotlib.mk
+++ b/package/python-matplotlib/python-matplotlib.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MATPLOTLIB_VERSION = 3.8.2
+PYTHON_MATPLOTLIB_VERSION = 3.9.2
 PYTHON_MATPLOTLIB_SOURCE = matplotlib-$(PYTHON_MATPLOTLIB_VERSION).tar.gz
-PYTHON_MATPLOTLIB_SITE = https://files.pythonhosted.org/packages/fb/ab/38a0e94cb01dacb50f06957c2bed1c83b8f9dac6618988a37b2487862944
+PYTHON_MATPLOTLIB_SITE = https://files.pythonhosted.org/packages/9e/d8/3d7f706c69e024d4287c1110d74f7dabac91d9843b99eadc90de9efc8869
 PYTHON_MATPLOTLIB_LICENSE = Python-2.0
 PYTHON_MATPLOTLIB_LICENSE_FILES = LICENSE/LICENSE
 PYTHON_MATPLOTLIB_DEPENDENCIES = \
@@ -19,16 +19,16 @@ PYTHON_MATPLOTLIB_DEPENDENCIES = \
 	python-cycler \
 	python-pybind \
 	qhull
-PYTHON_MATPLOTLIB_SETUP_TYPE = setuptools
-PYTHON_MATPLOTLIB_BUILD_OPTS = --skip-dependency-check
+PYTHON_MATPLOTLIB_CONF_OPTS = \
+	-Dmacosx=false \
+	-Dsystem-freetype=true \
+	-Dsystem-qhull=true
+PYTHON_MATPLOTLIB_CONF_ENV += \
+	_PYTHON_SYSCONFIGDATA_NAME=$(PKG_PYTHON_SYSCONFIGDATA_NAME) \
+	PYTHONPATH=$(PYTHON3_PATH)
 
 ifeq ($(BR2_PACKAGE_PYTHON_MATPLOTLIB_QT),y)
 PYTHON_MATPLOTLIB_DEPENDENCIES += python-pyqt5
 endif
 
-define PYTHON_MATPLOTLIB_COPY_SETUP_CFG
-	cp $(PYTHON_MATPLOTLIB_PKGDIR)/setup.cfg $(@D)/mplsetup.cfg
-endef
-PYTHON_MATPLOTLIB_PRE_CONFIGURE_HOOKS += PYTHON_MATPLOTLIB_COPY_SETUP_CFG
-
-$(eval $(python-package))
+$(eval $(meson-package))
diff --git a/package/python-matplotlib/setup.cfg b/package/python-matplotlib/setup.cfg
deleted file mode 100644
index 4bda0d4376..0000000000
--- a/package/python-matplotlib/setup.cfg
+++ /dev/null
@@ -1,10 +0,0 @@
-[libs]
-# Disable LTO to prevent the following error:
-# Relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `_ZSt3hexRSt8ios_base'
-# which may bind externally can not be used when making a shared object;
-# recompile with -fPIC
-enable_lto = False
-
-# Freetype and qhull are provided by Buildroot
-system_freetype = True
-system_qhull = True
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
