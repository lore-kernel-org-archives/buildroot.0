Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2A4AEEAA65
	for <buildroot@archiver.kernel.org>; Thu, 14 Sep 2023 19:20:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7EF8F4024A;
	Thu, 14 Sep 2023 19:20:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7EF8F4024A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iiRJZMH-7sOE; Thu, 14 Sep 2023 19:20:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F7FB401D0;
	Thu, 14 Sep 2023 19:20:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F7FB401D0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 59F531BF410
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 19:19:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BE19540207
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 19:19:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE19540207
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YG3Ta7AdVcz3 for <buildroot@lists.busybox.net>;
 Thu, 14 Sep 2023 19:19:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8A84740200
 for <buildroot@buildroot.org>; Thu, 14 Sep 2023 19:19:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A84740200
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 77A3E86F9E; Thu, 14 Sep 2023 19:19:25 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 14 Sep 2023 20:58:12 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: 84503913ef3ba4d56bca576645408463a8cde6fa
X-Git-Newrev: 6a753f9db26ac64a700f9926e35e24e5b450eeaa
X-Patchwork-Hint: ignore
Message-Id: <20230914191925.77A3E86F9E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/php: bump version
 to 8.2.10
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

commit: https://git.buildroot.net/buildroot/commit/?id=6a753f9db26ac64a700f9926e35e24e5b450eeaa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

Signed-off-by: Adam Duskett <aduskett@gmail.comm>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 9bf196ce287ecb4e772a935614132d492f5884a5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/php/0003-configure-disable-the-phar-tool.patch | 2 +-
 package/php/php.hash                                   | 2 +-
 package/php/php.mk                                     | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/php/0003-configure-disable-the-phar-tool.patch b/package/php/0003-configure-disable-the-phar-tool.patch
index ab3aecdaa3..6bfaf6640f 100644
--- a/package/php/0003-configure-disable-the-phar-tool.patch
+++ b/package/php/0003-configure-disable-the-phar-tool.patch
@@ -22,7 +22,7 @@ diff --git a/configure.ac b/configure.ac
 index 0dfab302..6026fb66 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1566,13 +1566,8 @@ CFLAGS_CLEAN="$CFLAGS \$(PROF_FLAGS)"
+@@ -1638,13 +1638,8 @@ CFLAGS_CLEAN="$CFLAGS \$(PROF_FLAGS)"
  CFLAGS="\$(CFLAGS_CLEAN) $standard_libtool_flag"
  CXXFLAGS="$CXXFLAGS $standard_libtool_flag \$(PROF_FLAGS)"
  
diff --git a/package/php/php.hash b/package/php/php.hash
index 02cc1e6c7a..b8ff7ccc5c 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From https://www.php.net/downloads.php
-sha256  1e6cb77f997613864ab3127fbfc6a8c7fdaa89a95e8ed6167617b913b4de4765  php-8.2.9.tar.xz
+sha256  561dc4acd5386e47f25be76f2c8df6ae854756469159248313bcf276e282fbb3  php-8.2.10.tar.xz
 
 # License file
 sha256  080d0d0cca64181ef8bf1df9fba0c6f0c485f78f79540c479a45b593bb3b33b5  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index e4b19c8eba..6c70de2742 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 8.2.9
+PHP_VERSION = 8.2.10
 PHP_SITE = https://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
