Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E84FC433EF
	for <buildroot@archiver.kernel.org>; Fri, 22 Apr 2022 16:15:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4A1C5404F3;
	Fri, 22 Apr 2022 16:15:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I0LZjY2IX3Yu; Fri, 22 Apr 2022 16:15:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DF8C640AD5;
	Fri, 22 Apr 2022 16:15:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 15BDF1BF842
 for <buildroot@lists.busybox.net>; Fri, 22 Apr 2022 16:15:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DEEA4826FF
 for <buildroot@lists.busybox.net>; Fri, 22 Apr 2022 16:15:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Dd_LEjFbtxCj for <buildroot@lists.busybox.net>;
 Fri, 22 Apr 2022 16:15:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C100582796
 for <buildroot@busybox.net>; Fri, 22 Apr 2022 16:15:34 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id u3so11785987wrg.3
 for <buildroot@busybox.net>; Fri, 22 Apr 2022 09:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gEaH9aWUR9O13uTVDKxbj+FjbWtNfn6T00UYl1BcFFU=;
 b=oImwi9nJSG67Om64F3eaAkaXzIESkt8jK95L8nq4aTTPxmnnm4UNj6Oi04JFymu720
 98CjnTXIQIMvseWNslUBIMd6S6ebtJvlS747tkp23eq1fUJN7SqIXXl4gmPhTR0CPvI+
 JEO65RktvVG6DIrKmZq9qv4uY9qr5jzZaeWY/dp5iDCZ8UQg2WqIf5aMr4VWNfA3KPHo
 9vzmo5aNA78WkgEUvx4xW2eTHZE9KKMtEbLOpsrfE0zCsANkr4Qzwg9lHVlQoNV2oPdO
 i49lXsWFjGyDtsxnGG9z5UlT7f+Yrx5X4DPR9Ux3M2oTboJ8sJ/TXpQaCgE1b6FIlV7V
 g/zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gEaH9aWUR9O13uTVDKxbj+FjbWtNfn6T00UYl1BcFFU=;
 b=h67PQxiEgBtg35zAN8dYKXkh0kFsTaRPaCidAswCNtEPuqcUDTba8DmZv+57iBn0Hp
 1Pd5ZqOUs8oEMxajYm41m89X09DmcVifILFZ0M7BCy+qFuVDcQqWAa+ozMG679ZAbvDN
 JLulRGganfhPusDcAXP0vUdJMRKX57zIv3YxJ2NAOPTPQj/+aGf7LCNHZ55vnvG71iy2
 AT+ugqZcDw29vsWRKyZjVi+ayO3wtFRMBbyOpvTQR3GlfBcu1t3KuBYnrK/tMdV3fFf3
 hViKy4tbX+mJZB6LEcnF7ggH4eJlIj7RSngW9o/j37Xz+nlVAi2LVE++9j3RItF9hTjk
 iZSg==
X-Gm-Message-State: AOAM531dXBV3JTv8cylAvVpOBmFxEYw9b8Jxmc83QonaPJbN2chfoRig
 tTvaLWJUFtVJ0/AtJ/zks/8hF/PHzL4=
X-Google-Smtp-Source: ABdhPJwzUREwTXD4/D7RVS5x4ZhaqYQMMM9Lnulu2k6c9Dh1p/ortn46pw97bx8pNAZHdioL58sAHw==
X-Received: by 2002:adf:e2cb:0:b0:203:7564:1076 with SMTP id
 d11-20020adfe2cb000000b0020375641076mr4373941wrj.199.1650644132982; 
 Fri, 22 Apr 2022 09:15:32 -0700 (PDT)
Received: from v2021.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 c186-20020a1c35c3000000b0038e6c6fc860sm2010671wma.37.2022.04.22.09.15.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 09:15:32 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Fri, 22 Apr 2022 18:15:08 +0200
Message-Id: <20220422161514.3449177-2-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220422161514.3449177-1-francois.perrad@gadz.org>
References: <20220422161514.3449177-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/8] package/perl-file-listing: bump to version
 6.15
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
 package/perl-file-listing/perl-file-listing.hash | 6 +++---
 package/perl-file-listing/perl-file-listing.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-file-listing/perl-file-listing.hash b/package/perl-file-listing/perl-file-listing.hash
index 235896571..cb52c127c 100644
--- a/package/perl-file-listing/perl-file-listing.hash
+++ b/package/perl-file-listing/perl-file-listing.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  cf60a79563185391831613178a79b4cd  File-Listing-6.14.tar.gz
-sha256  15b3a4871e23164a36f226381b74d450af41f12cc94985f592a669fcac7b48ff  File-Listing-6.14.tar.gz
+md5  8ba34641a6c5a2ec1b0bf7064f68c535  File-Listing-6.15.tar.gz
+sha256  46c4fb9f9eb9635805e26b7ea55b54455e47302758a10ed2a0b92f392713770c  File-Listing-6.15.tar.gz
 
 # computed by scancpan
-sha256  7f0ccec295e6d7d2be1439cedd7caf6cc6247191f4c10ac56d91ee9bc265ba02  LICENSE
+sha256  287e6f0fdf2db790a24975b492cde64b210c16af7137f44373cbd03fcf844212  LICENSE
diff --git a/package/perl-file-listing/perl-file-listing.mk b/package/perl-file-listing/perl-file-listing.mk
index 61bbc18eb..c8584ffa8 100644
--- a/package/perl-file-listing/perl-file-listing.mk
+++ b/package/perl-file-listing/perl-file-listing.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_FILE_LISTING_VERSION = 6.14
+PERL_FILE_LISTING_VERSION = 6.15
 PERL_FILE_LISTING_SOURCE = File-Listing-$(PERL_FILE_LISTING_VERSION).tar.gz
 PERL_FILE_LISTING_SITE = $(BR2_CPAN_MIRROR)/authors/id/P/PL/PLICEASE
 PERL_FILE_LISTING_LICENSE = Artistic or GPL-1.0+
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
