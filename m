Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 169B1C2BD09
	for <buildroot@archiver.kernel.org>; Sat,  6 Jul 2024 21:01:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D3B80402E3;
	Sat,  6 Jul 2024 21:01:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T17VIHDThS5W; Sat,  6 Jul 2024 21:01:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 98BFC4043E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 98BFC4043E;
	Sat,  6 Jul 2024 21:01:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9DBF51BF27C
 for <buildroot@lists.busybox.net>; Sat,  6 Jul 2024 21:01:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 96F524059F
 for <buildroot@lists.busybox.net>; Sat,  6 Jul 2024 21:01:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eV8cKsMcg0Xm for <buildroot@lists.busybox.net>;
 Sat,  6 Jul 2024 21:01:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A1C3E40586
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A1C3E40586
 for <buildroot@buildroot.org>; Sat,  6 Jul 2024 21:01:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 86F0383CBD; Sat,  6 Jul 2024 21:01:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 6 Jul 2024 22:56:21 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 36d6d1de0bdf1f46c516c4a5b39069c87a4106c5
X-Git-Newrev: cb7e586019c899d87456e4f75e3a666e3605d1c4
X-Patchwork-Hint: ignore
Message-Id: <20240706210107.86F0383CBD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/php: security
 bump to version 8.2.21
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

commit: https://git.buildroot.net/buildroot/commit/?id=cb7e586019c899d87456e4f75e3a666e3605d1c4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Fixes CVE-2024-4577, CVE-2024-5458, CVE-2024-5585

Changelog: https://www.php.net/ChangeLog-8.php#8.2.21

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index e8dc16bd61..b4cce93b43 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From https://www.php.net/downloads.php
-sha256  44b306fc021e56441f691da6c3108788bd9e450f293b3bc70fcd64b08dd41a50  php-8.2.18.tar.xz
+sha256  8cc44d51bb2506399ec176f70fe110f0c9e1f7d852a5303a2cd1403402199707  php-8.2.21.tar.xz
 
 # License file
 sha256  b42e4df5e50e6ecda1047d503d6d91d71032d09ed1027ba1ef29eed26f890c5a  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index e99e627389..81a122784d 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 8.2.18
+PHP_VERSION = 8.2.21
 PHP_SITE = https://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
