Return-Path: <SRS0=USZC=O5=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F789C433F5
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 12:08:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 561F060F57
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 12:08:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 561F060F57
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 24139605B2;
	Sat,  9 Oct 2021 12:08:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YfIbtgeBFG_W; Sat,  9 Oct 2021 12:08:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7AA9060A44;
	Sat,  9 Oct 2021 12:08:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EFE251BF36A
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 12:03:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EAD6D4057A
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 12:03:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A_-fRoHhBQDf for <buildroot@lists.busybox.net>;
 Sat,  9 Oct 2021 12:03:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D4D1540431
 for <buildroot@buildroot.org>; Sat,  9 Oct 2021 12:03:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 18AB6947C3; Sat,  9 Oct 2021 12:00:36 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 9 Oct 2021 13:40:38 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 56bc92c3bae4f4cb92c417794e3534693e20f5c7
X-Git-Newrev: d930e0f666ffac1c6b6036686eff140f11319130
X-Patchwork-Hint: ignore
Message-Id: <20211009120036.18AB6947C3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/php: security
 bump version to 7.4.24
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

commit: https://git.buildroot.net/buildroot/commit/?id=d930e0f666ffac1c6b6036686eff140f11319130
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Changelog: https://www.php.net/ChangeLog-7.php#7.4.24

Fixes CVE-2021-21706: https://bugs.php.net/bug.php?id=81420

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index 28ac6c5d68..d82c81a703 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From https://www.php.net/downloads.php
-sha256  cea52313fcffe56343bcd3c66dbb23cd5507dc559cc2e3547cf8f5452e88a05d  php-7.4.23.tar.xz
+sha256  ff7658ee2f6d8af05b48c21146af5f502e121def4e76e862df5ec9fa06e98734  php-7.4.24.tar.xz
 
 # License file
 sha256  a188db807d711536f71e27b7d36879d63480f7994dc18adc08e624b3c5430fff  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index 805030d88a..30c3ee9ca4 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 7.4.23
+PHP_VERSION = 7.4.24
 PHP_SITE = http://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
