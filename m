Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3745FC47073
	for <buildroot@archiver.kernel.org>; Thu,  4 Jan 2024 22:04:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CBDF96F4BE;
	Thu,  4 Jan 2024 22:04:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CBDF96F4BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fFjZNW7XsP64; Thu,  4 Jan 2024 22:04:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 10C4561AED;
	Thu,  4 Jan 2024 22:04:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 10C4561AED
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 135C91BF355
 for <buildroot@lists.busybox.net>; Thu,  4 Jan 2024 22:04:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EC7E3834DB
 for <buildroot@lists.busybox.net>; Thu,  4 Jan 2024 22:04:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC7E3834DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hRVCWC2yHObo for <buildroot@lists.busybox.net>;
 Thu,  4 Jan 2024 22:04:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2CAEB8350A
 for <buildroot@buildroot.org>; Thu,  4 Jan 2024 22:04:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2CAEB8350A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 14E6983B96; Thu,  4 Jan 2024 22:04:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jan 2024 23:04:05 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f74609cf9678f4b5d63eafa235d3be365b0048da
X-Git-Newrev: 0f2f090892914e3b04ff217d1ea10cceafc70515
X-Patchwork-Hint: ignore
Message-Id: <20240104220418.14E6983B96@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-sqlalchemy: bump version to
 2.0.25
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
Content-Type: multipart/mixed; boundary="===============6108891919904498210=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6108891919904498210==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=0f2f090892914e3b04ff217d1ea10cceafc70515
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Hash of license file is changed due to:

-Copyright 2005-2022 SQLAlchemy authors and contributors <see AUTHORS file>.
+Copyright 2005-2024 SQLAlchemy authors and contributors <see AUTHORS file>.

Signed-off-by: Flávio Tapajós <flavio.tapajos@newtesc.com.br>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-sqlalchemy/Config.in              | 1 +
 package/python-sqlalchemy/python-sqlalchemy.hash | 6 +++---
 package/python-sqlalchemy/python-sqlalchemy.mk   | 4 ++--
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/python-sqlalchemy/Config.in b/package/python-sqlalchemy/Config.in
index f7ec3a6ad4..974393bb5c 100644
--- a/package/python-sqlalchemy/Config.in
+++ b/package/python-sqlalchemy/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_SQLALCHEMY
 	bool "python-sqlalchemy"
+	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
 	help
 	  SQLAlchemy is the Python SQL toolkit and Object Relational
 	  Mapper that gives application developers the full power and
diff --git a/package/python-sqlalchemy/python-sqlalchemy.hash b/package/python-sqlalchemy/python-sqlalchemy.hash
index 9f479d8f7b..7951a32978 100644
--- a/package/python-sqlalchemy/python-sqlalchemy.hash
+++ b/package/python-sqlalchemy/python-sqlalchemy.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/sqlalchemy/json
-md5  52318b83e8931c5f5a459f54fe4be3e8  SQLAlchemy-1.4.42.tar.gz
-sha256  177e41914c476ed1e1b77fd05966ea88c094053e17a85303c4ce007f88eff363  SQLAlchemy-1.4.42.tar.gz
+md5  7abfc2972d7e16315c8b7492ea0e0fdb  SQLAlchemy-2.0.25.tar.gz
+sha256  a2c69a7664fb2d54b8682dd774c3b54f67f84fa123cf84dda2a5f40dcaa04e08  SQLAlchemy-2.0.25.tar.gz
 # Locally computed sha256 checksums
-sha256  859ded25da34c1eb73e6e736df4c5f8ce3ed2ed5290663176f06e7720d9c9a20  LICENSE
+sha256  3c0f59ab887d041de6a4e52ffe3e9edb5d9522de909fae9a6cd7adb6e7be3293  LICENSE
diff --git a/package/python-sqlalchemy/python-sqlalchemy.mk b/package/python-sqlalchemy/python-sqlalchemy.mk
index a94b9eca92..400ad92f63 100644
--- a/package/python-sqlalchemy/python-sqlalchemy.mk
+++ b/package/python-sqlalchemy/python-sqlalchemy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SQLALCHEMY_VERSION = 1.4.42
+PYTHON_SQLALCHEMY_VERSION = 2.0.25
 PYTHON_SQLALCHEMY_SOURCE = SQLAlchemy-$(PYTHON_SQLALCHEMY_VERSION).tar.gz
-PYTHON_SQLALCHEMY_SITE = https://files.pythonhosted.org/packages/e4/56/8ea85eaab7d93b58f9c213ad8fc5882838189a29fc8cc401d80710a12969
+PYTHON_SQLALCHEMY_SITE = https://files.pythonhosted.org/packages/7b/bb/85bd8e211f54983e927c7cd9b2ad66773fbef507957156fc72e481a62681
 PYTHON_SQLALCHEMY_SETUP_TYPE = setuptools
 PYTHON_SQLALCHEMY_LICENSE = MIT
 PYTHON_SQLALCHEMY_LICENSE_FILES = LICENSE

--===============6108891919904498210==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6108891919904498210==--
