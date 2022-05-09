Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D6BEC433F5
	for <buildroot@archiver.kernel.org>; Mon,  9 May 2022 06:07:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 46ED581759;
	Mon,  9 May 2022 06:07:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NQGH47789nW6; Mon,  9 May 2022 06:07:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2FAFD8174C;
	Mon,  9 May 2022 06:07:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1CFAF1BF284
 for <buildroot@lists.busybox.net>; Mon,  9 May 2022 06:07:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0B49F4098D
 for <buildroot@lists.busybox.net>; Mon,  9 May 2022 06:07:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3hSRH-OY6rAS for <buildroot@lists.busybox.net>;
 Mon,  9 May 2022 06:07:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8AA5940308
 for <buildroot@buildroot.org>; Mon,  9 May 2022 06:07:26 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id u23so16290000lfc.1
 for <buildroot@buildroot.org>; Sun, 08 May 2022 23:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YcA0gHhYgjM6OLM49VLtb5o8B2XYCmty/tCXIpM6icc=;
 b=XriTSyHImudw58K2fj8I3FYSzGSwFIho9zyXeu/Bc9/w7S12H1lq9/JK35UEFBpO9w
 +p0ywOtVqSvPLISoaYLnogBIKi0DLpt41VNzbCt3orGCwReLmAJf/Mio0Yv0+eKag4y4
 c3aPLSbuwoQNm6yRgGcKSvM5Yt1Rj80lyhOHF3gpcVsi/Js5luhXk/8yZGePy4ay44ax
 3JDJTIyxjfPRVU86L6EcmiMI1fsJ2C+5thenkLl+6wRcq9oQBNIq1KaEI/lmIisbkm7m
 hX/UBGVu3gwaTZyjRsID0/bEAvPORDf+eyMrTWFwYAdUc+DzD3vctT/Sv/7WtGwlMide
 8qgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YcA0gHhYgjM6OLM49VLtb5o8B2XYCmty/tCXIpM6icc=;
 b=eX6J8Nahjyn2pCOSYXIuMbpKbT/1Pdp1nQQuWiMQ1ZY4gkNmCOPRKq5bWEE63pRo8c
 SVNyEyNYECE6THD1lVoo01uzSRi4vvQLVF36mKJ1h1NbRvbJIdQdUTINMyaLWyPL3Lq5
 G7i4AM4lmilJyy6n1zDoPz6pUV3XsN+YcfLQp1Xs8LBTnbX3xW54lgC7zUOIoHrkpoMg
 EUDA+nWpNVzZZedaSiYkymHQzkTEaDIW8lbhxVuhyPcXDEJDXhHog5O0LT0jBt1Yi33J
 TBiLPgVbg+X3aL4LQByStY6OUgWBPqCUL3LoyD9OVFiZR6X+UhTph8GIVSBQR6PxgGN/
 L17w==
X-Gm-Message-State: AOAM532QQDIFREYp5/U/vF51PuM0Cf9Vg60yDoFtGw8815tfEJu1N8XE
 sTxtnuaPnep2TcZ60XAegxEnVq5IUESrWQ==
X-Google-Smtp-Source: ABdhPJwQ/9nqzmlfLVTgQZFaHZNzHgzgL+vSHOX/qRwsF9EQ1ld+5G52r7DycS58coUN0A11o49NxQ==
X-Received: by 2002:a05:6512:c2a:b0:473:9e11:6ecd with SMTP id
 z42-20020a0565120c2a00b004739e116ecdmr11317967lfu.676.1652076444327; 
 Sun, 08 May 2022 23:07:24 -0700 (PDT)
Received: from localhost.localdomain ([5.188.167.245])
 by smtp.googlemail.com with ESMTPSA id
 q19-20020a0565123a9300b0047255d211b6sm1824707lfu.229.2022.05.08.23.07.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 May 2022 23:07:24 -0700 (PDT)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  9 May 2022 09:07:19 +0300
Message-Id: <20220509060721.2726047-2-geomatsi@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220509060721.2726047-1-geomatsi@gmail.com>
References: <20220509060721.2726047-1-geomatsi@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/3] package/rtl8189fs: enable required kernel
 options
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
Cc: Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Enable Linux kernel configuration options required by the driver.
Those are wireless networking and sdio support.

Fixes:
- http://autobuild.buildroot.net/results/ed6e29e44333ccae2728ca3321ff876c3056eada/

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 package/rtl8189fs/rtl8189fs.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/rtl8189fs/rtl8189fs.mk b/package/rtl8189fs/rtl8189fs.mk
index 40b735c21b..0cca0b751d 100644
--- a/package/rtl8189fs/rtl8189fs.mk
+++ b/package/rtl8189fs/rtl8189fs.mk
@@ -13,5 +13,12 @@ RTL8189FS_MODULE_MAKE_OPTS = \
 	KVER=$(LINUX_VERSION_PROBED) \
 	KSRC=$(LINUX_DIR)
 
+define RTL8189FS_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_WIRELESS)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CFG80211)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_MAC80211)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_MMC)
+endef
+
 $(eval $(kernel-module))
 $(eval $(generic-package))
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
