Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA582C4332F
	for <buildroot@archiver.kernel.org>; Fri, 10 Nov 2023 21:07:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B3034288D;
	Fri, 10 Nov 2023 21:07:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B3034288D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5fe0DHdqPuGx; Fri, 10 Nov 2023 21:06:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B72A942888;
	Fri, 10 Nov 2023 21:06:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B72A942888
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3B7AD1BF41B
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 21:05:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E94356F6F7
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 21:05:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E94356F6F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l7djrCp8S3i8 for <buildroot@lists.busybox.net>;
 Fri, 10 Nov 2023 21:05:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3C9826F70A
 for <buildroot@buildroot.org>; Fri, 10 Nov 2023 21:05:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C9826F70A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3A2C886EB8; Fri, 10 Nov 2023 21:05:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 10 Nov 2023 22:01:50 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 554ecdf49a8eeb1e2e3b3ba02d9337344330ffc1
X-Git-Newrev: 37a1a194b1fea92ee1af36aecb254bbf6df7ad2c
X-Patchwork-Hint: ignore
Message-Id: <20231110210508.3A2C886EB8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-keyring: bump to version
 24.2.0
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=37a1a194b1fea92ee1af36aecb254bbf6df7ad2c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add new python-jaraco-classes runtime dependency.

Add new python-jeepney runtime dependency.

License hash changed due to copyright notice removal:
https://github.com/jaraco/keyring/commit/5957d58266e479f124b31f30e4322e798fdf386b

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/python-keyring/Config.in           | 2 ++
 package/python-keyring/python-keyring.hash | 6 +++---
 package/python-keyring/python-keyring.mk   | 4 ++--
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/python-keyring/Config.in b/package/python-keyring/Config.in
index 6b33686cbe..6c03317f61 100644
--- a/package/python-keyring/Config.in
+++ b/package/python-keyring/Config.in
@@ -3,6 +3,8 @@ config BR2_PACKAGE_PYTHON_KEYRING
 	# python-secretstorage -> python-cryptography
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 	select BR2_PACKAGE_PYTHON_ENTRYPOINTS # runtime
+	select BR2_PACKAGE_PYTHON_JARACO_CLASSES # runtime
+	select BR2_PACKAGE_PYTHON_JEEPNEY # runtime
 	select BR2_PACKAGE_PYTHON_SECRETSTORAGE # runtime
 	help
 	  The Python keyring lib provides a easy way to access the
diff --git a/package/python-keyring/python-keyring.hash b/package/python-keyring/python-keyring.hash
index 837743f5c2..50ac3df342 100644
--- a/package/python-keyring/python-keyring.hash
+++ b/package/python-keyring/python-keyring.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/keyring/json
-md5  a0640ab7525b4fe58061b5999cca5026  keyring-23.13.1.tar.gz
-sha256  ba2e15a9b35e21908d0aaf4e0a47acc52d6ae33444df0da2b49d41a46ef6d678  keyring-23.13.1.tar.gz
+md5  ed5df85d33c36bb268a79d4472a13312  keyring-24.2.0.tar.gz
+sha256  ca0746a19ec421219f4d713f848fa297a661a8a8c1504867e55bfb5e09091509  keyring-24.2.0.tar.gz
 # Locally computed sha256 checksums
-sha256  db3f0246b1f9278f15845b99fec478b8b506eb76487993722f8c6e254285faf8  LICENSE
+sha256  86da0f01aeae46348a3c3d465195dc1ceccde79f79e87769a64b8da04b2a4741  LICENSE
diff --git a/package/python-keyring/python-keyring.mk b/package/python-keyring/python-keyring.mk
index 766139f525..87b51a8960 100644
--- a/package/python-keyring/python-keyring.mk
+++ b/package/python-keyring/python-keyring.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_KEYRING_VERSION = 23.13.1
+PYTHON_KEYRING_VERSION = 24.2.0
 PYTHON_KEYRING_SOURCE = keyring-$(PYTHON_KEYRING_VERSION).tar.gz
-PYTHON_KEYRING_SITE = https://files.pythonhosted.org/packages/55/fe/282f4c205add8e8bb3a1635cbbac59d6def2e0891b145aa553a0e40dd2d0
+PYTHON_KEYRING_SITE = https://files.pythonhosted.org/packages/14/c5/7a2a66489c66ee29562300ddc5be63636f70b4025a74df71466e62d929b1
 PYTHON_KEYRING_SETUP_TYPE = setuptools
 PYTHON_KEYRING_LICENSE = MIT
 PYTHON_KEYRING_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
