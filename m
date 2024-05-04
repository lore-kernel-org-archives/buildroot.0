Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB3B7C25B10
	for <buildroot@archiver.kernel.org>; Sat,  4 May 2024 21:41:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7EC8041F58;
	Sat,  4 May 2024 21:41:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OoNgB_W0VUzF; Sat,  4 May 2024 21:41:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 390A341F3C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 390A341F3C;
	Sat,  4 May 2024 21:41:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1A55B1BF3C9
 for <buildroot@lists.busybox.net>; Sat,  4 May 2024 21:40:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9A00941704
 for <buildroot@lists.busybox.net>; Sat,  4 May 2024 21:40:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IsoNm-VL3DBZ for <buildroot@lists.busybox.net>;
 Sat,  4 May 2024 21:40:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 98BDE41582
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 98BDE41582
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 98BDE41582
 for <buildroot@buildroot.org>; Sat,  4 May 2024 21:40:37 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-41b4ff362a8so8006195e9.0
 for <buildroot@buildroot.org>; Sat, 04 May 2024 14:40:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714858836; x=1715463636;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=bEmgjPqYQPn2znDh3NRrN02zntiRNBbXp0iDmO/VEpA=;
 b=mfYs1512klU4tHo+DHDM4MYBpWiypBMBt0vucVfhLmapRhKMey7RAyzdyNIheSBj7e
 Nli8QhLiq66nU3RRqSwx0IPHrOs7wfL3rgVQ+c4NKNRXHJKwTG9ZLd5eFwLwjvs5P2E8
 hvtHAUiuPmUL2+ajHBJ2Ic7jhQYX7l5k8K+xAWsQlGTfHljsBbAvzUurn/OIMRwuO/3B
 hgmWfDvZx3rAeu+IKZUht1GzqYlLJsMQnpd/cMse277/zMdfe0/aroO7tCmIJSf+yFaZ
 KqGzTzcBuycethOGA/NdCnQWPP2ISCyxV8Hzxd9lU7l6fATeNHuHIMvhV0OJnolO52MR
 4fFQ==
X-Gm-Message-State: AOJu0Yxxk2EjxCL1uq5H3TTnUI00Z2hPeqZaGtdDQvcBqjuuEvJamvfU
 bnLilPHiUbquAtsWFj2dVCbBMZGlxNKmSJjYlS8/UdnNIx8s3FuCnDJhJQ==
X-Google-Smtp-Source: AGHT+IEMBxJydsOLhPz7P5YKP7B2tf4e6v3uRLet8SdonXaIgXnhrGjce0v5rg30lwYZf2oUqxhbrA==
X-Received: by 2002:a05:600c:35ca:b0:41a:2c91:6352 with SMTP id
 r10-20020a05600c35ca00b0041a2c916352mr5695802wmq.36.1714858835677; 
 Sat, 04 May 2024 14:40:35 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 l3-20020a05600c4f0300b0041b43d2d745sm10464230wmq.7.2024.05.04.14.40.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 May 2024 14:40:35 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat,  4 May 2024 23:40:19 +0200
Message-ID: <43fba2bec692a64e65db78886de87973ac76d5ad.1714858818.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1714858818.git.yann.morin.1998@free.fr>
References: <cover.1714858818.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714858836; x=1715463636; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bEmgjPqYQPn2znDh3NRrN02zntiRNBbXp0iDmO/VEpA=;
 b=d6U3b2vhCxxDmOSielbUy/Q+EybC0Hqpr9XF2xIgS4jv1h5sFsITzgww2FldHnrPBz
 i0ht3eQSxcmoZk/xPBHUmiOkMLsmIbjpunvalciOUX1Qv/T2OvGX3wHw2EkWza/VviTG
 FQDI/aY7Eqk0pNUnGu9LUhiq0N/6e1EMhiXiLvFzwbfAnQ0yy+LSmjS1hDG2Fy0jHzKR
 IH2/lbpNUAy6Bs2LWd9tEM8sjmvafGWKz7UUgjf+X3EkNp4qWfxTqapWhkFRzdSKgBwl
 QdV0F1+U3zPi43jPHZWjoHMuy3avaAOZzWkXC/rS/uMULFWlvZ5zdD/foA0f9drFtmn8
 NmFg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=d6U3b2vh
Subject: [Buildroot] [PATCH 18/22 v3] support/testing: update hashes for
 generated archives
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../tests/download/br2-external/git-hash/package/bad/bad.hash   | 2 +-
 .../git-hash/package/export-subst/export-subst.hash             | 2 +-
 .../tests/download/br2-external/git-hash/package/good/good.hash | 2 +-
 .../git-partial-sha1-branch-head.hash                           | 2 +-
 .../git-partial-sha1-reachable-by-branch.hash                   | 2 +-
 .../git-partial-sha1-reachable-by-tag.hash                      | 2 +-
 .../git-partial-sha1-tag-itself.hash                            | 2 +-
 .../git-partial-sha1-tag-points-to.hash                         | 2 +-
 .../package/git-sha1-branch-head/git-sha1-branch-head.hash      | 2 +-
 .../git-sha1-reachable-by-branch.hash                           | 2 +-
 .../git-sha1-reachable-by-tag/git-sha1-reachable-by-tag.hash    | 2 +-
 .../package/git-sha1-tag-itself/git-sha1-tag-itself.hash        | 2 +-
 .../package/git-sha1-tag-points-to/git-sha1-tag-points-to.hash  | 2 +-
 .../package/git-submodule-disabled/git-submodule-disabled.hash  | 2 +-
 .../package/git-submodule-enabled/git-submodule-enabled.hash    | 2 +-
 .../download/br2-external/git-refs/package/git-tag/git-tag.hash | 2 +-
 .../git-refs/package/git-wrong-content/git-wrong-content.hash   | 2 +-
 17 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/support/testing/tests/download/br2-external/git-hash/package/bad/bad.hash b/support/testing/tests/download/br2-external/git-hash/package/bad/bad.hash
index 709932de98..c3ac6da64a 100644
--- a/support/testing/tests/download/br2-external/git-hash/package/bad/bad.hash
+++ b/support/testing/tests/download/br2-external/git-hash/package/bad/bad.hash
@@ -1 +1 @@
-sha256  0000000000000000000000000000000000000000000000000000000000000000  bad-a238b1dfcd825d47d834af3c5223417c8411d90d-git3.tar.gz
+sha256  0000000000000000000000000000000000000000000000000000000000000000  bad-a238b1dfcd825d47d834af3c5223417c8411d90d-git4.tar.gz
diff --git a/support/testing/tests/download/br2-external/git-hash/package/export-subst/export-subst.hash b/support/testing/tests/download/br2-external/git-hash/package/export-subst/export-subst.hash
index 7fc5b42ada..792546d342 100644
--- a/support/testing/tests/download/br2-external/git-hash/package/export-subst/export-subst.hash
+++ b/support/testing/tests/download/br2-external/git-hash/package/export-subst/export-subst.hash
@@ -1 +1 @@
-sha256  9d359f9ae9a9e65dd4ccfe7170aa6fda24e17dfc81238972957b4b7fe97168a7  export-subst-0fdb95cf4f3c5ed4003287649cabb33c5f843e26-git3.tar.gz
+sha256  5ee1800b8fd5f4a0d3e48a0c3a32a988ca974d0ef3c9bc8307ee1ff139cc3f3e  export-subst-0fdb95cf4f3c5ed4003287649cabb33c5f843e26-git4.tar.gz
diff --git a/support/testing/tests/download/br2-external/git-hash/package/good/good.hash b/support/testing/tests/download/br2-external/git-hash/package/good/good.hash
index 44b1d54c54..6909066f99 100644
--- a/support/testing/tests/download/br2-external/git-hash/package/good/good.hash
+++ b/support/testing/tests/download/br2-external/git-hash/package/good/good.hash
@@ -1 +1 @@
-sha256  682ad1f39f258bfb35e26f213f3798f44bb8105bb55fad47bdc003113765b650  good-a238b1dfcd825d47d834af3c5223417c8411d90d-git3.tar.gz
+sha256  32879a888bd3cfc10e108a0309940884aa0b01250fad5912c837d23c9918f8de  good-a238b1dfcd825d47d834af3c5223417c8411d90d-git4.tar.gz
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-branch-head/git-partial-sha1-branch-head.hash b/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-branch-head/git-partial-sha1-branch-head.hash
index fde03b9131..fa2bf666e5 100644
--- a/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-branch-head/git-partial-sha1-branch-head.hash
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-branch-head/git-partial-sha1-branch-head.hash
@@ -1,2 +1,2 @@
-sha256  c27041b3e874beb0d0218158e7d6507ad1515b684de5eed5fabd0f7205e9718e  git-partial-sha1-branch-head-68c197d0879d485f4f6c-git3.tar.gz
+sha256  86ab4376a55b9ecd5269adbb43146d28bfc90c785c01dbed11cc6c16fc10406a  git-partial-sha1-branch-head-68c197d0879d485f4f6c-git4.tar.gz
 sha256  2c1126513651b0d346a4e6d1bb75ac1c9999217e18026302d27bea47b06c7fb2  file
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-reachable-by-branch/git-partial-sha1-reachable-by-branch.hash b/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-reachable-by-branch/git-partial-sha1-reachable-by-branch.hash
index 463fd46848..633b2bb6d4 100644
--- a/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-reachable-by-branch/git-partial-sha1-reachable-by-branch.hash
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-reachable-by-branch/git-partial-sha1-reachable-by-branch.hash
@@ -1,2 +1,2 @@
-sha256  1bbba9bf2788bd789ed8da4e47cabbf3467b1f706875b3f6b62df38e08fb9aba  git-partial-sha1-reachable-by-branch-317406308d9259e2231b-git3.tar.gz
+sha256  2baa9ab4c5cab2348de03609288c9c874f1f56e4373d3d089e83f381d45d4e68  git-partial-sha1-reachable-by-branch-317406308d9259e2231b-git4.tar.gz
 sha256  fabbc65c442bacb5e69b7adfea6d14fbbfc1327134322efd12771dc84387d507  file
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-reachable-by-tag/git-partial-sha1-reachable-by-tag.hash b/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-reachable-by-tag/git-partial-sha1-reachable-by-tag.hash
index f83496743f..60582b0967 100644
--- a/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-reachable-by-tag/git-partial-sha1-reachable-by-tag.hash
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-reachable-by-tag/git-partial-sha1-reachable-by-tag.hash
@@ -1,2 +1,2 @@
-sha256  52d223f3b2d625216c259e9ff949ca8818452a531ba61557dd91f3889c7919d7  git-partial-sha1-reachable-by-tag-46bae5b639e5a18e2cc4-git3.tar.gz
+sha256  8042df3cc0a7427d1273a846ef5c38ebf589ba7a2ae8158fed3d29f5fea1cad3  git-partial-sha1-reachable-by-tag-46bae5b639e5a18e2cc4-git4.tar.gz
 sha256  2de87d77a2f226813f2d9bda906e970e4195605cdba6680443c0c04d89c532b6  file
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-tag-itself/git-partial-sha1-tag-itself.hash b/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-tag-itself/git-partial-sha1-tag-itself.hash
index 9041849c80..9fd26d6185 100644
--- a/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-tag-itself/git-partial-sha1-tag-itself.hash
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-tag-itself/git-partial-sha1-tag-itself.hash
@@ -1,2 +1,2 @@
-sha256  5cfc004b05f48b3fb419a5db4b7239223d670225fbbb91de2ae151c97910b36c  git-partial-sha1-tag-itself-2b0e0d98a49c97da6a61-git3.tar.gz
+sha256  be18eb6180f33ad01c09eefa40d8b58e09a9049d90cedd20a51ef2045beb92ad  git-partial-sha1-tag-itself-2b0e0d98a49c97da6a61-git4.tar.gz
 sha256  6de8772a0a58fa62e2b8c58d4dae55c9db7534ad3b3918ecc849a9008d58f081  file
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-tag-points-to/git-partial-sha1-tag-points-to.hash b/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-tag-points-to/git-partial-sha1-tag-points-to.hash
index c8b469b199..353c8f07f8 100644
--- a/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-tag-points-to/git-partial-sha1-tag-points-to.hash
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-tag-points-to/git-partial-sha1-tag-points-to.hash
@@ -1,2 +1,2 @@
-sha256  0f40d7f39bf2e389cc2ce03c73cc0cc9ded1119378aaa68e2a2ef8597f6fd2f3  git-partial-sha1-tag-points-to-516c9c5f64ec66534d4d-git3.tar.gz
+sha256  36d9064cfd4a028f89b1e482b2543ee15df5ad0076714c175db54f3943f37ca3  git-partial-sha1-tag-points-to-516c9c5f64ec66534d4d-git4.tar.gz
 sha256  6de8772a0a58fa62e2b8c58d4dae55c9db7534ad3b3918ecc849a9008d58f081  file
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-sha1-branch-head/git-sha1-branch-head.hash b/support/testing/tests/download/br2-external/git-refs/package/git-sha1-branch-head/git-sha1-branch-head.hash
index 393baef4ee..64e3ee450f 100644
--- a/support/testing/tests/download/br2-external/git-refs/package/git-sha1-branch-head/git-sha1-branch-head.hash
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-sha1-branch-head/git-sha1-branch-head.hash
@@ -1,2 +1,2 @@
-sha256  3ab67c485ce1825abbbf5db1d90d94dfadc89b30bb740041cfc75fc04021e218  git-sha1-branch-head-68c197d0879d485f4f6cee85544722b79e68e59f-git3.tar.gz
+sha256  94d3addcdc2bf76c996a9278f16d0bef966522e2fc1367e0039cac419e51f4ca  git-sha1-branch-head-68c197d0879d485f4f6cee85544722b79e68e59f-git4.tar.gz
 sha256  2c1126513651b0d346a4e6d1bb75ac1c9999217e18026302d27bea47b06c7fb2  file
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-sha1-reachable-by-branch/git-sha1-reachable-by-branch.hash b/support/testing/tests/download/br2-external/git-refs/package/git-sha1-reachable-by-branch/git-sha1-reachable-by-branch.hash
index 63f18a4066..509cfed768 100644
--- a/support/testing/tests/download/br2-external/git-refs/package/git-sha1-reachable-by-branch/git-sha1-reachable-by-branch.hash
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-sha1-reachable-by-branch/git-sha1-reachable-by-branch.hash
@@ -1,2 +1,2 @@
-sha256  a5936d6d6022ea101a6076864a2afa918ab2776764012c4be589027001044041  git-sha1-reachable-by-branch-317406308d9259e2231bd0d6ddad3de3832bce08-git3.tar.gz
+sha256  1ddd9110d10762476e87b7a8c66cc9fa5df0e29a0476e242a68e0493a4b97f1f  git-sha1-reachable-by-branch-317406308d9259e2231bd0d6ddad3de3832bce08-git4.tar.gz
 sha256  fabbc65c442bacb5e69b7adfea6d14fbbfc1327134322efd12771dc84387d507  file
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-sha1-reachable-by-tag/git-sha1-reachable-by-tag.hash b/support/testing/tests/download/br2-external/git-refs/package/git-sha1-reachable-by-tag/git-sha1-reachable-by-tag.hash
index a0f39cead8..8c75787ae5 100644
--- a/support/testing/tests/download/br2-external/git-refs/package/git-sha1-reachable-by-tag/git-sha1-reachable-by-tag.hash
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-sha1-reachable-by-tag/git-sha1-reachable-by-tag.hash
@@ -1,2 +1,2 @@
-sha256  c203f968e358ca478d4c5344b1e4ae9bf13f9fb1120f2ed96a12154dd64195a6  git-sha1-reachable-by-tag-46bae5b639e5a18e2cc4dc508f080d566baeff59-git3.tar.gz
+sha256  f2903e4b043fca2abb96a4aeabfcd83914c81929a9e880a743f23da86f7c68d8  git-sha1-reachable-by-tag-46bae5b639e5a18e2cc4dc508f080d566baeff59-git4.tar.gz
 sha256  2de87d77a2f226813f2d9bda906e970e4195605cdba6680443c0c04d89c532b6  file
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-sha1-tag-itself/git-sha1-tag-itself.hash b/support/testing/tests/download/br2-external/git-refs/package/git-sha1-tag-itself/git-sha1-tag-itself.hash
index 1497ecc1d5..0adb526ac7 100644
--- a/support/testing/tests/download/br2-external/git-refs/package/git-sha1-tag-itself/git-sha1-tag-itself.hash
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-sha1-tag-itself/git-sha1-tag-itself.hash
@@ -1,2 +1,2 @@
-sha256  57f08e9f3914e79a10e7fb5d346b26fef2773dd22eed0d61fd755e79e62cee93  git-sha1-tag-itself-2b0e0d98a49c97da6a618ab36337e2058eb733a2-git3.tar.gz
+sha256  6a7731130e07292ca92aec57b2ea495318e53403b2d455d1cb0fd1cd256829af  git-sha1-tag-itself-2b0e0d98a49c97da6a618ab36337e2058eb733a2-git4.tar.gz
 sha256  6de8772a0a58fa62e2b8c58d4dae55c9db7534ad3b3918ecc849a9008d58f081  file
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-sha1-tag-points-to/git-sha1-tag-points-to.hash b/support/testing/tests/download/br2-external/git-refs/package/git-sha1-tag-points-to/git-sha1-tag-points-to.hash
index 2776d43871..870c08fa3a 100644
--- a/support/testing/tests/download/br2-external/git-refs/package/git-sha1-tag-points-to/git-sha1-tag-points-to.hash
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-sha1-tag-points-to/git-sha1-tag-points-to.hash
@@ -1,2 +1,2 @@
-sha256  1d8b565827137aa21ba37cde382aa291e33a135c697e38dcd31f14e195386327  git-sha1-tag-points-to-516c9c5f64ec66534d4d069c2e408d9ae4dce023-git3.tar.gz
+sha256  0f09af0d4b9e0fb5969eab514d6b39ef8433607e92623ca1c641dbf25d7b6518  git-sha1-tag-points-to-516c9c5f64ec66534d4d069c2e408d9ae4dce023-git4.tar.gz
 sha256  6de8772a0a58fa62e2b8c58d4dae55c9db7534ad3b3918ecc849a9008d58f081  file
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-submodule-disabled/git-submodule-disabled.hash b/support/testing/tests/download/br2-external/git-refs/package/git-submodule-disabled/git-submodule-disabled.hash
index bc05bedd0d..930252ef2d 100644
--- a/support/testing/tests/download/br2-external/git-refs/package/git-submodule-disabled/git-submodule-disabled.hash
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-submodule-disabled/git-submodule-disabled.hash
@@ -1,2 +1,2 @@
-sha256  e8e0febc7f1408df22bce2d73d9a30081e03b45e152bc25effd14435ca8b3433  git-submodule-disabled-a9dbc1e23c45e8e1b88c0448763f54d714eb6f8f-git3.tar.gz
+sha256  f04937956fc45ca9bfaf911aa513956369256a6e53e733d9e7e06efb9cf05600  git-submodule-disabled-a9dbc1e23c45e8e1b88c0448763f54d714eb6f8f-git4.tar.gz
 sha256  ba8b6ddc4726bfb6a05045ebfd8c43263c968ad1bc601bd46a25bc055008eddc  file
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-submodule-enabled/git-submodule-enabled.hash b/support/testing/tests/download/br2-external/git-refs/package/git-submodule-enabled/git-submodule-enabled.hash
index e2a626833b..a147a8e1ae 100644
--- a/support/testing/tests/download/br2-external/git-refs/package/git-submodule-enabled/git-submodule-enabled.hash
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-submodule-enabled/git-submodule-enabled.hash
@@ -1 +1 @@
-sha256  176c32f10ad11f290b6251d701835450292ba281eb59c7fb57b244407a55ceab  git-submodule-enabled-a9dbc1e23c45e8e1b88c0448763f54d714eb6f8f-git3.tar.gz
+sha256  fd92a10055e233cb8ca857e9b68fa52c57803fc970cb96357a7350f9e8e4302f  git-submodule-enabled-a9dbc1e23c45e8e1b88c0448763f54d714eb6f8f-git4.tar.gz
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-tag/git-tag.hash b/support/testing/tests/download/br2-external/git-refs/package/git-tag/git-tag.hash
index a30a070aca..9ebeebb363 100644
--- a/support/testing/tests/download/br2-external/git-refs/package/git-tag/git-tag.hash
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-tag/git-tag.hash
@@ -1,2 +1,2 @@
-sha256  c66b2366d8ccb1670951012334fe8d48de3358aef39b3da2912b339448fefcde  git-tag-mytag-git3.tar.gz
+sha256  92fa45cdb205906f32be4c5bb4f11d09221b63908aab09c6475911cf89f3a0b7  git-tag-mytag-git4.tar.gz
 sha256  6de8772a0a58fa62e2b8c58d4dae55c9db7534ad3b3918ecc849a9008d58f081  file
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-wrong-content/git-wrong-content.hash b/support/testing/tests/download/br2-external/git-refs/package/git-wrong-content/git-wrong-content.hash
index 4c7da339d1..c39cd633ee 100644
--- a/support/testing/tests/download/br2-external/git-refs/package/git-wrong-content/git-wrong-content.hash
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-wrong-content/git-wrong-content.hash
@@ -1,2 +1,2 @@
- sha256  4a230e667227310289438cd7d899276a0d45ca8778abfd043dfc0a10ed2c9085  git-wrong-content-a238b1dfcd825d47d834af3c5223417c8411d90d-git3.tar.gz
+ sha256  4a230e667227310289438cd7d899276a0d45ca8778abfd043dfc0a10ed2c9085  git-wrong-content-a238b1dfcd825d47d834af3c5223417c8411d90d-git4.tar.gz
  sha256  0000000000000000000000000000000000000000000000000000000000000000  file
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
