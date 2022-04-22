Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60016C433F5
	for <buildroot@archiver.kernel.org>; Fri, 22 Apr 2022 16:16:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1429A61300;
	Fri, 22 Apr 2022 16:16:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WzmX1ufxXjWA; Fri, 22 Apr 2022 16:16:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 242B6611F4;
	Fri, 22 Apr 2022 16:16:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 128BB1BF842
 for <buildroot@lists.busybox.net>; Fri, 22 Apr 2022 16:15:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8AB4682965
 for <buildroot@lists.busybox.net>; Fri, 22 Apr 2022 16:15:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tkso7xApmHUg for <buildroot@lists.busybox.net>;
 Fri, 22 Apr 2022 16:15:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 877F0826FF
 for <buildroot@busybox.net>; Fri, 22 Apr 2022 16:15:38 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id bv16so11734549wrb.9
 for <buildroot@busybox.net>; Fri, 22 Apr 2022 09:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6+dHVYeeabKM/QRZsZdbTaVdA4AG5khqR1BW5aTKgcM=;
 b=oUTYvXtpnDv9q0uHo2Uz0imzyjM0rD4nl3CFCm0ScKwc6e4zisomSdqLR/SkV/Dto+
 i8YfXyijN5c12cdd+Vc/d08aNY+rD8XxzgGt4cyijxnqG+2lom7abGJdeADSE9jOplL9
 lMtmRlq0eleCUorVqsO3ysfgo1JkWn2TiAsNjPkQMlmYayeAFBhTbplQwUdVmLGjcBH/
 B1u4qdk3+atFjcJtkl2KK2RXmAR/mCDL+oFKjb9EUEYsbAlesVX58xtfbi5yoPgkL4bL
 7Mprp5OyW0NoDptOdTl0qa7viURre78Dd9XeaCbtt12ZkOYz/w4VjqGIyTnMjvStuTS2
 Gb6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6+dHVYeeabKM/QRZsZdbTaVdA4AG5khqR1BW5aTKgcM=;
 b=cJNbKD8P375/sxJJiNCP0wKp8Y+wfDybgrxiKgnNaabgi54kFc0hoFeKD73MiqCer4
 qdxGBCMPniz1jR/NAHB1fVQd5TZvtuZfCxcY3TRTUO2JPmzUfME6nYenY2WQ7f3c4ANC
 ugnorrpSL6/5wQdncPrx/i3Are4KT3WZF4jLutIMC5Sh+GLaW3xJ2FaxehK/SU9+yCQ1
 Ucr/0dhdrLrZglwCt5RPkDK04rgUymfL+nJ3M+V0MpC2BG90mfz/gxr8mT1SjTCCisCv
 JZLJsDSFDkZMvHoAalRKl3Gn5mvCsuaPakfFhvwQxUKRe44ZUiZqT4Oq+yfRaQLZJZKJ
 OEqA==
X-Gm-Message-State: AOAM533wsybErlt92i1p8uQ8p6gCoTRQgjgVbNmev+0FwuIdkXAo8hMx
 O0x8bHqGZLTX06s69tHISmEa5dIqY2M=
X-Google-Smtp-Source: ABdhPJxTRWyj6rZZahPqFOuIgIHazJmcWe4lS18cReGrM/M5SOBD+bCD7ygMvFGw1/sPQCQcRKIeyA==
X-Received: by 2002:a05:6000:1f09:b0:20a:c427:c7c with SMTP id
 bv9-20020a0560001f0900b0020ac4270c7cmr4335832wrb.337.1650644136648; 
 Fri, 22 Apr 2022 09:15:36 -0700 (PDT)
Received: from v2021.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 c186-20020a1c35c3000000b0038e6c6fc860sm2010671wma.37.2022.04.22.09.15.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 09:15:36 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Fri, 22 Apr 2022 18:15:12 +0200
Message-Id: <20220422161514.3449177-6-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220422161514.3449177-1-francois.perrad@gadz.org>
References: <20220422161514.3449177-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 6/8] package/perl-mojolicious: bump to version
 9.24
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
 package/perl-mojolicious/perl-mojolicious.hash | 4 ++--
 package/perl-mojolicious/perl-mojolicious.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-mojolicious/perl-mojolicious.hash b/package/perl-mojolicious/perl-mojolicious.hash
index cc29c3553..cd6c8ef7f 100644
--- a/package/perl-mojolicious/perl-mojolicious.hash
+++ b/package/perl-mojolicious/perl-mojolicious.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  c7a00b4bd8fa2db991c9b918d34041d3  Mojolicious-9.22.tar.gz
-sha256  6b76e024d3d6c077ad984ea3b3d229f093373d5e06438aca248235150d029043  Mojolicious-9.22.tar.gz
+md5  fea8c6a9b97b988ee18b1616e20cf3db  Mojolicious-9.24.tar.gz
+sha256  5a2f2e064fe50ad94ec5ed175403a26ec1ff4150d77742d14ca7b842e17f9168  Mojolicious-9.24.tar.gz
 
 # computed by scancpan
 sha256  19e2e0f2079ea1ce1576eb4ecc0575b33fe45b2b8e71f4aa589d6bedd1da4e0a  LICENSE
diff --git a/package/perl-mojolicious/perl-mojolicious.mk b/package/perl-mojolicious/perl-mojolicious.mk
index 559b995cd..4a05fe48b 100644
--- a/package/perl-mojolicious/perl-mojolicious.mk
+++ b/package/perl-mojolicious/perl-mojolicious.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_MOJOLICIOUS_VERSION = 9.22
+PERL_MOJOLICIOUS_VERSION = 9.24
 PERL_MOJOLICIOUS_SOURCE = Mojolicious-$(PERL_MOJOLICIOUS_VERSION).tar.gz
 PERL_MOJOLICIOUS_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SR/SRI
 PERL_MOJOLICIOUS_LICENSE = Artistic-2.0
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
