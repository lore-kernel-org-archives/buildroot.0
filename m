Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E26DAC433EF
	for <buildroot@archiver.kernel.org>; Tue, 22 Mar 2022 23:22:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 83B4F40C86;
	Tue, 22 Mar 2022 23:22:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id khMP1uQSqKXJ; Tue, 22 Mar 2022 23:22:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5CE8F40AFA;
	Tue, 22 Mar 2022 23:22:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F13D31BF427
 for <buildroot@lists.busybox.net>; Tue, 22 Mar 2022 23:22:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DE3BB40AFA
 for <buildroot@lists.busybox.net>; Tue, 22 Mar 2022 23:22:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z3NcWafnLjtX for <buildroot@lists.busybox.net>;
 Tue, 22 Mar 2022 23:22:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D614340194
 for <buildroot@buildroot.org>; Tue, 22 Mar 2022 23:22:35 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id d62so21989465iog.13
 for <buildroot@buildroot.org>; Tue, 22 Mar 2022 16:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yrHr32a3mQmwipbg1O4lH47hElIBX1pWtKfBKRYXO/c=;
 b=X0FaZYcqGN7v7xPnSGsFildD0pIgABh9+iS+Gfw+a++MGg0YIhx+ZIkCssHihXC6jy
 jj/TDBkX0eSKfOyLO/0UHS/wn/AcwjmFCHkcXibqHhqr+TGTCVV7/dUeiLZijntU6h9B
 PyH2KVgMVlC7BgTZGxVO2b2CFuOHfsZ25S/IOK5OYszevlPgkEk/L6+5wxPn/njCf0Mi
 iY+paGS2Bi12qyqFF4jYvC670VGwFcctd0AXPZtR0XJ5zvEiv2Ls+cnq+FK+8Ga95lty
 wbs6768km/Eo8+WUZDUbVD2g8TOGWmeKcmXcZhnY0HMacloaEjpxeirtN6kjqaXYwMVF
 OD/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yrHr32a3mQmwipbg1O4lH47hElIBX1pWtKfBKRYXO/c=;
 b=FLna3Yz9wsqXvE4DvaHR8cN409rdEhbXk3N3wqymGJiqH/8971bDtaMdD7hsVtUY62
 HKFz/7bj1HS0Lh4kguy8aYVFFpbjP2tkSgLhrjSMJ6SKYNkgreXdATQ4JugWhO97qoVB
 Tjxi1j7u4rdPSQDvqpfSkNlJCQkZQGQTYotJk/bimNHLgoDOvRgRLxc/w5q4ZHLOjnBl
 oxTvf8mL1hVRCyCckkJlZAdGRMiBbhzeK8BBhaFFfl+Cdsr2wHk/+/cNj7Zpdx7T9lwk
 m96zUxva4ZJytleWFqJjQlnLp72L2x8ebjIilqu4e4NBk2dSLgzCH2SRZCqq5jZoZ3Sb
 DxIw==
X-Gm-Message-State: AOAM5310q1xBpvIumUzt8rBiKOVYDopmICiNypfsnhK0EqP2gD9Y0YaC
 htqUnAla69Pqdy4AKFASiv0YumEbZOPWV6vU
X-Google-Smtp-Source: ABdhPJynYZclgCvDPKJvhZFySui5bgUbmDYE4gS19zkKWc3HdeeCQFrKGTpq2O48BJTPz9vkwRu2Jw==
X-Received: by 2002:a5d:840e:0:b0:649:c671:6594 with SMTP id
 i14-20020a5d840e000000b00649c6716594mr2701901ion.19.1647991354502; 
 Tue, 22 Mar 2022 16:22:34 -0700 (PDT)
Received: from james-x399.localdomain (71-218-122-133.hlrn.qwest.net.
 [71.218.122.133]) by smtp.gmail.com with ESMTPSA id
 i81-20020a6bb854000000b00649c1b67a6csm2006324iof.28.2022.03.22.16.22.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Mar 2022 16:22:34 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 22 Mar 2022 17:22:15 -0600
Message-Id: <20220322232224.2842266-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220322232224.2842266-1-james.hilliard1@gmail.com>
References: <20220322232224.2842266-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v12 02/11] package/clang: bump to version 11.1.0
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Bernd Kuhls <bernd.kuhls@t-online.de>,
 Matt Weber <matthew.weber@rockwellcollins.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>, Matt Weber <matthew.weber@collins.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Matt Weber <matthew.weber@rockwellcollins.com>

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 package/clang/clang.hash | 2 +-
 package/clang/clang.mk   | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/clang/clang.hash b/package/clang/clang.hash
index 067a2c0470..32a19c1659 100644
--- a/package/clang/clang.hash
+++ b/package/clang/clang.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256 5778512b2e065c204010f88777d44b95250671103e434f9dc7363ab2e3804253 clang-9.0.1.src.tar.xz
+sha256 0a8288f065d1f57cb6d96da4d2965cbea32edc572aa972e466e954d17148558b clang-11.1.0.src.tar.xz
 sha256 ebcd9bbf783a73d05c53ba4d586b8d5813dcdf3bbec50265860ccc885e606f47 LICENSE.TXT
diff --git a/package/clang/clang.mk b/package/clang/clang.mk
index 939f000cbd..d1667d79b6 100644
--- a/package/clang/clang.mk
+++ b/package/clang/clang.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 # LLVM, Clang and lld should be version bumped together
-CLANG_VERSION = 9.0.1
+CLANG_VERSION_MAJOR = 11
+CLANG_VERSION = $(CLANG_VERSION_MAJOR).1.0
 CLANG_SITE = https://github.com/llvm/llvm-project/releases/download/llvmorg-$(CLANG_VERSION)
 CLANG_SOURCE = clang-$(CLANG_VERSION).src.tar.xz
 CLANG_LICENSE = Apache-2.0 with exceptions
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
