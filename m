Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A39A0CF9C64
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 10:35:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7734A816E3;
	Sun, 22 Sep 2024 10:35:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gXk9jiooPP9C; Sun, 22 Sep 2024 10:35:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2B65B81A5F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B65B81A5F;
	Sun, 22 Sep 2024 10:35:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1B43B1BF870
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 10:34:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A16E740339
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 10:34:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hy30li82QR1t for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 10:34:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9D2D440190
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9D2D440190
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 10:34:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 927E980FD8; Sun, 22 Sep 2024 10:34:41 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 22 Sep 2024 12:30:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d6118f9567364fd5e822daf6d10839e81d196ec5
X-Git-Newrev: 5f7099609ad5f5875597890cdb0d11b560981f60
X-Patchwork-Hint: ignore
Message-Id: <20240922103441.927E980FD8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-twisted: bump to version
 24.7.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=5f7099609ad5f5875597890cdb0d11b560981f60
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop no longer required python-pyhamcrest runtime dependency.

Drop no longer required python-pyasn1 runtime dependency.

Migrate from setuptools to hatchling build backend.

License hash changed due to year update:
https://github.com/twisted/twisted/commit/4ed1a5b8ad9aaa1e3c5adb13076a2d79ec4279f1

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-twisted/Config.in           |  2 --
 package/python-twisted/python-twisted.hash |  8 ++++----
 package/python-twisted/python-twisted.mk   | 13 ++++++++-----
 3 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/package/python-twisted/Config.in b/package/python-twisted/Config.in
index 1f3baf57e2..84786689b7 100644
--- a/package/python-twisted/Config.in
+++ b/package/python-twisted/Config.in
@@ -5,7 +5,6 @@ config BR2_PACKAGE_PYTHON_TWISTED
 	select BR2_PACKAGE_PYTHON_AUTOMAT # runtime
 	select BR2_PACKAGE_PYTHON_CONSTANTLY # runtime
 	select BR2_PACKAGE_PYTHON_HYPERLINK # runtime
-	select BR2_PACKAGE_PYTHON_PYHAMCREST # runtime
 	select BR2_PACKAGE_PYTHON_ZOPE_INTERFACE # runtime
 	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
 	help
@@ -35,7 +34,6 @@ config BR2_PACKAGE_PYTHON_TWISTED_CONCH
 	select BR2_PACKAGE_PYTHON_APPDIRS # runtime
 	select BR2_PACKAGE_PYTHON_BCRYPT # runtime
 	select BR2_PACKAGE_PYTHON_CRYPTOGRAPHY # runtime
-	select BR2_PACKAGE_PYTHON_PYASN1 # runtime
 
 config BR2_PACKAGE_PYTHON_TWISTED_SERIAL
 	bool "Serial support"
diff --git a/package/python-twisted/python-twisted.hash b/package/python-twisted/python-twisted.hash
index 36612ff5e7..a414058ca7 100644
--- a/package/python-twisted/python-twisted.hash
+++ b/package/python-twisted/python-twisted.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/twisted/json
-md5  c9a5dad0813512fabd9de502738c0bf8  Twisted-22.10.0.tar.gz
-sha256  32acbd40a94f5f46e7b42c109bfae2b302250945561783a8b7a059048f2d4d31  Twisted-22.10.0.tar.gz
-# Locally computed sha256
-sha256  686f6426a775450eb3afd00bc3a5c2621f305ddb9c8478ee9bf28a368ef2dece  LICENSE
+md5  f89c2542ea9cb39c5343472fdefb4a22  twisted-24.7.0.tar.gz
+sha256  5a60147f044187a127ec7da96d170d49bcce50c6fd36f594e60f4587eff4d394  twisted-24.7.0.tar.gz
+# Locally computed sha256 checksums
+sha256  78d059391dddba18a695c1998ac9dde68160a1df1635f34adcfb3ecba4564802  LICENSE
diff --git a/package/python-twisted/python-twisted.mk b/package/python-twisted/python-twisted.mk
index 398baed2a8..71d1b32df2 100644
--- a/package/python-twisted/python-twisted.mk
+++ b/package/python-twisted/python-twisted.mk
@@ -4,14 +4,17 @@
 #
 ################################################################################
 
-PYTHON_TWISTED_VERSION = 22.10.0
-PYTHON_TWISTED_SOURCE = Twisted-$(PYTHON_TWISTED_VERSION).tar.gz
-PYTHON_TWISTED_SITE = https://files.pythonhosted.org/packages/b2/ce/cbb56597127b1d51905b0cddcc3f314cc769769efc5e9a8a67f4617f7bca
-PYTHON_TWISTED_SETUP_TYPE = setuptools
+PYTHON_TWISTED_VERSION = 24.7.0
+PYTHON_TWISTED_SOURCE = twisted-$(PYTHON_TWISTED_VERSION).tar.gz
+PYTHON_TWISTED_SITE = https://files.pythonhosted.org/packages/8b/bf/f30eb89bcd14a21a36b4cd3d96658432d4c590af3c24bbe08ea77fa7bbbb
+PYTHON_TWISTED_SETUP_TYPE = pep517
 PYTHON_TWISTED_LICENSE = MIT
 PYTHON_TWISTED_LICENSE_FILES = LICENSE
 PYTHON_TWISTED_CPE_ID_VENDOR = twistedmatrix
 PYTHON_TWISTED_CPE_ID_PRODUCT = twisted
-PYTHON_TWISTED_DEPENDENCIES = python-incremental host-python-incremental
+PYTHON_TWISTED_DEPENDENCIES = \
+	host-python-hatchling \
+	host-python-hatch-fancy-pypi-readme \
+	host-python-incremental
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
