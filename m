Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 993DACD11C2
	for <buildroot@archiver.kernel.org>; Wed, 10 Apr 2024 21:12:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC40560EA4;
	Wed, 10 Apr 2024 21:12:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MHWFVh2aj8KW; Wed, 10 Apr 2024 21:12:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7135A60EC7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7135A60EC7;
	Wed, 10 Apr 2024 21:12:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B574D1BF4D6
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 21:12:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ECD0C605CA
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 21:11:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CIEWuo4rJk4j for <buildroot@lists.busybox.net>;
 Wed, 10 Apr 2024 21:11:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E9EF60E8D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2E9EF60E8D
 for <buildroot@buildroot.org>; Wed, 10 Apr 2024 21:11:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2816B85F2C; Wed, 10 Apr 2024 21:11:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 10 Apr 2024 23:11:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4b7aeee28ed2f62370084dac4a92bdef89046b41
X-Git-Newrev: 0f5bbd4458c1307eba7acba2c7f4990973cff115
X-Patchwork-Hint: ignore
Message-Id: <20240410211159.2816B85F2C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/php-xdebug: bump to version 3.3.1
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0f5bbd4458c1307eba7acba2c7f4990973cff115
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- License updated to match the PHP 3.01 license:
  https://github.com/xdebug/xdebug/commit/5fc2d818067d05503226ee8c6442985cb2fe069d
- This bump will fix the following build failure raised since bump of
  php to version 8.3.4 in commit
  e50460f9f12a8c5f82f2166733afe9cca3c8cd19:

  checking Check for supported PHP versions... configure: error: not supported. Need a PHP version >= 8.0.0 and < 8.3.0 (found 8.3.4)

https://xdebug.org/updates#x_3_3_1

Fixes: e50460f9f12a8c5f82f2166733afe9cca3c8cd19
 - http://autobuild.buildroot.org/results/0209b522baec3c88a2060e79f805552db79b2c70

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/php-xdebug/php-xdebug.hash | 4 ++--
 package/php-xdebug/php-xdebug.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/php-xdebug/php-xdebug.hash b/package/php-xdebug/php-xdebug.hash
index 2509e6e2ee..251b79ab77 100644
--- a/package/php-xdebug/php-xdebug.hash
+++ b/package/php-xdebug/php-xdebug.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f48777371f90cbb315ea4ea082a1ede6765bcfb35d7d6356ab8f71fd6dfcc157  xdebug-3.2.2.tgz
-sha256  ef479ee1a3da3f933e0d046ca8cd0c14601f29b2c0c41cc60c9388546a4e0272  LICENSE
+sha256  4eb4ee270bbcc5f14195c38f6ee58580e007cf4886ce32e11430318ab5bc2315  xdebug-3.3.1.tgz
+sha256  bc2aee27f3f0806be39e329d284ddbbfb14602a49af261df305dd6122d988eb0  LICENSE
diff --git a/package/php-xdebug/php-xdebug.mk b/package/php-xdebug/php-xdebug.mk
index 3bc197e556..771b96534a 100644
--- a/package/php-xdebug/php-xdebug.mk
+++ b/package/php-xdebug/php-xdebug.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PHP_XDEBUG_VERSION = 3.2.2
+PHP_XDEBUG_VERSION = 3.3.1
 PHP_XDEBUG_SOURCE = xdebug-$(PHP_XDEBUG_VERSION).tgz
 PHP_XDEBUG_SITE = https://xdebug.org/files
 PHP_XDEBUG_INSTALL_STAGING = YES
-PHP_XDEBUG_LICENSE = Xdebug License (PHP-3.0-like)
+PHP_XDEBUG_LICENSE = Xdebug License (PHP-3.01-like)
 PHP_XDEBUG_LICENSE_FILES = LICENSE
 # phpize does the autoconf magic
 PHP_XDEBUG_DEPENDENCIES = php host-autoconf
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
