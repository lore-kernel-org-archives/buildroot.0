Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4F89C433EF
	for <buildroot@archiver.kernel.org>; Sat, 29 Jan 2022 09:44:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2C512403A5;
	Sat, 29 Jan 2022 09:44:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vmVMf-DWqVNK; Sat, 29 Jan 2022 09:44:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2577040140;
	Sat, 29 Jan 2022 09:44:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 763DB1BF2C5
 for <buildroot@lists.busybox.net>; Sat, 29 Jan 2022 09:44:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 67FCE81B84
 for <buildroot@lists.busybox.net>; Sat, 29 Jan 2022 09:44:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u4gyBITs9ruk for <buildroot@lists.busybox.net>;
 Sat, 29 Jan 2022 09:44:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8CCC881B70
 for <buildroot@buildroot.org>; Sat, 29 Jan 2022 09:44:16 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id s18so15489890wrv.7
 for <buildroot@buildroot.org>; Sat, 29 Jan 2022 01:44:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OUJnZBxYWKuwOHGtsTuDu5jbKgAV9LMsqsd1bDZ0dNo=;
 b=C5Fxb3Of3MYG+cxy95+L0Aq5YXIOfhKcl/rZoejJ7PeybYohsBb/sg9aij6oW+/l9T
 P2sKymJSYHOEW9aqxK3SOhfZZmlUdNPa23MlYEwN2OP3ms3W+GWQI7qvY6YKJcvpqp9y
 DTKUVbKRxlFEhdq2NK9YukgpD5YUGCa1UvvsuZNidfmjbxlKakwgkNI9sIWVqQLlU8pB
 OBJRRznqO5KBrD5SGTETbw5r4Cq1sVUrPlQRLhXsaDkamX5k5iPIfz1Efr76Jbie0xpb
 +qGqRRDmyRxMGYDTlv5BhdTECOK6mVTXb0xVWys1k5CuBx7eJ2TyO3IeXy7YLPG6KIEM
 Z+gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OUJnZBxYWKuwOHGtsTuDu5jbKgAV9LMsqsd1bDZ0dNo=;
 b=yFK0kSf6Eo7qN10A/n+21dLhoKsm0BuDGEfpsb15nqWw2DPXgu+0Ub89w7SPrrtFyo
 oAw9pJq6TadU2LGOELbFiDorXsxRE35iqFZBPCgzBYw+7N95BQFg1Dzzdun8LVdqk/4M
 MyuhXAzAKEAVOc6362lxQS4pgPV2fhvoS3JJHTVJz7lMXmYMfYzcofuLD3ZXVShq8S7W
 rVuOYfwHbXgTX9hPW9ik6KtEr37nJ2EMNmh8VIwVW69fzAEjmizrjxib/OtmK+5BhN6O
 s5f9IrILQzwS5Ui7lEsF9a5WqReUAGU9DG41xRwhVAmJTHSV87cW/tTWfAF9Na6uMFMS
 n5xw==
X-Gm-Message-State: AOAM533jhQrLWVKGCKYDq2A8UE771ADwTvzL3pQ6g0arTOPSezY2dk7N
 EuW1mZZu0Fo+Hl818TGYam/bjuN/x3k=
X-Google-Smtp-Source: ABdhPJy/31ljMGCOgIQ3qSIAdK9tzzp+to6oVHhndtDJKZT4V2bA4luNStGF+nmTmbHJeXln4GVokw==
X-Received: by 2002:adf:db4d:: with SMTP id f13mr9882876wrj.329.1643449454235; 
 Sat, 29 Jan 2022 01:44:14 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id p13sm6413354wrx.86.2022.01.29.01.44.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Jan 2022 01:44:13 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 29 Jan 2022 10:42:22 +0100
Message-Id: <20220129094222.3583303-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/pkg-cargo: fix debug build
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

There is no --debug mode for cargo resulting in the following build
failure in ripgrep since its conversion to cargo infrastructure in
commit 342fd3e7350479dc368541ac77a5130ebb53194c:

error: Found argument '--debug' which wasn't expected, or isn't valid in this context

Fixes:
 - http://autobuild.buildroot.org/results/772ebdd6a39950457a59419bdc1376cb0e0a3611

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/pkg-cargo.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-cargo.mk b/package/pkg-cargo.mk
index 614d46ad64..e74a8358bc 100644
--- a/package/pkg-cargo.mk
+++ b/package/pkg-cargo.mk
@@ -104,7 +104,7 @@ define $(2)_BUILD_CMDS
 		$$($(2)_CARGO_ENV) \
 		cargo build \
 			--offline \
-			$$(if $$(BR2_ENABLE_DEBUG),--debug,--release) \
+			$$(if $$(BR2_ENABLE_DEBUG),,--release) \
 			--manifest-path Cargo.toml \
 			--locked \
 			$$($(2)_CARGO_BUILD_OPTS)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
