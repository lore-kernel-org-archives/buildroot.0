Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35434E7718D
	for <buildroot@archiver.kernel.org>; Sun, 22 Dec 2024 13:57:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EEF4760A50;
	Sun, 22 Dec 2024 13:57:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dbvN1GJAqOCM; Sun, 22 Dec 2024 13:57:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC5F660A9E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC5F660A9E;
	Sun, 22 Dec 2024 13:57:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 460BBD3
 for <buildroot@buildroot.org>; Sun, 22 Dec 2024 13:56:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 524E3608F6
 for <buildroot@buildroot.org>; Sun, 22 Dec 2024 13:56:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c98LTYjV8jIQ for <buildroot@buildroot.org>;
 Sun, 22 Dec 2024 13:56:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4BFA0608F2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4BFA0608F2
 for <buildroot@buildroot.org>; Sun, 22 Dec 2024 13:56:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 44A8A87392; Sun, 22 Dec 2024 13:56:51 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 22 Dec 2024 13:57:37 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b005eb5bb5907a1010441d653e2ea3ec13ce3a92
X-Git-Newrev: fb99040495eabc8b797076435501e5e4e07cf3a9
X-Patchwork-Hint: ignore
Message-Id: <20241222135651.44A8A87392@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-aerich: bump to version
 0.8.0
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=fb99040495eabc8b797076435501e5e4e07cf3a9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patch which is now upstream.

Replace python-click with python-asyncclick runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...ry-build-backend-to-support-editable-inst.patch | 29 ----------------------
 package/python-aerich/Config.in                    |  2 +-
 package/python-aerich/python-aerich.hash           |  4 +--
 package/python-aerich/python-aerich.mk             |  4 +--
 4 files changed, 5 insertions(+), 34 deletions(-)

diff --git a/package/python-aerich/0001-update-poetry-build-backend-to-support-editable-inst.patch b/package/python-aerich/0001-update-poetry-build-backend-to-support-editable-inst.patch
deleted file mode 100644
index 67d7c45bfb..0000000000
--- a/package/python-aerich/0001-update-poetry-build-backend-to-support-editable-inst.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From e729bb9b602ba74dea7ccc978dac709283a0934a Mon Sep 17 00:00:00 2001
-From: strayge <strayge@gmail.com>
-Date: Fri, 18 Aug 2023 15:03:38 +0400
-Subject: [PATCH] update poetry build-backend to support editable install
-
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
-Upstream: https://github.com/tortoise/aerich/commit/e729bb9b602ba74dea7ccc978dac709283a0934a
----
- pyproject.toml | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/pyproject.toml b/pyproject.toml
-index b9390e1..7673d70 100644
---- a/pyproject.toml
-+++ b/pyproject.toml
-@@ -45,8 +45,8 @@ location = "./migrations"
- src_folder = "./."
- 
- [build-system]
--requires = ["poetry>=0.12"]
--build-backend = "poetry.masonry.api"
-+requires = ["poetry-core>=1.0.0"]
-+build-backend = "poetry.core.masonry.api"
- 
- [tool.poetry.scripts]
- aerich = "aerich.cli:main"
--- 
-2.34.1
-
diff --git a/package/python-aerich/Config.in b/package/python-aerich/Config.in
index 3aa39e176d..39c0a50aa1 100644
--- a/package/python-aerich/Config.in
+++ b/package/python-aerich/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_PYTHON_AERICH
 	bool "python-aerich"
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-pydantic -> python-pydantic-core
-	select BR2_PACKAGE_PYTHON_CLICK # runtime
+	select BR2_PACKAGE_PYTHON_ASYNCCLICK # runtime
 	select BR2_PACKAGE_PYTHON_DICTDIFFER # runtime
 	select BR2_PACKAGE_PYTHON_PYDANTIC # runtime
 	select BR2_PACKAGE_PYTHON_TOMLKIT # runtime
diff --git a/package/python-aerich/python-aerich.hash b/package/python-aerich/python-aerich.hash
index c104c3d58e..ba1ea35997 100644
--- a/package/python-aerich/python-aerich.hash
+++ b/package/python-aerich/python-aerich.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aerich/json
-md5  26a99a2c6c604a370b228b74e12c7981  aerich-0.7.2.tar.gz
-sha256  31d67de7b96184636b89de99062e059e5e6204b6251d24c33eb21fc9cf982e09  aerich-0.7.2.tar.gz
+md5  22db080bf0e608344dbd837ff29ee2e8  aerich-0.8.0.tar.gz
+sha256  13786a91469626c025a2e2c5e524cac2b82b900de063b317f402710ee4c11ccb  aerich-0.8.0.tar.gz
 # Locally computed sha256 checksums
 sha256  4cc00f0e33ac8e089b37d8a1474be441b26311bdc16fe035c75b51201515f617  LICENSE
diff --git a/package/python-aerich/python-aerich.mk b/package/python-aerich/python-aerich.mk
index 6df3dc4f6e..ea4ee07697 100644
--- a/package/python-aerich/python-aerich.mk
+++ b/package/python-aerich/python-aerich.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AERICH_VERSION = 0.7.2
+PYTHON_AERICH_VERSION = 0.8.0
 PYTHON_AERICH_SOURCE = aerich-$(PYTHON_AERICH_VERSION).tar.gz
-PYTHON_AERICH_SITE = https://files.pythonhosted.org/packages/ca/cd/ae9c60ffc21e2d41e22c62cbf24a60dfad937222d880489703842d179746
+PYTHON_AERICH_SITE = https://files.pythonhosted.org/packages/35/a5/fc8f6e70cedf47757c4738ed6f79420b9cca6ed1655daf527f86e73f3159
 PYTHON_AERICH_SETUP_TYPE = poetry
 PYTHON_AERICH_LICENSE = Apache-2.0
 PYTHON_AERICH_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
