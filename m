Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B73FACFC53E
	for <buildroot@archiver.kernel.org>; Sat, 22 Nov 2025 16:09:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4934060D61;
	Sat, 22 Nov 2025 16:09:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n_iDWTkRJjAj; Sat, 22 Nov 2025 16:09:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 86A4F60743
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 86A4F60743;
	Sat, 22 Nov 2025 16:09:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 098FF34E
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 16:09:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F0200404C5
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 16:09:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FKLSCIDEcl1X for <buildroot@buildroot.org>;
 Sat, 22 Nov 2025 16:09:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0A00E40382
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0A00E40382
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 16:09:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0365585DED; Sat, 22 Nov 2025 16:09:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 22 Nov 2025 16:42:45 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ce861801c08da9f639d1d64d807ec7e3ece838fd
X-Git-Newrev: 7ba8dbee211666577b626b42dc053fc55657d5b8
X-Patchwork-Hint: ignore
Message-Id: <20251122160952.0365585DED@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/php-apcu: bump version to 5.1.27
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

commit: https://git.buildroot.net/buildroot/commit/?id=7ba8dbee211666577b626b42dc053fc55657d5b8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog: https://pecl.php.net/package-changelog.php?package=APCu

Since Buildroot commit [1] (package/php: bump version to 8.4.13)
php-acpu is failing to build with errors such as:

    arm-linux-gcc.br_real: error:  -DZEND_COMPILE_DL_EXT=1: linker input file not found: No such file or directory

This commits fixes the issue.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/12104755570

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/a9e5cf6ac2cb7ba62d23c842899b3f7816eca14c

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Reviewed-by: Herve Codina <herve.codina@bootlin.com>
[Julien: add commit log info about build failure]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/php-apcu/php-apcu.hash | 2 +-
 package/php-apcu/php-apcu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php-apcu/php-apcu.hash b/package/php-apcu/php-apcu.hash
index 4a5eadf803..073d1ae6e9 100644
--- a/package/php-apcu/php-apcu.hash
+++ b/package/php-apcu/php-apcu.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  010a0d8fd112e1ed7a52a356191da3696a6b76319423f7b0dfdeaeeafcb41a1e  apcu-5.1.22.tgz
+sha256  1a2c37fcad2ae2a1aea779cd6ca9353d8b38d4e27dde2327c52ff3892dfadb3f  apcu-5.1.27.tgz
 sha256  ecc8b74820c32fb82ddee80446205408585d75d1632ac959fb3cdf8eaf3877b5  LICENSE
diff --git a/package/php-apcu/php-apcu.mk b/package/php-apcu/php-apcu.mk
index b8eeb9de7c..ce640c9c03 100644
--- a/package/php-apcu/php-apcu.mk
+++ b/package/php-apcu/php-apcu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_APCU_VERSION = 5.1.22
+PHP_APCU_VERSION = 5.1.27
 PHP_APCU_SITE = http://pecl.php.net/get
 PHP_APCU_SOURCE = apcu-$(PHP_APCU_VERSION).tgz
 PHP_APCU_LICENSE = PHP-3.01
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
