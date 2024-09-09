Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE96EECE57A
	for <buildroot@archiver.kernel.org>; Mon,  9 Sep 2024 12:12:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 91FBE6066A;
	Mon,  9 Sep 2024 12:12:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FnicrjI15N5K; Mon,  9 Sep 2024 12:12:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9EC14606CE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9EC14606CE;
	Mon,  9 Sep 2024 12:12:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 88BE01BF366
 for <buildroot@lists.busybox.net>; Mon,  9 Sep 2024 12:12:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 825844029F
 for <buildroot@lists.busybox.net>; Mon,  9 Sep 2024 12:12:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xb7fgaOcssb6 for <buildroot@lists.busybox.net>;
 Mon,  9 Sep 2024 12:12:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::136; helo=mail-lf1-x136.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6EF084029C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6EF084029C
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6EF084029C
 for <buildroot@buildroot.org>; Mon,  9 Sep 2024 12:12:54 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-5365aec6fc1so3362229e87.3
 for <buildroot@buildroot.org>; Mon, 09 Sep 2024 05:12:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725883973; x=1726488773;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xXOlo4mmKNRtzpezhqHVVf4gk2N9wpQFgkEecZ7F9sI=;
 b=a6jyF4w9h2v8Pya3Ud4ZGC2WW6+3CwEXA8GDRodax2mzbHp+xNxjk0QAQ7mT7m/g9I
 9dNGsiM6wvDGK+nB6IEwCp/rTfZsMeNhX03lI9FpFiqu10UGDNtcWIHug2uAIw4WI59L
 +UcMRrQXhKJhji/pyO7R0ZgxRTbEN7njUk/DFAMa/dtoS51uOzXvkO7+CSqjpjjBP3lQ
 XYM/iEcfUUU4uFk7LrU0bxx8pMQWvOCACD/nFN0SPNtVYyF8ZwUKFXFkpwl2XoSCbevc
 HX68VnsFfJs3LpoUrZWfrpFMmwxEfrqJiwZ+CfOvtyU5/0kvTnYQtWxDcj7dMcazww1R
 o61w==
X-Gm-Message-State: AOJu0YxXwOh/xMOrEJaC5cgcX876tx/nIoFdCmcxXi+kzx4QzKof2TsH
 jFHbuOCZxB/3EmWgMwiBruUln5TBAr1FGYZKdtvwQaA45J5S1h15Wy8+yg==
X-Google-Smtp-Source: AGHT+IFprc244H9dMNzDOVtHo8mr/s6GIp4ZMJUWswH2DEdvlj33F4ch/fiOvykm8wttgj41SZ2P2g==
X-Received: by 2002:a05:6512:3987:b0:52f:244:206f with SMTP id
 2adb3069b0e04-53658809f15mr6716369e87.53.1725883972617; 
 Mon, 09 Sep 2024 05:12:52 -0700 (PDT)
Received: from precision7530-arch-roy.lan
 ([2a01:799:1a22:4401:9825:b52b:4cba:665e])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5365f905a06sm747560e87.241.2024.09.09.05.12.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2024 05:12:51 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  9 Sep 2024 14:11:13 +0200
Message-ID: <20240909121115.1165942-2-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240909121115.1165942-1-roykollensvendsen@gmail.com>
References: <20240909121115.1165942-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725883973; x=1726488773; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xXOlo4mmKNRtzpezhqHVVf4gk2N9wpQFgkEecZ7F9sI=;
 b=lAtzVhKZzYWgGLpeJybh+wdfbjMVFANHV4DxuuRgPTYWpDqTD0YgRDyOO7dojMdC5u
 vxCcW8FfwBPObbRYAGq37sDZdqLahEXubnMJPGEn9IhXzy7rXMGkiG/tzzXXQXEzsOyA
 X50idt4rkOowEzvpmrSHJCD1CF5QcAax6wQRbJIWMEROLGSNuxYg+2f6cAnPnyhrK490
 jLNM8tI2uOFkrM80ifcSUafIwWLvRxJog4ebOlujNowZHn84xo9mqYmr53qDOTiw/q3I
 S3++mvbWWHZ0oG08NlTodHMXnu1USzCq4auLtP84z9xTT8pHLfbM28jrFgK6R3A/+hXT
 BRMw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=lAtzVhKZ
Subject: [Buildroot] [PATCH v4 2/2] DEVELOPERS: add Roy Kollen Svendsen for
 dlib
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
Cc: Samuel Martin <s.martin49@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index b0efabfd5d..8df56f37c0 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2878,6 +2878,7 @@ F:	support/testing/tests/package/test_python_mako.py
 F:	toolchain/
 
 N:	Roy Kollen Svendsen <roykollensvendsen@gmail.com>
+F:	package/dlib/
 F:	package/qt6/
 
 N:	Rufus Segar <rhs@riseup.net>
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
