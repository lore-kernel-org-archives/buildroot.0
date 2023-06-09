Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5AF2C7EE2E
	for <buildroot@archiver.kernel.org>; Fri,  9 Jun 2023 16:21:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 67696419FF;
	Fri,  9 Jun 2023 16:21:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 67696419FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id enOjDjbuU0-j; Fri,  9 Jun 2023 16:21:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9338B41A1C;
	Fri,  9 Jun 2023 16:21:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9338B41A1C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8EF451BF2AA
 for <buildroot@lists.busybox.net>; Fri,  9 Jun 2023 16:20:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 739E983EBC
 for <buildroot@lists.busybox.net>; Fri,  9 Jun 2023 16:20:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 739E983EBC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2Z8k09-1lZhN for <buildroot@lists.busybox.net>;
 Fri,  9 Jun 2023 16:20:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 66F3084156
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 66F3084156
 for <buildroot@busybox.net>; Fri,  9 Jun 2023 16:20:32 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3f78a32266bso19273645e9.3
 for <buildroot@busybox.net>; Fri, 09 Jun 2023 09:20:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686327630; x=1688919630;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bOjEXS0myY6fIEoZTQ8pjgZHSt6ACu91JyqrT6ArMUU=;
 b=ll2p89C22rHvaA+qcM7u/fU4IwwAnvI3mKNoU8eGqA0l6zYYssfSGYcwiz/E5We3NL
 lMAi0jVhha/4MFUoXjUtFW0gnQIWu0fjoqtUrp/32Bm/DTFul59d2DLgnAFMr29SCsay
 lWpB5Wwh/WNDvpBinopYchA3e+rABey6G40nyMrLROOoF8R6Y2hMdV806TVJiLxplggT
 4Pln5jtrn3wzyYEK81TiYiHgTOl8sc+RXq0sbD8VI4MIS3H88VWWhbX/RLWBhphSSloX
 lkmC4M+jAbLvT5lBjKi9Xpehc19qBFr0EzLD0f9k63YwK6JJZBupwO3ZqGlF0OCGgCJ2
 G2oA==
X-Gm-Message-State: AC+VfDzUd2KAK/VB3ng24pJ9N9BWDQhkOLIjjW94Yu+7RHGyyrM5cdwj
 KPUYe5EpHEIvaayqLA95rxDUDqAdaOs=
X-Google-Smtp-Source: ACHHUZ79j5IxP/F8IblcCUt47wR97GRrEvDZ2f2c02IEQ8cHld4o/717oHAfYr+c5IJjT39JRSm1IA==
X-Received: by 2002:a05:600c:2116:b0:3f6:a44:73bb with SMTP id
 u22-20020a05600c211600b003f60a4473bbmr1663015wml.8.1686327630511; 
 Fri, 09 Jun 2023 09:20:30 -0700 (PDT)
Received: from vm.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 x19-20020a1c7c13000000b003f7aad8c160sm3141044wmc.11.2023.06.09.09.20.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jun 2023 09:20:30 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Fri,  9 Jun 2023 18:20:18 +0200
Message-Id: <20230609162018.1231615-8-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230609162018.1231615-1-francois.perrad@gadz.org>
References: <20230609162018.1231615-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686327630; x=1688919630;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bOjEXS0myY6fIEoZTQ8pjgZHSt6ACu91JyqrT6ArMUU=;
 b=DKFByrq7XD85iwr1I7AYzy9LjtG0UTAnyycBHJBjgW7T/Fcgqlca0vRvuuqbVk44mJ
 P2HNcin+0kKSkzZhxunyW6/kIIEmiO1u8Y+CmqeSl8X5b6mv5JJA3Lb8N3idB1eHE/4R
 PWABJP7cItyqNm0Fl8uuxC5IwansNFa2v/DyczAhF/aO04rdlKj4FZpvLz6cwY+BzKsM
 G4KuBZX+WCkYEj4lk4ga+M+wyGnVIkHUWluD14Wr0phSaIpDYOwz4Bfqsj5+PTlrKXrL
 bEcU/qVmDHpU6wZL8Irs4jn5ggaE9MPfNlXj5KqwZdYfW6AN8zRx5hqA5/tN9Hm9A4b6
 gxAw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=DKFByrq7
Subject: [Buildroot] [PATCH 8/8] package/perl-uri: bump to version 5.19
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
 package/perl-uri/perl-uri.hash | 6 +++---
 package/perl-uri/perl-uri.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/perl-uri/perl-uri.hash b/package/perl-uri/perl-uri.hash
index daf043347..a428b7c56 100644
--- a/package/perl-uri/perl-uri.hash
+++ b/package/perl-uri/perl-uri.hash
@@ -1,6 +1,6 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-md5  63675c429cfb1df73d7d21a9302e1000  URI-5.17.tar.gz
-sha256  5f7e42b769cb27499113cfae4b786c37d49e7c7d32dbb469602cd808308568f8  URI-5.17.tar.gz
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  3afa2a27cd215d88c3301087f7b150c1  URI-5.19.tar.gz
+sha256  8fed5f819905c8a8e18f4447034322d042c3536b43c13ac1f09ba92e1a50a394  URI-5.19.tar.gz
 
 # computed by scancpan
 sha256  d4f0b7a8771dcb1eee79a38c2e466eb997e23565a6687dd1900a2027eabe12a0  LICENSE
diff --git a/package/perl-uri/perl-uri.mk b/package/perl-uri/perl-uri.mk
index d4bfcb44e..a7fab863a 100644
--- a/package/perl-uri/perl-uri.mk
+++ b/package/perl-uri/perl-uri.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PERL_URI_VERSION = 5.17
+PERL_URI_VERSION = 5.19
 PERL_URI_SOURCE = URI-$(PERL_URI_VERSION).tar.gz
-PERL_URI_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
+PERL_URI_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SI/SIMBABQUE
 PERL_URI_LICENSE = Artistic or GPL-1.0+
 PERL_URI_LICENSE_FILES = LICENSE
 PERL_URI_DISTNAME = URI
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
