Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 430D5C54791
	for <buildroot@archiver.kernel.org>; Wed, 13 Mar 2024 09:15:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 057E0416AB;
	Wed, 13 Mar 2024 09:15:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yRvVXtbsg7Qq; Wed, 13 Mar 2024 09:15:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 91FF841694
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 91FF841694;
	Wed, 13 Mar 2024 09:15:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 337F21BF3DF
 for <buildroot@lists.busybox.net>; Wed, 13 Mar 2024 09:14:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E5BC58133B
 for <buildroot@lists.busybox.net>; Wed, 13 Mar 2024 09:14:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FbH34wX9KtU5 for <buildroot@lists.busybox.net>;
 Wed, 13 Mar 2024 09:14:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=fperrad@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0BE1F813B6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0BE1F813B6
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0BE1F813B6
 for <buildroot@busybox.net>; Wed, 13 Mar 2024 09:14:34 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4132ab0c302so21893535e9.3
 for <buildroot@busybox.net>; Wed, 13 Mar 2024 02:14:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710321272; x=1710926072;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qFzZA9n9cnRTEYOt7Tt4t0WhDQ2qyHAN1ReUo0dxLkQ=;
 b=K7ePa2GRvc8Rd7j/UNgrPFIau2sbdxRVpLJoSE2ImbFptpibTlCrOGPRPnSyc1xEpN
 y96Qh0zc3993W0GXC3pqpKq00eUgXTTQEEldwS9bAlCDZEVjt/c/1dZuAFWrKaFSLxr9
 2ga7fYGV08iiVZjlzQZ/cCpoXLuPRejxV5qyS6S3s9NDmG0HRAxRUY5b89Fr9dnK1zrk
 RqUToN7NMaYFGSgV1kbmEE1hf0YvYHfcjKFgrrAOjwPU03nM4d3SIyHvbY5b6HkRUTz6
 weNBZV1XTevE3UX8vjSTr5rYl0sxrhgTFtnDyIdn8RNEe0Uy2KAVsHPBgpfU/RUw0QtY
 3VAw==
X-Gm-Message-State: AOJu0YxmlETfdSie+JHjJnpoq+1gINdLMjx5XaQHHcAZZzQ3BVrsTvs4
 7hftEwgSGVhsdqFinSuv1ZWkFHLWa4zXRSsVfNI822DK3dfS4c5nc5oZNUrOeZ8=
X-Google-Smtp-Source: AGHT+IHJow5WDYr9wgiTNeOGqRHhTCGc/AU0tuYMmQbQRMQvPsXnwE59FRjJOPABfx/q4FXHPJToIg==
X-Received: by 2002:a05:600c:3b95:b0:413:166c:242e with SMTP id
 n21-20020a05600c3b9500b00413166c242emr8547142wms.28.1710321272267; 
 Wed, 13 Mar 2024 02:14:32 -0700 (PDT)
Received: from xubuntu-23.. ([37.65.6.92]) by smtp.gmail.com with ESMTPSA id
 u1-20020a05600c138100b00412e5f32591sm1699799wmf.28.2024.03.13.02.14.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Mar 2024 02:14:31 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed, 13 Mar 2024 10:14:01 +0100
Message-Id: <20240313091412.20865-20-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240313091412.20865-1-francois.perrad@gadz.org>
References: <20240313091412.20865-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710321272; x=1710926072; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qFzZA9n9cnRTEYOt7Tt4t0WhDQ2qyHAN1ReUo0dxLkQ=;
 b=kZNSKqnXtVfk2bLZDk5nI32viaaPvU1MU4Fdktu6SNU7D26FDiUQli/XQQaybrBquB
 uvbnzokQVmSqAIk77FiCRx3W2BCMWt8PlYKlM2mcPe68vQ2Dk4RuJxCb4ogr89Pw2aTS
 M2aJg0QP9FwkTUGyhd0A39vWQl/0TNeN5SyL/j/w5CeTfa+vWj5Jm2UB/ZjfH0RIOZUk
 1pyj/+xAXTzNy7w0U2Oql4/jY3KpD/QeS68rGnAIwcNQsuxAY7tQnn+IbYuQ7VHeFINO
 Y8ht25rcchspXOp0ZaW71WwYfSK60dcGpfcYhEjx/uMfOjWbeek0+ZdVEyj+SAkodYdn
 yd2w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=kZNSKqnX
Subject: [Buildroot] [PATCH 20/31] package/netcat: disable busybox netcat
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
 package/netcat/netcat.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/netcat/netcat.mk b/package/netcat/netcat.mk
index c9d7952e5..3a80a1417 100644
--- a/package/netcat/netcat.mk
+++ b/package/netcat/netcat.mk
@@ -10,4 +10,8 @@ NETCAT_LICENSE = GPL-2.0+
 NETCAT_LICENSE_FILES = COPYING
 NETCAT_CPE_ID_VALID = YES
 
+define NETCAT_BUSYBOX_CONFIG_FIXUPS
+	$(call KCONFIG_DISABLE_OPT,CONFIG_NETCAT)
+endef
+
 $(eval $(autotools-package))
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
