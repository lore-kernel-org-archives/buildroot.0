Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23C74C433F5
	for <buildroot@archiver.kernel.org>; Mon, 16 May 2022 13:14:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D720161078;
	Mon, 16 May 2022 13:14:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TcCBrWZEBUBQ; Mon, 16 May 2022 13:14:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id ECE2B61086;
	Mon, 16 May 2022 13:14:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 94BE21BF97F
 for <buildroot@lists.busybox.net>; Mon, 16 May 2022 13:13:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 916F582C9C
 for <buildroot@lists.busybox.net>; Mon, 16 May 2022 13:13:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8lodQ0ovMRAp for <buildroot@lists.busybox.net>;
 Mon, 16 May 2022 13:13:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D605A82C8E
 for <buildroot@buildroot.org>; Mon, 16 May 2022 13:13:54 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id m1so20470574wrb.8
 for <buildroot@buildroot.org>; Mon, 16 May 2022 06:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=z23x0l7n7WVWtHoMhWoBi9e7/Fh2I+wpsgrYZCf+RCQ=;
 b=GH9HHs3ZWoIYE56k91HOb/obKltnenpo4zP63oujhWTnDte/wbdK+Vj+qFrczUQYbM
 5EhpRrbV1Qe99+yJpjorYp38Vd9uFj48QfrTUbwuBWiwLu8dtqADzcDNwykU2sKfhF+4
 Vt1PGKbYQZRTYrjHcdPhLc3H1p0eTYZq2DH1MDo5ftY6+sxW47SsZL6HLyKTz7q/nXGj
 hyY1vemrLdjNdBMgmO3weWcZEcCZI3gnI9qK9OyZ2MPI5lscsoc7VljVlpltWanPgIUC
 eGiWcMGzhTfwxrj9EFN4f1C/QKCjEhrmH9cjJCjlIqy3vIpT7m31G9hddBHxaZaC52f0
 ID9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=z23x0l7n7WVWtHoMhWoBi9e7/Fh2I+wpsgrYZCf+RCQ=;
 b=xLpJNuOjaG9PK0LZ7WH+qFWILy47X3ANP7l9bUWQX/T9Zr26weJEr0QgfsbhG2uytC
 rMs+ArDLkXm1/KEDei4m6O49o5cWOQQ1yuFB9yZ1deem73O3qDpnUsHMaCRCestjTAet
 +IE4Y1/nN3mBBHcx/9UzvbMQKsFPEgX3Lm/87bvubuJnwmddLJ7nNYK5Gc8JjCcORsec
 7utOa0kHqmLWPDa49/xeQpMA1eivxWciZ62/LBQsc+pHt62c6vVyDwccbi/u6Gq+pOCF
 vIhkRgZoU6w3w1F4tZUj3vA1ZrUY54PkwC3sFS8+TVGiOaxfL9ITGc4o4GB25sjSsdRd
 OrCg==
X-Gm-Message-State: AOAM533LCkRwqbhH9Ifblt6tqUyDeB/uf6XIw3iKkn6YhN3EL2MxlLFG
 oXvV1Js3DKgJlei4xkwf8u0Ebq8wM0M=
X-Google-Smtp-Source: ABdhPJzcLtcWArbXLmadazoN78h/Ft9Bp+6cFMCb1qROmTluPo4cT9XIe30jkxThUa9iDLgG5DZ0CQ==
X-Received: by 2002:adf:f486:0:b0:20d:5ff:246b with SMTP id
 l6-20020adff486000000b0020d05ff246bmr5431552wro.127.1652706832657; 
 Mon, 16 May 2022 06:13:52 -0700 (PDT)
Received: from shrek2.. (lmontsouris-659-1-42-116.w92-154.abo.wanadoo.fr.
 [92.154.77.116]) by smtp.gmail.com with ESMTPSA id
 ay41-20020a05600c1e2900b003942a244f51sm13023789wmb.42.2022.05.16.06.13.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 06:13:52 -0700 (PDT)
From: Johan Oudinet <johan.oudinet@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 16 May 2022 15:13:17 +0200
Message-Id: <20220516131334.1910858-4-johan.oudinet@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220516131334.1910858-1-johan.oudinet@gmail.com>
References: <20220516131334.1910858-1-johan.oudinet@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 03/20] package/erlang-p1-utils: bump version to
 1.0.23
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
Cc: Johan Oudinet <johan.oudinet@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/erlang-p1-utils/erlang-p1-utils.hash | 2 +-
 package/erlang-p1-utils/erlang-p1-utils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/erlang-p1-utils/erlang-p1-utils.hash b/package/erlang-p1-utils/erlang-p1-utils.hash
index dec7c26039..082622098e 100644
--- a/package/erlang-p1-utils/erlang-p1-utils.hash
+++ b/package/erlang-p1-utils/erlang-p1-utils.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  234b88227f61ef03a6177d97ed062c62a22760b6fd189a5a24d2fd1599d95ac9  erlang-p1-utils-1.0.20.tar.gz
+sha256  05f29bc55a51840c84f4055b89d4cc312078badc5571a5962f15348fa5d87015  erlang-p1-utils-1.0.23.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/erlang-p1-utils/erlang-p1-utils.mk b/package/erlang-p1-utils/erlang-p1-utils.mk
index 084382cd2b..5804c2531d 100644
--- a/package/erlang-p1-utils/erlang-p1-utils.mk
+++ b/package/erlang-p1-utils/erlang-p1-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_P1_UTILS_VERSION = 1.0.20
+ERLANG_P1_UTILS_VERSION = 1.0.23
 ERLANG_P1_UTILS_SITE = $(call github,processone,p1_utils,$(ERLANG_P1_UTILS_VERSION))
 ERLANG_P1_UTILS_LICENSE = Apache-2.0
 ERLANG_P1_UTILS_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
