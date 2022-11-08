Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60C0FC433FE
	for <buildroot@archiver.kernel.org>; Tue,  8 Nov 2022 20:06:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F2C3F60E4C;
	Tue,  8 Nov 2022 20:06:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F2C3F60E4C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UWZoorZdMxwn; Tue,  8 Nov 2022 20:06:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2905C60E31;
	Tue,  8 Nov 2022 20:06:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2905C60E31
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C781A1BF3C6
 for <buildroot@lists.busybox.net>; Tue,  8 Nov 2022 20:06:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A3E5B404D8
 for <buildroot@lists.busybox.net>; Tue,  8 Nov 2022 20:06:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A3E5B404D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NlmFIEu0hW7A for <buildroot@lists.busybox.net>;
 Tue,  8 Nov 2022 20:06:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BC8AE403B7
 for <buildroot@buildroot.org>; Tue,  8 Nov 2022 20:06:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BC8AE403B7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A8EEC80E38; Tue,  8 Nov 2022 20:06:30 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 8 Nov 2022 21:05:23 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: dff8703ca251425cdf0d37438c797a970c59659a
X-Git-Newrev: 8ba2f61f8f9a7dc772098e7145b7a6f7666c7bfd
X-Patchwork-Hint: ignore
Message-Id: <20221108200630.A8EEC80E38@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/php: security
 bump version to 8.0.25
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

commit: https://git.buildroot.net/buildroot/commit/?id=8ba2f61f8f9a7dc772098e7145b7a6f7666c7bfd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Changelog: https://www.php.net/ChangeLog-8.php#8.0.25

Fixes:
- CVE-2022-31630: http://bugs.php.net/81739
- CVE-2022-37454: http://bugs.php.net/81738

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index 55a92c6c36..574d5fb7c4 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From https://www.php.net/downloads.php
-sha256  8e6a63ac9cdabe4c345b32a54b18f348d9e50a1decda217faf2d61278d22f08b  php-8.0.24.tar.xz
+sha256  a291b71d0498707fc5514eb5b9513e88f0f1d4890bcdefd67282ded8a2bfb941  php-8.0.25.tar.xz
 
 # License file
 sha256  a188db807d711536f71e27b7d36879d63480f7994dc18adc08e624b3c5430fff  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index facc2f5634..531f88e896 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 8.0.24
+PHP_VERSION = 8.0.25
 PHP_SITE = https://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
