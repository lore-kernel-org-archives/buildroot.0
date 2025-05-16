Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7807DC2D0CD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 11:00:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B61570E0F;
	Mon, 19 May 2025 11:00:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ATlxInGLiMFW; Mon, 19 May 2025 11:00:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E5E670E19
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E5E670E19;
	Mon, 19 May 2025 11:00:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 31FB5D4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:47:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C8490417F7
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UEGZFjuMgyt7 for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:40:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9C37D410A3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9C37D410A3
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9A6B38348A; Mon, 19 May 2025 10:40:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 16 May 2025 16:19:48 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: e42de820cd598d6ed7045fd4f06aa1429a359e05
X-Git-Newrev: e1c939e4269130fd0ef857c63a0f752f9e5c13ec
X-Patchwork-Hint: ignore
Message-Id: <20250519104004.9A6B38348A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-pydantic: bump
 2.11.4
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e1c939e4269130fd0ef857c63a0f752f9e5c13ec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/python-pydantic/Config.in            | 4 ++--
 package/python-pydantic/python-pydantic.hash | 4 ++--
 package/python-pydantic/python-pydantic.mk   | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-pydantic/Config.in b/package/python-pydantic/Config.in
index e9cd2e6780..eebfb3a1f7 100644
--- a/package/python-pydantic/Config.in
+++ b/package/python-pydantic/Config.in
@@ -4,8 +4,8 @@ config BR2_PACKAGE_PYTHON_PYDANTIC
 	select BR2_PACKAGE_PYTHON_ANNOTATED_TYPES # runtime
 	select BR2_PACKAGE_PYTHON_PYDANTIC_CORE # runtime
 	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
+	select BR2_PACKAGE_PYTHON_TYPING_INSPECTION # runtime
 	help
-	  Data validation and settings management using python 3.6
-	  type hinting.
+	  Data validation using Python type hints.
 
 	  https://github.com/pydantic/pydantic
diff --git a/package/python-pydantic/python-pydantic.hash b/package/python-pydantic/python-pydantic.hash
index 72470e1f19..d639fc0da7 100644
--- a/package/python-pydantic/python-pydantic.hash
+++ b/package/python-pydantic/python-pydantic.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pydantic/json
-md5  46b0048f4ad780b0e8a15f602b56c5a1  pydantic-2.10.6.tar.gz
-sha256  ca5daa827cce33de7a42be142548b0096bf05a7e7b365aebfa5f8eeec7128236  pydantic-2.10.6.tar.gz
+md5  13bdd5856e805abdce75516cdb98935f  pydantic-2.11.4.tar.gz
+sha256  32738d19d63a226a52eed76645a98ee07c1f410ee41d93b4afbfa85ed8111c2d  pydantic-2.11.4.tar.gz
 # Locally computed sha256 checksums
 sha256  a9e186f3ca16b5eef84318e7a701721351a00cb7b8ae3a4394b67b49e3529ef3  LICENSE
diff --git a/package/python-pydantic/python-pydantic.mk b/package/python-pydantic/python-pydantic.mk
index b5808e0201..f82cdd3c16 100644
--- a/package/python-pydantic/python-pydantic.mk
+++ b/package/python-pydantic/python-pydantic.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYDANTIC_VERSION = 2.10.6
+PYTHON_PYDANTIC_VERSION = 2.11.4
 PYTHON_PYDANTIC_SOURCE = pydantic-$(PYTHON_PYDANTIC_VERSION).tar.gz
-PYTHON_PYDANTIC_SITE = https://files.pythonhosted.org/packages/b7/ae/d5220c5c52b158b1de7ca89fc5edb72f304a70a4c540c84c8844bf4008de
+PYTHON_PYDANTIC_SITE = https://files.pythonhosted.org/packages/77/ab/5250d56ad03884ab5efd07f734203943c8a8ab40d551e208af81d0257bf2
 PYTHON_PYDANTIC_SETUP_TYPE = hatch
 PYTHON_PYDANTIC_LICENSE = MIT
 PYTHON_PYDANTIC_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
