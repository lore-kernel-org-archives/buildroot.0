Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76D2CECE579
	for <buildroot@archiver.kernel.org>; Mon,  9 Sep 2024 16:28:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2960980EC5;
	Mon,  9 Sep 2024 16:28:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YFeSRcW-nWrJ; Mon,  9 Sep 2024 16:28:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E84B181010
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E84B181010;
	Mon,  9 Sep 2024 16:28:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 260AF1BF345
 for <buildroot@lists.busybox.net>; Mon,  9 Sep 2024 16:28:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BEDA280FA6
 for <buildroot@lists.busybox.net>; Mon,  9 Sep 2024 16:28:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o7KMGlBMTN13 for <buildroot@lists.busybox.net>;
 Mon,  9 Sep 2024 16:28:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CD76D80EA7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD76D80EA7
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CD76D80EA7
 for <buildroot@busybox.net>; Mon,  9 Sep 2024 16:28:03 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-42cbc38a997so2857935e9.1
 for <buildroot@busybox.net>; Mon, 09 Sep 2024 09:28:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725899282; x=1726504082;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vJ4a0R7czxB7cAL/Lj/jMaAoTR6w2JbN3HoLSL+c+QU=;
 b=XJQC9iu/+5MEa24hAoN6s9uJEfVfOfIVrZ26/AQi5dpOi49azQVOvlXGMiVCQwW1D6
 vSlMH7mEz/IrYKYgCLaH1XB147nB0n1eETbK4GGDJ5rKNBts/osjnbEpEmImH4OpXqZM
 lBV7ullrzVr1O8k8tjypkcFZMYsLX5hKgk4qxV9fOvi80rke3eit0bLjvnhm8JpfOABo
 fhoqE8mI9eYULrnxePZBj3j+glB0Vyip5DBsmXF9/kX71QZItb7bHhzcmRDhvyU1p4SF
 F+My1Fo6FOiasdy1hfL61GaOCjMIGvvRQ3LsZm6b27nO2cZSi6y/plp+v0q9WUHJwAgd
 myKg==
X-Gm-Message-State: AOJu0Yzn/xALPVH/mlELdmS+sEdeyFKGENyg+OQx6BIEkcfeZsdQBPkI
 1Ey9PcMZLChVK7ssMtJND0fz1ZAqX5J6B8qIZKgax6+3+Hgvrh6HiC6yDkTauAWPuhxEnqeGn4A
 ukQ==
X-Google-Smtp-Source: AGHT+IHnSj/oeJhBv9TmoEbgbImXYKiQqbpfSemdHO8M0CVinYHkDuJSlPpyNmngrg2dxvZLwOF8Aw==
X-Received: by 2002:a05:600c:1c25:b0:42c:ae1d:ea4b with SMTP id
 5b1f17b1804b1-42cbde1a51emr1118845e9.13.1725899281648; 
 Mon, 09 Sep 2024 09:28:01 -0700 (PDT)
Received: from vm-2404.. (255.7.65.37.rev.sfr.net. [37.65.7.255])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42ca0600651sm114500595e9.32.2024.09.09.09.28.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2024 09:28:01 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon,  9 Sep 2024 18:26:59 +0200
Message-ID: <20240909162703.3439481-17-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240909162703.3439481-1-francois.perrad@gadz.org>
References: <20240909162703.3439481-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1725899282; x=1726504082; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vJ4a0R7czxB7cAL/Lj/jMaAoTR6w2JbN3HoLSL+c+QU=;
 b=oZPjQUaovuxCOAtLCVlxEuDlSfEEo4awDV2ld2iDmHoyUW5MyP0sPcBbWVJwduc6Gc
 TArQh+rhahnIPYEM6c6htVsv9X+qvXBpfnz+0qK7dwuQDosFmvkHDdquCWnujvUTn1Gw
 wkQJXEHu7wZ4wBIS0jl33y8QqP3PQKwlKQseYu8Cf85dLcbWFHuk5Ibb8Tox9wGMgZQ1
 q7hEboEdEkTfTSNjrybvgikzYHiOH7fR0xcuhNJYHhsIwlYzSpNYlSk84ikdw3x+6AQp
 BR+HZ+KRzK9w0043bANE0CzN8HXLrsxGo5tDZrD9OgaRrNpTZV7GdNZpJya8uxA6pjkp
 T9bQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=oZPjQUao
Subject: [Buildroot] [PATCH 17/20] package/perl-html-parser: bump to version
 3.83
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

diff LICENSE: use "The Perl Artistic License 1.0"
    see https://metacpan.org/release/OALDERS/HTML-Parser-3.83/diff/OALDERS/HTML-Parser-3.81#LICENSE

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-html-parser/perl-html-parser.hash | 7 ++++---
 package/perl-html-parser/perl-html-parser.mk   | 2 +-
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/perl-html-parser/perl-html-parser.hash b/package/perl-html-parser/perl-html-parser.hash
index fbdffa03d..3de461c7e 100644
--- a/package/perl-html-parser/perl-html-parser.hash
+++ b/package/perl-html-parser/perl-html-parser.hash
@@ -1,5 +1,6 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-sha256  c0910a5c8f92f8817edd06ccfd224ba1c2ebe8c10f551f032587a1fc83d62ff2  HTML-Parser-3.81.tar.gz
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  17a4c886024bfad1cffcbe6b46cda128  HTML-Parser-3.83.tar.gz
+sha256  7278ce9791256132b26a71a5719451844704bb9674b58302c3486df43584f8c0  HTML-Parser-3.83.tar.gz
 
 # computed by scancpan
-sha256  9081922eb873ec1809c20672a7385a65f3c6b1163166bf69b2bbe986fb5b0159  LICENSE
+sha256  cb797b8a92dcb2329dcde194a3032d5d94c172289e9e54ffe8dd1785bc3de2df  LICENSE
diff --git a/package/perl-html-parser/perl-html-parser.mk b/package/perl-html-parser/perl-html-parser.mk
index 50efaa273..02ce08b56 100644
--- a/package/perl-html-parser/perl-html-parser.mk
+++ b/package/perl-html-parser/perl-html-parser.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_HTML_PARSER_VERSION = 3.81
+PERL_HTML_PARSER_VERSION = 3.83
 PERL_HTML_PARSER_SOURCE = HTML-Parser-$(PERL_HTML_PARSER_VERSION).tar.gz
 PERL_HTML_PARSER_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
 PERL_HTML_PARSER_LICENSE = Artistic or GPL-1.0+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
