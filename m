Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BA24C43217
	for <buildroot@archiver.kernel.org>; Wed,  2 Nov 2022 22:49:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2EC6440B61;
	Wed,  2 Nov 2022 22:49:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2EC6440B61
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id We5VZTWqrgoN; Wed,  2 Nov 2022 22:49:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4C8A940AE1;
	Wed,  2 Nov 2022 22:49:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4C8A940AE1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1922F1BF95F
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 22:48:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A77A360AFC
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 22:48:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A77A360AFC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zO-a7_4Z6THj for <buildroot@lists.busybox.net>;
 Wed,  2 Nov 2022 22:48:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5929560B70
 for <buildroot@buildroot.org>; Wed,  2 Nov 2022 22:48:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5929560B70
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 464BB879B4; Wed,  2 Nov 2022 22:48:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 2 Nov 2022 23:47:36 +0100
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: 1331d2d3ee6cd7cfda2bbd13cb18833cb53d2e0c
X-Git-Newrev: d57cf26ea923305fca93a59579df65e6b8f5b686
X-Patchwork-Hint: ignore
Message-Id: <20221102224807.464BB879B4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] package/php: security
 bump version to 8.1.11
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

commit: https://git.buildroot.net/buildroot/commit/?id=d57cf26ea923305fca93a59579df65e6b8f5b686
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

Fixes
- CVE-2022-31628: http://bugs.php.net/81726
- CVE-2022-31629: http://bugs.php.net/81727

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 1684cd72b0557444ee80195b60c5ab57ff6b1313)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index 5fb373ec11..c4c42a2c7d 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From https://www.php.net/downloads.php
-sha256  53477e73e6254dc942b68913a58d815ffdbf6946baf61a1f8ef854de524c27bf  php-8.1.9.tar.xz
+sha256  3005198d7303f87ab31bc30695de76e8ad62783f806b6ab9744da59fe41cc5bd  php-8.1.11.tar.xz
 
 # License file
 sha256  a188db807d711536f71e27b7d36879d63480f7994dc18adc08e624b3c5430fff  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index 77584813c3..7136fd9744 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 8.1.9
+PHP_VERSION = 8.1.11
 PHP_SITE = https://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
