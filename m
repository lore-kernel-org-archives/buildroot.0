Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80DBFC3ABCE
	for <buildroot@archiver.kernel.org>; Mon, 16 Sep 2024 10:02:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C75560AA2;
	Mon, 16 Sep 2024 10:02:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rKnHt82R5vjo; Mon, 16 Sep 2024 10:02:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8DA0360AC0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8DA0360AC0;
	Mon, 16 Sep 2024 10:02:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7C9211BF397
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 10:01:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AE925403DE
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 10:01:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HPW8Wt3hm2Nu for <buildroot@lists.busybox.net>;
 Mon, 16 Sep 2024 10:01:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B331A403D1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B331A403D1
 for <buildroot@buildroot.org>; Mon, 16 Sep 2024 10:01:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E77B38377E; Mon, 16 Sep 2024 10:01:46 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 16 Sep 2024 11:54:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8ce8c362176328f1bc4bab7c2d9c30d36760460e
X-Git-Newrev: ee974c03f0e5d770136a1870b0e5b6956f328b83
X-Patchwork-Hint: ignore
Message-Id: <20240916100146.E77B38377E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-marshmallow-sqlalchemy:
 bump to version 1.1.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=ee974c03f0e5d770136a1870b0e5b6956f328b83
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Migrate from setuptools to flit build backend.

License hash changed due to year removal:
https://github.com/marshmallow-code/marshmallow-sqlalchemy/commit/26f4bed9e41c8d2bd03183e5960dfd3753a308df

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-marshmallow-sqlalchemy/Config.in                   | 1 -
 .../python-marshmallow-sqlalchemy.hash                            | 6 +++---
 .../python-marshmallow-sqlalchemy.mk                              | 8 ++++----
 3 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/package/python-marshmallow-sqlalchemy/Config.in b/package/python-marshmallow-sqlalchemy/Config.in
index f48d27edd6..f7f1975c72 100644
--- a/package/python-marshmallow-sqlalchemy/Config.in
+++ b/package/python-marshmallow-sqlalchemy/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_PYTHON_MARSHMALLOW_SQLALCHEMY
 	bool "python-marshmallow-sqlalchemy"
 	select BR2_PACKAGE_PYTHON_MARSHMALLOW # runtime
-	select BR2_PACKAGE_PYTHON_PACKAGING # runtime
 	select BR2_PACKAGE_PYTHON_SQLALCHEMY # runtime
 	help
 	  SQLAlchemy integration with the marshmallow
diff --git a/package/python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.hash b/package/python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.hash
index 3194513dfc..68892165f5 100644
--- a/package/python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.hash
+++ b/package/python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/marshmallow-sqlalchemy/json
-md5  61e46e0ad5fabd0e9e11f895e1243bc3  marshmallow-sqlalchemy-0.30.0.tar.gz
-sha256  29ad0a4fd1b4a1e52dcb07f9673d284a6b0795141916cc2169d4ee9a5d007347  marshmallow-sqlalchemy-0.30.0.tar.gz
+md5  1cdbefa0aa35a1205d7e3bb3674743bb  marshmallow_sqlalchemy-1.1.0.tar.gz
+sha256  2ab092da269dafa8a05d51a58409af71a8d2183958ba47143127dd239e0359d8  marshmallow_sqlalchemy-1.1.0.tar.gz
 # Locally computed sha256 checksums
-sha256  5f6cd082e01dda8a7c157687e196be98d68224cf41c0cee1968eb5c08e0c076a  LICENSE
+sha256  906b5d9051e426144cb173ad911667b8ebd05a9c584c2c26c135b32a3ed12001  LICENSE
diff --git a/package/python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.mk b/package/python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.mk
index a95e53022b..a334bec1f5 100644
--- a/package/python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.mk
+++ b/package/python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_MARSHMALLOW_SQLALCHEMY_VERSION = 0.30.0
-PYTHON_MARSHMALLOW_SQLALCHEMY_SOURCE = marshmallow-sqlalchemy-$(PYTHON_MARSHMALLOW_SQLALCHEMY_VERSION).tar.gz
-PYTHON_MARSHMALLOW_SQLALCHEMY_SITE = https://files.pythonhosted.org/packages/5d/3f/21aa202f3df31d2d20d4ae8dfe9c7f1ce0a1eecba7003915a986a7599778
-PYTHON_MARSHMALLOW_SQLALCHEMY_SETUP_TYPE = setuptools
+PYTHON_MARSHMALLOW_SQLALCHEMY_VERSION = 1.1.0
+PYTHON_MARSHMALLOW_SQLALCHEMY_SOURCE = marshmallow_sqlalchemy-$(PYTHON_MARSHMALLOW_SQLALCHEMY_VERSION).tar.gz
+PYTHON_MARSHMALLOW_SQLALCHEMY_SITE = https://files.pythonhosted.org/packages/82/f8/2e565045b17dd60b38aafc3242ac44f5403315df08963501d07463d089ac
+PYTHON_MARSHMALLOW_SQLALCHEMY_SETUP_TYPE = flit
 PYTHON_MARSHMALLOW_SQLALCHEMY_LICENSE = MIT
 PYTHON_MARSHMALLOW_SQLALCHEMY_LICENSE_FILES = LICENSE
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
