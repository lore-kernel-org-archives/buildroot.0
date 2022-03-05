Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26AC5C433EF
	for <buildroot@archiver.kernel.org>; Sat,  5 Mar 2022 00:22:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A0FDE40935;
	Sat,  5 Mar 2022 00:22:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Rs1j1A21iauR; Sat,  5 Mar 2022 00:22:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D16BF408D7;
	Sat,  5 Mar 2022 00:22:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7A8BE1BF292
 for <buildroot@lists.busybox.net>; Sat,  5 Mar 2022 00:22:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 76B2360B12
 for <buildroot@lists.busybox.net>; Sat,  5 Mar 2022 00:22:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=broadcom.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Pt5BzNFIpv3l for <buildroot@lists.busybox.net>;
 Sat,  5 Mar 2022 00:22:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C127060AAF
 for <buildroot@buildroot.org>; Sat,  5 Mar 2022 00:22:18 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id m22so8647471pja.0
 for <buildroot@buildroot.org>; Fri, 04 Mar 2022 16:22:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QYG4mjrxw/LUfjUHg3rbzLZx2KrCEpuInzTkXVxB41w=;
 b=IhYZIxhAstfoOpwCx3vULCDkWyFSB4cxWBQktpR5RAXG0gomfmtWv1zYJ3pw+vmEHc
 U9+0yTn2yss42G3ZJP7JuouakxSH2XLZP8Y1uypWJJrMaWnxz/bpunatJxPTqOkXTZ3R
 X0EKp3S5/cdypoNZue8FvZxfZ7/BAkTpa37EU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QYG4mjrxw/LUfjUHg3rbzLZx2KrCEpuInzTkXVxB41w=;
 b=hGGcHLkEkOHTJphgk7PFgVO9kEvoednC9HlTgKJCjT8XUOVeEKZT1f/LCdVZdvOD0z
 FB/1HBXzjBso/Z3n6W5NVFHfWUh1ZFvyMZuLp4AVLvAJ8cXYe0mJz3tdKfrc7lvpmx0q
 LP20dmfR4UIIH1BTJGain7X2YNOBMzUjJyxhN8McPnO/1Jwzlnf3n7IKvV7ZnOSN49c+
 kGSX0/2M498rkPDd7R8u+wDDc3162vCXqFXWZ9sd6VaSlvCYkcj2LXq0AJzM8XPEne0z
 IFDxVOksPP6Hf2mrCXqlikn501IdCPl5ezgowbY0gHZCGMnF2AaJuyclxcVaAVZdWW0z
 nddw==
X-Gm-Message-State: AOAM532s6Kc5IbNswTMmqYlcP/bGMM+8LRP5O7IqPepFWD//xEa0F0dA
 CLeBTaMpiRV267aSluyOa2/i8w==
X-Google-Smtp-Source: ABdhPJxiMlExLKn+jetUWoYc3ScNAdhIl5S1hNjF5+vNPq7xH0WQ4fejpxnKKvJeXEbkHJGf63PioA==
X-Received: by 2002:a17:903:120c:b0:14f:3f4a:f832 with SMTP id
 l12-20020a170903120c00b0014f3f4af832mr1127218plh.157.1646439737870; 
 Fri, 04 Mar 2022 16:22:17 -0800 (PST)
Received: from lbrmn-mmayer.ric.broadcom.net ([192.19.161.250])
 by smtp.gmail.com with ESMTPSA id
 g5-20020a655805000000b003643e405b56sm5667328pgr.24.2022.03.04.16.22.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 16:22:17 -0800 (PST)
Received: by lbrmn-mmayer.ric.broadcom.net (Postfix, from userid 1000)
 id A670644CB044; Fri,  4 Mar 2022 16:22:15 -0800 (PST)
To: Buildroot Mailing List <buildroot@buildroot.org>
Date: Fri,  4 Mar 2022 16:22:09 -0800
Message-Id: <20220305002209.493816-1-mmayer@broadcom.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220305000052.491721-1-mmayer@broadcom.com>
References: <20220305000052.491721-1-mmayer@broadcom.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] linux: limit YYLTYPE kernel modification
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
From: Markus Mayer via buildroot <buildroot@buildroot.org>
Reply-To: Markus Mayer <mmayer@broadcom.com>
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Markus Mayer <mmayer@broadcom.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 9b41b54be07711c10ad13ce157be272ed1cf402e addresses a build issue
regarding re-defined YACC symbols. Unfortunately, this can break the
build for older toolchains.

To prevent unintentional breakage, make the source code modification
conditional on BR2_TOOLCHAIN_GCC_AT_LEAST_10. Also inform the user about
the modification when it is performed, so it becomes more obvious what
is happening in case of unforseen problems.

Signed-off-by: Markus Mayer <mmayer@broadcom.com>
---
 linux/linux.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/linux/linux.mk b/linux/linux.mk
index 940dc2849f..382a3f679e 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -293,12 +293,15 @@ endef
 
 LINUX_POST_PATCH_HOOKS += LINUX_APPLY_LOCAL_PATCHES
 
+ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_10),y)
 # Older versions break on gcc 10+ because of redefined symbols
 define LINUX_DROP_YYLLOC
+	@echo "Removing 'YYLTYPE yylloc;' from kernel sources..."
 	$(Q)grep -Z -l -r -E '^YYLTYPE yylloc;$$' $(@D) \
 	|xargs -0 -r $(SED) '/^YYLTYPE yylloc;$$/d'
 endef
 LINUX_POST_PATCH_HOOKS += LINUX_DROP_YYLLOC
+endif
 
 # Older linux kernels use deprecated perl constructs in timeconst.pl
 # that were removed for perl 5.22+ so it breaks on newer distributions
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
