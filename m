Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D657C54791
	for <buildroot@archiver.kernel.org>; Wed, 13 Mar 2024 09:15:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5887341528;
	Wed, 13 Mar 2024 09:15:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vWloF8vp--_6; Wed, 13 Mar 2024 09:15:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E819541694
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E819541694;
	Wed, 13 Mar 2024 09:15:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 22D711BF3DF
 for <buildroot@lists.busybox.net>; Wed, 13 Mar 2024 09:14:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4308281401
 for <buildroot@lists.busybox.net>; Wed, 13 Mar 2024 09:14:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c6gt_AwyHV7B for <buildroot@lists.busybox.net>;
 Wed, 13 Mar 2024 09:14:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=fperrad@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8B3D7813BA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B3D7813BA
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8B3D7813BA
 for <buildroot@busybox.net>; Wed, 13 Mar 2024 09:14:33 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-41324a16c9eso5637275e9.0
 for <buildroot@busybox.net>; Wed, 13 Mar 2024 02:14:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710321272; x=1710926072;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BCk29SAjjgef0KzigN88/YkYRToKMAHPP440uuoi23c=;
 b=JBMbdsRdLbctwA1hgy4i7vL9+mnMwobcATv2HQSf5MSRqXkVaM9ozTMLRiiNZSQcdk
 VNwvkp0ZuoKrqZNT/SfPvZhzgBlntndAoxnapiICgyQFepYXQvlzIV8XzDzMFB767/MD
 u01GaFxm8EiGTtTOJ99ij5ryU/PoJHFC04yyaKgMTASg3JBiRLn1Pgtie5jMmsPGK2LR
 G6QGwuK0UI6CoL678MkicCWfEuwyguAS2J1NXQFmmc7J/pLOvCwi16lnO/q48EKY1sWl
 /4mF6O95Sc/HgPzIEFW2mOz4o5XpF+5Mtt5e1M+aweujCqAsf8V/5g9epfAh+U4Z2Yrx
 Z25g==
X-Gm-Message-State: AOJu0YxH1LlZOw69QahzOT1g/iY50gqpc6msLpl3wYuWck0SrU6w78Sz
 6nQ6RuKQ8lJpyCkCuRQPjltosVxncjMqD8Hq47rNXGKDwlV+lSbC5L+IUOXnBSg=
X-Google-Smtp-Source: AGHT+IGpghNaLWUNBuvd9Rb4OyooozxvmV3XHqammHxhxmH1zgQP6CN4zqp3GLniNJZAY7fVkNQb6g==
X-Received: by 2002:a05:600c:1c85:b0:413:2ab0:eacc with SMTP id
 k5-20020a05600c1c8500b004132ab0eaccmr4545368wms.23.1710321271705; 
 Wed, 13 Mar 2024 02:14:31 -0700 (PDT)
Received: from xubuntu-23.. ([37.65.6.92]) by smtp.gmail.com with ESMTPSA id
 u1-20020a05600c138100b00412e5f32591sm1699799wmf.28.2024.03.13.02.14.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Mar 2024 02:14:31 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed, 13 Mar 2024 10:14:00 +0100
Message-Id: <20240313091412.20865-19-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240313091412.20865-1-francois.perrad@gadz.org>
References: <20240313091412.20865-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710321272; x=1710926072; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BCk29SAjjgef0KzigN88/YkYRToKMAHPP440uuoi23c=;
 b=mcRQtSCSFphh6Voqg/y5Yi1hEIk1I7DbB3LkOFC5vri0sf9uCsoikvqpM0xs3ZvB0q
 QmOqr9RukTw1oL4EX1BfDNDcr2yOq+wy9AtPqQGCIX53g06bKvOp/1TSQR+O7P3HtV+V
 hKDIywC2RVJdeO3ugk1LJNkC0X7WrFiHN1jzeOhbNNt6goJIGV/L8d3pWhRWVo5lqdZS
 R8U7Kv3TaR6PsRgNjuyf7oszV44j3aF2h4WBW6I5ZtPtfu0joo5rRMDZAj9d+8Qlg6P3
 t6r5QnAJ8goC+nV52qlkHahYsMLzvJWrVecDm6IGQ8zG9+VHZkbNhT6yQEalCZrCGAJw
 j3Ag==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=mcRQtSCS
Subject: [Buildroot] [PATCH 19/31] package/lsof: disable busybox lsof
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
 package/lsof/lsof.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/lsof/lsof.mk b/package/lsof/lsof.mk
index cb4e987bd..3066c142e 100644
--- a/package/lsof/lsof.mk
+++ b/package/lsof/lsof.mk
@@ -47,4 +47,8 @@ define LSOF_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 755 $(@D)/lsof $(TARGET_DIR)/usr/bin/lsof
 endef
 
+define LSOF_BUSYBOX_CONFIG_FIXUPS
+	$(call KCONFIG_DISABLE_OPT,CONFIG_LSOF)
+endef
+
 $(eval $(generic-package))
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
