Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12D91C433EF
	for <buildroot@archiver.kernel.org>; Thu, 19 May 2022 14:11:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C850760F3B;
	Thu, 19 May 2022 14:11:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cvnpuNS_A8LX; Thu, 19 May 2022 14:11:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DACBE60EAC;
	Thu, 19 May 2022 14:11:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DBE481C116E
 for <buildroot@lists.busybox.net>; Thu, 19 May 2022 14:08:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C99B140124
 for <buildroot@lists.busybox.net>; Thu, 19 May 2022 14:08:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yKUAaluvh0J0 for <buildroot@lists.busybox.net>;
 Thu, 19 May 2022 14:08:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 00CA6404D1
 for <buildroot@buildroot.org>; Thu, 19 May 2022 14:08:42 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id s28so7221644wrb.7
 for <buildroot@buildroot.org>; Thu, 19 May 2022 07:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=i7XJOJPcjSMEEwctHtUxQIexDeWSOoXLddVhind+MkA=;
 b=gBx1rYvNAiH7naDE4YaEeZlc2K1mJrQERXNMRVYhGXWWcdGnmIIaQ+NXSDCMfxzJR/
 gKsXlnYq9/Bgs1FPT/Uxjc7kWNk46zI4g7aiv2CsMouTns8Fsa/Fuawu1Uq7Ey564hM0
 lOQHZ90y4XjFp8+TCvFGQKJxvwmiVHaK7XhzyvlTP36azYHT46nH4K0VhrVmmCmzH1Qe
 N2N238mXbvjnORLCVbmKFbiGDEANpcbpFCp9+KFWXJ+VeOq+4oVs9KimaNNvQ1ekPs3U
 iTJH9eZyR1R3/WB8tc2alcEkFHGJK2Oz/fTM9FnsrMHl67Etu28QdasyAbURC8ZbG4vg
 qEgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=i7XJOJPcjSMEEwctHtUxQIexDeWSOoXLddVhind+MkA=;
 b=culpsX7xp910HVEQ6uXK357qxepeiBRcAbVgTzlQVUc7pJzD5MjwPjV+WEC+/hCPQk
 TXDXZv1g0MrdvDULk1mlArrBVY7t/Jy3sOMXHwgoMbeRZmTa7JI8z8tfiZTAOCCRW4LH
 AxcMKF2bUVu8Em1/Lk2ff/5LSxfwpJW5qsmn+VLvdUSWd6ZBP+DLFI4ipcN3duq6hxYU
 iToVmCzlAoQMIGB1yvMIicSY3fyjc7uLucnzhvekwnp2Bc9idFA94Mj3aVOjusq8cRp9
 BtcvjOkRPZdVbb0HGuq6wGcYVGGEubhAVypqcd96jI8MIR1gAsas/vgxENBXff9upjRR
 /aCg==
X-Gm-Message-State: AOAM532ULYEs7VMBdb/qIQd5xYtfqyK6tBrX8lCnpLxRpURfTsibu/Pa
 Rt6+20XeU7MgVUpbefMJp6UPPtmRhhw=
X-Google-Smtp-Source: ABdhPJy/Phnx5BitJ9/1ugce5Ys+c4xuCaIHXAQiYD/lhvc6RL5CrAAt6AFBHH2SuUra7cnAEsjkXw==
X-Received: by 2002:a05:6000:144f:b0:20c:6090:3040 with SMTP id
 v15-20020a056000144f00b0020c60903040mr4119269wrx.479.1652969320965; 
 Thu, 19 May 2022 07:08:40 -0700 (PDT)
Received: from shrek2.. (lmontsouris-659-1-42-116.w92-154.abo.wanadoo.fr.
 [92.154.77.116]) by smtp.gmail.com with ESMTPSA id
 f18-20020adfb612000000b0020d00174eabsm4790214wre.94.2022.05.19.07.08.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 07:08:40 -0700 (PDT)
From: Johan Oudinet <johan.oudinet@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 19 May 2022 16:08:01 +0200
Message-Id: <20220519140810.1953601-12-johan.oudinet@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220519140810.1953601-1-johan.oudinet@gmail.com>
References: <20220519140810.1953601-1-johan.oudinet@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 11/20] package/erlang-p1-oauth2: bump version
 to 0.6.10
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
 package/erlang-p1-oauth2/erlang-p1-oauth2.hash | 2 +-
 package/erlang-p1-oauth2/erlang-p1-oauth2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/erlang-p1-oauth2/erlang-p1-oauth2.hash b/package/erlang-p1-oauth2/erlang-p1-oauth2.hash
index a6d00aa96e..7a0304e86a 100644
--- a/package/erlang-p1-oauth2/erlang-p1-oauth2.hash
+++ b/package/erlang-p1-oauth2/erlang-p1-oauth2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  c5cf0d2a9f5874c289cc6044945f4771a79007bda812e5269dea3a4c92fc8811  erlang-p1-oauth2-0.6.7.tar.gz
+sha256  625e6d96a212cc2cf8a63c36ee698072791d85acbaae18e5820ba144cdaca869  erlang-p1-oauth2-0.6.10.tar.gz
 sha256  0ecddd0a5e35b7fcdab451f54c5bb688fac8365cdf6b0da0ac64b7895a0770f3  LICENSE
diff --git a/package/erlang-p1-oauth2/erlang-p1-oauth2.mk b/package/erlang-p1-oauth2/erlang-p1-oauth2.mk
index d7dd45b252..50ac9fbda5 100644
--- a/package/erlang-p1-oauth2/erlang-p1-oauth2.mk
+++ b/package/erlang-p1-oauth2/erlang-p1-oauth2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_P1_OAUTH2_VERSION = 0.6.7
+ERLANG_P1_OAUTH2_VERSION = 0.6.10
 ERLANG_P1_OAUTH2_SITE = $(call github,processone,p1_oauth2,$(ERLANG_P1_OAUTH2_VERSION))
 ERLANG_P1_OAUTH2_LICENSE = MIT
 ERLANG_P1_OAUTH2_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
