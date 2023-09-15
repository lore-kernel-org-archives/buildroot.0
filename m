Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC1DDCD37AA
	for <buildroot@archiver.kernel.org>; Fri, 15 Sep 2023 22:27:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 890E0613E5;
	Fri, 15 Sep 2023 22:27:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 890E0613E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 37LvycQTCEs1; Fri, 15 Sep 2023 22:27:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E222760DC2;
	Fri, 15 Sep 2023 22:27:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E222760DC2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 70CFC1BF5A8
 for <buildroot@lists.busybox.net>; Fri, 15 Sep 2023 22:27:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3C1EF421CE
 for <buildroot@lists.busybox.net>; Fri, 15 Sep 2023 22:27:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C1EF421CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nq_zI-bkA9C3 for <buildroot@lists.busybox.net>;
 Fri, 15 Sep 2023 22:27:16 +0000 (UTC)
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 489E8421BC
 for <buildroot@buildroot.org>; Fri, 15 Sep 2023 22:27:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 489E8421BC
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-274928c74b0so1152085a91.3
 for <buildroot@buildroot.org>; Fri, 15 Sep 2023 15:27:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694816835; x=1695421635;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XbnNM6KtRz63x6v2YSRhqq5KjroFWeAr52ydFS7Yujk=;
 b=mxpPShuSj2eGK0foeUmSiNpQcKUri0Bh58J/PoE1vXVxNdWJ9LRt9NMkKBN0hpFvTh
 42+kk6B543YNzFNhp3PBnFjoEgQohfZDqdLA005i0NZJZUhVNhxaPcd/RimBnObkHwzk
 WLkmyoUCbJZIlTq8k8FdMBpbKt+Ww7NFY/7u4HLMR3nzJdHE3Qrxt+oxdCPdks9k/pUb
 kvaba+ACFuGeFOwZgJRc+Ynnz2LuHFTlaR9mmET+c5N9R/vMKm3Rgxm6w/k50y7qtU8I
 2oSY0C1pLPxTHC8rIOjfhwL9YWcpg5nInO+m/RURa97JHqndVwzDucZmeAdwWocFpWOH
 cLfA==
X-Gm-Message-State: AOJu0Yy6CfQkO9BUdsmbgeL/rhkn/k94Eykm5aD5GRpGZB72f8hyPp1l
 Jfc9qSBzh2IBaYTf2IiDGVKmtvsUIFo=
X-Google-Smtp-Source: AGHT+IEmybGw6shdcuWDyaotvqPIFVd+X/bcG+7gM0X6hcD+6xaYjMfMS8UTMorZk32fuCoEJvHNyQ==
X-Received: by 2002:a17:90b:4398:b0:262:fb5d:147b with SMTP id
 in24-20020a17090b439800b00262fb5d147bmr2801857pjb.19.1694816835216; 
 Fri, 15 Sep 2023 15:27:15 -0700 (PDT)
Received: from localhost.localdomain (cpe-70-95-248-239.san.res.rr.com.
 [70.95.248.239]) by smtp.gmail.com with ESMTPSA id
 26-20020a17090a019a00b0026fb228fafasm5714413pjc.18.2023.09.15.15.27.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Sep 2023 15:27:14 -0700 (PDT)
From: Yanghao Cheng <yanghaobillcheng@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 15 Sep 2023 15:27:10 -0700
Message-Id: <20230915222711.899079-1-yanghaobillcheng@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230915172458.3388709-1-yanghaobillcheng@gmail.com>
References: <20230915172458.3388709-1-yanghaobillcheng@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1694816835; x=1695421635; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XbnNM6KtRz63x6v2YSRhqq5KjroFWeAr52ydFS7Yujk=;
 b=NL2NzB8y+fVsITMwQ0TlDFcli6ImdTFhRtCD+EyJ/lUgZqNwgg8tmCzw8f1thuTAE0
 HRvh2lxQrrVjlKnvCewU5o/Zh5ZP4yZtulPMdMd3dBg+Th4k/Xfn+HpHcWOb4Sv2wxZo
 jZ/GPMz9Em2a5kW/fyCKZ10DalGGh8QZoAjIVECgkxV5Cp30VWqpEdli+9xEaWVZ2wl0
 jNVgzU/M+JdTK6lo2qxnFWLdql0bhCREX/opUVcE5hgf0DlBJ7IY3YtgqaCmOM5HafZE
 WAt/6z7R0DcF2Gug02eyFeb0w+5r6t0EX8siURLXD4OA6q4e8WW4QCwBN3xOnylCViqI
 ZuFw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=NL2NzB8y
Subject: [Buildroot] [PATCH v3 1/2] package/xserver_xorg-server: fix init
 script conflicts
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
Cc: Yanghao Cheng <yanghao.cheng@aioi-atg.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yanghao Cheng <yanghao.cheng@aioi-atg.com>

xdm package also installs a init script that utimately starts X server

Signed-off-by: Yanghao Cheng <yanghao.cheng@aioi-atg.com>
---
Changes v1 -> v2:
    - Simplify the condition per Thomas's suggestion

Changes v2 -> v3: (Suggested by Yann)
	- Revert indent added in original patch
	- Keep the original number of patches

 package/x11r7/xserver_xorg-server/xserver_xorg-server.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index 593bbd4276..0390519d6a 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -181,8 +181,9 @@ define XSERVER_XORG_SERVER_INSTALL_INIT_SYSTEMD
 		$(TARGET_DIR)/usr/lib/systemd/system/xorg.service
 endef
 
-# init script conflicts with S90nodm
-ifneq ($(BR2_PACKAGE_NODM),y)
+# init script conflicts with S90nodm and S99xdm
+ifeq ($(or $(BR2_PACKAGE_NODM), $(BR2_PACKAGE_XAPP_XDM)),)
+# Install the init script only when nodm nor xdm aren't enabled
 define XSERVER_XORG_SERVER_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 755 package/x11r7/xserver_xorg-server/S40xorg \
 		$(TARGET_DIR)/etc/init.d/S40xorg
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
