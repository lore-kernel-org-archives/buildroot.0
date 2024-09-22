Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BCBECF9C64
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 10:35:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D1F0813B8;
	Sun, 22 Sep 2024 10:35:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m0EdO0lsO6Rd; Sun, 22 Sep 2024 10:35:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CACD381468
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CACD381468;
	Sun, 22 Sep 2024 10:35:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8C05A1BF870
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 10:34:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8884E4063B
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 10:34:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N5wPWPoouThQ for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 10:34:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A4714062F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6A4714062F
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 10:34:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 641F881446; Sun, 22 Sep 2024 10:34:39 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 22 Sep 2024 11:37:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 71a92525c43edc715269226473a808365835019a
X-Git-Newrev: ce1c9bf64629a515ee02bdd047583d011c9f33fa
X-Patchwork-Hint: ignore
Message-Id: <20240922103440.641F881446@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-simplelogging: bump to
 version 0.12.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=ce1c9bf64629a515ee02bdd047583d011c9f33fa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patch which is now upstream.

License hash changed due to year update:
https://github.com/vpoulailleau/simplelogging/commit/f1e551b962f55afd547cc842e416a95b20c860d1

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../0001-Switch-build-backend-to-poetry-core.patch | 31 ----------------------
 .../python-simplelogging/python-simplelogging.hash |  6 ++---
 .../python-simplelogging/python-simplelogging.mk   |  4 +--
 3 files changed, 5 insertions(+), 36 deletions(-)

diff --git a/package/python-simplelogging/0001-Switch-build-backend-to-poetry-core.patch b/package/python-simplelogging/0001-Switch-build-backend-to-poetry-core.patch
deleted file mode 100644
index 2c345fe268..0000000000
--- a/package/python-simplelogging/0001-Switch-build-backend-to-poetry-core.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 76c1c545bad28f592405ca1e5bcf6081051c946a Mon Sep 17 00:00:00 2001
-From: James Hilliard <james.hilliard1@gmail.com>
-Date: Tue, 13 Feb 2024 13:37:00 -0700
-Subject: [PATCH] Switch build-backend to poetry-core
-
-poetry-core is the lightweight counterpart of poetry that is intended
-to be used as a build-backend. Unlike poetry, it does not require
-installing all the dependencies of the package manager, making
-the builds much faster. The generated artifacts are the same.
-
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
-Upstream: https://github.com/vpoulailleau/simplelogging/pull/230
----
- pyproject.toml | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/pyproject.toml b/pyproject.toml
-index a89ab64..79403cb 100644
---- a/pyproject.toml
-+++ b/pyproject.toml
-@@ -55,5 +55,5 @@ commands =
- """
- 
- [build-system]
--requires = ["poetry>=0.12"]
--build-backend = "poetry.masonry.api"
-+requires = ["poetry-core>=1.0.0"]
-+build-backend = "poetry.core.masonry.api"
--- 
-2.34.1
-
diff --git a/package/python-simplelogging/python-simplelogging.hash b/package/python-simplelogging/python-simplelogging.hash
index 6d80fb93ec..f080a3b123 100644
--- a/package/python-simplelogging/python-simplelogging.hash
+++ b/package/python-simplelogging/python-simplelogging.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/simplelogging/json
-md5  97b5f2a5cd9cff1b60c727cd03b3ffe1  simplelogging-0.11.0.tar.gz
-sha256  23a128b47d3e88213adc51fdd102aae15a398cf459d782eb19534945d23f0bc5  simplelogging-0.11.0.tar.gz
+md5  993862aca6fe6d0962effe07a335b554  simplelogging-0.12.0.tar.gz
+sha256  a9695b05090951c029733606f14e24a783c7a100bbe96f8f16a5f2c4c9b08102  simplelogging-0.12.0.tar.gz
 # Locally computed sha256 checksums
-sha256  bd2a0fe3b3bab7092ffa7f58d46bb05d98f12f107b3a6be947c098f7c2ad1d1a  LICENSE
+sha256  71cc6fb7236f1a0734c24b4e5dff18d3afc87a5fb68f25f2d368d8fe099a6cda  LICENSE
diff --git a/package/python-simplelogging/python-simplelogging.mk b/package/python-simplelogging/python-simplelogging.mk
index dbd9ce3ae3..d725cccdd8 100644
--- a/package/python-simplelogging/python-simplelogging.mk
+++ b/package/python-simplelogging/python-simplelogging.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SIMPLELOGGING_VERSION = 0.11.0
+PYTHON_SIMPLELOGGING_VERSION = 0.12.0
 PYTHON_SIMPLELOGGING_SOURCE = simplelogging-$(PYTHON_SIMPLELOGGING_VERSION).tar.gz
-PYTHON_SIMPLELOGGING_SITE = https://files.pythonhosted.org/packages/73/d6/4c06aa7f2c3b9fc09429a1196fd357357cc555de5e16c09b2d12e9db1ebb
+PYTHON_SIMPLELOGGING_SITE = https://files.pythonhosted.org/packages/30/71/d6b6513598e6a4300f6142a839d1b0e10a25a4707f1b586d9a6331be91bb
 PYTHON_SIMPLELOGGING_SETUP_TYPE = pep517
 PYTHON_SIMPLELOGGING_LICENSE = BSD-3-Clause
 PYTHON_SIMPLELOGGING_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
