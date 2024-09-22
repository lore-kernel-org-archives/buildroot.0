Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DCE2CF9C64
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 16:03:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 090BE605E3;
	Sun, 22 Sep 2024 16:03:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hvt9hm26aKlF; Sun, 22 Sep 2024 16:03:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EDFD6605E9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EDFD6605E9;
	Sun, 22 Sep 2024 16:03:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EBFF81BF3E8
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 16:03:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DB6D381299
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 16:03:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ybofpu9Dxd3Z for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 16:03:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D2DE581298
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D2DE581298
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 16:03:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BAA6E802F9; Sun, 22 Sep 2024 16:03:06 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 22 Sep 2024 18:01:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7bf6d2a49f57a623d8808c74df7e251406f35023
X-Git-Newrev: ed84f3b7e6a32c4896863d4bf9caafed1fb69ddc
X-Patchwork-Hint: ignore
Message-Id: <20240922160306.BAA6E802F9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Revert "package/python-configobj: bump to
 version 5.0.9"
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

commit: https://git.buildroot.net/buildroot/commit/?id=ed84f3b7e6a32c4896863d4bf9caafed1fb69ddc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit 616de7655afa6c037f159e13eeb37f03826895f3.

The commit log forgot to mention the license hash change, and a v2 was
later posted, but v1 was applied in error.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-configobj/Config.in             | 1 +
 package/python-configobj/python-configobj.hash | 6 +++---
 package/python-configobj/python-configobj.mk   | 4 ++--
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/python-configobj/Config.in b/package/python-configobj/Config.in
index cb9d914745..365aa17fcb 100644
--- a/package/python-configobj/Config.in
+++ b/package/python-configobj/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_CONFIGOBJ
 	bool "python-configobj"
+	select BR2_PACKAGE_PYTHON_SIX # runtime
 	help
 	  Config file reading, writing and validation.
 
diff --git a/package/python-configobj/python-configobj.hash b/package/python-configobj/python-configobj.hash
index b173f0cdd7..682dc987f1 100644
--- a/package/python-configobj/python-configobj.hash
+++ b/package/python-configobj/python-configobj.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/configobj/json
-md5  496b60edcd943a900ddc0cb04132e81c  configobj-5.0.9.tar.gz
-sha256  03c881bbf23aa07bccf1b837005975993c4ab4427ba57f959afdd9d1a2386848  configobj-5.0.9.tar.gz
+md5  8dda7b31bb3aea87ecfe3b7a87812b17  configobj-5.0.8.tar.gz
+sha256  6f704434a07dc4f4dc7c9a745172c1cad449feb548febd9f7fe362629c627a97  configobj-5.0.8.tar.gz
 # Locally computed sha256 checksums
-sha256  fd227649f1956788444397bf0899e977140a5bc662d86826657bc2aad833fe2a  LICENSE
+sha256  0d95e648469a711f5ec1e59e6d4492150ec65d968c1ea6c6d96154a92879997a  LICENSE
diff --git a/package/python-configobj/python-configobj.mk b/package/python-configobj/python-configobj.mk
index 963bbcb2b8..fe1776f79f 100644
--- a/package/python-configobj/python-configobj.mk
+++ b/package/python-configobj/python-configobj.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CONFIGOBJ_VERSION = 5.0.9
+PYTHON_CONFIGOBJ_VERSION = 5.0.8
 PYTHON_CONFIGOBJ_SOURCE = configobj-$(PYTHON_CONFIGOBJ_VERSION).tar.gz
-PYTHON_CONFIGOBJ_SITE = https://files.pythonhosted.org/packages/f5/c4/c7f9e41bc2e5f8eeae4a08a01c91b2aea3dfab40a3e14b25e87e7db8d501
+PYTHON_CONFIGOBJ_SITE = https://files.pythonhosted.org/packages/cb/87/17d4c6d634c044ab08b11c0cd2a8a136d103713d438f8792d7be2c5148fb
 PYTHON_CONFIGOBJ_SETUP_TYPE = setuptools
 PYTHON_CONFIGOBJ_LICENSE = BSD-3-Clause
 PYTHON_CONFIGOBJ_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
