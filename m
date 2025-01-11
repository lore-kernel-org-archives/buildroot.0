Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EA12C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:53:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 540EB6FBF8;
	Fri, 28 Feb 2025 16:53:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MWWaJERZ1DTg; Fri, 28 Feb 2025 16:53:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 45AE670379
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 45AE670379;
	Fri, 28 Feb 2025 16:53:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1C9A8711
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:36:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B064243067
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wm02wEwu01mO for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA00642D13
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DA00642D13
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D493687C2C; Fri, 28 Feb 2025 16:30:02 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 11 Jan 2025 17:03:49 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: b27de188f78b467ea06ab431393e4bcc9bac93c3
X-Git-Newrev: acede98f8f606d9f8d5fc198cffbba9cd679f3ac
X-Patchwork-Hint: ignore
Message-Id: <20250228163002.D493687C2C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-aerich: bump to
 version 0.8.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=acede98f8f606d9f8d5fc198cffbba9cd679f3ac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Replace python-tomlkit with python-tomli-w runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-aerich/Config.in          | 2 +-
 package/python-aerich/python-aerich.hash | 4 ++--
 package/python-aerich/python-aerich.mk   | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-aerich/Config.in b/package/python-aerich/Config.in
index 39c0a50aa1..4e7ea1117c 100644
--- a/package/python-aerich/Config.in
+++ b/package/python-aerich/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_PYTHON_AERICH
 	select BR2_PACKAGE_PYTHON_ASYNCCLICK # runtime
 	select BR2_PACKAGE_PYTHON_DICTDIFFER # runtime
 	select BR2_PACKAGE_PYTHON_PYDANTIC # runtime
-	select BR2_PACKAGE_PYTHON_TOMLKIT # runtime
+	select BR2_PACKAGE_PYTHON_TOMLI_W # runtime
 	select BR2_PACKAGE_PYTHON_TORTOISE_ORM # runtime
 	help
 	  A database migrations tool for Tortoise ORM.
diff --git a/package/python-aerich/python-aerich.hash b/package/python-aerich/python-aerich.hash
index ba1ea35997..87df73d3c7 100644
--- a/package/python-aerich/python-aerich.hash
+++ b/package/python-aerich/python-aerich.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aerich/json
-md5  22db080bf0e608344dbd837ff29ee2e8  aerich-0.8.0.tar.gz
-sha256  13786a91469626c025a2e2c5e524cac2b82b900de063b317f402710ee4c11ccb  aerich-0.8.0.tar.gz
+md5  d4062a911161435a3d21736b51340b0e  aerich-0.8.1.tar.gz
+sha256  1e95b1c04dfc0c634dd43b0123933038c820140e17a4b27885a63b7461eb0632  aerich-0.8.1.tar.gz
 # Locally computed sha256 checksums
 sha256  4cc00f0e33ac8e089b37d8a1474be441b26311bdc16fe035c75b51201515f617  LICENSE
diff --git a/package/python-aerich/python-aerich.mk b/package/python-aerich/python-aerich.mk
index ea4ee07697..bb568d642f 100644
--- a/package/python-aerich/python-aerich.mk
+++ b/package/python-aerich/python-aerich.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AERICH_VERSION = 0.8.0
+PYTHON_AERICH_VERSION = 0.8.1
 PYTHON_AERICH_SOURCE = aerich-$(PYTHON_AERICH_VERSION).tar.gz
-PYTHON_AERICH_SITE = https://files.pythonhosted.org/packages/35/a5/fc8f6e70cedf47757c4738ed6f79420b9cca6ed1655daf527f86e73f3159
+PYTHON_AERICH_SITE = https://files.pythonhosted.org/packages/4f/41/3c478b7a344abda866f2c644b056ebae638499bbe0eec0010e7361211774
 PYTHON_AERICH_SETUP_TYPE = poetry
 PYTHON_AERICH_LICENSE = Apache-2.0
 PYTHON_AERICH_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
