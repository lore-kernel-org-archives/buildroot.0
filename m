Return-Path: <SRS0=o+05=PO=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0FEDC433EF
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 19:10:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E75B460E0B
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 19:10:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E75B460E0B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A13C64047E;
	Tue, 26 Oct 2021 19:10:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O0uwJ3RPn-yD; Tue, 26 Oct 2021 19:10:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 098724046E;
	Tue, 26 Oct 2021 19:10:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4DF0E1BF3CD
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 19:10:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4A9CD4046E
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 19:10:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yaAG7T1N4pcE for <buildroot@lists.busybox.net>;
 Tue, 26 Oct 2021 19:10:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 45389401D0
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 19:10:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 6029388EF3; Tue, 26 Oct 2021 19:07:12 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 26 Oct 2021 21:08:40 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: c1c0d83cbb67f948896e36f33e5831577894a047
X-Git-Newrev: 8c9111ca6e22b3c79fddc353b01b68c90554ca15
X-Patchwork-Hint: ignore
Message-Id: <20211026190712.6029388EF3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/php: security
 bump to version 7.4.25
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

commit: https://git.buildroot.net/buildroot/commit/?id=8c9111ca6e22b3c79fddc353b01b68c90554ca15
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Fixes the following security issue:

- CVE-2021-21703: n PHP versions 7.3.x up to and including 7.3.31, 7.4.x
  below 7.4.25 and 8.0.x below 8.0.12, when running PHP FPM SAPI with main
  FPM daemon process running as root and child worker processes running as
  lower-privileged users, it is possible for the child processes to access
  memory shared with the main process and write to it, modifying it in a way
  that would cause the root process to conduct invalid memory reads and
  writes, which can be used to escalate privileges from local unprivileged
  user to the root user.

  For more details, see https://www.ambionics.io/blog/php-fpm-local-root

https://www.php.net/ChangeLog-7.php#7.4.25

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index d82c81a703..c55f997731 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From https://www.php.net/downloads.php
-sha256  ff7658ee2f6d8af05b48c21146af5f502e121def4e76e862df5ec9fa06e98734  php-7.4.24.tar.xz
+sha256  12a758f1d7fee544387a28d3cf73226f47e3a52fb3049f07fcc37d156d393c0a  php-7.4.25.tar.xz
 
 # License file
 sha256  a188db807d711536f71e27b7d36879d63480f7994dc18adc08e624b3c5430fff  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index 30c3ee9ca4..27e665bf3c 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 7.4.24
+PHP_VERSION = 7.4.25
 PHP_SITE = http://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
