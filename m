Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4497FC433F5
	for <buildroot@archiver.kernel.org>; Fri, 21 Jan 2022 18:59:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DE5214015F;
	Fri, 21 Jan 2022 18:59:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V85OgB5IgbBx; Fri, 21 Jan 2022 18:59:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D839440114;
	Fri, 21 Jan 2022 18:59:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2B31F1BF2FF
 for <buildroot@lists.busybox.net>; Fri, 21 Jan 2022 18:58:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 547C58125E
 for <buildroot@lists.busybox.net>; Fri, 21 Jan 2022 18:58:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ekDn6umElesX for <buildroot@lists.busybox.net>;
 Fri, 21 Jan 2022 18:58:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 83B0D8133F
 for <buildroot@busybox.net>; Fri, 21 Jan 2022 18:58:55 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 ay14-20020a05600c1e0e00b0034d7bef1b5dso23251476wmb.3
 for <buildroot@busybox.net>; Fri, 21 Jan 2022 10:58:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DJZ9h8EbpCsGLOIcHCJ2aBAouCcbv+WJlPyi19y2jtY=;
 b=DJZHClQ+G/14GQiCMc1CZPQ8MRWmmNnMVVITWTw5WWAsx6Xzqq/k57nOLO5vyCCWR6
 4jrz1aIqpfhI+wLknYDj+znSBPx4ZqCqx4D/Q1bP5dcxoHofyPMzJXcQwnV1NB/UO+9Q
 0AGMwYafrwA1CwI5fQbMCgHnHVi7ALR3V6TghdOCJWhsytHUPjXU66qEmHTVZuQjRMav
 uTmATMkRdX2jTCzWBDOOc3yt9/7lC2kR4T9cT+IgZ24agEK7qwKTpL2I5N/19JyewNuR
 2gl5HRUF6K9TjV/X7xjlicjos/1wO6gHiM6ftU+Kou5O4Brr6NYYooBD4yLtNH9ZD62P
 u5qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DJZ9h8EbpCsGLOIcHCJ2aBAouCcbv+WJlPyi19y2jtY=;
 b=nnVMCaTNvobUC6iP/kAeD5tcPNQL/lyt/shPiQ74GBxOVWIBOKzAJMKXW+inJJGM17
 0wBYN0gqSiwKXldP1xAS58I5BDBW7pPGOq47CFA+r0ZJ+QSpGnS4dg8cmspCrQs8Nomj
 GGGillM3b4RLR/auwvTP03N4d/RkXQo0eORqCHIqgueuacPB3SnLF+xKuQeEOCAJq31Q
 mFh+Ny3+T3jsdxvKoj4m2CG8peDmUCRagQFApikRqW6ibxW8AwcleUA26sQZqwH/TP6E
 yz0zAYrra2DetPyXs/kcDveb3G63grhrAFKHFKoGCIBol5gmuCREAzNHmiMzDCpLLJAC
 GckA==
X-Gm-Message-State: AOAM530pmWnnGJWUvtPTs1/H2Ce4qPXrm67wt6I4mhBfjIrn7OlkNlTD
 /xe2EOk38S9I1DXEj+98ajqnvr9CbRE=
X-Google-Smtp-Source: ABdhPJwLZAJBSOgotq/CBUGellbuyD5pXOYIJkccGt7tTgpvXT9WLiUOoyZ/z6bR5FSuxw+pypUORQ==
X-Received: by 2002:a05:600c:3d85:: with SMTP id
 bi5mr1934529wmb.62.1642791533842; 
 Fri, 21 Jan 2022 10:58:53 -0800 (PST)
Received: from v2021.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id d2sm6165681wru.40.2022.01.21.10.58.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jan 2022 10:58:53 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Fri, 21 Jan 2022 13:38:57 +0100
Message-Id: <20220121123859.754653-6-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220121123859.754653-1-francois.perrad@gadz.org>
References: <20220121123859.754653-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 6/8] package/perl-path-tiny: bump to version
 0.122
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
 package/perl-path-tiny/perl-path-tiny.hash | 4 ++--
 package/perl-path-tiny/perl-path-tiny.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-path-tiny/perl-path-tiny.hash b/package/perl-path-tiny/perl-path-tiny.hash
index 6899d5c6b..16f1a9a22 100644
--- a/package/perl-path-tiny/perl-path-tiny.hash
+++ b/package/perl-path-tiny/perl-path-tiny.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  046d14dde6e3568aee5085487dd4769e  Path-Tiny-0.120.tar.gz
-sha256  66a1164981d449da46cc88383fe37f9e352e87e9570bfb960e43fe8ff016ee1b  Path-Tiny-0.120.tar.gz
+md5  f746d8da5d049a5523b1880666bb0992  Path-Tiny-0.122.tar.gz
+sha256  4bc6f76d0548ccd8b38cb66291a885bf0de453d0167562c7b82e8861afdcfb7c  Path-Tiny-0.122.tar.gz
 
 # computed by scancpan
 sha256  c1a19c0d83f668a784640c0b41e024f37b182ad38011b170f9200123e57f6070  LICENSE
diff --git a/package/perl-path-tiny/perl-path-tiny.mk b/package/perl-path-tiny/perl-path-tiny.mk
index cd4c3bc49..310feed98 100644
--- a/package/perl-path-tiny/perl-path-tiny.mk
+++ b/package/perl-path-tiny/perl-path-tiny.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_PATH_TINY_VERSION = 0.120
+PERL_PATH_TINY_VERSION = 0.122
 PERL_PATH_TINY_SOURCE = Path-Tiny-$(PERL_PATH_TINY_VERSION).tar.gz
 PERL_PATH_TINY_SITE = $(BR2_CPAN_MIRROR)/authors/id/D/DA/DAGOLDEN
 PERL_PATH_TINY_LICENSE = Apache-2.0
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
