Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96E45C64ED8
	for <buildroot@archiver.kernel.org>; Mon, 27 Feb 2023 15:13:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 32E1A606F2;
	Mon, 27 Feb 2023 15:13:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 32E1A606F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id stulXdBw36VO; Mon, 27 Feb 2023 15:13:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C4F561084;
	Mon, 27 Feb 2023 15:13:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4C4F561084
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 096111BF31B
 for <buildroot@lists.busybox.net>; Mon, 27 Feb 2023 15:13:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3D70F8125E
 for <buildroot@lists.busybox.net>; Mon, 27 Feb 2023 15:13:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D70F8125E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XYpqnQRh8ktv for <buildroot@lists.busybox.net>;
 Mon, 27 Feb 2023 15:13:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5D29E8124F
 for <buildroot@buildroot.org>; Mon, 27 Feb 2023 15:13:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D29E8124F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4B47686C01; Mon, 27 Feb 2023 15:13:05 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 27 Feb 2023 16:12:32 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9d74f85c97d21461a5a23b27eb682c1157875bdb
X-Git-Newrev: 8280400fbadde09e51ccff312d7a4ef6a386f589
X-Patchwork-Hint: ignore
Message-Id: <20230227151305.4B47686C01@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/php-xdebug: bump to version 3.2.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=8280400fbadde09e51ccff312d7a4ef6a386f589
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Use official tarball
- This bump will fix the following build failure raised since bump of
  php to version 8.2.1 in commit
  90ab065162a35b8aa2c429903e3d59d4ad2c0d7f:

  checking Check for supported PHP versions... configure: error: not supported. Need a PHP version >= 7.2.0 and < 8.2.0 (found 8.2.1)

https://xdebug.org/announcements/2022-12-08
https://xdebug.org/updates#x_3_2_0

Fixes:
 - http://autobuild.buildroot.org/results/092a6d388fc6801c109eb46635e8df80d06a803e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/php-xdebug/php-xdebug.hash | 2 +-
 package/php-xdebug/php-xdebug.mk   | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/php-xdebug/php-xdebug.hash b/package/php-xdebug/php-xdebug.hash
index 72bfac67ce..fa92ee82ed 100644
--- a/package/php-xdebug/php-xdebug.hash
+++ b/package/php-xdebug/php-xdebug.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  7e4f28fc65c8b535de43b6d2ec57429476a6de1d53c4d440a9108ae8d28e01f4  php-xdebug-3.0.4.tar.gz
+sha256  7769b20eecdadf5fbe9f582512c10b394fb575b6f7a8c3a3a82db6883e0032b7  xdebug-3.2.0.tgz
 sha256  ef479ee1a3da3f933e0d046ca8cd0c14601f29b2c0c41cc60c9388546a4e0272  LICENSE
diff --git a/package/php-xdebug/php-xdebug.mk b/package/php-xdebug/php-xdebug.mk
index 18ebc32592..9429d4afee 100644
--- a/package/php-xdebug/php-xdebug.mk
+++ b/package/php-xdebug/php-xdebug.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-PHP_XDEBUG_VERSION = 3.0.4
-PHP_XDEBUG_SITE = $(call github,xdebug,xdebug,$(PHP_XDEBUG_VERSION))
+PHP_XDEBUG_VERSION = 3.2.0
+PHP_XDEBUG_SOURCE = xdebug-$(PHP_XDEBUG_VERSION).tgz
+PHP_XDEBUG_SITE = https://xdebug.org/files
 PHP_XDEBUG_INSTALL_STAGING = YES
 PHP_XDEBUG_LICENSE = Xdebug License (PHP-3.0-like)
 PHP_XDEBUG_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
