Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B440C433EF
	for <buildroot@archiver.kernel.org>; Fri, 22 Apr 2022 16:16:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BAE6740AC7;
	Fri, 22 Apr 2022 16:16:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MMCudVmwZ2Vd; Fri, 22 Apr 2022 16:16:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B161E40AE0;
	Fri, 22 Apr 2022 16:16:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 300331BF842
 for <buildroot@lists.busybox.net>; Fri, 22 Apr 2022 16:15:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E687082965
 for <buildroot@lists.busybox.net>; Fri, 22 Apr 2022 16:15:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id njl-bOvMA9ar for <buildroot@lists.busybox.net>;
 Fri, 22 Apr 2022 16:15:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E6DDE829A9
 for <buildroot@busybox.net>; Fri, 22 Apr 2022 16:15:36 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id bv16so11734468wrb.9
 for <buildroot@busybox.net>; Fri, 22 Apr 2022 09:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yxA3Ch/IgIqzAk+nZ8mPmCToVn7sCRQjBAaW4XL9KIA=;
 b=De3ObSydLrwiSnMoma3CITxD/ob+rT629Umhy5crIeY4DUexKkdoAcdFZtj0M2hhwo
 xiRP1efNy8JWqAZV8kg7Kwp3qX9A7YNMbAKdcAi677rMze7Zl+PMlUCaytLnMQ43s5WD
 VeeLiPfsrBmBdNU6lal9k32MQZS1679Z5YaNOmNLTe4w5tuLB8/aGBj1inUGO/2WO3YA
 iPNXuHSM/T7xGol1F18nyrvcdrefSN2F2D+dYn6Z0RrvUI/xgj9AdjiIbcnYipo8NQxM
 NvPffg4f9pl2/y8VjhKoxa664dMnzHBXNTlXxN3SMfZbZk24mRHYpW3a2IWOrz5gxbut
 vwFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yxA3Ch/IgIqzAk+nZ8mPmCToVn7sCRQjBAaW4XL9KIA=;
 b=hWWuIayYGXqi+kYO/Q9sndE8mdPoANVVvhABshFFOsjr3YnX3JJalZ/xiIDrYHR7O7
 UmKs+6t4Kf6K/dXty7J3LvUsqv6Ngqmwae5teQTm+sPkSI2/jeRmeP9HpL6k6M+njuYC
 Pm289y3aMaNYfts/FiAnGsbl9ufQi230b/KhRxMFVBgxYlVRIum/tIwTBLrlWE1wuRYW
 gOnBW0ZFYRTzt2/It8qMKDo3/ftNKopUB7aWatykPU7dXenSMJUcwFOuQYxpV1ss1pCz
 VPoIinP3dHcS8THSv+V8hn+Xpi1XIR6XU7yytAT+dlOo9K9dAwQhs2VH7CAweJgeD7is
 Hjkg==
X-Gm-Message-State: AOAM531C7KrUA3peQ2cCVYFijWK5ESQZ89oZRIp6oMtuD6vj5C22DU+k
 dwurL7LRZ/AalkLSxFC4Wa9Jy++J6pM=
X-Google-Smtp-Source: ABdhPJw88XQLb+Gzzz/g2p+C+ct//mzyW2X8QRIfvkrOXnQqoAIGox4iwe/wmuXx2WTd32ahevNtAw==
X-Received: by 2002:a5d:598c:0:b0:20a:9194:22d4 with SMTP id
 n12-20020a5d598c000000b0020a919422d4mr4395820wri.124.1650644134893; 
 Fri, 22 Apr 2022 09:15:34 -0700 (PDT)
Received: from v2021.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 c186-20020a1c35c3000000b0038e6c6fc860sm2010671wma.37.2022.04.22.09.15.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 09:15:34 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Fri, 22 Apr 2022 18:15:10 +0200
Message-Id: <20220422161514.3449177-4-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220422161514.3449177-1-francois.perrad@gadz.org>
References: <20220422161514.3449177-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 4/8] package/perl-http-daemon: bump to version
 6.14
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
 package/perl-http-daemon/perl-http-daemon.hash | 6 +++---
 package/perl-http-daemon/perl-http-daemon.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-http-daemon/perl-http-daemon.hash b/package/perl-http-daemon/perl-http-daemon.hash
index f8272a4fc..c19b3b955 100644
--- a/package/perl-http-daemon/perl-http-daemon.hash
+++ b/package/perl-http-daemon/perl-http-daemon.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  63674e3f81760a29075853413eb157d8  HTTP-Daemon-6.12.tar.gz
-sha256  df47bed10c38670c780fd0116867d5fd4693604acde31ba63380dce04c4e1fa6  HTTP-Daemon-6.12.tar.gz
+md5  3111b0081d08d8b225f52884033de349  HTTP-Daemon-6.14.tar.gz
+sha256  f0767e7f3cbb80b21313c761f07ad8ed253bce9fa2d0ba806b3fb72d309b2e1d  HTTP-Daemon-6.14.tar.gz
 
 # computed by scancpan
-sha256  e84ac5ab84ace59952d2640e0ca4522eb0aaa8c2aa696352d1252aa109ea20bc  LICENCE
+sha256  311f168ba9a7819ffab4fea19858f9e880737baf6d112929d11530205035a4cc  LICENCE
diff --git a/package/perl-http-daemon/perl-http-daemon.mk b/package/perl-http-daemon/perl-http-daemon.mk
index e47507262..fe50c768b 100644
--- a/package/perl-http-daemon/perl-http-daemon.mk
+++ b/package/perl-http-daemon/perl-http-daemon.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_HTTP_DAEMON_VERSION = 6.12
+PERL_HTTP_DAEMON_VERSION = 6.14
 PERL_HTTP_DAEMON_SOURCE = HTTP-Daemon-$(PERL_HTTP_DAEMON_VERSION).tar.gz
 PERL_HTTP_DAEMON_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
 PERL_HTTP_DAEMON_DEPENDENCIES = host-perl-module-build-tiny
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
