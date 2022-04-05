Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0DF0C433F5
	for <buildroot@archiver.kernel.org>; Tue,  5 Apr 2022 08:49:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8741A60D55;
	Tue,  5 Apr 2022 08:49:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cI3I0r1NGKdj; Tue,  5 Apr 2022 08:49:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE81360D4C;
	Tue,  5 Apr 2022 08:49:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 960311BF336
 for <buildroot@lists.busybox.net>; Tue,  5 Apr 2022 08:49:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 927B640257
 for <buildroot@lists.busybox.net>; Tue,  5 Apr 2022 08:49:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=googlemail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h8OBcPKrbgrx for <buildroot@lists.busybox.net>;
 Tue,  5 Apr 2022 08:49:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A735C4023B
 for <buildroot@buildroot.org>; Tue,  5 Apr 2022 08:49:40 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id bg10so25247618ejb.4
 for <buildroot@buildroot.org>; Tue, 05 Apr 2022 01:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=whwObzVshx07VZj05TeSq6yROfpivWTVFidlUVg+Sw8=;
 b=aoF9oX0yqFA5CyZqumCRR8I2bGGoo1Ui/5n1R/U4UG/+LUF6v7K5f0TYmjf0/6siaO
 Q5Y59JKgRAI2InhJqZ00A0liJJPVFASWCnbolhdlexQYd73y5DdUJ05JqUmY74Yh7fwD
 1gHvMo/ctZVbl2tfCcwm8IVLVDvZ1Y70mgXZySj4goxhcOrNshZWCetsg7UANWHPYoIH
 RlJ122/Fca85Y0vnVRoHK5jU2Mwv4M/RAUmciKSokB+YmzH591WjPTDjlYnglUjMwrUq
 77PHq8Df/V7GY/crhcgKS6xqE5HN+5ziMUd/gzh8fCArVpJlc5CSUvUuFi5UiqYCJltw
 MTOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=whwObzVshx07VZj05TeSq6yROfpivWTVFidlUVg+Sw8=;
 b=ZQpCsjrqiXcNCUo3pdiPgGA3U0DvW3qG8pa7/qV4JAQDAJtnh0669vpkrCZEuWtnwC
 qF2y2hXMq7YPBWrw23z3MMhSwBGSCpopYIlg9wQrRx+FBsrWxEiBVmI9pyJ+y/yGP6Gq
 r5u5GEJXHChRd7ciUB83KGc6X+DYmOy4UAHpIprpkJxcgy1VSXtNYrZ7BvPavSOK4sIC
 CnL0J4uh3piC3KhXpctS2EhgXrYqdjBjBelZUr88oCWDADPw1veKGcGvR2KjFgN7Z0im
 5y1/XCwQWmlp0iG+/CRRqqswgnfw2uuwG5cplvpenOCFfwYEOyXq02DsLFxaFutOFcfR
 /DUw==
X-Gm-Message-State: AOAM530sIQJwDTKgOnQNKEBKcgc2+2F9GK+bPQQx5vvu5+Q+Djm1DRrX
 AgBo6M34xOL9JxzIbGIqrHvneu1eHxk=
X-Google-Smtp-Source: ABdhPJw6kx7RgR7D490qy3uVFcBN/UdiL8xKVXVKkus8fms5WXY/HpJErDj/Xbip/ULsyza0IZvTJw==
X-Received: by 2002:a17:906:c110:b0:6e0:dc2a:3393 with SMTP id
 do16-20020a170906c11000b006e0dc2a3393mr2394848ejc.512.1649148578553; 
 Tue, 05 Apr 2022 01:49:38 -0700 (PDT)
Received: from development1.visionsystems.de (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 t7-20020a50d907000000b0041cda2f0548sm1959083edj.10.2022.04.05.01.49.37
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 05 Apr 2022 01:49:37 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue,  5 Apr 2022 10:49:28 +0200
Message-Id: <20220405084929.2755-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.17.0
Subject: [Buildroot] [PATCH 1/2] package/wpa_supplicant: enable SAE-PK
 option for WPA3
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
From: yegorslists--- via buildroot <buildroot@buildroot.org>
Reply-To: yegorslists@googlemail.com
Cc: Matt Weber <matthew.weber@collins.com>,
 Sergey Matyukevich <geomatsi@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

This enables a new security feature "SAE Public Key".

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/wpa_supplicant/wpa_supplicant.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index f0eb36e083..a2ca8a0b30 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -112,11 +112,13 @@ ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_WPA3),y)
 WPA_SUPPLICANT_CONFIG_ENABLE += \
 	CONFIG_DPP \
 	CONFIG_SAE \
+	CONFIG_SAE_PK \
 	CONFIG_OWE
 else
 WPA_SUPPLICANT_CONFIG_DISABLE += \
 	CONFIG_DPP \
 	CONFIG_SAE \
+	CONFIG_SAE_PK \
 	CONFIG_OWE
 endif
 
-- 
2.17.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
