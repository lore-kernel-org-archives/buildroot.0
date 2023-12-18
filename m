Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C8E9C35274
	for <buildroot@archiver.kernel.org>; Mon, 18 Dec 2023 19:40:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 08B04418A0;
	Mon, 18 Dec 2023 19:40:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 08B04418A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bh8blws2jx-r; Mon, 18 Dec 2023 19:40:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 51AE641898;
	Mon, 18 Dec 2023 19:40:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 51AE641898
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B63271BF3DC
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 19:40:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9BE2081B8A
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 19:40:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9BE2081B8A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fdg7Wpv3Ltrk for <buildroot@lists.busybox.net>;
 Mon, 18 Dec 2023 19:40:08 +0000 (UTC)
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 048AB81B60
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 19:40:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 048AB81B60
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-1d3ac87553bso7467025ad.3
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 11:40:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702928406; x=1703533206;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UaDrgXrLKAqiyJi7lO8g0/jj6VdwvIqpMsgSwuh110k=;
 b=VXx0Yu7VFk7lXGH1GtCEsd4KZoSIyEBehMfTL/n2dLKUfk9ZnDvA+bap0+N5y161sZ
 /8jlwehAUn776Nm8HfILfGsj1cw6f9MSZ3HAJprEZfDpGWZ5DuJcrs8WTxe0RhGTC8VC
 EtQc+j2lkSAMUsac+pWz6zP6mkjcecxXyfpeQjhDPS0FYW3/YOId5MfTnsteTQBvmeJW
 0q+/DjgK8PV+oTXLtiva2+PKKcWxg1p5K75W+331bqSElUe3iXI7ANmvHMsneXQaGi1w
 Y+948oyqYN2wORfVQzgktdwsBKGHhAm/qiTgIKX1kd9A+GgBWmkawxXNkYP1DaFzk9iw
 GBFw==
X-Gm-Message-State: AOJu0YzV8zMZ/9cs5M6YcAoKEwpMxaQERKnpseUQEMSL4XJ5e1KxdOTv
 n8J4vpRXkPzuCy0IPI+xkfVHh2V7UGi6nx963rI=
X-Google-Smtp-Source: AGHT+IGnzGCPJZEy8bCSURlCDpPzioUJchuWQqFglSTaXOhbt7YBszaFmhh/SfSTxqg2xcpHm8jG2w==
X-Received: by 2002:a17:902:f802:b0:1d3:a491:5bfd with SMTP id
 ix2-20020a170902f80200b001d3a4915bfdmr1559624plb.117.1702928406551; 
 Mon, 18 Dec 2023 11:40:06 -0800 (PST)
Received: from DESKTOP-OI0KN2B.amarulasolutions.com ([174.27.209.61])
 by smtp.gmail.com with ESMTPSA id
 jj20-20020a170903049400b001cfbd3f38dcsm2983808plb.225.2023.12.18.11.40.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 11:40:05 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 18 Dec 2023 12:39:47 -0700
Message-ID: <20231218194001.544887-2-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231218194001.544887-1-adam.duskett@amarulasolutions.com>
References: <20231218194001.544887-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1702928406; x=1703533206;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UaDrgXrLKAqiyJi7lO8g0/jj6VdwvIqpMsgSwuh110k=;
 b=f6idxZWpDExVPDnodxHSFM8rPv6P/in/vQ1zTOhZW+otVucrGjEcwQ3V7z6eS2tVyL
 qWO+ZAf1y3qS1nF1rDVqmRX5jZ973Fn4lG7slnGoeqDzC1f85+Rbh8QxHbKoRTeollRD
 qbIjRTbwpl9HgvpowuJmjxo+1tV3Avn5awVPk=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=f6idxZWp
Subject: [Buildroot] [PATCH v2 02/14] package/sway/Config.in: select
 BR2_PACKAGE_XKEYBOARD_CONFIG
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Much like weston, this is a runtime dependency.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/sway/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/sway/Config.in b/package/sway/Config.in
index 26b5b2ecea..95b19dd464 100644
--- a/package/sway/Config.in
+++ b/package/sway/Config.in
@@ -18,6 +18,7 @@ config BR2_PACKAGE_SWAY
 	select BR2_PACKAGE_CAIRO
 	select BR2_PACKAGE_CAIRO_PNG
 	select BR2_PACKAGE_PANGO
+	select BR2_PACKAGE_XKEYBOARD_CONFIG # Runtime dependency
 	help
 	  i3-compatible Wayland compositor
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
