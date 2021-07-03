Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D04E0C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:02:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 77BF16103C
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:02:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 77BF16103C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C855423A0;
	Wed,  4 Aug 2021 00:02:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 55XJ03AJ0gfg; Wed,  4 Aug 2021 00:02:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9EB3142374;
	Wed,  4 Aug 2021 00:02:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4E58F1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:14:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E0EA640E4A
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EzrUli-C2gGI for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CB8EF4068C
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 2BE97860D3; Tue,  3 Aug 2021 21:09:58 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 3 Jul 2021 21:56:45 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: fdeaec513cc374a655b97d1f6bdb24bec0e74be9
X-Git-Newrev: 20ecd9c94222ef20b7804084acefb472b8e5deaf
X-Patchwork-Hint: ignore
Message-Id: <20210803210958.2BE97860D3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/php-gnupg: bump
 version to 1.5.0
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=20ecd9c94222ef20b7804084acefb472b8e5deaf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Other changes:
  - Change --with-gnupg=$(STAGING_DIR)/usr/include to
  --with-gnupg=$(STAGING_DIR)/usr as the make system appends /include to the
    gnupgp path now.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/php-gnupg/php-gnupg.hash | 2 +-
 package/php-gnupg/php-gnupg.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/php-gnupg/php-gnupg.hash b/package/php-gnupg/php-gnupg.hash
index 8d142cdaaf..99ffe87f46 100644
--- a/package/php-gnupg/php-gnupg.hash
+++ b/package/php-gnupg/php-gnupg.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  35e16bee11345a7d6bf57bea3cadf45e371ad1ed4e0218b0c06f6f637e4e1772  gnupg-1.4.0.tgz
+sha256  d4f5f79aa483908f3df08e5b343ea3593c6d725b9ed2103e30242627659e0a64  gnupg-1.5.0.tgz
 sha256  da1136d4d9326317cbd320dadddf7e9b4b4edffd973eb083cb7b9754fb6a15d9  LICENSE
diff --git a/package/php-gnupg/php-gnupg.mk b/package/php-gnupg/php-gnupg.mk
index ae0a781154..a89f0978af 100644
--- a/package/php-gnupg/php-gnupg.mk
+++ b/package/php-gnupg/php-gnupg.mk
@@ -4,13 +4,13 @@
 #
 ################################################################################
 
-PHP_GNUPG_VERSION = 1.4.0
+PHP_GNUPG_VERSION = 1.5.0
 PHP_GNUPG_SOURCE = gnupg-$(PHP_GNUPG_VERSION).tgz
 PHP_GNUPG_SITE = https://pecl.php.net/get
 # phpize does the autoconf magic
 PHP_GNUPG_DEPENDENCIES = php libgpgme host-autoconf host-pkgconf
 PHP_GNUPG_CONF_OPTS = --with-php-config=$(STAGING_DIR)/usr/bin/php-config \
-	--with-gnupg=$(STAGING_DIR)/usr/include --with-gpg=/usr/bin/gpg
+	--with-gnupg=$(STAGING_DIR)/usr --with-gpg=/usr/bin/gpg
 PHP_GNUPG_LICENSE = BSD-2-Clause
 PHP_GNUPG_LICENSE_FILES = LICENSE
 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
