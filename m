Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F928D10F33
	for <buildroot@archiver.kernel.org>; Sun, 17 Nov 2024 22:05:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1FDC784148;
	Sun, 17 Nov 2024 22:05:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DopZKKt9kA0x; Sun, 17 Nov 2024 22:05:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 44BE084488
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 44BE084488;
	Sun, 17 Nov 2024 22:05:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9A49BB14
 for <buildroot@buildroot.org>; Sun, 17 Nov 2024 22:05:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8840D84488
 for <buildroot@buildroot.org>; Sun, 17 Nov 2024 22:05:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iryzHStMQ616 for <buildroot@buildroot.org>;
 Sun, 17 Nov 2024 22:05:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=robertoxmed@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B275484148
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B275484148
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B275484148
 for <buildroot@buildroot.org>; Sun, 17 Nov 2024 22:05:06 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4316a44d1bbso19809435e9.3
 for <buildroot@buildroot.org>; Sun, 17 Nov 2024 14:05:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731881104; x=1732485904;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=n0PNSr4590k+BrWzHd/FC8RZIQl3wZZbZ26AdQPWRKU=;
 b=BYqI6BjOkkOk6nYHzz826RK7sNzP/A10sfn1RxlLC3geO+ShTHlhdj7MQ62PSRnI03
 ezgBsbM3pNRDL4bVWeuoDnKF9ugsSMYTSnJw9jzjy2aWKo4TcC0gc08VaoXNKNh2Pvnn
 QHhJFVQ8TuNH7C2Iv37sGnVlA2WYmGcqqLeO1BENYFkRkTR/2QUwwybQF1lgowyLibVQ
 RdZDfFS/i6Nx9i3P8IMpfLfbaRWNBYG/r1GTz/eBeSqAobmZwN+t9weJ3nv/TCYMdMfA
 2xLVSK9WWyf4I7ohfXqSG2WDjGDVJZJKgOAJRi7rsAvYmIvdHCAzNn8c6qp9tM5xFPtb
 xliQ==
X-Gm-Message-State: AOJu0YwVPFqHph0UGO1zAZMid+Ulw6K2d4tpJmwmPDq2dAnc6fZkE064
 rwPAG9WHUyDKzbcfTrGkcrbXv98TVdCLH/rni9CoPC6Oh0QCp2dP11V6nnkJ
X-Google-Smtp-Source: AGHT+IF2yZceEumXj5iLFSYOxkhnUmow6U8EnfWdwomXAx+PBlv4bEiLUcoPYktB9fr86BueBFk1Ew==
X-Received: by 2002:a05:600c:1d8f:b0:431:5a27:839c with SMTP id
 5b1f17b1804b1-432df71eb8fmr90040175e9.5.1731881104268; 
 Sun, 17 Nov 2024 14:05:04 -0800 (PST)
Received: from Suzaku.home ([2001:bb6:11e3:a300:da4d:c63d:b184:11d6])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432dab80821sm131158645e9.23.2024.11.17.14.05.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Nov 2024 14:05:03 -0800 (PST)
From: Roberto Medina <robertoxmed@gmail.com>
To: buildroot@buildroot.org
Cc: Roberto Medina <robertoxmed@gmail.com>
Date: Sun, 17 Nov 2024 22:04:59 +0000
Message-ID: <20241117220500.584642-1-robertoxmed@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731881104; x=1732485904; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=n0PNSr4590k+BrWzHd/FC8RZIQl3wZZbZ26AdQPWRKU=;
 b=GupuYGFunRy1m6Zqks52d0j+BPWiUpnBJ/+6qXB2xIV+ycMkguCaqrKcZohtzBokJT
 I3A26QRW8RiWY1uUXB06TFwkM7Gyl9VFW5ETdN90BckbnyM9tHX3TSB+8EAyed4TIuTs
 edPypxrRwhjkhIY+UlFy50HSjt/coH2eKPr4nrIAzST7fU3CngxpKYJhGwyBv7rl+mUo
 YFeIpEW8vZthxz76uNxq106QhGYhcC+niZT5EYsojiaRTfkk6fKdVY2Ufa6Z5Y3IwbJu
 lybp7tPlFuqYChwHcA51ysUbXdeZ4QkzeuPnxeRL6kqVdYK3No/4AckmdDLEvN/Pkn6B
 jO7Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=GupuYGFu
Subject: [Buildroot] [PATCH v3 0/1] configs/roc_pc_rk3399: Bump Linux, U-Boot,
 TF-A
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

v3 -> v2:
- Revert to use Glibc.

v2 -> v1:
- Enable checking hashes and add relevant hash files.
- Move from Glibc to uClibc.

Roberto Medina (1):
  configs/roc_pc_rk3399: Bump Linux, U-Boot, TF-A

 .../arm-trusted-firmware/arm-trusted-firmware.hash     |  2 ++
 .../patches/linux-headers/linux-headers.hash           |  1 +
 board/firefly/roc-rk3399-pc/patches/linux/linux.hash   |  2 ++
 board/firefly/roc-rk3399-pc/patches/uboot/uboot.hash   |  2 ++
 configs/roc_pc_rk3399_defconfig                        | 10 ++++++----
 5 files changed, 13 insertions(+), 4 deletions(-)
 create mode 100644 board/firefly/roc-rk3399-pc/patches/arm-trusted-firmware/arm-trusted-firmware.hash
 create mode 120000 board/firefly/roc-rk3399-pc/patches/linux-headers/linux-headers.hash
 create mode 100644 board/firefly/roc-rk3399-pc/patches/linux/linux.hash
 create mode 100644 board/firefly/roc-rk3399-pc/patches/uboot/uboot.hash

-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
