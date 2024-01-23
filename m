Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4DDBC47258
	for <buildroot@archiver.kernel.org>; Tue, 23 Jan 2024 16:26:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EDCEB40529;
	Tue, 23 Jan 2024 16:26:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EDCEB40529
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Vc9Ou1eWKkDF; Tue, 23 Jan 2024 16:26:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1AE23403FF;
	Tue, 23 Jan 2024 16:26:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1AE23403FF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CF53D1BF3A6
 for <buildroot@lists.busybox.net>; Tue, 23 Jan 2024 16:26:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A6C23410E1
 for <buildroot@lists.busybox.net>; Tue, 23 Jan 2024 16:26:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A6C23410E1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CtTw0Fqa521j for <buildroot@lists.busybox.net>;
 Tue, 23 Jan 2024 16:25:59 +0000 (UTC)
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A2D2541496
 for <buildroot@buildroot.org>; Tue, 23 Jan 2024 16:25:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A2D2541496
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-40ec048e0c1so5298935e9.2
 for <buildroot@buildroot.org>; Tue, 23 Jan 2024 08:25:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706027157; x=1706631957;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8ezvpahyihVXvpekHVyxyx9AGaYVRHmDSewHsWF+k4w=;
 b=XPlLRtqsfckcb4lQmISmKUf90ree6HDtPBOrVTJuWaX5vmYH3c/2P4mZit0EcwVDVF
 sxYCPsHINykqXhmWzBIU7TFodshMAZqbDIaMkNFR5YIHCqzL3AjrenrZmj3Th1oZ2pdu
 4Vtx5tFF+0fG7WKj4GrskhvIUPmXp0/PFRVbmlI5CAIyQuXEYpHbnVl/JdeMz0kIJ+r7
 J9v9jtNa37PFOVe7ofM/fQwfr+Vv4cK5DG+Il4IknMcNBi9pziUNaRuC4RyYNmLYtvwU
 LgwDjXEEfbo58tX/uwnqcfX//pdICnQXMimukJlT3k2ZJdEaNhWDz0OEWv7kO1KFP9R3
 41JA==
X-Gm-Message-State: AOJu0YywF8uwz9cHKHRfDlg38QZQgPFp9YKncnc/VxmdYR/n8MHQLcHK
 m0xXA8TKKhqP0LkXYdAnexcB0oh3mWpg3/289alCRKXuxY/Ky6kifFvVIRF5QUo/AQj6BWQhtKB
 C
X-Google-Smtp-Source: AGHT+IEAARDIYoXtEZ5botzqXKQ0hnPSVNBIiLF4wOj0b1Euk0JR3Kgcra9GyBKRKpQTBiH/Go5izg==
X-Received: by 2002:a05:600c:314d:b0:40e:53ef:8ecb with SMTP id
 h13-20020a05600c314d00b0040e53ef8ecbmr780948wmo.5.1706027157446; 
 Tue, 23 Jan 2024 08:25:57 -0800 (PST)
Received: from localhost.localdomain
 (lfbn-nan-1-1117-126.w90-12.abo.wanadoo.fr. [90.12.67.126])
 by smtp.gmail.com with ESMTPSA id
 u6-20020a05600c138600b0040d5a9d6b68sm47270550wmf.6.2024.01.23.08.25.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jan 2024 08:25:57 -0800 (PST)
From: Antoine Coutant <antoine.coutant@smile.fr>
To: buildroot@buildroot.org
Date: Tue, 23 Jan 2024 17:25:47 +0100
Message-Id: <20240123162548.2738451-2-antoine.coutant@smile.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240123162548.2738451-1-antoine.coutant@smile.fr>
References: <20240123162548.2738451-1-antoine.coutant@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1706027157; x=1706631957;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8ezvpahyihVXvpekHVyxyx9AGaYVRHmDSewHsWF+k4w=;
 b=ZLP2H8ju9Yn3O2zntd1pmrZ47nqATVJ1meH+Fd5HSgPqU4iqRcCqRJ7njmH2Wr7kqw
 /1TEco5YsoCWb4GorHJqkFrdBF0zHTEM10CtXbOF1crDtCTyj8cKrzri2ynt2ywh2w3Z
 rxpqSxT6qxHvTZnvQC9BX0I5yYHkrNOKmedERXUHLZ8ih1o0UochnxwRhI9HNPtz4A4e
 6MxfxFYXAbDiErmuJp5jtCDgKy9JV+eOp8o6iQNFBn5FEwfluiA5CHdl8zm0+Jiah3nP
 SROAMYtdTghlTEX28mRdJNwRmfds8zPJor6dE4E0lae0fWgY38prfnS7UZTrkKA06CjK
 VsGw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=ZLP2H8ju
Subject: [Buildroot] [PATCH] package/hyperfine: bump version to 1.18.0
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
Cc: Antoine Coutant <antoine.coutant@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:
https://github.com/sharkdp/hyperfine/blob/master/CHANGELOG.md

Signed-off-by: Antoine Coutant <antoine.coutant@smile.fr>
---
Tested on qemu_x86_64
---
 package/hyperfine/hyperfine.hash | 2 +-
 package/hyperfine/hyperfine.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/hyperfine/hyperfine.hash b/package/hyperfine/hyperfine.hash
index 50cc7694b3..c7e094080a 100644
--- a/package/hyperfine/hyperfine.hash
+++ b/package/hyperfine/hyperfine.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  28fcd72c556b4ca2150577217a4d7d51907b7e00ff86b764943d068202a92ace  hyperfine-1.14.0.tar.gz
+sha256  40204671ee8ca73b15c88fcbc6399af0aca69ae9fc45f3ae36487b9c5c07cf48  hyperfine-1.18.0.tar.gz
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE-APACHE
 sha256  1dfee18c2ff07ce551de4d6a1d2db158c0380746b488a7f0d08c8e0d3568b7c3  LICENSE-MIT
diff --git a/package/hyperfine/hyperfine.mk b/package/hyperfine/hyperfine.mk
index 62246f002e..b9f09a2820 100644
--- a/package/hyperfine/hyperfine.mk
+++ b/package/hyperfine/hyperfine.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HYPERFINE_VERSION = 1.14.0
+HYPERFINE_VERSION = 1.18.0
 HYPERFINE_SITE = $(call github,sharkdp,hyperfine,v$(HYPERFINE_VERSION))
 HYPERFINE_LICENSE = Apache-2.0 or MIT
 HYPERFINE_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
