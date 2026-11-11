Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C0F606A321
	for <buildroot@archiver.kernel.org>; Wed, 11 Nov 2026 15:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=H3WjPkiq;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SO2zNNP2
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 15302812A0;
	Wed, 11 Nov 2026 15:46:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a0_bSXzxKMb3; Wed, 11 Nov 2026 15:46:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 856548123F
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794411962;
	b=derhr/OqUax/PzzVizLFjBrtzXugXI4f4sCu/TEyZVrTRQOmsxkUHIoE/QA5nIVcU4+F
	 In0uGAQ18BRWF9YS1007V9/zzFro9R0FAGOVkqYIaEpVFY+kczSEndAF3Z3OCK7K73QzA
	 GLrNRDbrdwLYpkObMNs+jxMOlDgFpUevP1aJp1QXeuGwczgTMpL+dE+6Tx14faKyJ2Ign
	 Zkb0JpxZ94Szrwxc3E8m6TBT3ajMB7A/X+NXrsEeWDODx3yT1qMzS2qdFPvfrIA5h0hib
	 PWtVup2/2wRlhVdnS5yuqA5OFJqHS7JOUc+yBq9s8n6zYoIv/8+6sgc6PX25MG8/szQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794411962;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=ywP4Y4J0AAUUQ9+KAKI4X1Y57pguQg0p8jsy7t8YQAA=;
	b=SySLJAaNPY/MGMr3GqJU60HSnIAycdvvat70bPAjG9r9IqeeJdu7ID5rm3ptpe++xKth
	 4NSUei57nnoz+2ehYIRLKLkj/oT1tR8xFADA14gYs69JmZKtAIdyKlEAHKxfJl/ycdJJI
	 xYcMIUZfu377M1ZrN9Lv1uJK6evdwvge1Wn3y9yemtYW+kdt08o4yjMrjfXTiEsS+ERMs
	 yI1JrW92nl+vIPb3g3B6o1TlTOZ01aHP4ERezHbr06ICrPm6FXFpXSM+IR5ih7LJHnkF9
	 SPl+rLr2R0f3YPbLPV7Wdu3gjDuqqK48SZ4LZJq2BBlXbMWA+MqqYDIDGjb7mFi58Gw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SO2zNNP2;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794411962;
	bh=ywP4Y4J0AAUUQ9+KAKI4X1Y57pguQg0p8jsy7t8YQAA=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=H3WjPkiq33vlv5bIp/9KWixeL1MNQLrniBG0LC7JIRRY8a+7dplMTWlyeWRwMDg9g
	 OhT2F/rmHQz1uXMxRWy1PAp/RV6BQoVvJ8cJNdJ1HLMpz2obM1HXk880JsYNAuzMvE
	 JefJNwNp6kPs2MnDFwDLj4IloE3nnvEE9Qnmfd1bmmYMztp1LXrujkp7hWij34wUut
	 1l96JbdcCsK2oIlAdDYvWc7ziaziyLoIVIcn7oFvsmsvNVbctnBHOnDT96lP/ytQ/6
	 mDEHxddfxQOCdbGigm2BJee40hR5g75POIbu5XCDKj1XaF2ISQzUROxUWDFAKzq0IP
	 cXSLB3Bt4v8/A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 856548123F;
	Wed, 11 Nov 2026 15:46:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id BB2BF31F
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 15:46:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ACE62811E0
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 15:46:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rtz9f2_XFsXA for <buildroot@buildroot.org>;
 Wed, 11 Nov 2026 15:46:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 7B57780CD4
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::432"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=SO2zNNP2
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7B57780CD4
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 15:45:58 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-490585eddfcso2586275f8f.0
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 07:45:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794411957; x=1795016757; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=dQrAgnxWzRUfFpAz0XzTSiDcbAwXK4W3Php8WZlXWzM=;
 b=SO2zNNP2FX5dax6JGqhNyrZ8Adme6LUo0qQNh0AogATxHZZhiP7bY4HU/ckesXZSrB
 d/6ONueNEsKpSa8UwFQNWT0N8/tC9Bu5851AUTWQ5lkmDFn0LRkDmHI6OoKwbisXxZVh
 MJeOcqqxTQ4QNZ7IB3jrGMP3Otrq4FzF53uvQUV7aDbCGRbQAvLcA/ZOqMGXNi7XzFlx
 lMyEO+uJlSJ/DirSW3Py+IzwPA4Q3CNebb09y8WuGcD0OXC55yaf7b/WrTkbqd5zSXoY
 NQyJ84dnDvfrUllQhQ6Wz8IsOrpqchGWl1z/VIWCzpCblqzNomfaBDh7VIwXWAhA1aMm
 1caQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794411957; x=1795016757;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=dQrAgnxWzRUfFpAz0XzTSiDcbAwXK4W3Php8WZlXWzM=;
 b=btD1cKnW5vA7mdgHeKpxRRR26svAEBrM5tht+bAxnUinyW2e4ZAWNFlvLXY/I+y95F
 WPThxSQXFZjUgixpHYm7lsCp6VfcXooyMPRj6ZK9c1VUKTw4r+6lLLaY6HPGzaT0K2z/
 71Nm66l5khkE9siuHnFOkTWU8HFMQ1JSFStbvnUZfx29dIO0aPrTHYCrA1RV4j28MlCM
 FhJVCSnS1eLwrcbtM5put13Zhgxvv4bhnUr0FJaNgWcfGEirnlzw+JP6Tqh9Rqs85cM3
 ZLeQDqpq/u79vX/lmotEbmwYVh5C+ndk3Otb2fpOtEN6BlUpnjSJoaLsMy+upsDZO81V
 atqw==
X-Gm-Message-State: APuU4Z8URjCc83XTdy48YPMRIDfsqRO7MlGrNSnEN3E2h1SayOH34jqq
 +styot4mSoqVLHBV6lHYlIjmKuwHvn4Da6CcuQBX3xguolw/x/w3UPZvv8MQzsBt
X-Gm-Gg: AYBFou1tFeM/i2624tmUvz4Jz23xMM04s9tUjxwXOUkHmmfLiWnrqk0rcIkdwfci5ms
 CLiAX9Lqw6GklqqXLmn0kKsdEuM1CmQ+FRkWKC71XTCf+IhH4cgmGElrWKp3QAzw0dJBF38Nx9T
 d9Qgm5d5krrRQaXStxRn4wU42duMprODVaOoTdUAydUdbvqrc1nHQDrBC7eoxnrQLJR9bQwKBQr
 M2EP3sB5r711HihcVGuXTgvqcuuMWkuX5AlVjRFTv/uBtoOK7eY0+HyEAh4+VMcG271oBa7Ddr5
 7RaoegeqQxVY0GCiizTMCOejpBzKHyDHKDUomNeCgS22LgPAqm9aaCD5mOjDgaWNof9mib155Tj
 9Bz9g8re0g3hkg2d0Qut7soQ6DOatOvJeSaJpKokKLY4bdEs/I5zHmZmFnqkd19+6eAkxDODKYB
 hi3KqNZ06LfO4oyzjJOz73ASll6h46CB9bZQe/Y7kKiXMgADs5/FkVDwf86lvYIN9BkYRg2VIa+
 LDM5GXL5whJPp4g7/Ad4TU9dEfsVlPL6FUh/qTiW5MX4StowZTYXHdHU8ofFmMVtvI3DJY5XH9F
 PUZjotyt2hC4/ssT1pjgpdmx/p2MF87wAeCoBTT4fDIXFIeems/D
X-Received: by 2002:a05:600c:8b70:b0:4b7:6c16:7b43 with SMTP id
 5b1f17b1804b1-4ba0939d508mr50255385e9.10.1794411956658; 
 Wed, 11 Nov 2026 07:45:56 -0800 (PST)
Received: from angelo-Precision-7550 ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb4c53bb94sm4574095e9.8.2026.11.11.07.45.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2026 07:45:56 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Biagio Montaruli <biagio.hkr@gmail.com>,
 Edgar Bonet <bonet@grenoble.cnrs.fr>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Simon Dawson <spdawson@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Wed, 11 Nov 2026 16:45:48 +0100
Message-ID: <20261111154553.673632-2-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261111154553.673632-1-angelo.compagnucci@gmail.com>
References: <20261110215557.2248804-1-angelo.compagnucci@gmail.com>
 <20261111154553.673632-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 2/6] configs/acmesystems_acqua_a5_*: bump
 AT91Bootstrap to 3.10.4
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Use the 3.x version of the at91bootstrap3 package, now 3.10.4, instead
of fetching v3.10.3 from git, and drop the board hash file of the git
tarball: the package hash file covers the release tarball.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Tested-by: Edgar Bonet <bonet@grenoble.cnrs.fr>
Acked-by: Edgar Bonet <bonet@grenoble.cnrs.fr>
---
Changes v1 -> v2:
  - collect Tested-by and Acked-by [Edgar]
---
 .../acqua-a5/patches/at91bootstrap3/at91bootstrap3.hash      | 2 --
 configs/acmesystems_acqua_a5_256mb_defconfig                 | 5 +----
 configs/acmesystems_acqua_a5_512mb_defconfig                 | 5 +----
 3 files changed, 2 insertions(+), 10 deletions(-)
 delete mode 100644 board/acmesystems/acqua-a5/patches/at91bootstrap3/at91bootstrap3.hash

diff --git a/board/acmesystems/acqua-a5/patches/at91bootstrap3/at91bootstrap3.hash b/board/acmesystems/acqua-a5/patches/at91bootstrap3/at91bootstrap3.hash
deleted file mode 100644
index 6edf3d3345..0000000000
--- a/board/acmesystems/acqua-a5/patches/at91bootstrap3/at91bootstrap3.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Locally calculated
-sha256  5ea2a8fed1ba0024229c6f6d77176679e1b24791bdbce8e285634013d4a93551  at91bootstrap3-v3.10.3-git4.tar.gz
diff --git a/configs/acmesystems_acqua_a5_256mb_defconfig b/configs/acmesystems_acqua_a5_256mb_defconfig
index 5b31f4c692..725b82e86f 100644
--- a/configs/acmesystems_acqua_a5_256mb_defconfig
+++ b/configs/acmesystems_acqua_a5_256mb_defconfig
@@ -22,10 +22,7 @@ BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_AT91BOOTSTRAP3=y
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.10.3"
-BR2_TARGET_AT91BOOTSTRAP3_LICENSE_FILES=""
+BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION_3X=y
 BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="acqua-256m"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
diff --git a/configs/acmesystems_acqua_a5_512mb_defconfig b/configs/acmesystems_acqua_a5_512mb_defconfig
index ed74dd30d6..470ac36de8 100644
--- a/configs/acmesystems_acqua_a5_512mb_defconfig
+++ b/configs/acmesystems_acqua_a5_512mb_defconfig
@@ -22,10 +22,7 @@ BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_AT91BOOTSTRAP3=y
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.10.3"
-BR2_TARGET_AT91BOOTSTRAP3_LICENSE_FILES=""
+BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION_3X=y
 BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="acqua-512m"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
