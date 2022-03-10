Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80CC3C433EF
	for <buildroot@archiver.kernel.org>; Thu, 10 Mar 2022 21:27:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C1104196C;
	Thu, 10 Mar 2022 21:27:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N1tPXBvTLmDm; Thu, 10 Mar 2022 21:27:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2899741969;
	Thu, 10 Mar 2022 21:27:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4528F1BF2C1
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 21:26:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 33F6961279
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 21:26:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4fU1l57YWwNK for <buildroot@lists.busybox.net>;
 Thu, 10 Mar 2022 21:26:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 832C160B43
 for <buildroot@buildroot.org>; Thu, 10 Mar 2022 21:26:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 9D2CF83C07; Thu, 10 Mar 2022 21:18:23 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 10 Mar 2022 22:26:11 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 73fd90816a23c925a33ad0c606df3e0992d873b1
X-Git-Newrev: 51aa106ba3194ae49e119fb3c0bd91ddd81608fa
X-Patchwork-Hint: ignore
Message-Id: <20220310211823.9D2CF83C07@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/php: security
 bump version to 7.4.28
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

commit: https://git.buildroot.net/buildroot/commit/?id=51aa106ba3194ae49e119fb3c0bd91ddd81608fa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Changelog: https://www.php.net/ChangeLog-7.php#7.4.28

Fixes CVE-2021-21708.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index 76e4b4a8e5..33f56dc551 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From https://www.php.net/downloads.php
-sha256  e305b3aafdc85fa73a81c53d3ce30578bc94d1633ec376add193a1e85e0f0ef8  php-7.4.26.tar.xz
+sha256  9cc3b6f6217b60582f78566b3814532c4b71d517876c25013ae51811e65d8fce  php-7.4.28.tar.xz
 
 # License file
 sha256  a188db807d711536f71e27b7d36879d63480f7994dc18adc08e624b3c5430fff  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index 2123cbc5e9..15f5540c5e 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 7.4.26
+PHP_VERSION = 7.4.28
 PHP_SITE = http://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
