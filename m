Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E86C4C76196
	for <buildroot@archiver.kernel.org>; Mon, 10 Apr 2023 17:50:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8368D40AB9;
	Mon, 10 Apr 2023 17:50:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8368D40AB9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1OC0G2XFOYvK; Mon, 10 Apr 2023 17:50:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 57912417B0;
	Mon, 10 Apr 2023 17:50:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 57912417B0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BF8391BF3DA
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 17:50:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A635860BE2
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 17:50:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A635860BE2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kRHsnkQlvTxR for <buildroot@lists.busybox.net>;
 Mon, 10 Apr 2023 17:50:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D0E3F60BCD
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D0E3F60BCD
 for <buildroot@buildroot.org>; Mon, 10 Apr 2023 17:50:25 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id a29so6690066ljq.0
 for <buildroot@buildroot.org>; Mon, 10 Apr 2023 10:50:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681149023;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MDlO/JQh5w+7jGjgtrgqiEOyi1SZFWy81JN8cv0p9UY=;
 b=q5p3AOiilELOyHIOOyjNW+gbMKoJQc6uhIEfDXCYxWIqz6TXaem6X5OqnSsRgoMQVQ
 AynCL5UdXUrdj1fqnjfx6s7d4230nsUmsG7J/GWAWycHxG60ISg7nUwPa4XctDNfmay2
 r9hrHsdyf1soej3nPNcgFWJ2hr81gcj0absmIeRAsSu6V2OPudRkIlIt7/zybVllkpUc
 3lIrVkfRLhBM9SZ8NAzv4cOljP4kXghdyyLpgPVaRk+rfMkRzZYxDDANUKs7R2Cf174S
 piUd3pWttTmK5a6vC1rXX1lV+bucM2WYwAG1BXt5GLVw6mTWNAo7wdNQsV/W3lZUJ0sL
 Vmlw==
X-Gm-Message-State: AAQBX9dl7wO9vsV5VtEgcFKUuVMnnRpOpVlQTORTsV2xH+y7Ynw9p41P
 F07Ea3EU/wI1wDPY12wTikshhdNyG7p8cQ==
X-Google-Smtp-Source: AKy350bbdP+wM+pWBLheBJt8jG+mbGfwxwBoJuwqUgH46eWAI8kzWB0N5Qem7eoT2xZdlWoL6nQ+WQ==
X-Received: by 2002:a2e:97c6:0:b0:2a2:ada:d70a with SMTP id
 m6-20020a2e97c6000000b002a20adad70amr2168682ljj.7.1681149023357; 
 Mon, 10 Apr 2023 10:50:23 -0700 (PDT)
Received: from localhost.localdomain ([5.188.167.245])
 by smtp.googlemail.com with ESMTPSA id
 a8-20020a2e9808000000b00295b842c2dbsm2343994ljj.133.2023.04.10.10.50.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 10:50:22 -0700 (PDT)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 10 Apr 2023 20:50:16 +0300
Message-Id: <20230410175018.2283807-2-geomatsi@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230410175018.2283807-1-geomatsi@gmail.com>
References: <20230410175018.2283807-1-geomatsi@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1681149023;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MDlO/JQh5w+7jGjgtrgqiEOyi1SZFWy81JN8cv0p9UY=;
 b=KXjeyJ5gIcwPjWBtAzWwWnogkQ0XCRitE5OrZvM6JtaFZ6tDSeQfVSVYk0yiG75k6f
 acrTP57X7U6DvBnvuU8BdJ9XA1U7cEnelWaqAd8O14RWgUp1m87Gt3cyDdRLybEAe/LV
 omPhxYc14T9EQ/LwF3p6NmheljRKPckqHeTMdl6M2nUzoAhX/nY3eeBX4dIxX0hfHPGr
 PFd1172BhAbJQmQq6fjT/pMujHFj807Bku9lpKHAfZc18j7Mh1UoIm/bsFyZueUX6tHE
 2gcAIem7dPXOUGIMnJ/MNSV8DEvQa8esPU+/nBULR0+HbsWenHpKGXAldEIcS8p33Fgg
 oCaw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=KXjeyJ5g
Subject: [Buildroot] [PATCH 1/3] package/xr819-xradio: bump version
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

With introduction of vmap'ed stacks to ARM in Linux v5.18, stack
parameters can no longer be used for DMA. So pull the latest xradio
changes that fix the driver and make it work with vmap'ed stacks
in new kernels.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 package/xr819-xradio/xr819-xradio.hash | 2 +-
 package/xr819-xradio/xr819-xradio.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/xr819-xradio/xr819-xradio.hash b/package/xr819-xradio/xr819-xradio.hash
index 60185db736..8676f065f8 100644
--- a/package/xr819-xradio/xr819-xradio.hash
+++ b/package/xr819-xradio/xr819-xradio.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  2b297fbcc9b5ed190bcfff9f6f808c170632ac3d69dbd92156a7f4f57142dec9  xr819-xradio-005f28cfe9e20b7f2dfd9d32d38ee97060dc707f.tar.gz
+sha256  93388424f1f136db541ce056be017f2f0f6688278ac15a88bef34da8f12ffea6  xr819-xradio-119cad7d07aef6973dd44e4dae74d4c9defd06a2.tar.gz
 # Locally computed
 sha256  db296f2f7f35bca3a174efb0eb392b3b17bd94b341851429a3dff411b1c2fc73  LICENSE
diff --git a/package/xr819-xradio/xr819-xradio.mk b/package/xr819-xradio/xr819-xradio.mk
index e5daaa6051..66c08e7921 100644
--- a/package/xr819-xradio/xr819-xradio.mk
+++ b/package/xr819-xradio/xr819-xradio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XR819_XRADIO_VERSION = 005f28cfe9e20b7f2dfd9d32d38ee97060dc707f
+XR819_XRADIO_VERSION = 119cad7d07aef6973dd44e4dae74d4c9defd06a2
 XR819_XRADIO_SITE = $(call github,fifteenhex,xradio,$(XR819_XRADIO_VERSION))
 XR819_XRADIO_LICENSE = GPL-2.0
 XR819_XRADIO_LICENSE_FILES = LICENSE
-- 
2.40.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
