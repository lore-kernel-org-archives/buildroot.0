Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7E9DC433F5
	for <buildroot@archiver.kernel.org>; Tue, 15 Feb 2022 21:34:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 31980828DE;
	Tue, 15 Feb 2022 21:34:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XYU6XwCTNJzD; Tue, 15 Feb 2022 21:34:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 80F4A827DD;
	Tue, 15 Feb 2022 21:34:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2956F1BF32E
 for <buildroot@lists.busybox.net>; Tue, 15 Feb 2022 21:34:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 18B5360E7D
 for <buildroot@lists.busybox.net>; Tue, 15 Feb 2022 21:34:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ktIHgVkvfGNK for <buildroot@lists.busybox.net>;
 Tue, 15 Feb 2022 21:34:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EDD9960C0E
 for <buildroot@buildroot.org>; Tue, 15 Feb 2022 21:34:33 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id o10so63574ilh.0
 for <buildroot@buildroot.org>; Tue, 15 Feb 2022 13:34:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jMDSK2luoeqrJ+E3+zoJZwohv1eQsQMSQVx/68FkqWE=;
 b=Go+zynotFNwRWNRKF6LOxb58A6F9V6c/CprxeRb61y8lyP1PYYQw1qZZS5E0eo8xZR
 Eg5sz50RThXnGm1lTXSQukcxT2pal8Wm2JCMR9ZZ4ETg5AESkxFK1OwAXzdm+3i9D3nF
 jIG1WbE7xTa4qMer24oguG2rsm5EB/BSW7+rqwv8z1ILktyYUBbnPYjXpqWJzuKQwxFG
 prsVbcSUTCk0ELJkhJf22LKooU0r98wonISb2BgE4wBcwT/f3uFzJvYnNmpR1H+q3xEq
 f49jKqdxejXhNTFSE1D1R2xIMeFFOFbViXrjT85Bg8q/bjTcMKMxxklJBeYp6c10JYMj
 iKgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jMDSK2luoeqrJ+E3+zoJZwohv1eQsQMSQVx/68FkqWE=;
 b=zN3uI0Rh6NqGd54kRyZPKckrbYDeUYIf2ngkTfBicEzpU3DdzzJMmpAI9fY54OfjAd
 yVpsLacZTc5JRyAsHUeCCQ5P81eWK2nEGOSXtNXasnxSaB/VYmBdXxG9xS37xNSEouXC
 IqFyqd52zVc3Yx7e81hlxcKCBOlf/OSdnkVaZsPAWgVxpUyOtRc28tfaCg9N/mnKA6un
 MWXO4srJE0JcuDygg0xhWZShVZcqBxGWfssPVGw0hqJ1uJQUSv8eJhByNtYWXd9FX7VU
 ApMHcVUmSVHwTXhijVnyBVMyxhT3Z3rN7PrHCE7Hci/DskgZuk228MRJszQITEt4jWls
 PGwQ==
X-Gm-Message-State: AOAM533IMBX2A7vJaZcSRxyNwuSkaJxkyGIfOdx7B51++9KVCQK56u9W
 4CoRDYeagSSRd8x2O/O9TbzsOtzmSlI=
X-Google-Smtp-Source: ABdhPJy/M2ObnBQXrQ4fv+EruePCrVZEvM5HWa08gm+XvpMEDjnmK+pQAf5mqUERWltoOYHyxRW97A==
X-Received: by 2002:a05:6e02:1a8d:: with SMTP id
 k13mr702756ilv.0.1644960872695; 
 Tue, 15 Feb 2022 13:34:32 -0800 (PST)
Received: from james-x399.localdomain (97-118-156-98.hlrn.qwest.net.
 [97.118.156.98])
 by smtp.gmail.com with ESMTPSA id e11sm23457902ioq.41.2022.02.15.13.34.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 13:34:32 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 15 Feb 2022 14:34:29 -0700
Message-Id: <20220215213429.1778225-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/bpftool: bump to version
 51d4a12c69c7339f60813b04fc9d0fd6154792a6
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/bpftool/bpftool.hash | 2 +-
 package/bpftool/bpftool.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/bpftool/bpftool.hash b/package/bpftool/bpftool.hash
index c7d4ae250e..9cb03ae332 100644
--- a/package/bpftool/bpftool.hash
+++ b/package/bpftool/bpftool.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  c868cb85bf44195ec6cd20649c3db4f7aff64a38d950a1c2911d981fb2d7042c  bpftool-a7f0e7f057283ae8af3de4578bcb8b7ee80b7144-br1.tar.gz
+sha256  97a91701f0924152eb506d549b46f5df8ce80e738f175c32c364aa8da90ab746  bpftool-51d4a12c69c7339f60813b04fc9d0fd6154792a6-br1.tar.gz
 sha256  7c588754d5e81e92e2a12e47cf78949d485c9c22b4850f12d21b3835c85947d1  LICENSE
 sha256  6313108c23efffa36948f8b2cff1560a5935373b527b0e1a837cc77e6ed1bacd  LICENSE.BSD-2-Clause
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL-2.0
diff --git a/package/bpftool/bpftool.mk b/package/bpftool/bpftool.mk
index 4276f91958..66f8932b6d 100644
--- a/package/bpftool/bpftool.mk
+++ b/package/bpftool/bpftool.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BPFTOOL_VERSION = a7f0e7f057283ae8af3de4578bcb8b7ee80b7144
+BPFTOOL_VERSION = 51d4a12c69c7339f60813b04fc9d0fd6154792a6
 BPFTOOL_SITE = https://github.com/libbpf/bpftool
 BPFTOOL_SITE_METHOD = git
 BPFTOOL_GIT_SUBMODULES = YES
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
