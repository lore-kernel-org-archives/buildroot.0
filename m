Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4171CC4829D
	for <buildroot@archiver.kernel.org>; Tue, 13 Feb 2024 02:19:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D76A6405F6;
	Tue, 13 Feb 2024 02:19:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AlC0-8eQi5oN; Tue, 13 Feb 2024 02:19:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BEFEE405F7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BEFEE405F7;
	Tue, 13 Feb 2024 02:19:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BB1861BF343
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 02:19:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A7C3440529
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 02:19:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GT8cUqm0FFNn for <buildroot@lists.busybox.net>;
 Tue, 13 Feb 2024 02:19:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::102f; helo=mail-pj1-x102f.google.com;
 envelope-from=kadambini.nema@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E7FCD404F5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E7FCD404F5
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E7FCD404F5
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 02:19:53 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 98e67ed59e1d1-2906773c7e9so2155588a91.1
 for <buildroot@buildroot.org>; Mon, 12 Feb 2024 18:19:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707790792; x=1708395592;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=k/yQpxaU6TCNWafyHhrRoC26bDcWORXzypmzKEy/FZY=;
 b=KY7Ewux2iY5UANX8nYDu6w+3xq2ES1x8o+xTSc3q4RuOVVW/aJa5Yts9r0arwedO1N
 QnUIULUYHDQzFrG7N0vLkGDsWhFP//dSQiIuc2JnYwfoPhZr5ppISDsCkw9sL/ggkyFE
 dvKCQrlrMHjNeoj4+WExmKH9JrekC4Y/uBI7AOdUYx17edG5RJNUssaH/hrToZpHMh2T
 1shRLQGPvkPRwT7ngqgkvnKVlOP0F+71/zwc/+ZTmPhPPg6+Fk3bh5Imqm4Uy7yg568f
 0TkvJAuNQm0zJ3PHgCymZp4PeveE6uZQe9y2E07+haxjJ1HZDFxLkW3NZ6yaYtKppWwu
 gYQA==
X-Gm-Message-State: AOJu0YxZyKK8IkpJ3HFC/S9jLvwDzRnDjpn9F9i0zRCzJhNQqEHwQhRn
 PegU6NjaFcQmSwgIUTPOHx2QYTQ4iSfxNRCpgEx7iUHAcfw/FbXDdDO6rO74Nfc=
X-Google-Smtp-Source: AGHT+IHmWKv5Snn17R0rIkycdRkVTaCtnbTxc4Tg5tZoiSxTcFGuoHIRdFSDhPFmm1OBlbxeZYPmuQ==
X-Received: by 2002:a17:90a:7286:b0:296:e93:cdc with SMTP id
 e6-20020a17090a728600b002960e930cdcmr4545324pjg.16.1707790792451; 
 Mon, 12 Feb 2024 18:19:52 -0800 (PST)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 ph8-20020a17090b3bc800b0029899165611sm701704pjb.35.2024.02.12.18.19.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Feb 2024 18:19:52 -0800 (PST)
From: Kadambini Nema <kadambini.nema@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 12 Feb 2024 18:17:44 -0800
Message-Id: <20240213021745.1350798-1-kadambini.nema@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707790792; x=1708395592; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=k/yQpxaU6TCNWafyHhrRoC26bDcWORXzypmzKEy/FZY=;
 b=dw+UBVmyfyzBPdTwlR5kALMLmTm2Fnrw+6w/sb4A4kQtBlTSRRpS7hXhRShQq/9zim
 xhyRjTqsw2Zd6YJc4eQVMzSrOH/Zvg8XNjYqq2kQVp3+Gr0BvJWjQa6GXgbj7Sj0tPfR
 N0r55IjlokKoGAVNkaO1nIkzXxoM2K22FUdeQQB7xkYnl3KfpJu7oYDf9SG6YfxzgJ28
 43FKxFasm/rwGBev+DYvOHtKsD8YjXvUm6chddIE0/vnusrj0OharX5mvd8iGTZiwGQR
 cLf60v3Td+ib8IMoGlB/j+vqLYvMJDoJWs+0C8Ch6qe/olHuDCnV0Hl5NUPQjJF4669B
 beIw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=dw+UBVmy
Subject: [Buildroot] [PATCH 1/1] package/zlib-ng: bump version to 2.1.6
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
Cc: Kadambini Nema <kadambini.nema@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
---
 package/zlib-ng/zlib-ng.hash | 2 +-
 package/zlib-ng/zlib-ng.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/zlib-ng/zlib-ng.hash b/package/zlib-ng/zlib-ng.hash
index a2fe98435c..908164aa60 100644
--- a/package/zlib-ng/zlib-ng.hash
+++ b/package/zlib-ng/zlib-ng.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  d20e55f89d71991c59f1c5ad1ef944815e5850526c0d9cd8e504eaed5b24491a  zlib-ng-2.1.3.tar.gz
+sha256  a5d504c0d52e2e2721e7e7d86988dec2e290d723ced2307145dedd06aeb6fef2  zlib-ng-2.1.6.tar.gz
 sha256  d3c80be055d94d798eaa786116e84fa0b010bc11420b5d2060d978ea77845436  LICENSE.md
diff --git a/package/zlib-ng/zlib-ng.mk b/package/zlib-ng/zlib-ng.mk
index fbb906503a..2fb6ea763f 100644
--- a/package/zlib-ng/zlib-ng.mk
+++ b/package/zlib-ng/zlib-ng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZLIB_NG_VERSION = 2.1.3
+ZLIB_NG_VERSION = 2.1.6
 ZLIB_NG_SITE = $(call github,zlib-ng,zlib-ng,$(ZLIB_NG_VERSION))
 ZLIB_NG_LICENSE = Zlib
 ZLIB_NG_LICENSE_FILES = LICENSE.md
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
