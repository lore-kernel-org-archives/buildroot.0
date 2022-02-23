Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E119C433F5
	for <buildroot@archiver.kernel.org>; Wed, 23 Feb 2022 19:15:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EBDA582B34;
	Wed, 23 Feb 2022 19:15:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EmlWG-lRn5jv; Wed, 23 Feb 2022 19:15:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 475C082B49;
	Wed, 23 Feb 2022 19:15:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6B5E21BF5EA
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 19:14:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5A24A81B69
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 19:14:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A6b8HWRiImYQ for <buildroot@lists.busybox.net>;
 Wed, 23 Feb 2022 19:14:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9FB2681C2F
 for <buildroot@buildroot.org>; Wed, 23 Feb 2022 19:14:45 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id 29so16436415ljv.10
 for <buildroot@buildroot.org>; Wed, 23 Feb 2022 11:14:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SgjOflK+6gxu9sNcSbHUh87RYaCigNFfLgAAtaFAUDk=;
 b=A0qo+PMiM6oW1qkwWLSRrRUsMcNxDu+yYhaaXfo+ITRIKaiq8g/bGDZNc9M8bRngGF
 VhxHo8HJtdlClLj/gAdCqIGc6zfaM/bhO+AIvq0YRbxyeEcEcV/5w9VXeLfnjuvmZeji
 pfVvTefsM8sIAWOzXWOazst1GeHtDNyb9QGWRyA/nn7/l4PdOCdOtcaNUvN5P0IhN2VA
 J657KPoU/+6fvkQY6Kqcq5sHZmhFJRTfSJXCqprG+rLUquthv9j8XAaML+C/yAI0bVlI
 BrS6XkIcfiRf/496FwnoopA4Rqp69xKZykbuM7T3LUfo5gcmnPcqjSSYFbIQkB1fRd3h
 u6Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SgjOflK+6gxu9sNcSbHUh87RYaCigNFfLgAAtaFAUDk=;
 b=s4VeK71RvCW/uIk4oz8FeFVBuYBBErrkZWcOWNnjM9tHsBvsSlesdiTbp45Ee7WihM
 Phvn+X1JvGSfv4x6FBcFW1LxNn7wyDpV16aV+u1Z7aqrkTShguhMeuUlW4RwcmbBhV9c
 U/Ew9kt80ji0I04QR/W8RyWXh6kwzZaOLF63zaMiKQ5BSmuofPtZGiIZTo2EV/0G2if3
 c6Ilc22ahaeZF4HS88K65cktxwPMEYPfftFgZCUn4kFYF2ovPd31IaCz3a4wWTGMBmbF
 rCao2Bu+68ASiXps1tW8bInDIIfyqMl5TH345kVB5NBLdx/xSTKLlcnXBMzC0mp5XI1F
 +YlQ==
X-Gm-Message-State: AOAM5321fq29fd80Rad4v44cpHFQK0fsewV9wf06IY7c4UGGSNwpYFNS
 OdXpsLbem7QQA1KArKqVRlRXz2MqbGlUeg==
X-Google-Smtp-Source: ABdhPJwfF8CyuaksfqU5PYVmJ7EMdaxGnG2PJJSvcR4MfATLr6JxZdhQBd/jHT2WHSO6bRFSsaD3mQ==
X-Received: by 2002:a2e:9e48:0:b0:246:4a89:14f7 with SMTP id
 g8-20020a2e9e48000000b002464a8914f7mr588103ljk.343.1645643683529; 
 Wed, 23 Feb 2022 11:14:43 -0800 (PST)
Received: from localhost.localdomain ([5.188.167.245])
 by smtp.googlemail.com with ESMTPSA id o22sm31750lfr.92.2022.02.23.11.14.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Feb 2022 11:14:42 -0800 (PST)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 23 Feb 2022 22:14:36 +0300
Message-Id: <20220223191436.3045255-5-geomatsi@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220223191436.3045255-1-geomatsi@gmail.com>
References: <20220223191436.3045255-1-geomatsi@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 4/4] DEVELOPERS: add myself for
 orangepi-zero-plus2
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
Cc: Sergey Kuzminov <kuzminov.sergey81@gmail.com>,
 Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 DEVELOPERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index ac702d8d0f..f29e889c52 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2545,10 +2545,12 @@ F:	board/linksprite/pcduino
 F:	board/orangepi/orangepi-zero
 F:	board/orangepi/orangepi-one
 F:	board/orangepi/orangepi-pc-plus/
+F:	board/orangepi/orangepi-zero-plus2/
 F:	configs/linksprite_pcduino_defconfig
 F:	configs/orangepi_one_defconfig
 F:	configs/orangepi_pc_plus_defconfig
 F:	configs/orangepi_zero_defconfig
+F:	configs/orangepi_zero_plus2_defconfig
 F:	package/armbian-firmware/
 F:	package/hostapd/
 F:	package/rtl8189fs/
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
