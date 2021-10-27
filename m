Return-Path: <SRS0=x9kH=PP=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3C7DC433EF
	for <buildroot@archiver.kernel.org>; Wed, 27 Oct 2021 10:16:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9146760EC0
	for <buildroot@archiver.kernel.org>; Wed, 27 Oct 2021 10:16:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9146760EC0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 502F1401A2;
	Wed, 27 Oct 2021 10:16:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0Dnmd-P7ZQjW; Wed, 27 Oct 2021 10:16:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 62FF9401DB;
	Wed, 27 Oct 2021 10:16:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4A26D1BF2F4
 for <buildroot@lists.busybox.net>; Wed, 27 Oct 2021 10:16:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4749F80D00
 for <buildroot@lists.busybox.net>; Wed, 27 Oct 2021 10:16:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id coq6TxwUETGr for <buildroot@lists.busybox.net>;
 Wed, 27 Oct 2021 10:16:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8F00480CE4
 for <buildroot@buildroot.org>; Wed, 27 Oct 2021 10:16:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 3966488FA7; Wed, 27 Oct 2021 10:12:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 27 Oct 2021 12:16:02 +0200
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: 20ce8f444983c8c5d9f66c2dbd46339153a329a2
X-Git-Newrev: aefbe5cc683c0f7d445e51069da6974b481d1dd8
X-Patchwork-Hint: ignore
Message-Id: <20211027101252.3966488FA7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] package/php:security bump
 version to 8.0.12
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

commit: https://git.buildroot.net/buildroot/commit/?id=aefbe5cc683c0f7d445e51069da6974b481d1dd8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

Changelog:
https://www.php.net/ChangeLog-8.php#8.0.12

Fixes CVE-2021-21703: http://bugs.php.net/81026

For details, see https://www.ambionics.io/blog/php-fpm-local-root

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit afdd74d2fbb0461b7b8cba9ea9a0268eae1662aa)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index a74ade473d..64ea95b9ba 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From https://www.php.net/downloads.php
-sha256  e3e5f764ae57b31eb65244a45512f0b22d7bef05f2052b23989c053901552e16  php-8.0.11.tar.xz
+sha256  a501017b3b0fd3023223ea25d98e87369b782f8a82310c4033d7ea6a989fea0a  php-8.0.12.tar.xz
 
 # License file
 sha256  a188db807d711536f71e27b7d36879d63480f7994dc18adc08e624b3c5430fff  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index 8885759f04..b7cd356282 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 8.0.11
+PHP_VERSION = 8.0.12
 PHP_SITE = https://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
