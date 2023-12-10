Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B223AC4167B
	for <buildroot@archiver.kernel.org>; Sun, 10 Dec 2023 13:11:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E5E360B90;
	Sun, 10 Dec 2023 13:11:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E5E360B90
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F8CJmIaS45M0; Sun, 10 Dec 2023 13:11:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 946DC61075;
	Sun, 10 Dec 2023 13:11:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 946DC61075
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AFB391BF5A8
 for <buildroot@lists.busybox.net>; Sun, 10 Dec 2023 13:11:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 86D8F4013F
 for <buildroot@lists.busybox.net>; Sun, 10 Dec 2023 13:11:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 86D8F4013F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7rkQnNn9aMDB for <buildroot@lists.busybox.net>;
 Sun, 10 Dec 2023 13:11:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7A2DF400D6
 for <buildroot@buildroot.org>; Sun, 10 Dec 2023 13:11:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7A2DF400D6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 64CC587A85; Sun, 10 Dec 2023 13:11:24 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 10 Dec 2023 13:57:05 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: e6252e5b6d7b3ed645c3001dec3b5845852727d7
X-Git-Newrev: e727d9c69c21994c8b88bccd3f64b5a88fbc1fdc
X-Patchwork-Hint: ignore
Message-Id: <20231210131124.64CC587A85@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/php: security
 bump version to 8.2.13
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

commit: https://git.buildroot.net/buildroot/commit/?id=e727d9c69c21994c8b88bccd3f64b5a88fbc1fdc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

"This is a security release" according to the upstream release notes:
https://news-web.php.net/php.announce/369

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 0a54c46054b618f191e5474c8e4961462b97056e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index 0f77f0082f..8ad3823960 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From https://www.php.net/downloads.php
-sha256  e1526e400bce9f9f9f774603cfac6b72b5e8f89fa66971ebc3cc4e5964083132  php-8.2.12.tar.xz
+sha256  2629bba10117bf78912068a230c68a8fd09b7740267bd8ebd3cfce91515d454b  php-8.2.13.tar.xz
 
 # License file
 sha256  080d0d0cca64181ef8bf1df9fba0c6f0c485f78f79540c479a45b593bb3b33b5  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index e2cdccb275..481b0b7eb1 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 8.2.12
+PHP_VERSION = 8.2.13
 PHP_SITE = https://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
