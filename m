Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10AEFC4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Dec 2021 22:28:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF35941C10;
	Mon,  6 Dec 2021 22:28:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Rd2SmX7535Uf; Mon,  6 Dec 2021 22:28:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F74940924;
	Mon,  6 Dec 2021 22:28:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D102F1BF232
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 22:28:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BECA684BE4
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 22:28:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eAxczA5_s-4K for <buildroot@lists.busybox.net>;
 Mon,  6 Dec 2021 22:28:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 18F6784BE3
 for <buildroot@buildroot.org>; Mon,  6 Dec 2021 22:28:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 44A43817D5; Mon,  6 Dec 2021 22:23:08 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 6 Dec 2021 23:12:25 +0100
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: fa0df4790f8d394e3a06391415c064f3757207d8
X-Git-Newrev: b834cfef79c8fc5857f6b89fa24d414821396d90
X-Patchwork-Hint: ignore
Message-Id: <20211206222308.44A43817D5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] package/php: security
 bump version to 8.0.13
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

commit: https://git.buildroot.net/buildroot/commit/?id=b834cfef79c8fc5857f6b89fa24d414821396d90
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

Changelog: https://www.php.net/ChangeLog-8.php#8.0.13

Fixes CVE-2021-21707: http://bugs.php.net/79971

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 3c91d5f8dd0751eeb9be35b50b032ab60646cf0c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index 64ea95b9ba..254484e72f 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From https://www.php.net/downloads.php
-sha256  a501017b3b0fd3023223ea25d98e87369b782f8a82310c4033d7ea6a989fea0a  php-8.0.12.tar.xz
+sha256  cd976805ec2e9198417651027dfe16854ba2c2c388151ab9d4d268513d52ed52  php-8.0.13.tar.xz
 
 # License file
 sha256  a188db807d711536f71e27b7d36879d63480f7994dc18adc08e624b3c5430fff  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index b7cd356282..8c45da77a2 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 8.0.12
+PHP_VERSION = 8.0.13
 PHP_SITE = https://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
