Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55329C7EE2E
	for <buildroot@archiver.kernel.org>; Fri,  9 Jun 2023 16:21:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0E0E3419FC;
	Fri,  9 Jun 2023 16:21:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E0E3419FC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xrVI6K7hMcpV; Fri,  9 Jun 2023 16:21:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2B1E741A27;
	Fri,  9 Jun 2023 16:21:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2B1E741A27
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9989D1BF2AA
 for <buildroot@lists.busybox.net>; Fri,  9 Jun 2023 16:20:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 809F483EBC
 for <buildroot@lists.busybox.net>; Fri,  9 Jun 2023 16:20:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 809F483EBC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id weYlsQsPX_L0 for <buildroot@lists.busybox.net>;
 Fri,  9 Jun 2023 16:20:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 75DD983B97
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 75DD983B97
 for <buildroot@busybox.net>; Fri,  9 Jun 2023 16:20:28 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-3f7378a74faso15716705e9.0
 for <buildroot@busybox.net>; Fri, 09 Jun 2023 09:20:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686327626; x=1688919626;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/wLwq+KNAPdyWYFyqIMFn6bvcwsCP17MjclX/d8I1ps=;
 b=hDy+63fnmDGZTmTVVPd2R/Cw1uvovKko8WLb4HcqU4L9rnHQOWY1dg+ELzVfzecwVG
 gjoKDiQpyh4tpJHpcr9g46uObdC/QJYDApIf+ACUv/CP7WJaknLVFiWda7grqEPISAKe
 Jap+H1P+1GHbu7mgWA+aUOVUCd2y6F5nghVQTDvdrh6FQsGU0OFBXKKEu2yklVlfLBOu
 CVYWNXZAnIOD71UjJORdkFRjd8iRu5gY61EOFU0OSnFHy38sp26SZryOGgjTw25Y/sHw
 zlXdsP0YTo0HQeBiTpBwpgcjNpdoO131JG5O5B14cTGlIUQhzymQIoz8DTOX/tt+otiz
 KqDw==
X-Gm-Message-State: AC+VfDzFEuKAhbFr1PIiNcgHLi/KLAL9pZDTcszoboA+YzhCd1i4vxEW
 9AYlxxtiwfRWE2Bn7wVGARbKuK6tKSY=
X-Google-Smtp-Source: ACHHUZ47pH6zaIgtrYa96daZz0AcR5NFMY0OZ1sQsey3fW9qlbllT3jsiOl+C+QfLWjxeZmcjpPHzA==
X-Received: by 2002:a05:6000:1951:b0:30a:e699:20c6 with SMTP id
 e17-20020a056000195100b0030ae69920c6mr1384615wry.0.1686327626403; 
 Fri, 09 Jun 2023 09:20:26 -0700 (PDT)
Received: from vm.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 x19-20020a1c7c13000000b003f7aad8c160sm3141044wmc.11.2023.06.09.09.20.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jun 2023 09:20:26 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Fri,  9 Jun 2023 18:20:14 +0200
Message-Id: <20230609162018.1231615-4-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230609162018.1231615-1-francois.perrad@gadz.org>
References: <20230609162018.1231615-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686327626; x=1688919626;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/wLwq+KNAPdyWYFyqIMFn6bvcwsCP17MjclX/d8I1ps=;
 b=WHJLCptSaot4BzAxFnRQfthKHys+gtCByS//xs4O9Zlx+m1aEIri4vf/ajjvvqq2NP
 rJ7QPrblX5zOx/dFAR4l3pQUF4ub5sKPLS2qqmC1GBKnrJ+uU8QemFBzD44hLQH3x9fc
 IWdIlo8JnKNlySrJ2c9Jkie/o/TrSJaGsg7ZQdwE1S82gR33gDoWW1WcEkujOs8ObftO
 319H+9Yt1eLeO804Zpqutk//T4osNhrbi2w7Xp2eF3slkldvp3lJLLCl3E6AZLu87/+r
 mVurSGnTn9X9BXOJsHqpMhF9bzXAGyUp4BP2x3FWx4hF0RIizWd2sPW2vcsbyG8ZP4CE
 3cXA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=WHJLCptS
Subject: [Buildroot] [PATCH 4/8] package/perl-html-parser: bump to version
 3.81
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
 package/perl-html-parser/perl-html-parser.hash | 6 +++---
 package/perl-html-parser/perl-html-parser.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-html-parser/perl-html-parser.hash b/package/perl-html-parser/perl-html-parser.hash
index ccd115d6c..71157c3cd 100644
--- a/package/perl-html-parser/perl-html-parser.hash
+++ b/package/perl-html-parser/perl-html-parser.hash
@@ -1,6 +1,6 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-md5  8e7151d08f30457a2ba80020b936285f  HTML-Parser-3.80.tar.gz
-sha256  63411db03016747e37c2636db11b05f8cc71608ef5bff36d04ddb0dc92f7835b  HTML-Parser-3.80.tar.gz
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  b9f5dd3b14632f7a60541a2b61389c06  HTML-Parser-3.81.tar.gz
+sha256  c0910a5c8f92f8817edd06ccfd224ba1c2ebe8c10f551f032587a1fc83d62ff2  HTML-Parser-3.81.tar.gz
 
 # computed by scancpan
 sha256  9081922eb873ec1809c20672a7385a65f3c6b1163166bf69b2bbe986fb5b0159  LICENSE
diff --git a/package/perl-html-parser/perl-html-parser.mk b/package/perl-html-parser/perl-html-parser.mk
index 1e1f8e605..50efaa273 100644
--- a/package/perl-html-parser/perl-html-parser.mk
+++ b/package/perl-html-parser/perl-html-parser.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_HTML_PARSER_VERSION = 3.80
+PERL_HTML_PARSER_VERSION = 3.81
 PERL_HTML_PARSER_SOURCE = HTML-Parser-$(PERL_HTML_PARSER_VERSION).tar.gz
 PERL_HTML_PARSER_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
 PERL_HTML_PARSER_LICENSE = Artistic or GPL-1.0+
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
