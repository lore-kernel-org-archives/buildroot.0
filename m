Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52C00C4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 22:23:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E4C6542140;
	Mon,  6 Nov 2023 22:23:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E4C6542140
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qNMGwsWHsCBC; Mon,  6 Nov 2023 22:23:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 118DB4209A;
	Mon,  6 Nov 2023 22:23:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 118DB4209A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 799241BF271
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 22:20:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9AB15418C7
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 22:20:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9AB15418C7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5zmPjzgzxJtj for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 22:20:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A96D1410B5
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 22:20:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A96D1410B5
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A771086B74; Mon,  6 Nov 2023 22:20:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 6 Nov 2023 23:15:37 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: aad42c93dccb7c258d8a2a3ab91dbad1d9c2e3f3
X-Git-Newrev: 8bd4d7ed63b31d5d90c5ab2d5ddec3da96623604
X-Patchwork-Hint: ignore
Message-Id: <20231106222017.A771086B74@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-git: bump to version 3.1.40
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

commit: https://git.buildroot.net/buildroot/commit/?id=8bd4d7ed63b31d5d90c5ab2d5ddec3da96623604
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop no longer required python-typing-extensions dependency.

Switch to pypi based source download.

License hash changed due to formatting tweaks:
https://github.com/gitpython-developers/GitPython/commit/e1af18377fd69f9c1007f8abf6ccb95b3c5a6558

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-git/Config.in       | 1 -
 package/python-git/python-git.hash | 8 +++++---
 package/python-git/python-git.mk   | 5 +++--
 3 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/package/python-git/Config.in b/package/python-git/Config.in
index 3c23f91c36..183b377c46 100644
--- a/package/python-git/Config.in
+++ b/package/python-git/Config.in
@@ -3,7 +3,6 @@ config BR2_PACKAGE_PYTHON_GIT
 	depends on BR2_USE_MMU # git
 	select BR2_PACKAGE_GIT # runtime
 	select BR2_PACKAGE_PYTHON_GITDB2 # runtime
-	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
 	help
 	  GitPython is a python library used to interact with git
 	  repositories, high-level like git-porcelain, or low-level
diff --git a/package/python-git/python-git.hash b/package/python-git/python-git.hash
index 0c8c764bf3..a979871796 100644
--- a/package/python-git/python-git.hash
+++ b/package/python-git/python-git.hash
@@ -1,3 +1,5 @@
-# locally computed hashes
-sha256  8282d0d1169a3a98546979bfae1524608670fadc4ca7636517aadd428e0cfbeb  python-git-3.1.24.tar.gz
-sha256  fd657ffc2cef63d25c78cab7808d414dd03a282e63893491fd11c32f98be67fb  LICENSE
+# md5, sha256 from https://pypi.org/pypi/gitpython/json
+md5  db4f2a27c8abc4a7e25504e3aeab4a84  GitPython-3.1.40.tar.gz
+sha256  22b126e9ffb671fdd0c129796343a02bf67bf2994b35449ffc9321aa755e18a4  GitPython-3.1.40.tar.gz
+# Locally computed sha256 checksums
+sha256  86fc94c321a9afbc11514713511bafded225f25100dcc0f7350e82bc231b8beb  LICENSE
diff --git a/package/python-git/python-git.mk b/package/python-git/python-git.mk
index 9b2771ca07..91d6b07ab1 100644
--- a/package/python-git/python-git.mk
+++ b/package/python-git/python-git.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GIT_VERSION = 3.1.24
-PYTHON_GIT_SITE = $(call github,gitpython-developers,GitPython,$(PYTHON_GIT_VERSION))
+PYTHON_GIT_VERSION = 3.1.40
+PYTHON_GIT_SOURCE = GitPython-$(PYTHON_GIT_VERSION).tar.gz
+PYTHON_GIT_SITE = https://files.pythonhosted.org/packages/0d/b2/37265877ae607a2cbf9a471f4581dbf5ed13a501b90cb4c773f9ccfff3ea
 PYTHON_GIT_LICENSE = BSD-3-Clause
 PYTHON_GIT_LICENSE_FILES = LICENSE
 PYTHON_GIT_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
