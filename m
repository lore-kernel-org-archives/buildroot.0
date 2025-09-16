Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2B00CAC598
	for <buildroot@archiver.kernel.org>; Tue, 16 Sep 2025 20:51:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C2783404BE;
	Tue, 16 Sep 2025 20:51:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ux3XfsQXGH03; Tue, 16 Sep 2025 20:51:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C794140480
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C794140480;
	Tue, 16 Sep 2025 20:51:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E253F199
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 20:51:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D421E611CD
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 20:51:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u32Tcs0SCLCU for <buildroot@buildroot.org>;
 Tue, 16 Sep 2025 20:51:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0949C611CA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0949C611CA
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 20:51:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 03CF984DBF; Tue, 16 Sep 2025 20:51:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 16 Sep 2025 22:50:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 42772667538c82a875bb2766ec189d8833ab9437
X-Git-Newrev: 0865a1ae4b929b3af21921d382d273b518a0db9c
X-Patchwork-Hint: ignore
Message-Id: <20250916205105.03CF984DBF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-asyncclick: bump to version
 8.2.2.2
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0865a1ae4b929b3af21921d382d273b518a0db9c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop python-anyio runtime dependency which is now an optional
dependency of asyncclick. See:
https://github.com/python-trio/asyncclick/commit/ca93155e162cfe15127d443b1de1d76edeafddec

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
[Julien: add commit reference for anyio dependency change]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-asyncclick/Config.in              | 1 -
 package/python-asyncclick/python-asyncclick.hash | 4 ++--
 package/python-asyncclick/python-asyncclick.mk   | 4 ++--
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/python-asyncclick/Config.in b/package/python-asyncclick/Config.in
index 9264245213..7147803d23 100644
--- a/package/python-asyncclick/Config.in
+++ b/package/python-asyncclick/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PYTHON_ASYNCCLICK
 	bool "python-asyncclick"
-	select BR2_PACKAGE_PYTHON_ANYIO # runtime
 	help
 	  Composable command line interface toolkit, async version.
 
diff --git a/package/python-asyncclick/python-asyncclick.hash b/package/python-asyncclick/python-asyncclick.hash
index d121097130..1a2603d2aa 100644
--- a/package/python-asyncclick/python-asyncclick.hash
+++ b/package/python-asyncclick/python-asyncclick.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/asyncclick/json
-md5  e9bab017b26d1310d42b4043742812ce  asyncclick-8.1.8.tar.gz
-sha256  0f0eb0f280e04919d67cf71b9fcdfb4db2d9ff7203669c40284485c149578e4c  asyncclick-8.1.8.tar.gz
+md5  3c8af1a8b6151c24a102e5ed891d19d1  asyncclick-8.2.2.2.tar.gz
+sha256  014f6b7bfb1ef34a2215bc36aebd5150d5d2e50668b12eceb749961e32c24660  asyncclick-8.2.2.2.tar.gz
 # Locally computed sha256 checksums
 sha256  9a8ad106a394e853bfe21f42f4e72d592819a22805d991b5f3275029292b658d  LICENSE.txt
diff --git a/package/python-asyncclick/python-asyncclick.mk b/package/python-asyncclick/python-asyncclick.mk
index 9168d65b58..d413242def 100644
--- a/package/python-asyncclick/python-asyncclick.mk
+++ b/package/python-asyncclick/python-asyncclick.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ASYNCCLICK_VERSION = 8.1.8
+PYTHON_ASYNCCLICK_VERSION = 8.2.2.2
 PYTHON_ASYNCCLICK_SOURCE = asyncclick-$(PYTHON_ASYNCCLICK_VERSION).tar.gz
-PYTHON_ASYNCCLICK_SITE = https://files.pythonhosted.org/packages/cb/b5/e1e5fdf1c1bb7e6e614987c120a98d9324bf8edfaa5f5cd16a6235c9d91b
+PYTHON_ASYNCCLICK_SITE = https://files.pythonhosted.org/packages/35/51/b01dd77c9a14fb0b312d799fd8c10b145b882535dbaa9ac055a52515b390
 PYTHON_ASYNCCLICK_SETUP_TYPE = flit
 PYTHON_ASYNCCLICK_LICENSE = BSD-3-Clause
 PYTHON_ASYNCCLICK_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
