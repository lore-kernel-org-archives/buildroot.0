Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ADD2C433EF
	for <buildroot@archiver.kernel.org>; Fri, 22 Apr 2022 16:15:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EBE9A60F30;
	Fri, 22 Apr 2022 16:15:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 815co1v-BKFo; Fri, 22 Apr 2022 16:15:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 16ABE612EE;
	Fri, 22 Apr 2022 16:15:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7C9A41BF842
 for <buildroot@lists.busybox.net>; Fri, 22 Apr 2022 16:15:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 69792829A9
 for <buildroot@lists.busybox.net>; Fri, 22 Apr 2022 16:15:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eZQCAE-da6Oa for <buildroot@lists.busybox.net>;
 Fri, 22 Apr 2022 16:15:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 325EC826FF
 for <buildroot@busybox.net>; Fri, 22 Apr 2022 16:15:34 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id q7so4133032wrm.5
 for <buildroot@busybox.net>; Fri, 22 Apr 2022 09:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CFLUucJCUuNICT3DHVqcPpD9Q1hE1aGBP0wa6lIA60s=;
 b=pBmfforUofo15DGGQWUOUjNC/VOWVfNrK+Suozm0XTxIwB54ta2i8ggMTwNeKfVrHy
 w9SQhw6+cuvg9Eo0I3omyGp8BZf58YeY/vbig5yr6i7B3MrrSWrCRHBmEbn3UoKQMxPl
 NM0lK5vJ2WsMSyudGKzO035VtfGLt0ous7eailGUGVtkpZrMdbLxZHkPPzc4EI8Znt0S
 WLS/bf3gdn1qxFhho/EY5XGekMkJ/aMVd9Y4Wwi8EEP6etpvKjLUuviXNVGD0+4E6eek
 0OmmHi2/Y4wOaTqBU5961NCdS0I0HcIYPNASEODEnRGN8ywYpeq0qP1BqvibaiEY0DZ2
 poyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CFLUucJCUuNICT3DHVqcPpD9Q1hE1aGBP0wa6lIA60s=;
 b=sOrk/qgrHnAl8dj7wNMcAv80JZ0dKFKOJszLO2KIiyYhq9MWpx8t5X174dhBaL+/ob
 sofCtk1s0bIowpH3LSDBlyPUbAOeyjqZSMhRmmkhmPUR+HUjdH4yzRuTIeySNW5SBUNr
 y8YReBJ+NF3dpyyoSsFn0qDyYFzizDT3EvlXLnAd8uiqcggooGLGeXkeapVqM/TEX4/m
 YVoMvrZlNHnFHIsWWawnBlfohO0AW5/9imtd3qLvfOJWkGZCDlfo9ImL9c9ohMNMZtNg
 fupRHfkQVA/2goM6GYAGQ998V082QWBlUXLosaw8JYFMNdXfpUEE+xLWQ6mdQfi5WMU6
 Uesg==
X-Gm-Message-State: AOAM533hI3UeHdmmqs36VlRUk6wvy5r36wjX1sZyv9qiDYxZAU9qv7b2
 ihJV1tKouwPfNMmUE9Fn5eT0E8Dm8Bg=
X-Google-Smtp-Source: ABdhPJzVhJjV1v68T4OkaVll1sl4FT/9Oz1PYCs/4u+GGlKuAC1xtHerPOAFosaM06cOtEeceeljIg==
X-Received: by 2002:adf:fdc8:0:b0:20a:ce84:eb81 with SMTP id
 i8-20020adffdc8000000b0020ace84eb81mr997919wrs.96.1650644132142; 
 Fri, 22 Apr 2022 09:15:32 -0700 (PDT)
Received: from v2021.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 c186-20020a1c35c3000000b0038e6c6fc860sm2010671wma.37.2022.04.22.09.15.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 09:15:31 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Fri, 22 Apr 2022 18:15:07 +0200
Message-Id: <20220422161514.3449177-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/8] package/perl-crypt-openssl-guess: bump to
 version 0.15
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 .../perl-crypt-openssl-guess/perl-crypt-openssl-guess.hash    | 4 ++--
 package/perl-crypt-openssl-guess/perl-crypt-openssl-guess.mk  | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-crypt-openssl-guess/perl-crypt-openssl-guess.hash b/package/perl-crypt-openssl-guess/perl-crypt-openssl-guess.hash
index e6d19cb68..b4795ed3d 100644
--- a/package/perl-crypt-openssl-guess/perl-crypt-openssl-guess.hash
+++ b/package/perl-crypt-openssl-guess/perl-crypt-openssl-guess.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  9e86baf96828a38c967003a5e66f0c39  Crypt-OpenSSL-Guess-0.12.tar.gz
-sha256  0a18d18768cf42b49b15c9dea626199dc74346bbbc76acd3d817b9c1d2bd471d  Crypt-OpenSSL-Guess-0.12.tar.gz
+md5  e07f470dd25023730cf8536e0cefbabd  Crypt-OpenSSL-Guess-0.15.tar.gz
+sha256  1c5033381819fdb4c9087dd291b90ec70e7810d31d57eade9b388eccfd70386d  Crypt-OpenSSL-Guess-0.15.tar.gz
 
 # computed by scancpan
 sha256  5c739f181ce7aa31d739277996ff230067dad39332e5597c0dffd36e5d784072  LICENSE
diff --git a/package/perl-crypt-openssl-guess/perl-crypt-openssl-guess.mk b/package/perl-crypt-openssl-guess/perl-crypt-openssl-guess.mk
index 4f0898cf5..56ff79d84 100644
--- a/package/perl-crypt-openssl-guess/perl-crypt-openssl-guess.mk
+++ b/package/perl-crypt-openssl-guess/perl-crypt-openssl-guess.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_CRYPT_OPENSSL_GUESS_VERSION = 0.12
+PERL_CRYPT_OPENSSL_GUESS_VERSION = 0.15
 PERL_CRYPT_OPENSSL_GUESS_SOURCE = Crypt-OpenSSL-Guess-$(PERL_CRYPT_OPENSSL_GUESS_VERSION).tar.gz
 PERL_CRYPT_OPENSSL_GUESS_SITE = $(BR2_CPAN_MIRROR)/authors/id/A/AK/AKIYM
 PERL_CRYPT_OPENSSL_GUESS_LICENSE = Artistic or GPL-1.0+
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
