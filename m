Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98FE8C54791
	for <buildroot@archiver.kernel.org>; Wed, 13 Mar 2024 09:14:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 471F94150C;
	Wed, 13 Mar 2024 09:14:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TQwB2JA98n6X; Wed, 13 Mar 2024 09:14:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2A88E414F7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2A88E414F7;
	Wed, 13 Mar 2024 09:14:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2069F1BF3DF
 for <buildroot@lists.busybox.net>; Wed, 13 Mar 2024 09:14:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 278D681346
 for <buildroot@lists.busybox.net>; Wed, 13 Mar 2024 09:14:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id spbDgembTZYw for <buildroot@lists.busybox.net>;
 Wed, 13 Mar 2024 09:14:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=fperrad@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6F14C81375
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6F14C81375
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6F14C81375
 for <buildroot@busybox.net>; Wed, 13 Mar 2024 09:14:25 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-413e93b10bfso2479505e9.1
 for <buildroot@busybox.net>; Wed, 13 Mar 2024 02:14:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710321263; x=1710926063;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YylEX0Xlgvk2BdSAYlLHyBPY8ODBpHrVX7xVHaFNtqg=;
 b=CxaR0rq5dB+Av1bC/LR8yAQElT2gWyVE0/cCgJdtvw9D00mmofV2OFNNyu5V9s7U70
 FJSbIMEHS3mWrA3Y5grIYy/yZ3k72eY2JFtFkz6tEEstUTb+x9002PzNa6+7MScCgYM1
 0JRAV5gFgJKworuGHzpT5f8WRNIxBYfnVrCYGrlAmjrOE4BcXtB2/PTPYlWJ1W4ttaqv
 Pa9wGJrgGrGmkc5//oqY1m3+nUeYhl92TnWhXirKTeDOxpJPD9/OGlzfuTSGfj88RxNU
 E9bq1T00DTpFnwl38Bk2KitVRAEnSv+NoqpUeXUjXojf7VGCZnwmxfVHM1OMdZVLFVvu
 z44A==
X-Gm-Message-State: AOJu0Ywa1TBGPXSItJtwf1lqA+8X6oJYfS2Gd2OEtOZaLPzXZZANseqy
 zS/EUE7V5dUFBbb35e9NiuOHha1i1Fm2NyttyM7sssiCrdqCKFSSUU3m7C/5KZM=
X-Google-Smtp-Source: AGHT+IGtt2wU0/o3hwkFLqkqSg6cQ0SbEc5M8g70EYtJRpfk2vut1V2YOVWbbdYKcnMCpMM9wMm2wg==
X-Received: by 2002:a05:600c:3146:b0:413:1ee4:692e with SMTP id
 h6-20020a05600c314600b004131ee4692emr1791228wmo.9.1710321263429; 
 Wed, 13 Mar 2024 02:14:23 -0700 (PDT)
Received: from xubuntu-23.. ([37.65.6.92]) by smtp.gmail.com with ESMTPSA id
 u1-20020a05600c138100b00412e5f32591sm1699799wmf.28.2024.03.13.02.14.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Mar 2024 02:14:23 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed, 13 Mar 2024 10:13:45 +0100
Message-Id: <20240313091412.20865-4-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240313091412.20865-1-francois.perrad@gadz.org>
References: <20240313091412.20865-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710321263; x=1710926063; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YylEX0Xlgvk2BdSAYlLHyBPY8ODBpHrVX7xVHaFNtqg=;
 b=a6B44uSlZQvV5J/MZRamuajOhNhZN3WxoJGSCw0r+Ei2D+/Li3uE9W6FCj7sOO92U5
 aj/a8AJ9YE2TQqnG94X9hP/V7JYxtDLTx7PBWHOPQPUCrF0nmqOZd8Xb+y5yNKH/n7v+
 JsnxDwtwUgaztN4hGkO0sJKjAPeQk71MOHJZmq6pKzfjw2PWBCUKjxh3F1a46cIMrWiA
 w6JQuq7bK++o1Lv3lIK++s5tfIpEKEyuIMrfoBC3vzELtR2IrJc9m/E2jrKJHyLzmaZD
 WN6XQyeQjuCsuK1VfbxNi4LkuIhhuNkY1cNwcGzfqrgo0XTpITjL5vhzIIHyGjg3OpJh
 OT8g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=a6B44uSl
Subject: [Buildroot] [PATCH 04/31] package/diffutils: disable busybox diff
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/diffutils/diffutils.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/diffutils/diffutils.mk b/package/diffutils/diffutils.mk
index 111926686..fe20a0e67 100644
--- a/package/diffutils/diffutils.mk
+++ b/package/diffutils/diffutils.mk
@@ -18,4 +18,8 @@ ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),y)
 DIFFUTILS_CONF_ENV += gl_cv_func_getopt_gnu=yes
 endif
 
+define DIFFUTILS_BUSYBOX_CONFIG_FIXUPS
+	$(call KCONFIG_DISABLE_OPT,CONFIG_DIFF)
+endef
+
 $(eval $(autotools-package))
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
