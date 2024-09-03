Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90F0CCD343A
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 14:16:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ECBB0607D3;
	Tue,  3 Sep 2024 14:16:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5XfBwrSnRX4Q; Tue,  3 Sep 2024 14:16:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0FB47607DC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0FB47607DC;
	Tue,  3 Sep 2024 14:16:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A83301BF82C
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 14:16:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9617C607DC
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 14:16:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e0f1us7aDv2J for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 14:16:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::42b; helo=mail-pf1-x42b.google.com;
 envelope-from=daniel@0x0f.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 890CE607D3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 890CE607D3
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 890CE607D3
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 14:16:17 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-7143ae1b48fso3162333b3a.1
 for <buildroot@buildroot.org>; Tue, 03 Sep 2024 07:16:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725372976; x=1725977776;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mz8p6qFnTghFWQ/TBRLPnkEYJ7oO4zyLeAvCcaEsJBI=;
 b=No7yckSywIPcQRTGF+dltOKEPR1hA+WWt2iDC+bc3ab0pv6WHUwLu6Zhsfw8t41Slg
 0w06bHwOGG8JjjRsfMoIi5OKM0OJGnUkQSyifrK4JqOLkpN4QdFlYA/UmoB+B77RL/W4
 Zd0u5k+2u7qGdx0/mPtiarj6gobPWcbQlsodNuXetxGlmzFnA7ampGjSWbjA/WgGc2gz
 zMH+HXBh/JgHk2c+hD4l6JZZ1bptsOUwqDHZNRa+RqZCzyH4XEzTD3Ovoc/RXczyegI6
 XuJPL9xzC/vp9jtQsO5L+pQz7Ah5QD1+ybpMbRGwZbF2Gtyu8tgb6ESDec71RnzzhPVd
 bTgw==
X-Gm-Message-State: AOJu0YznxtJV2BWk9II50tZ/5DeCL0k+85RcxkScdXC3DStv4kg4+Ilx
 KjFbDNdOThSMyKUo3sp3ZfrhAFgVBaOPhLubciVtVSbjCDDCnlQuNqoHdEL1ylmUjc8t6h/z7AT
 LVSc=
X-Google-Smtp-Source: AGHT+IEmHxfoc0O/0ry8RwyjJK5wOfGDON3KzMVIdnQsgP4rOr4DCrFu8NZCJ90zRJHgXV16WwEJBw==
X-Received: by 2002:a05:6a21:3949:b0:1c4:87b9:7ef9 with SMTP id
 adf61e73a8af0-1cece5d1391mr11958199637.42.1725372976344; 
 Tue, 03 Sep 2024 07:16:16 -0700 (PDT)
Received: from shiro.work.home.arpa
 (p1980092-ipxg00g01sizuokaden.shizuoka.ocn.ne.jp. [153.201.32.92])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-7175e26bc3csm2882191b3a.205.2024.09.03.07.16.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 07:16:16 -0700 (PDT)
From: Daniel Palmer <daniel@0x0f.com>
To: buildroot@buildroot.org
Date: Tue,  3 Sep 2024 23:16:11 +0900
Message-ID: <20240903141611.458298-1-daniel@0x0f.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=0x0f.com; s=google; t=1725372976; x=1725977776; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mz8p6qFnTghFWQ/TBRLPnkEYJ7oO4zyLeAvCcaEsJBI=;
 b=YG7lRYK5MvDY+ovXtcHWDxEXBVSgtSN4tQ/3zTSqGh7Vbmr7gQbSVigszj2u7aOeGf
 dPGhWYwGmYkhEcYD8ZE1BzzEEhRQprfLggwWskfyEQ1J4Q8G9tlG/ivKUC6o/KNZB26a
 BTU8+ewIQKojAdqkUlK2IkvCey44mz/TARN3I=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=0x0f.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=0x0f.com header.i=@0x0f.com header.a=rsa-sha256
 header.s=google header.b=YG7lRYK5
Subject: [Buildroot] [PATCH] m68k: Add an option for 68030
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
Cc: Daniel Palmer <daniel@0x0f.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Buildroot is probably the only thing lightweight enough to
run on 68030 machines in the current day.

Add a CPU option for the 68030.

Tested on a Motorola MVME147.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 arch/Config.in.m68k | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/Config.in.m68k b/arch/Config.in.m68k
index 9fd22aaf1e58..235cafacf5b7 100644
--- a/arch/Config.in.m68k
+++ b/arch/Config.in.m68k
@@ -23,6 +23,11 @@ choice
 	help
 	  Specific CPU variant to use
 
+config BR2_m68k_68030
+	bool "68030"
+	select BR2_m68k_m68k
+	select BR2_USE_MMU
+
 config BR2_m68k_68040
 	bool "68040"
 	select BR2_m68k_m68k
@@ -36,6 +41,7 @@ config BR2_m68k_cf5208
 endchoice
 
 config BR2_GCC_TARGET_CPU
+	default "68030"		if BR2_m68k_68030
 	default "68040"		if BR2_m68k_68040
 	default "5208"		if BR2_m68k_cf5208
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
