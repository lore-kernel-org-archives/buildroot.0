Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92E3CC433F5
	for <buildroot@archiver.kernel.org>; Fri, 21 Jan 2022 19:00:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 473AD60F07;
	Fri, 21 Jan 2022 19:00:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WYaTxB76N9rj; Fri, 21 Jan 2022 19:00:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 84E8460FD8;
	Fri, 21 Jan 2022 19:00:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 139A01BF2FF
 for <buildroot@lists.busybox.net>; Fri, 21 Jan 2022 18:58:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 933B481383
 for <buildroot@lists.busybox.net>; Fri, 21 Jan 2022 18:58:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wFScPT2NFXyL for <buildroot@lists.busybox.net>;
 Fri, 21 Jan 2022 18:58:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 28A9E81330
 for <buildroot@busybox.net>; Fri, 21 Jan 2022 18:58:57 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id v6so1354099wra.8
 for <buildroot@busybox.net>; Fri, 21 Jan 2022 10:58:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZXEKIFPVzRicnMDju2SDsCvNNp/4qNGZukXuyrhbksY=;
 b=aGIUf8vbhz9vVpNWSvqAgbFooy5g8pN8qMHjzHemAcMZdWV5Sgcl+1MSzWskykOUjK
 nZyAyFvvbGy38wCWWwHFbTd7+clSzyWbs1pJJ+q3NOk9TKzvJdx1ybKN0P//9C2Coti9
 xdydqSOoKhUd5sW2mfNKezcqPzDhjwybve9VgzpJu6Oj4pRp5qaOiY9UYY2QmSb3Efqk
 IiNLhAdo6kwMuKRPMhqCuuTxKZajH5iUAbCttKJUKzc4rbzPiK7aacNEmkwyes2Rj6I/
 SO4p1lmXNVChi/UroOIG0wNsjakluz9gywnKzFLQxZVDCgRrNJw3cZFobLwRZO14nnEY
 8kGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZXEKIFPVzRicnMDju2SDsCvNNp/4qNGZukXuyrhbksY=;
 b=PQBKo5xZDBJFs8WVDSFRiDwbPWbkw64q8957YodSyAVQDKwRFYVAZY5vExWbvRRxd/
 dRRWLIxtWCTVKKPX9YIIPNKvorA9VNt6b/OoqasXl+iEDMSUO6EG+B8l62s85R/1pYDV
 W1ii4aYvG5//XaTpefOopf8bWSIS2zHgkFu8aB0iQdEbciuwSJoSX/dtqyMTWdiRRfur
 SjhjwBZcgHKoCqtfIf49N2pt/1M+EyBeZLwJvR1mCYhaokvAu8qA/fnQmp72TxBGQscp
 S9rixeMYldkphGstJVLuoiOirvkvUHUMGreHmSZtGryJSLPwOtudJU+Kh25dJi8CIPc1
 9rvA==
X-Gm-Message-State: AOAM530YquvYk8twgeS1DfH2ZicAVaDZSXTx5d61OZ/SmEG2JoZNmfLi
 h6WWsk5ReI8TXxGGdow2J+qb6Hu7z4o=
X-Google-Smtp-Source: ABdhPJwev2e5D5mSTeaEpYorvX/JuoRZb8lE1UL2ZKr2UCo57n8ARwtFQRd7cxpKGqpjMosKQ2tyiA==
X-Received: by 2002:adf:f74d:: with SMTP id z13mr5254901wrp.77.1642791535485; 
 Fri, 21 Jan 2022 10:58:55 -0800 (PST)
Received: from v2021.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id d2sm6165681wru.40.2022.01.21.10.58.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jan 2022 10:58:55 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Fri, 21 Jan 2022 13:38:59 +0100
Message-Id: <20220121123859.754653-8-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220121123859.754653-1-francois.perrad@gadz.org>
References: <20220121123859.754653-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 8/8] package/perl-uri: bump to version 5.10
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
 package/perl-uri/perl-uri.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-uri/perl-uri.hash b/package/perl-uri/perl-uri.hash
index 578beed9b..e7e272c63 100644
--- a/package/perl-uri/perl-uri.hash
+++ b/package/perl-uri/perl-uri.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  bd66b0c620d076c4b0de9507b5f1fbdf  URI-5.09.tar.gz
-sha256  03e63ada499d2645c435a57551f041f3943970492baa3b3338246dab6f1fae0a  URI-5.09.tar.gz
+md5  2a00d3dbf891df4256d251382aefd9b9  URI-5.10.tar.gz
+sha256  16325d5e308c7b7ab623d1bf944e1354c5f2245afcfadb8eed1e2cae9a0bd0b5  URI-5.10.tar.gz
 
 # computed by scancpan
-sha256  65cd6f88516a30f56fd4e0080fb78ea69424fc89067470dc994e4abfba08664e  LICENSE
+sha256  d4f0b7a8771dcb1eee79a38c2e466eb997e23565a6687dd1900a2027eabe12a0  LICENSE
diff --git a/package/perl-uri/perl-uri.mk b/package/perl-uri/perl-uri.mk
index d588e8205..d451bc5d6 100644
--- a/package/perl-uri/perl-uri.mk
+++ b/package/perl-uri/perl-uri.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_URI_VERSION = 5.09
+PERL_URI_VERSION = 5.10
 PERL_URI_SOURCE = URI-$(PERL_URI_VERSION).tar.gz
 PERL_URI_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
 PERL_URI_LICENSE = Artistic or GPL-1.0+
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
