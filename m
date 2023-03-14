Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCDB5C6FD1C
	for <buildroot@archiver.kernel.org>; Tue, 14 Mar 2023 12:15:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 64CF441902;
	Tue, 14 Mar 2023 12:15:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 64CF441902
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kpA8qnXEoMXr; Tue, 14 Mar 2023 12:15:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C33D418F7;
	Tue, 14 Mar 2023 12:15:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C33D418F7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CAE5B1BF3D4
 for <buildroot@lists.busybox.net>; Tue, 14 Mar 2023 12:15:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A1D2A418EC
 for <buildroot@lists.busybox.net>; Tue, 14 Mar 2023 12:15:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A1D2A418EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6mYvVnE0soXE for <buildroot@lists.busybox.net>;
 Tue, 14 Mar 2023 12:15:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 14F7B41882
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 14F7B41882
 for <buildroot@buildroot.org>; Tue, 14 Mar 2023 12:15:17 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id t15so14131332wrz.7
 for <buildroot@buildroot.org>; Tue, 14 Mar 2023 05:15:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678796116;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OhPVwKZHAgnKre2ZYtOWxpHiQ1puSm70d+AQ4JZnhCg=;
 b=f6YTN3laT9ZRhvEaO2NH4k4yOMOcfU714HBzXld6k08yshI5josZTrgNRZOH5MVP4v
 xVKcANrYavWFWxpUn+ZIPYlt8W2G7SjX3hHFbbYgeiH+c2TLiNozSSMbY9g9QMpXYtVR
 pzkoA29Wm92DNHAwK1FIAKeHpEDJ5qkg/O83s78MrhCmJP5NwQg3oCiJre4xv1EWKEYF
 06PnR80VS2fHfE8rFcktMS95APBAR6FToYTZmz6tM9E/EEOpQVsD3LQevPvwA3YuOp7D
 TrGcc/pxGXYuSfeDf1I8QC4hqpzPIyWD4ETDOH5Cs4p5SkOCINCoV7xVpcLOr3c5aQii
 oO9w==
X-Gm-Message-State: AO0yUKVUC1U5A18de7vKPOHsj0wFEwZu9WWqcUXdv2UBzSJ3fwxe8Jnf
 kZ6OyD+FkyRpXI4GHocliae2cemPwwBxjsquhwo=
X-Google-Smtp-Source: AK7set859WdPmfBSDHDbZwZLNU33dSREh4DcXWMnW5Avj97FLO1wBKI5Koq81iynCroHxavl2l5d0A==
X-Received: by 2002:a5d:5152:0:b0:2ce:9f35:b645 with SMTP id
 u18-20020a5d5152000000b002ce9f35b645mr7644321wrt.20.1678796115779; 
 Tue, 14 Mar 2023 05:15:15 -0700 (PDT)
Received: from P-NAN-LIMA.lan ([2001:861:5384:6b50:61ee:d4ee:9412:e29a])
 by smtp.gmail.com with ESMTPSA id
 x1-20020a5d6501000000b002c54241b4fesm2011504wru.80.2023.03.14.05.15.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 05:15:15 -0700 (PDT)
From: Sebastian Weyer <sebastian.weyer@smile.fr>
To: buildroot@buildroot.org
Date: Tue, 14 Mar 2023 13:15:04 +0100
Message-Id: <20230314121507.2597723-2-sebastian.weyer@smile.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230314121507.2597723-1-sebastian.weyer@smile.fr>
References: <20230314121507.2597723-1-sebastian.weyer@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112; t=1678796116;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OhPVwKZHAgnKre2ZYtOWxpHiQ1puSm70d+AQ4JZnhCg=;
 b=ZhFbFrORTawMBXZtpqZ5fLHrsHELh8WCqLXUB0KR5hSGWnRsR6FauMZmHe38w0usi7
 X7cBZ5eZ1EBykm3vmD7px9J/XW5VEoUZGNbUgdjSZdIsvQV1rDXv+AWXv2AVvfjhKohg
 gYCo/MVYs4z6Vp5BLG7C3Gyl376vOH5hrMiarBwICyXXE40CWW3ODT5PJs5+FEXFmn0P
 IL3B8b+g8/L6Ht7tg2I1xcSET9uqhb68UCYCfzhi6Yf82xrzQuUSr5WBLlIBUZl9Z9mc
 RjtDKgsAj6CuaZfAJ5GaIR6yNgo9BbCM5TL102AUO1bLqduOkSi51BuA6m+QwUIgDzgH
 6U8w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=ZhFbFrOR
Subject: [Buildroot] [PATCH 2/4] package/busybox: add uutils-coreutils as
 optional dependency
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
Cc: Sebastian Weyer <sebastian.weyer@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This optional dependency is necessary so that when uutils-coreutils is
selected, it will be built before busybox. Then busybox will see the
symlinks that are already placed in target/bin and will not recreate
them (noclobber).

Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
---
 package/busybox/busybox.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 1633ca525d..d8000ddbb4 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -68,6 +68,7 @@ BUSYBOX_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_UNZIP),unzip) \
 	$(if $(BR2_PACKAGE_USBUTILS),usbutils) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX),util-linux) \
+	$(if $(BR2_PACKAGE_UUTILS_COREUTILS),uutils-coreutils) \
 	$(if $(BR2_PACKAGE_VIM),vim) \
 	$(if $(BR2_PACKAGE_WATCHDOG),watchdog) \
 	$(if $(BR2_PACKAGE_WGET),wget) \
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
