Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98A16D2ECE6
	for <buildroot@archiver.kernel.org>; Mon, 19 Jan 2026 20:56:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E2A24048C;
	Mon, 19 Jan 2026 20:56:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7jPW_8ddaRZS; Mon, 19 Jan 2026 20:56:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 45985404D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768856181;
	bh=YwmJ+wcJFGtWjb7IMMVXZTKyX4ZbtfzLKniV8Ycl3qc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=YL8XW5wwIpYQLvojnoyOqun+e9ySynV3JFn6MH5MbUXv72QcZQrUFykRAQ4HNkI9o
	 UY62BdLDa6S3Dwi9PR4BYH0a80cGufI49OKRV1C7NtQ9KB7if4hAek7P5sGGiawXal
	 /21cSQcv8INV7W+ueLi2pW2YWn7eJrkSv5Gw3g6fvzXcIK8W+0efyowtnO6CjlNrtk
	 SW1uA5oj3jarK5zENckfBNqsgHpZo7LMcdCpOb4Ur4bb06POxsXqm3rAGeE+7gE+4/
	 SBfV2wrKgmJP+VpV+uHIWFWEWGltWgCa1OHh5O1Dhyv/k97XL70ps3yAWDUJMiMzoE
	 DVPET04Iyahyw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 45985404D9;
	Mon, 19 Jan 2026 20:56:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6B65F2CE
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 20:56:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5F663841B4
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 20:56:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qPX0ZWmo9AQw for <buildroot@buildroot.org>;
 Mon, 19 Jan 2026 20:56:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B63D4841B3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B63D4841B3
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 20:56:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A5A4B886C8; Mon, 19 Jan 2026 20:56:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 19 Jan 2026 21:20:34 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1e02c54873d564c2bec56364ad380fa984d9ed81
X-Git-Newrev: 45eaf7db42d6834d9d9f21dea3f7fe4a9db30ff1
X-Patchwork-Hint: ignore
Message-Id: <20260119205617.A5A4B886C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/php-xdebug: bump version to 3.5.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=45eaf7db42d6834d9d9f21dea3f7fe4a9db30ff1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://xdebug.org/announcements/2025-12-04

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Nicolas Carrier <nicolas.carrier@orolia.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/php-xdebug/php-xdebug.hash | 2 +-
 package/php-xdebug/php-xdebug.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php-xdebug/php-xdebug.hash b/package/php-xdebug/php-xdebug.hash
index 9470a7d4e8..9149545a6e 100644
--- a/package/php-xdebug/php-xdebug.hash
+++ b/package/php-xdebug/php-xdebug.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  7592923501e3fdb9741ad35b90e08fc6b3c5dd31eadc4c83b7b3c9dda0627b24  xdebug-3.4.7.tgz
+sha256  f6daf55a5c7adadb07dd2af25ff78b1cc9b1c58d6cc442a463eba015b678aabf  xdebug-3.5.0.tgz
 sha256  bc2aee27f3f0806be39e329d284ddbbfb14602a49af261df305dd6122d988eb0  LICENSE
diff --git a/package/php-xdebug/php-xdebug.mk b/package/php-xdebug/php-xdebug.mk
index 272d331f7b..85a00d10fb 100644
--- a/package/php-xdebug/php-xdebug.mk
+++ b/package/php-xdebug/php-xdebug.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_XDEBUG_VERSION = 3.4.7
+PHP_XDEBUG_VERSION = 3.5.0
 PHP_XDEBUG_SOURCE = xdebug-$(PHP_XDEBUG_VERSION).tgz
 PHP_XDEBUG_SITE = https://xdebug.org/files
 PHP_XDEBUG_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
