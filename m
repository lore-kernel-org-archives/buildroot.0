Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A79B9C88E64
	for <buildroot@archiver.kernel.org>; Mon, 14 Sep 2026 08:22:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1724740608;
	Mon, 14 Sep 2026 08:22:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id THSQAxGc0U6o; Mon, 14 Sep 2026 08:22:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 0B045405F3
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789374120;
	b=EKqqpzm8wjYeJE91u90R3xbtQmFODbilhfAbNrnVnGFJQDlfPx5NV5l4YP4VPUXmcZpi
	 byGJl12ivLzsSyW6MLEwKxr31FsLwDUB5R4I4C936bOATNgb5KhnKVxOIXJgxaAwW0Eua
	 FWtH0o1NQiM3HTdR8BQnOJCKwf5rUtyV9WsislGVIISKRwqGZEgbfsrb5XDQOGJ0uiZ0z
	 Y/wcvKQeoj6mH4Tg+P6E8QxkILXwxjvEdpIZGkcZOxqt0/B1dFwBxXXByBev5F54rnQY/
	 XJyxedAXb/xsRAp8hOqDaJZZm1mbz57T4f4QuSEVeXpVHBLW/9Rnyhy9a33cXmO1jWg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789374120;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=zOjYvnui52hrdnWO06rYIOhQk7VGoNOyy+ca6te7/io=;
	b=UjlWJUU5e/WaurYgs5dfK/hFPxW1MneFVeTIRfyjchDy6OPyW122ipiPqIeDU3zRlzlT
	 syYZAM9px4imFIH+oEyhDktbGRshEDqe7+CLkV7bZ5MYhxGqGZKlqholWZ2dlE6S+y/9m
	 RAY6gRF8GxRFysd6EPFuvw1c4j8qOlZ9MBOYCXgaKy3oB9kihzNM3TD0IYUXgZ3zaTz3y
	 5uA7Hv26QY0uEjllnbYt3LydFA7s7vOTXHVTZ95oXnNf+j/+sb8u/inGpl1ruFVVohEjk
	 e/9c7JWCMeS+2wWR5qk8CexkPMXYay06kY55xiMOqNN0Ko92dZYNgJQlijW4t90pEOg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789374120;
	bh=zOjYvnui52hrdnWO06rYIOhQk7VGoNOyy+ca6te7/io=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=SFiZLoWp0OLvyxSVnJPO8O+EAs/Zaii7eRN+Q7um8fyPIoM9+PHymq7WRXa6ift+e
	 bqU/W75R0f5iKLvg3bWuP+TV/fubkMgKQo9nFwcdTMftQPrty6WfP7/Ie2FQ494+hd
	 efAex79YDnZfux2+nxunaUY7uqqSL8sl8RytvjswBud7++0rQeRiu8DHHeJWzanIci
	 r8RJ+2VcI2vG4jV2cCJ4y5maiE5xIWC1gS5T2kW1vY3t13bUqVVgBXAUH1cInujF6z
	 JWOhN44iP7EvHZCdRbl6ng1zOG2oMVdCxn99hhUehPnNl2BURg5TWY56VLuiKIkbUw
	 jKP+vy8hTO8cA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B045405F3;
	Mon, 14 Sep 2026 08:22:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7610E24D
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 08:21:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 620FA80C93
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 08:21:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TWYXOzs4kHAV for <buildroot@buildroot.org>;
 Mon, 14 Sep 2026 08:21:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org E478080C8D
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:30::10"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789374117;
 b=E+x17TfQo7pRCQBAHK4lgA0o4+RPZah/SnmaA7vRGRTC9iN7bxkwnjCdjsZFUp+BKdte
 BfvZ+PWSsHvjKmKuIB1zp/V24rLik0VumSvfflNll/68gZ//9pAUaa6eIxQZ3mCtN7laO
 n4jownxR/4bO0IifeVkXCcYijjV6Tz9dL/els4oIOOK5kUGPHZbsmgc1BF3IrE7FORiRN
 hN9Xte8KUkY3sa85gb01rurPgEn6LugmpSlzsCdXNjeeqrrr+w+Jrepi8WdLrgxOkd5eK
 CCr/0rOLBrNjF3F7pJSLLsq4d2zUkaVgzdLTFvs0efMvSKlsqrb2fo3t7xDgiqtIDNA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789374117;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=hs91ehr8FARAVasCKrCgQuHfxbvguBHQoHSVAwWfBBs=;
 b=Oyht9WotJSNIp5rKQVhl2F70lu+sq3s3X+OVFFl85V3Lvr/aSno6hlFDIGVD1RXSdimx
 uufw2EdDd8SnibDGzPtVIr239pOxw+Iddzabzo+HgLnRbvy7FIVbOzTWObNlxhG7dQIiu
 gYi2FufvZ3/8q7Pyo9VI6X/FrOmJMKsY/WYcFvctvHJmW0lVlm1rItCwO9qDyj3sF/TSY
 SDCBeplJsyjbaZzcf6ZVr9NqKnXnTntzkhwQIjEluO8tv/rS/y8Vbnj1zc4pGb6dqjzrX
 j3KR07blFNp5gizsJn23VhbzWkz5TleP7TlZhDnELBahxpfPvhr5eqMyvqZ10EtUUBA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b="Yz/dorwy"; 
 arc=none smtp.remote-ip="2a00:1450:4864:30::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:30::10; helo=mail-wr2-x10.google.com;
 envelope-from=fred.lefranc.evs@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=Yz/dorwy
Received: from mail-wr2-x10.google.com (mail-wr2-x10.google.com
 [IPv6:2a00:1450:4864:30::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E478080C8D
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 08:21:55 +0000 (UTC)
Received: by mail-wr2-x10.google.com with SMTP id
 ffacd0b85a97d-484366874b0so920511f8f.2
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 01:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1789374113; x=1789978913; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=hs91ehr8FARAVasCKrCgQuHfxbvguBHQoHSVAwWfBBs=;
 b=Yz/dorwyH9WS2DiEpOMkB3d9ngR/CPqETiJShUIGGA2/TA294JqhH0i572JfNJMXLk
 Bv8snGPOHYITgi2OPLMZjoE1BpJ0h2s7kB/NpZsKhjq9aSTK/l7zhxu8pE19tj66Mzgm
 rdw4yiQqYNkKFHSOQRosUkjOwXPsDccf2OymqlNPtH4/ViSJ5xJLBqOdp+vWgM7nnHYU
 zJXrjC+ExkqeD3HFjXvuAsDOmAst7VeXE/5ZMde4BjGtmKKuTFNBbSFFl28eXy7mAHwe
 spW3QTbl9Ns/Ium1iKdNSS3tUNSawTt5KI09rzoXAM1/f5YkHPtOJJblbCqZmkCKM6u8
 C2Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1789374113; x=1789978913;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=hs91ehr8FARAVasCKrCgQuHfxbvguBHQoHSVAwWfBBs=;
 b=pqMdcNw/b99Wht4yGpt+JXCsg4s7ZtDAtxOCkwhkQOBPPB2NfzLeOrSdDxyAAPl7Fd
 KKHI95PAd3gIiSwL/iADvkCsm9YgjhvIPfjW9dVBMxLuJWgaZ6aeku+9onqLvgcCizF3
 yYZN88eBBzvySzkwRxRAHILgXRiaAHJ2ipcx84492dpINjZkSdN2iiIPYdu3AlGp44e6
 yd3mTVw6Ns9Sat4SvQnv9i+SheX/GsxCfyK2K+P6qxxntQ1iwCleqat25nu4YCWMtAz/
 Qa31Kzv69ASkJpGWAWB9fKhrdBJZYKgMeEGy7VlowU28dp1/S1c/y8NlGefGoYceCKxt
 h0yQ==
X-Gm-Message-State: AFuF++nKUbBdRSKccBhG4Hvde89Mt7BwnAgnSb/rviIKpi70S3aPsitc
 MNrg/Ch0hwSPXmNa5DSAfIeKtFttL0y0FAz3O1LZfhMZ6QJRFeEhwy8P5dFplgjgwB4=
X-Gm-Gg: AYBFou0lfPBDrQojxghKXWtKXftm/YOPPtGX7nm7o3SDGgpW22a8yn5/UvU73LTawxI
 uUK3VGaa56ehAcDbFampJFOrM5IeTsMCgCgcMpRCksjGCyHzNa5Fg94i7sC4qVPlUgwpi8CJsdO
 1YqsZRRGIlBcL0rPemGlYHLk0B7kceH0wV7nb3g4cIHYXvpOZwTTiJmYZpEORLUl8IMf2+HX++w
 j2XWOvxTAGAl0gBsn4xKQPkoOe4jO193Outd9VEWi+VgnTAbuoXiL6qLnuxD65kaLbqNZV0Cgyr
 AQll0HFw2pUSFjeimBQ2X1u5YW7zeFwqriWKlxAyL8Xoh3hhuIAi4mLA+dSOzOXSoQsRjhj7L5p
 zZB7znWfb0BtmIAi1WloK5Q7Nh53LGfZqZVakS5C/4qQGqsOu3Sr1pbGgHA2S+ZKg24PyHdO8WB
 S1S56XtX4np6SDskgYF4zpPGW1YRwSbdPTnYfoMVsqlWr9wgblf2occbOQRqMznKhOaUpy6AOrP
 GfpZcVXWtp5
X-Received: by 2002:a05:6000:389:b0:486:fc38:9ea8 with SMTP id
 ffacd0b85a97d-48702ad8f2amr3346349f8f.8.1789374113088; 
 Mon, 14 Sep 2026 01:21:53 -0700 (PDT)
Received: from WL2200093.evs.tv ([74.221.142.215])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-486eb34e4b5sm24880218f8f.22.2026.09.14.01.21.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Sep 2026 01:21:52 -0700 (PDT)
From: Fred Lefranc <fred.lefranc.evs@gmail.com>
To: buildroot@buildroot.org
Cc: Fred Lefranc <fred.lefranc+evs@gmail.com>
Date: Mon, 14 Sep 2026 10:21:35 +0200
Message-ID: <20260914082138.2802-1-fred.lefranc.evs@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/qt6/qt6base: don't require gbm for eglfs
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

From: Fred Lefranc <fred.lefranc+evs@gmail.com>

Hi all,

While trying to enable Qt 6 with the eglfs eglfs_viv backend on a
32-bit i.MX6 target (imx-gpu-viv, framebuffer output), I hit the
package dependency-chain consistency error, because qt6base pulls in
libgbm/libdrm unconditionally for eglfs even though the Vivante
framebuffer EGL integration needs neither.

The root cause is that qt6base treats GBM as a hard requirement for
*all* of eglfs, whereas GBM/KMS is only needed by the eglfs_kms
backend. This patch decouples the two: eglfs now only requires libegl,
and GBM/KMS support is enabled conditionally when a gbm provider is
available.

Tested:
 - i.MX6Q (Cortex-A9, glibc, EABIhf), imx-gpu-viv FB output: qt6base
   builds, libqeglfs-viv-integration.so is produced, and a Qt app runs
   with -platform eglfs / QT_QPA_EGLFS_INTEGRATION=eglfs_viv.

I wasn't sure whether maintainers prefer keeping a Config.in comment
to explain that eglfs without gbm only provides vendor/fb backends -
happy to add one. Feedback welcome.

Thanks,
Fred

Fred Lefranc (1):
  package/qt6/qt6base: don't require gbm for eglfs

 package/qt6/qt6base/Config.in  |  2 +-
 package/qt6/qt6base/qt6base.mk | 12 ++++++++++--
 2 files changed, 11 insertions(+), 3 deletions(-)

-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
