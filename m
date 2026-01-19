Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0A0FD2ECEC
	for <buildroot@archiver.kernel.org>; Mon, 19 Jan 2026 20:56:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 293C7841D5;
	Mon, 19 Jan 2026 20:56:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jQOw3eItwR51; Mon, 19 Jan 2026 20:56:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 41268841C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768856182;
	bh=yOvfYli/rZPmMdcD7UXlrN9yt/O9BNA9gKm03t2N/4c=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ENuFs+lZxekvPuic8RCXzYgHCZh1QVFxGCSZOCB+yZE/jHUQ5okIASOMmwWYrvUDY
	 YnRJWaC+hAoXUbPp53vKjTpxJv8mHODdiV7AGp9xjBKLzn/5UOkRUORFDYvYtsmZwM
	 vru0+RwEgNJGHiH5v0yJYrmmcHpq+C4iq2fyBtdKSBhPlIU8Ly8QPH36fyRNeULqes
	 KKGvwN+lg8n5Fc7tazucNZ4y+dcla9BedKHbf0IMmmhs25VCuWKtvlEc7AP+v7xgkQ
	 gS+K6TOs5paSYqu/3NhpvR4dFIr3DlUz6XGHeKH3CLjuYgZo3tvRe7ZfTBlEiPhTwE
	 JQhUEM4Vxphmg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 41268841C7;
	Mon, 19 Jan 2026 20:56:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8033834D
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 20:56:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 64D0B404D9
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 20:56:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X-jW2hrWnG9i for <buildroot@buildroot.org>;
 Mon, 19 Jan 2026 20:56:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA5664048C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AA5664048C
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 20:56:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 981B9886C6; Mon, 19 Jan 2026 20:56:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 19 Jan 2026 21:20:32 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3e542f87e44574441b504fa2ecec284f55d25597
X-Git-Newrev: 1e02c54873d564c2bec56364ad380fa984d9ed81
X-Patchwork-Hint: ignore
Message-Id: <20260119205617.981B9886C6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/php-imagick: bump version to 3.8.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=1e02c54873d564c2bec56364ad380fa984d9ed81
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://pecl.php.net/package-changelog.php?package=imagick&release=3.8.1

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/php-imagick/php-imagick.hash | 2 +-
 package/php-imagick/php-imagick.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php-imagick/php-imagick.hash b/package/php-imagick/php-imagick.hash
index f6091c6b7e..fe6a80a6d2 100644
--- a/package/php-imagick/php-imagick.hash
+++ b/package/php-imagick/php-imagick.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  bda67461c854f20d6105782b769c524fc37388b75d4481d951644d2167ffeec6  imagick-3.8.0.tgz
+sha256  3a3587c0a524c17d0dad9673a160b90cd776e836838474e173b549ed864352ee  imagick-3.8.1.tgz
 sha256  b6e00df9cb3b91977c0d64a7c4db48cb6f5041f6eeda6583c236775f70a35b78  LICENSE
diff --git a/package/php-imagick/php-imagick.mk b/package/php-imagick/php-imagick.mk
index 0223b6ae93..d1ff69de6f 100644
--- a/package/php-imagick/php-imagick.mk
+++ b/package/php-imagick/php-imagick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_IMAGICK_VERSION = 3.8.0
+PHP_IMAGICK_VERSION = 3.8.1
 PHP_IMAGICK_SOURCE = imagick-$(PHP_IMAGICK_VERSION).tgz
 PHP_IMAGICK_SITE = http://pecl.php.net/get
 PHP_IMAGICK_CONF_OPTS = --with-php-config=$(STAGING_DIR)/usr/bin/php-config \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
