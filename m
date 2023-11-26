Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1029AC4167B
	for <buildroot@archiver.kernel.org>; Mon,  4 Dec 2023 20:26:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BEE6E418E2;
	Mon,  4 Dec 2023 20:26:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BEE6E418E2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9WTi291_Da1T; Mon,  4 Dec 2023 20:26:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D3C0741827;
	Mon,  4 Dec 2023 20:26:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D3C0741827
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 27FBB1BF977
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 20:13:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DC39F41953
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 20:13:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DC39F41953
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1sSJJu4uxP69 for <buildroot@lists.busybox.net>;
 Mon,  4 Dec 2023 20:13:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8FFC540140
 for <buildroot@buildroot.org>; Mon,  4 Dec 2023 20:13:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8FFC540140
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 80735879B8; Mon,  4 Dec 2023 20:13:29 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 26 Nov 2023 18:09:39 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 92fcdbd3e23aa03326d203271d02595409452690
X-Git-Newrev: 05a259ed416d2bef1587a29d35fc117fa81183b2
X-Patchwork-Hint: ignore
Message-Id: <20231204201329.80735879B8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pydantic: bump to version
 2.5.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=05a259ed416d2bef1587a29d35fc117fa81183b2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add new python-annotated-types runtime dependency.

Add new python-pydantic-core runtime dependency.

Migrate build backend from setuptools to hatchling.

License hash changed due to adding contributors:
https://github.com/pydantic/pydantic/commit/7bc9c6525a81680c0dd9df3558ed5f33345a77c2

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-pydantic/Config.in            | 5 ++++-
 package/python-pydantic/python-pydantic.hash | 6 +++---
 package/python-pydantic/python-pydantic.mk   | 9 ++++++---
 3 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/package/python-pydantic/Config.in b/package/python-pydantic/Config.in
index 41ec43adf4..e9cd2e6780 100644
--- a/package/python-pydantic/Config.in
+++ b/package/python-pydantic/Config.in
@@ -1,8 +1,11 @@
 config BR2_PACKAGE_PYTHON_PYDANTIC
 	bool "python-pydantic"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-pydantic-core
+	select BR2_PACKAGE_PYTHON_ANNOTATED_TYPES # runtime
+	select BR2_PACKAGE_PYTHON_PYDANTIC_CORE # runtime
 	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
 	help
 	  Data validation and settings management using python 3.6
 	  type hinting.
 
-	  https://github.com/samuelcolvin/pydantic
+	  https://github.com/pydantic/pydantic
diff --git a/package/python-pydantic/python-pydantic.hash b/package/python-pydantic/python-pydantic.hash
index 88b17f4575..0848debc1c 100644
--- a/package/python-pydantic/python-pydantic.hash
+++ b/package/python-pydantic/python-pydantic.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pydantic/json
-md5  f0e286c32f40ec45aba9603742739cd6  pydantic-1.10.8.tar.gz
-sha256  1410275520dfa70effadf4c21811d755e7ef9bb1f1d077a21958153a92c8d9ca  pydantic-1.10.8.tar.gz
+md5  348281a5a27eb5253c7a83927aae64e1  pydantic-2.5.2.tar.gz
+sha256  ff177ba64c6faf73d7afa2e8cad38fd456c0dbe01c9954e71038001cd15a6edd  pydantic-2.5.2.tar.gz
 # Locally computed sha256 checksums
-sha256  9e3946690ac88b6b73e8f001a0586af13568be8852fd514e4393f39761764387  LICENSE
+sha256  a9e186f3ca16b5eef84318e7a701721351a00cb7b8ae3a4394b67b49e3529ef3  LICENSE
diff --git a/package/python-pydantic/python-pydantic.mk b/package/python-pydantic/python-pydantic.mk
index b800426d22..b5bb7ff853 100644
--- a/package/python-pydantic/python-pydantic.mk
+++ b/package/python-pydantic/python-pydantic.mk
@@ -4,11 +4,14 @@
 #
 ################################################################################
 
-PYTHON_PYDANTIC_VERSION = 1.10.8
+PYTHON_PYDANTIC_VERSION = 2.5.2
 PYTHON_PYDANTIC_SOURCE = pydantic-$(PYTHON_PYDANTIC_VERSION).tar.gz
-PYTHON_PYDANTIC_SITE = https://files.pythonhosted.org/packages/23/65/2aa13873e9e0084ecaec00fbe6c6096b65e1ab99ba66bdbf7e4e7c4cc915
-PYTHON_PYDANTIC_SETUP_TYPE = setuptools
+PYTHON_PYDANTIC_SITE = https://files.pythonhosted.org/packages/b7/41/3c8108f79fb7da2d2b17f35744232af4ffcd9e764ebe1e3fd4b26669b325
+PYTHON_PYDANTIC_SETUP_TYPE = pep517
 PYTHON_PYDANTIC_LICENSE = MIT
 PYTHON_PYDANTIC_LICENSE_FILES = LICENSE
+PYTHON_PYDANTIC_DEPENDENCIES = \
+	host-python-hatchling \
+	host-python-hatch-fancy-pypi-readme
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
