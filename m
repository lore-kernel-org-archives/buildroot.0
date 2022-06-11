Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 584D2C43334
	for <buildroot@archiver.kernel.org>; Sat, 11 Jun 2022 14:38:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E3205419CD;
	Sat, 11 Jun 2022 14:38:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SCbsjDj8zkBW; Sat, 11 Jun 2022 14:38:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A910D41573;
	Sat, 11 Jun 2022 14:38:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 282731BF400
 for <buildroot@lists.busybox.net>; Sat, 11 Jun 2022 14:38:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 15F1341218
 for <buildroot@lists.busybox.net>; Sat, 11 Jun 2022 14:38:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PKbV5SxU4y-J for <buildroot@lists.busybox.net>;
 Sat, 11 Jun 2022 14:38:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E47DF408D1
 for <buildroot@buildroot.org>; Sat, 11 Jun 2022 14:38:34 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 x6-20020a1c7c06000000b003972dfca96cso939708wmc.4
 for <buildroot@buildroot.org>; Sat, 11 Jun 2022 07:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bxPmaxRsXMTbWXKzFH3/vcgEU2MJcFb1FQRkQQV9Vrc=;
 b=Zb0wv0yfJn5tFgx5P8rsYOZanjRMduTXLEKzmydfpKgwjuJ413dn1ssCXSsHqTSSvq
 WhHx++ltK6xRRRWKW8DaViEsmkSpZ2yaksRrHIxo+pMw+VZR7iGtFaBytSqzEisP0OLm
 c9E7TGJ6151qW6zKi4pD6YpFq7k3pWH4FpSmBW2huiwjN4NBbquuj6bhI2gEwtRbUVlo
 /W59X/DWMZaddvXjshXxUZes1K3uiEvbgpUyzixsT2HbzoQZZ9EuYVsVy0jVuB1TuxX8
 BgpiQZ8vnebOa5q8A2DpPhcDzh3Ny77XXgOe1zNacPutPTexs9MMYEGAybqlnt5FHi9B
 VtMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bxPmaxRsXMTbWXKzFH3/vcgEU2MJcFb1FQRkQQV9Vrc=;
 b=lKTSXlTfIw3y2s0EZl/3i7rrj8YIrkS/QLsT2JDvrqQNPs2aFN3yuHWSr2t2oI7Aga
 XQpBwFTuZXFk24To7IvkvkqbCCq/P/TCeLybVYdzpoyj0gshG5ZCfbtJteebwGORWeAY
 sZFplTjxNybTAJCaokEJAxi6mDkxb+yJbhnnmDjsu2+7sBASUsNG9YTZghrCEhTuIw2L
 1m99jbDditXsI32N1LPttJQu31YFdTrR/EEAJBASRsns6Z3LNBr8fFv7SvJgwGrVPOs8
 MgHmY3xkKBz+H8Ra84iEJe5X5cQPg6p5HDj4t4ctb+fbUnvaoe/EkxLz8+fGPY8cJWLR
 4GsQ==
X-Gm-Message-State: AOAM532jHl9MNLDKuGbEcvCCeK+fZkMgCWpbv6PJ28uMir6LkOP9HJUC
 HHuJhsXnbUkpTN+U6sMKziOqMwOLC4E=
X-Google-Smtp-Source: ABdhPJzmWRhHQQ1di4O5xYoD50cK2AXLF2kRjaXO7hwsYb5h8ffT/3a2X8htGBrJ6NjRDt+jFKfeNg==
X-Received: by 2002:a1c:4c0d:0:b0:39c:5233:1873 with SMTP id
 z13-20020a1c4c0d000000b0039c52331873mr5179249wmf.28.1654958312797; 
 Sat, 11 Jun 2022 07:38:32 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 q6-20020a5d5746000000b0020d10a249eesm2750132wrw.13.2022.06.11.07.38.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jun 2022 07:38:32 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 11 Jun 2022 16:35:44 +0200
Message-Id: <20220611143544.844613-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220611143544.844613-1-fontaine.fabrice@gmail.com>
References: <20220611143544.844613-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/wolftpm: drop WOLFTPM_CPE_ID_VENDOR
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
Cc: Dimitar Tomov <dimi@tpm.dev>, Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cpe:2.3:a:wolfssl:wolftpm has never been a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Awolfssl%3Awolftpm

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/wolftpm/wolftpm.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/wolftpm/wolftpm.mk b/package/wolftpm/wolftpm.mk
index f0cf0df0d3..042ccd22e1 100644
--- a/package/wolftpm/wolftpm.mk
+++ b/package/wolftpm/wolftpm.mk
@@ -9,7 +9,6 @@ WOLFTPM_SITE = $(call github,wolfSSL,wolfTPM,v$(WOLFTPM_VERSION))
 WOLFTPM_INSTALL_STAGING = YES
 WOLFTPM_LICENSE = GPL-2.0+
 WOLFTPM_LICENSE_FILES = LICENSE
-WOLFTPM_CPE_ID_VENDOR = wolfssl
 WOLFTPM_CONFIG_SCRIPTS = wolftpm-config
 
 # wolfTPM's source code is released without a configure script,
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
