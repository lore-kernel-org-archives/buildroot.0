Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 563D3C54E58
	for <buildroot@archiver.kernel.org>; Wed, 13 Mar 2024 09:15:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DAB1C408C7;
	Wed, 13 Mar 2024 09:15:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YjgnZCykjP_y; Wed, 13 Mar 2024 09:15:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B449141521
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B449141521;
	Wed, 13 Mar 2024 09:15:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 123711BF3DF
 for <buildroot@lists.busybox.net>; Wed, 13 Mar 2024 09:14:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 95BE5813D5
 for <buildroot@lists.busybox.net>; Wed, 13 Mar 2024 09:14:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y5xCDHID6Y0I for <buildroot@lists.busybox.net>;
 Wed, 13 Mar 2024 09:14:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=fperrad@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D9310813B0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D9310813B0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D9310813B0
 for <buildroot@busybox.net>; Wed, 13 Mar 2024 09:14:30 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-413ebcf1315so1099055e9.2
 for <buildroot@busybox.net>; Wed, 13 Mar 2024 02:14:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710321269; x=1710926069;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=j1pwxpBvRupqrTECQCtLj6AVfnCdNKL3TffJdOPB9y8=;
 b=eG5Q0gOHLLZUxpeiqCu0369JlR+SBSM+UkItg3sHRU2wGvDfJvqwsFfelgs4ntMA21
 L1rq30ey68dRdmXXY3rFE82rt0YwYClIpEpowUL2IHqZwenb4rZydOZwveJjt3iDiYjC
 k5YYAM2hufzvFPxiDjdjEpNnZJ6xs00/b+u/bHqe2F0lm5RLn6hGhhDhIN+hbrYGJy20
 8LtZMYZZKUyjIqmmK0+8Neo0DqXRpZnPdUsgbq7WQ81su/JQQH7JInbVMDhUBXWiu/bT
 Yn1E8sJUQzyPvmHrkqtW1r2qLrbqnjDGA3HkeYQbdA0m3ZmlEOFWec9F9yA1+58mUusZ
 nJKw==
X-Gm-Message-State: AOJu0Yx8vGTEn+9jX/dLToh41g5pDJICG2C2Cb5V6H0H2YOe9mg9RorE
 9OovL0nhvB6C3podg8huKJCHipW1wtqZcng1NrbOiAmRhonEUv6iDq00F+YfBno=
X-Google-Smtp-Source: AGHT+IHr5MshTkEj4YdbyMwdDF+rDT96zFe9Fxpakg3V92EiYVhJoK5NoshY+IuceJ5but30uheoLg==
X-Received: by 2002:a05:600c:46cb:b0:413:182c:81c7 with SMTP id
 q11-20020a05600c46cb00b00413182c81c7mr8381483wmo.35.1710321268963; 
 Wed, 13 Mar 2024 02:14:28 -0700 (PDT)
Received: from xubuntu-23.. ([37.65.6.92]) by smtp.gmail.com with ESMTPSA id
 u1-20020a05600c138100b00412e5f32591sm1699799wmf.28.2024.03.13.02.14.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Mar 2024 02:14:28 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed, 13 Mar 2024 10:13:55 +0100
Message-Id: <20240313091412.20865-14-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240313091412.20865-1-francois.perrad@gadz.org>
References: <20240313091412.20865-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710321269; x=1710926069; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j1pwxpBvRupqrTECQCtLj6AVfnCdNKL3TffJdOPB9y8=;
 b=RZeoQUMCPqHN5+63OQGlNCRVAuUqAvGipj9M094+uiPLqgCZaVI4ybXBIOfTEKN48J
 bqyA48ZZCztgiAUo4iy7lz5WDU6rrnlFxF9LNPo+9JYmS3x6U3TPbCt8wdwxhc1wsVGM
 naNk3B5BrFC2pHtJFO4Z54jXXkR+ep7rG96gm1YIgsemoZRQCj6TcF6SZpxmulc/xqHX
 CnWvjmfFGEd6g5rvYVXn/uDWn52uOJR91fI1rVM9E9CavTLyfeUMS3D38ae+piHSxquj
 MRXJmroqTzMfkIesMMQe8BInJH2FM7lVf3XWwAr+415S1eahp+DagA/hN9m/lGtyAh0Z
 M1yg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=RZeoQUMC
Subject: [Buildroot] [PATCH 14/31] package/ifplugd: disable busybox ifplugd
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
 package/ifplugd/ifplugd.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/ifplugd/ifplugd.mk b/package/ifplugd/ifplugd.mk
index 6de7f1764..f841f59b3 100644
--- a/package/ifplugd/ifplugd.mk
+++ b/package/ifplugd/ifplugd.mk
@@ -32,4 +32,8 @@ define IFPLUGD_INSTALL_INIT_SYSV
 	$(SED) 's^/bin/bash^/bin/sh^g' $(TARGET_DIR)/etc/init.d/S45ifplugd
 endef
 
+define IFPLUGD_BUSYBOX_CONFIG_FIXUPS
+	$(call KCONFIG_DISABLE_OPT,CONFIG_IFPLUGD)
+endef
+
 $(eval $(autotools-package))
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
