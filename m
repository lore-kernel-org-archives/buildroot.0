Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 703AEC4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 16:53:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B50661078
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 16:53:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1B50661078
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D9E6583B46;
	Thu,  5 Aug 2021 16:53:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rzYLrBZPFUmx; Thu,  5 Aug 2021 16:53:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3DEA683B13;
	Thu,  5 Aug 2021 16:53:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F0B7A1C1148
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 16:52:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EC80D40003
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 16:52:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XMU1Eqb44QRd for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 16:52:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C7A79404F2
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 16:52:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id C38F38B85A; Thu,  5 Aug 2021 16:52:40 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 5 Aug 2021 18:46:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 602ff66bf7e85a5962025b6640ced7421b539fb2
X-Git-Newrev: c1e6b82e8db71a602e32acdc4dac7c3c7f69c7e3
X-Patchwork-Hint: ignore
Message-Id: <20210805165240.C38F38B85A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/php: drop mcrypt
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

commit: https://git.buildroot.net/buildroot/commit/?id=c1e6b82e8db71a602e32acdc4dac7c3c7f69c7e3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

mcrypt has been dropped from php since version 7.2.0 and
https://github.com/php/php-src/commit/5a17f632d4c7d936385485a0cb187172f33eb97a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Config.in.legacy       | 6 ++++++
 package/php/Config.ext | 6 ------
 package/php/php.mk     | 5 -----
 3 files changed, 6 insertions(+), 11 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 4e4a464709..54476acf9a 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2021.08"
 
+config BR2_PACKAGE_PHP_EXT_MCRYPT
+	bool "PHP mcrypt extension removed"
+	select BR2_LEGACY
+	help
+	  mcrypt has been removed from php since version 7.2.0.
+
 config BR2_BINUTILS_VERSION_2_34_X
 	bool "binutils 2.34 has been removed"
 	select BR2_LEGACY
diff --git a/package/php/Config.ext b/package/php/Config.ext
index 4dfdb37f87..5da5d8bed9 100644
--- a/package/php/Config.ext
+++ b/package/php/Config.ext
@@ -87,12 +87,6 @@ config BR2_PACKAGE_PHP_EXT_LIBSODIUM
 	help
 	  libsodium support
 
-config BR2_PACKAGE_PHP_EXT_MCRYPT
-	bool "mcrypt"
-	select BR2_PACKAGE_LIBMCRYPT
-	help
-	  mcrypt support
-
 config BR2_PACKAGE_PHP_EXT_OPENSSL
 	bool "openssl"
 	select BR2_PACKAGE_OPENSSL
diff --git a/package/php/php.mk b/package/php/php.mk
index 6780b6a962..a1ad6e3296 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -136,11 +136,6 @@ PHP_CONF_OPTS += --enable-mbstring
 PHP_DEPENDENCIES += oniguruma
 endif
 
-ifeq ($(BR2_PACKAGE_PHP_EXT_MCRYPT),y)
-PHP_CONF_OPTS += --with-mcrypt=$(STAGING_DIR)/usr
-PHP_DEPENDENCIES += libmcrypt
-endif
-
 ifeq ($(BR2_PACKAGE_PHP_EXT_OPENSSL),y)
 PHP_CONF_OPTS += --with-openssl=$(STAGING_DIR)/usr
 PHP_DEPENDENCIES += openssl
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
