Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7FC7C433F5
	for <buildroot@archiver.kernel.org>; Mon,  7 Feb 2022 19:02:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4F2424032A;
	Mon,  7 Feb 2022 19:02:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Fet0NrIqf4wO; Mon,  7 Feb 2022 19:02:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5CA5740327;
	Mon,  7 Feb 2022 19:02:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 232981BF299
 for <buildroot@lists.busybox.net>; Mon,  7 Feb 2022 19:02:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1D7D340158
 for <buildroot@lists.busybox.net>; Mon,  7 Feb 2022 19:02:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8mlllJovCs2i for <buildroot@lists.busybox.net>;
 Mon,  7 Feb 2022 19:02:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 50AA74010F
 for <buildroot@buildroot.org>; Mon,  7 Feb 2022 19:02:47 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 v13-20020a17090ac90d00b001b87bc106bdso7489747pjt.4
 for <buildroot@buildroot.org>; Mon, 07 Feb 2022 11:02:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=H1H5G5LD2XlEHgwWx2sRWTkLaEqA3VKTl5J4Ul/Vw6s=;
 b=fswswD/seEKLZigF2yzpPr6eeVxl7CIR7UffDlojK/2f2ZgWLT5TpdEgQVtA+pE/tp
 2onRSjd6+i9trhv1cX5ZU+zLU3F+jINO6NuY1mzxn3+n9RkO0N4v1nK+UzgMt2eVNc/J
 xoVHj32U9InCYXuHl1SuqWgkCMjMDapila0+2F400PAr1xZZyM091EsT46R7VitJ/CSi
 CY8PAsZ4+juIZgzVPd85ySNsVD8Q0XYCIFywsxigTehbdDhO4yQp+UyDiyn2b8AymH5r
 r2qZjrjGO3xnr9gaB/ZKhOXK09MfuIXadw6jHMIQyyzlygCc28EFu9LcaPGSgyJxl7rt
 gqwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H1H5G5LD2XlEHgwWx2sRWTkLaEqA3VKTl5J4Ul/Vw6s=;
 b=OMbT2fjPKXQRY3nPmQtRHtQTmw5s6UuwuxW7JgrHeSzz9R41MHOdu0rwVhHtEGVSBW
 ogYyBFfirzMi31GJ3F2vQPQoS4Sy4RgYvOkYYE+2D/MUXEWEpyBo71dxCyocF3Hq3FRv
 +hxgwCO57Ja88v5qx2CKjgbjbVqce7DmA2agKH6LJDjNx5Cw07UYO7hXkJ7GSFW8w9gh
 hHKIUgyBmrl2r7jMgfbP2bT7RuRZSYAICFSGKfOWVb4w10xLEaHWC+Kic9IxC0M0HEK5
 s9ukDrzTRra5OKZPwFdOfkRu4MNZY13uiMT2juVyYVi8i1Uc8xvvTSJSOcTZv7M2T0kV
 0uoQ==
X-Gm-Message-State: AOAM532AhALwUz0TKJH1Ifz7otI7gJhlONp2fhs84c8jcAOiE0D5nMG5
 9xMNf79nfUhsmTk20IrjiMiyWrSe7C4=
X-Google-Smtp-Source: ABdhPJwcQLF9Tj2q9KcxrQuzxrUL96Ca1g8F1RaFZBQ7oMjdXwzUBafOE9qaYr6o2xOIydF2oNlLdw==
X-Received: by 2002:a17:902:a40d:: with SMTP id
 p13mr1080140plq.33.1644260566501; 
 Mon, 07 Feb 2022 11:02:46 -0800 (PST)
Received: from localhost.localdomain ([47.149.13.137])
 by smtp.gmail.com with ESMTPSA id pf4sm102682pjb.35.2022.02.07.11.02.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Feb 2022 11:02:46 -0800 (PST)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  7 Feb 2022 11:02:37 -0800
Message-Id: <20220207190238.73906-2-aduskett@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220207190238.73906-1-aduskett@gmail.com>
References: <20220207190238.73906-1-aduskett@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/3] package/mender/mender.mk: add
 bootloader-integration inventory script
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This script is installed in the official meta-mender yocto recipe. Install it
here as well.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/mender/mender.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mender/mender.mk b/package/mender/mender.mk
index 33b4611a5f..f462a34fa5 100644
--- a/package/mender/mender.mk
+++ b/package/mender/mender.mk
@@ -61,7 +61,7 @@ define MENDER_INSTALL_CONFIG_FILES
 
 	$(INSTALL) -D -m 0755 $(@D)/support/mender-device-identity \
 		$(TARGET_DIR)/usr/share/mender/identity/mender-device-identity
-	$(foreach f,hostinfo network os rootfs-type, \
+	$(foreach f,bootloader-integration hostinfo network os rootfs-type, \
 		$(INSTALL) -D -m 0755 $(@D)/support/mender-inventory-$(f) \
 			$(TARGET_DIR)/usr/share/mender/inventory/mender-inventory-$(f)
 	)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
