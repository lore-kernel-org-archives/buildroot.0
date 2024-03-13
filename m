Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4C0CC54E58
	for <buildroot@archiver.kernel.org>; Wed, 13 Mar 2024 09:15:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B263A41710;
	Wed, 13 Mar 2024 09:15:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ysyeCYSKelQL; Wed, 13 Mar 2024 09:15:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 797EE4170A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 797EE4170A;
	Wed, 13 Mar 2024 09:15:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EB75B1BF3DF
 for <buildroot@lists.busybox.net>; Wed, 13 Mar 2024 09:14:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D827981464
 for <buildroot@lists.busybox.net>; Wed, 13 Mar 2024 09:14:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eBAHfRDi_pdD for <buildroot@lists.busybox.net>;
 Wed, 13 Mar 2024 09:14:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22d; helo=mail-lj1-x22d.google.com;
 envelope-from=fperrad@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 323798137E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 323798137E
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 323798137E
 for <buildroot@busybox.net>; Wed, 13 Mar 2024 09:14:39 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2d2fad80eacso61231101fa.2
 for <buildroot@busybox.net>; Wed, 13 Mar 2024 02:14:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710321277; x=1710926077;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tJYHMKnbXO336NWHRi0y8uPgTurzj6mrSuf88A5X7XE=;
 b=QeJWTppNQt1yd6CGdB/bdmleSJZT2d37/DGYC1SOdchVZpoXE+ekQhn1IRQwVU+G9K
 fk22QnalwIYIXuF0vVylpP/9iOIqa7t4QrslZa+vODsOSvhYim4fegVhYzwzS05V41fe
 7pbvYYDFLrdYRljBTROFD/ORfQysICvFSgMyqKcYc4Lt4C5w2abG8KiYi4/el3GmLSmo
 TQikORogMP4aZ9LYDba7t52LrVZJ0a7831A5vL7xddS4WbnnLDh/be9m+sVh/21a4XzS
 /Ht2dTE6wzB/l7LlqvL9AXLO59NoIQ8Tv1eacweWzzI008Kk0EPw6i5YSzuV+iI69scG
 vH+w==
X-Gm-Message-State: AOJu0YwEGk8BbI0vCcfdL9k5jIeo9Eoa1UitEJJUZIjrhse47Jt+2A5z
 yBAniaDhfXxYPRaBBzY9AyMws9rRoaczGC8LSJjW0BbIrUnAAYpRrhLWzMPV064=
X-Google-Smtp-Source: AGHT+IEWhN5HrC57qMISIKpO4fVwD/pEEb+S0p0PQy/dOC/KmoGqfm2NXjsu861HYh2wrF6c8o128g==
X-Received: by 2002:a2e:7013:0:b0:2d3:d050:3f15 with SMTP id
 l19-20020a2e7013000000b002d3d0503f15mr7979140ljc.35.1710321277001; 
 Wed, 13 Mar 2024 02:14:37 -0700 (PDT)
Received: from xubuntu-23.. ([37.65.6.92]) by smtp.gmail.com with ESMTPSA id
 u1-20020a05600c138100b00412e5f32591sm1699799wmf.28.2024.03.13.02.14.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Mar 2024 02:14:36 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed, 13 Mar 2024 10:14:09 +0100
Message-Id: <20240313091412.20865-28-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240313091412.20865-1-francois.perrad@gadz.org>
References: <20240313091412.20865-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710321277; x=1710926077; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tJYHMKnbXO336NWHRi0y8uPgTurzj6mrSuf88A5X7XE=;
 b=B4x4dcOQh10752w+pQ+8mdRIZqwBwGs96R5CWjGG0845jdmvya1sFcVSlY/n0kii3g
 +0Bvw3Z1nPnzHmlmnx8Yq0xrAqELwaxAJdPLHLfRWUNRXREtKSnYqvybGCrPrlJy7AUT
 Mp+SU2wGFB+qlYEKi/8nW41m1+L8jXC9Qnv8BzVWHNH6qpN4+P29rfUE4UNSD4KZGkMq
 iIsMRj+9EIfotObLnLbjgHJdSYt8rayeiIjeFRAESpsB5oB4SQnhaMBi+kHAVJfraXtv
 UixRSrX3wzhvefJRMdsecNb+kN+/gbuz9Ixj22wyZ1ExlY87/GHoi7J05/n3zAg/+VFy
 FF6w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=B4x4dcOQ
Subject: [Buildroot] [PATCH 28/31] package/unzip: disable busybox unzip
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
 package/unzip/unzip.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/unzip/unzip.mk b/package/unzip/unzip.mk
index 5effebee4..f0eee19fa 100644
--- a/package/unzip/unzip.mk
+++ b/package/unzip/unzip.mk
@@ -42,4 +42,8 @@ UNZIP_CONF_OPTS += \
 	-DCMAKE_C_FLAGS="$(UNZIP_TARGET_CFLAGS) -DLARGE_FILE_SUPPORT" \
 	-DCMAKE_CXX_FLAGS="$(UNZIP_TARGET_CXXFLAGS) -DLARGE_FILE_SUPPORT"
 
+define UNZIP_BUSYBOX_CONFIG_FIXUPS
+	$(call KCONFIG_DISABLE_OPT,CONFIG_UNZIP)
+endef
+
 $(eval $(cmake-package))
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
