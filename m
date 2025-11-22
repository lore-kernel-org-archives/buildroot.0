Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9038ECFC53E
	for <buildroot@archiver.kernel.org>; Sat, 22 Nov 2025 16:09:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E3C9606A7;
	Sat, 22 Nov 2025 16:09:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tbuc9jZ3lTxE; Sat, 22 Nov 2025 16:09:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 720E4606AA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 720E4606AA;
	Sat, 22 Nov 2025 16:09:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 25796351
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 16:09:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 16C87404CF
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 16:09:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0L8ZAhreFFJh for <buildroot@buildroot.org>;
 Sat, 22 Nov 2025 16:09:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1C037404C5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1C037404C5
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 16:09:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0CB1785DF0; Sat, 22 Nov 2025 16:09:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 22 Nov 2025 17:00:01 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7ba8dbee211666577b626b42dc053fc55657d5b8
X-Git-Newrev: bfa0e6e7f79799c4349e641360aadec76ed38818
X-Patchwork-Hint: ignore
Message-Id: <20251122160952.0CB1785DF0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/php-xdebug: bump version to 3.4.7
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
Content-Type: multipart/mixed; boundary="===============7020969714355093785=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7020969714355093785==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=bfa0e6e7f79799c4349e641360aadec76ed38818
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog: https://xdebug.org/updates#x_3_4_7

Since Buildroot commit [1] (package/php: bump version to 8.4.13)
php-xdebug is failing to build with error:

    /buildroot/output/build/php-xdebug-3.3.1/src/coverage/code_coverage.c: In function ‘xdebug_find_jumps’:
    /buildroot/output/build/php-xdebug-3.3.1/src/coverage/code_coverage.c:349:34: error: ‘ZEND_EXIT’ undeclared (first use in this function); did you mean ‘ZEND_GINIT’?

This commits fixes the issue.

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/a9e5cf6ac2cb7ba62d23c842899b3f7816eca14c

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Julien: add commit log info about build failure]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/php-xdebug/php-xdebug.hash | 2 +-
 package/php-xdebug/php-xdebug.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php-xdebug/php-xdebug.hash b/package/php-xdebug/php-xdebug.hash
index 251b79ab77..9470a7d4e8 100644
--- a/package/php-xdebug/php-xdebug.hash
+++ b/package/php-xdebug/php-xdebug.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  4eb4ee270bbcc5f14195c38f6ee58580e007cf4886ce32e11430318ab5bc2315  xdebug-3.3.1.tgz
+sha256  7592923501e3fdb9741ad35b90e08fc6b3c5dd31eadc4c83b7b3c9dda0627b24  xdebug-3.4.7.tgz
 sha256  bc2aee27f3f0806be39e329d284ddbbfb14602a49af261df305dd6122d988eb0  LICENSE
diff --git a/package/php-xdebug/php-xdebug.mk b/package/php-xdebug/php-xdebug.mk
index 771b96534a..272d331f7b 100644
--- a/package/php-xdebug/php-xdebug.mk
+++ b/package/php-xdebug/php-xdebug.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_XDEBUG_VERSION = 3.3.1
+PHP_XDEBUG_VERSION = 3.4.7
 PHP_XDEBUG_SOURCE = xdebug-$(PHP_XDEBUG_VERSION).tgz
 PHP_XDEBUG_SITE = https://xdebug.org/files
 PHP_XDEBUG_INSTALL_STAGING = YES

--===============7020969714355093785==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7020969714355093785==--
