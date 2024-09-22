Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88B22CF9C69
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 18:05:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 438FA4056A;
	Sun, 22 Sep 2024 18:05:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0Y6p-Tvw0kaK; Sun, 22 Sep 2024 18:04:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7E8CF40480
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7E8CF40480;
	Sun, 22 Sep 2024 18:04:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 892BE1BF44A
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 18:04:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 72344405AE
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 18:04:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X9-ARCEGkNKD for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 18:04:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4062740469
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4062740469
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 18:04:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2B4A4822A0; Sun, 22 Sep 2024 18:04:47 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 22 Sep 2024 18:53:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 411e5e802175f6480725ad029161a6dbe3ac56a0
X-Git-Newrev: 0c15e04677a8a46d6e97b0e791e6cbb612684409
X-Patchwork-Hint: ignore
Message-Id: <20240922180447.2B4A4822A0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pytablereader: bump to
 version 0.31.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=0c15e04677a8a46d6e97b0e791e6cbb612684409
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop no longer required python-six and python-pathpy runtime
dependencies.

Add new python-path runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-pytablereader/Config.in                 | 3 +--
 package/python-pytablereader/python-pytablereader.hash | 4 ++--
 package/python-pytablereader/python-pytablereader.mk   | 4 ++--
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/python-pytablereader/Config.in b/package/python-pytablereader/Config.in
index 00be18510f..308e06236a 100644
--- a/package/python-pytablereader/Config.in
+++ b/package/python-pytablereader/Config.in
@@ -5,9 +5,8 @@ config BR2_PACKAGE_PYTHON_PYTABLEREADER
 	select BR2_PACKAGE_PYTHON_DATAPROPERTY # runtime
 	select BR2_PACKAGE_PYTHON_JSONSCHEMA # runtime
 	select BR2_PACKAGE_PYTHON_MBSTRDECODER # runtime
-	select BR2_PACKAGE_PYTHON_PATHPY # runtime
+	select BR2_PACKAGE_PYTHON_PATH # runtime
 	select BR2_PACKAGE_PYTHON_PATHVALIDATE # runtime
-	select BR2_PACKAGE_PYTHON_SIX # runtime
 	select BR2_PACKAGE_PYTHON_TABLEDATA # runtime
 	select BR2_PACKAGE_PYTHON_TYPEPY # runtime
 	help
diff --git a/package/python-pytablereader/python-pytablereader.hash b/package/python-pytablereader/python-pytablereader.hash
index 2034cfd61e..18a26847c8 100644
--- a/package/python-pytablereader/python-pytablereader.hash
+++ b/package/python-pytablereader/python-pytablereader.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pytablereader/json
-md5  8d732b706186666a4c28d14927c26754  pytablereader-0.31.3.tar.gz
-sha256  e292b81ecd96546fe0f53d9c83e716a4682d07d7ead6d9be8beb14ab0591df11  pytablereader-0.31.3.tar.gz
+md5  d92cbcb2716ecea0eee58649a591edc0  pytablereader-0.31.4.tar.gz
+sha256  ad97308308525cafe0eaa4b6a80a02499e0b4c6c979efb17452d302ad78bd5b1  pytablereader-0.31.4.tar.gz
 # Locally computed sha256 checksums
 sha256  7588265082eed5e9f4afd5090c57e610b740ec547b16aaaab739ba07c5eefb15  LICENSE
diff --git a/package/python-pytablereader/python-pytablereader.mk b/package/python-pytablereader/python-pytablereader.mk
index daa484d393..40614472a6 100644
--- a/package/python-pytablereader/python-pytablereader.mk
+++ b/package/python-pytablereader/python-pytablereader.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYTABLEREADER_VERSION = 0.31.3
+PYTHON_PYTABLEREADER_VERSION = 0.31.4
 PYTHON_PYTABLEREADER_SOURCE = pytablereader-$(PYTHON_PYTABLEREADER_VERSION).tar.gz
-PYTHON_PYTABLEREADER_SITE = https://files.pythonhosted.org/packages/b5/c8/67590578e27cb1716c7b71291946d685b5bf63fbfe7a254a7cb3f6f8aeab
+PYTHON_PYTABLEREADER_SITE = https://files.pythonhosted.org/packages/0a/44/e42c24df7b6f1c880b5bf614112e2009ac088fee79b6bc4d1fa43789c460
 PYTHON_PYTABLEREADER_SETUP_TYPE = setuptools
 PYTHON_PYTABLEREADER_LICENSE = MIT
 PYTHON_PYTABLEREADER_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
