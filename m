Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D926FC10F1A
	for <buildroot@archiver.kernel.org>; Tue,  7 May 2024 20:15:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D3438246D;
	Tue,  7 May 2024 20:15:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y0CN_P_tKupI; Tue,  7 May 2024 20:15:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D1EF28246F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D1EF28246F;
	Tue,  7 May 2024 20:15:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 88D691BF281
 for <buildroot@lists.busybox.net>; Tue,  7 May 2024 20:15:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 72FC260B45
 for <buildroot@lists.busybox.net>; Tue,  7 May 2024 20:15:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BYInbwX_9iqC for <buildroot@lists.busybox.net>;
 Tue,  7 May 2024 20:15:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9EF4860B3C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9EF4860B3C
 for <buildroot@buildroot.org>; Tue,  7 May 2024 20:15:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8936786A47; Tue,  7 May 2024 20:15:22 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 7 May 2024 22:03:21 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 5177d62dce792246088a2b9a6d7bd0c24bd290b1
X-Git-Newrev: e83045c4822072698bcfc6580707c2f2e70331ad
X-Patchwork-Hint: ignore
Message-Id: <20240507201522.8936786A47@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/php: security
 bump version to 8.2.18
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

commit: https://git.buildroot.net/buildroot/commit/?id=e83045c4822072698bcfc6580707c2f2e70331ad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Fixes CVE-2024-1874, CVE-2024-2756 & CVE-2024-3096.

Changelog: https://www.php.net/ChangeLog-8.php#PHP_8_2
Release notes: https://news-web.php.net/php.announce/423

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index 4ce3616de3..e8dc16bd61 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From https://www.php.net/downloads.php
-sha256  28cdc995b7d5421711c7044294885fcde4390c9f67504a994b4cf9bc1b5cc593  php-8.2.16.tar.xz
+sha256  44b306fc021e56441f691da6c3108788bd9e450f293b3bc70fcd64b08dd41a50  php-8.2.18.tar.xz
 
 # License file
 sha256  b42e4df5e50e6ecda1047d503d6d91d71032d09ed1027ba1ef29eed26f890c5a  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index 28893be4c6..e99e627389 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 8.2.16
+PHP_VERSION = 8.2.18
 PHP_SITE = https://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
