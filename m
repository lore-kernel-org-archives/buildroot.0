Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D75FC433EF
	for <buildroot@archiver.kernel.org>; Sat,  7 May 2022 20:29:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5AEC940527;
	Sat,  7 May 2022 20:29:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C_pyxfM4XgOc; Sat,  7 May 2022 20:29:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2EF694017B;
	Sat,  7 May 2022 20:29:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A37841BF599
 for <buildroot@lists.busybox.net>; Sat,  7 May 2022 20:29:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2AFAC40A03
 for <buildroot@lists.busybox.net>; Sat,  7 May 2022 20:29:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IccRs0mNb5qL for <buildroot@lists.busybox.net>;
 Sat,  7 May 2022 20:29:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EE698410C5
 for <buildroot@buildroot.org>; Sat,  7 May 2022 20:29:10 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id bx33so1949501ljb.12
 for <buildroot@buildroot.org>; Sat, 07 May 2022 13:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7p2MoT606q71BM1LrI0936a7l6d6EffKgZtBM2oz7XE=;
 b=MTqFO0Is6wXYHYf2AUj4NNBz65np5E16yVMWUuAwVgC7F83JaDHLsmtPVrQUaQPMgM
 DEgW2wbf59uKdWpIweqm1CDhzrimz+QhhaVdTR0HxQhC0DjE218r70eNvx2KWwwWx0sv
 pHMEAinh0dRjGwPbCIdAMSFUxEsVKPhurhWGa51pC6j5bEy7ep57H+NdbKZZ48K17d5c
 fm09KB1rPGTBbANZAKrvTODIvoQY6NFLfoN38QnxM/ahzhrtVVWXZ4zInLLPa93tdgTw
 +itzrM8WCpvOo4mahbvWjCzFlW1kPTH66WwUummykZziNl77E3MZCfPB0PJDYbo5ur3S
 /YQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7p2MoT606q71BM1LrI0936a7l6d6EffKgZtBM2oz7XE=;
 b=OS0aLiWGVJqXW0whm/6VmyOXNAMcP6vMLcpJKXVQLK676sMMoqB5uk9+sAsjnIjdp5
 ngtIHMLIsUZim6E3uCsTURvIEnmIOSAQVyGuygOVI8t/Rb5razn6gLREMiGet2Ob3wqZ
 0vx/vwk/3g05SqJutcWmPye2tr0DUTwbg7JXd5CSoLIwHebGv7bc94Ky980Pvvivzmxp
 7eDnUtFxbW1T8dtnylM84XFaUieiDBugbm9IN5P3AsTNtZx2BhLn3CWltQ12ExXxYLhH
 g6z0Q+ARfkkRnWM5KHkFb+uYonZqna9RWL01EWxuxJ5v8DMbcnSL2U/YJbKektDyuuMv
 oEJg==
X-Gm-Message-State: AOAM5322ILwhzafaQD1nt14RFA4WUlyujUDbD9r3VJ4JieoTfhI36t8R
 dhpJqfxZyMx+9BQFHVHXJofK9Ky/3CI=
X-Google-Smtp-Source: ABdhPJwpJY9FHJ7nblPQk6+N/otyxlUkNYE3+y6iHlbUpQuSWvMA+oA7NbLDWvu7RA9t5+boAtTEWg==
X-Received: by 2002:a05:651c:1782:b0:244:cb09:c317 with SMTP id
 bn2-20020a05651c178200b00244cb09c317mr6075626ljb.488.1651955348576; 
 Sat, 07 May 2022 13:29:08 -0700 (PDT)
Received: from localhost.localdomain ([5.188.167.245])
 by smtp.googlemail.com with ESMTPSA id
 a17-20020a05651c031100b0024f3d1daea3sm1150028ljp.43.2022.05.07.13.29.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 May 2022 13:29:08 -0700 (PDT)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  7 May 2022 23:29:03 +0300
Message-Id: <20220507202905.397732-2-geomatsi@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220507202905.397732-1-geomatsi@gmail.com>
References: <20220507202905.397732-1-geomatsi@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/3] package/xr819-xradio: bump version
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
Cc: Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pull the latest xradio change that allows build testing
on other platforms than ARM.

Fixes:
- http://autobuild.buildroot.net/results/7ad4a4b6b1612460427e667d98efc6df7b4a2153

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 package/xr819-xradio/xr819-xradio.hash | 2 +-
 package/xr819-xradio/xr819-xradio.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/xr819-xradio/xr819-xradio.hash b/package/xr819-xradio/xr819-xradio.hash
index 4a77db0d1a..89201a8eb7 100644
--- a/package/xr819-xradio/xr819-xradio.hash
+++ b/package/xr819-xradio/xr819-xradio.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  06b91b1fcf98a261125b4d599ffcce2458fb9d0c1f38a4bd432a622b446f0f51  xr819-xradio-16180b6308e3c5dc42a92a663adf669028087ff7.tar.gz
+sha256  0d0449a85488b990d10ecdf67ac88bfbd39fa81c2df5dfcfed583975222afd33  xr819-xradio-4f0cfd5e869ca101e7c624d9ce05ba5d2b2a0bc2.tar.gz
 # Locally computed
 sha256  db296f2f7f35bca3a174efb0eb392b3b17bd94b341851429a3dff411b1c2fc73  LICENSE
diff --git a/package/xr819-xradio/xr819-xradio.mk b/package/xr819-xradio/xr819-xradio.mk
index 5f60be887c..d4b9826f64 100644
--- a/package/xr819-xradio/xr819-xradio.mk
+++ b/package/xr819-xradio/xr819-xradio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XR819_XRADIO_VERSION = 16180b6308e3c5dc42a92a663adf669028087ff7
+XR819_XRADIO_VERSION = 4f0cfd5e869ca101e7c624d9ce05ba5d2b2a0bc2
 XR819_XRADIO_SITE = $(call github,fifteenhex,xradio,$(XR819_XRADIO_VERSION))
 XR819_XRADIO_LICENSE = GPL-2.0
 XR819_XRADIO_LICENSE_FILES = LICENSE
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
