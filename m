Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A853C433F5
	for <buildroot@archiver.kernel.org>; Thu, 19 May 2022 14:11:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 489E841986;
	Thu, 19 May 2022 14:11:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PS3h4OTHZ2k6; Thu, 19 May 2022 14:11:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1FC9D4162C;
	Thu, 19 May 2022 14:11:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C9B591BF9C1
 for <buildroot@lists.busybox.net>; Thu, 19 May 2022 14:08:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B93A384338
 for <buildroot@lists.busybox.net>; Thu, 19 May 2022 14:08:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iyK2VGcqN7zT for <buildroot@lists.busybox.net>;
 Thu, 19 May 2022 14:08:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0E71C8426E
 for <buildroot@buildroot.org>; Thu, 19 May 2022 14:08:43 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id h5so6212845wrb.11
 for <buildroot@buildroot.org>; Thu, 19 May 2022 07:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rAr808R7QXQrW7xpt3UmnrV/WovQkF9siFLgmqYcYvQ=;
 b=CZQ6UeTx64Ash8CBqEaVL3r6MExvaRBtr1EIA/h8d6Es9JobQ6R/YvZy+yt1FMmKUB
 Kf0aBvsEYu3PAMgkzlvFn19YMDC51rP0h1wqYyzBsj+ed8hk/qBetLqZdoMj5ejtVijZ
 nbc3sgbV7dAlMZ0EVSf/rbUnYIN7kbafUacxDfn6AA6TkJs7esU7uYjIAsNg38elofes
 lpGZGqT8DoUzBIiv6mR7K/P4cqAmozs13YzOlscfYB+8UZijTNtboYxoUZNF7NIg9KxS
 YIHiDl6lK8GjDiNMXqUB5QkwiWKXsYdNUgI0XOWTr6KWOOyOpJKZktpF1WORS1AtOk6c
 kcwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rAr808R7QXQrW7xpt3UmnrV/WovQkF9siFLgmqYcYvQ=;
 b=MW8CumvMn44D82K/Oq5RLdNtW/Anm7WjyOZefyFHNU1eF3YIneO01F61egM2zMwhyv
 7DCjuYjlp3tw4MRFeZ5NfdKt2xmaljb6YRoDSnm5cc2EVjjN1wU3tyYqyIHMH1pMRj/N
 jAN+TaO645GqQY42w9BzalPxpDNBDXEdFBm6kiPDX4SWxWxoaFMJHIZeHF31Y6U55rKD
 xo3br1UPuGnCrbqxFwF7Wli8oXKRr2UkHBzBdBXCFRPc1szNXbEnv+uA/hFxOLyouRl4
 +czg09eHTxIhIeQmZ+ibho08YQLolyBez798ibhoH2ov9CS46lwfstK3vsjEZvzITrf3
 YMGQ==
X-Gm-Message-State: AOAM531Yf9Dn0/zEi6h0Z58QFNQjAqrLwyH45fd7SJ1YrLCqPKW3nACU
 PKe+cDnYvVznVrCOlTTNpOSOrNjvRGI=
X-Google-Smtp-Source: ABdhPJzYZ3SQCWk+h+D9D1Ca3Cm6YaPacVqWz9BmgAUmCLF8yp6OD9dkTbXTLSR9qBK+1qW1ku+62w==
X-Received: by 2002:adf:e845:0:b0:20d:85:394c with SMTP id
 d5-20020adfe845000000b0020d0085394cmr4167405wrn.487.1652969321980; 
 Thu, 19 May 2022 07:08:41 -0700 (PDT)
Received: from shrek2.. (lmontsouris-659-1-42-116.w92-154.abo.wanadoo.fr.
 [92.154.77.116]) by smtp.gmail.com with ESMTPSA id
 f18-20020adfb612000000b0020d00174eabsm4790214wre.94.2022.05.19.07.08.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 07:08:41 -0700 (PDT)
From: Johan Oudinet <johan.oudinet@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 19 May 2022 16:08:02 +0200
Message-Id: <20220519140810.1953601-13-johan.oudinet@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220519140810.1953601-1-johan.oudinet@gmail.com>
References: <20220519140810.1953601-1-johan.oudinet@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 12/20] package/erlang-p1-pkix: bump version
 to 1.0.8
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
 package/erlang-p1-pkix/erlang-p1-pkix.hash | 2 +-
 package/erlang-p1-pkix/erlang-p1-pkix.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/erlang-p1-pkix/erlang-p1-pkix.hash b/package/erlang-p1-pkix/erlang-p1-pkix.hash
index b0ee7d58ba..c58dc5c2c5 100644
--- a/package/erlang-p1-pkix/erlang-p1-pkix.hash
+++ b/package/erlang-p1-pkix/erlang-p1-pkix.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  3a39c4ca74f93efa0e4de4c37f9e4d073b1aeb142ad669f12588ad2b3c39724e  erlang-p1-pkix-1.0.6.tar.gz
+sha256  257171bec3fe495cd390c3a987131893a0a1a0b22e5973ac3cba9c354cb72324  erlang-p1-pkix-1.0.8.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/erlang-p1-pkix/erlang-p1-pkix.mk b/package/erlang-p1-pkix/erlang-p1-pkix.mk
index 12ae042138..a7ecb08ad9 100644
--- a/package/erlang-p1-pkix/erlang-p1-pkix.mk
+++ b/package/erlang-p1-pkix/erlang-p1-pkix.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_P1_PKIX_VERSION = 1.0.6
+ERLANG_P1_PKIX_VERSION = 1.0.8
 ERLANG_P1_PKIX_SITE = $(call github,processone,pkix,$(ERLANG_P1_PKIX_VERSION))
 ERLANG_P1_PKIX_LICENSE = Apache-2.0
 ERLANG_P1_PKIX_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
