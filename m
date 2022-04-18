Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4BD5C433F5
	for <buildroot@archiver.kernel.org>; Mon, 18 Apr 2022 10:41:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4026241DCF;
	Mon, 18 Apr 2022 10:41:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CwURchRO-12D; Mon, 18 Apr 2022 10:41:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17681415C4;
	Mon, 18 Apr 2022 10:41:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 680FC1BF390
 for <buildroot@lists.busybox.net>; Mon, 18 Apr 2022 10:41:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 61C2C415C4
 for <buildroot@lists.busybox.net>; Mon, 18 Apr 2022 10:41:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YiF7tZp1G9iG for <buildroot@lists.busybox.net>;
 Mon, 18 Apr 2022 10:41:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 099FE415BC
 for <buildroot@buildroot.org>; Mon, 18 Apr 2022 10:41:00 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id bv16so974731wrb.9
 for <buildroot@buildroot.org>; Mon, 18 Apr 2022 03:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KNV9m0kRplbvX2RkmlHk57oLdN9WCAEweznMe2HwIY0=;
 b=ikpKc8bcWQmDATV4yN0yKSVx8Ve9SoHxk3qhElVs2ygxWw5UHRwrKWTWXYgXR+2jVB
 e6FyP02zNtY8bQZlVXu/cs2BEXUGsWhzYX+OCk+UkO32O/78ylhXkh8QimhSML87cJeH
 LSWKZtBUeiyxFwliJArFW24DjFlOf3WPYHJQwW8paqS6Bnq/VGbot8BIwJXyL0hhf1Z9
 9Wy3cOMRh8F19zLTH2RQzMCI6K8PkMm/C5VkOyU2Y6HQEUYRDEMK6xPvx0fOl44Oo19C
 1Agd8bJ/z2g9JWAMc96QmmJhwytWccedoUD3ltwX400j4CUTX8LxU3UXsq7hYPgcpEOk
 zX8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KNV9m0kRplbvX2RkmlHk57oLdN9WCAEweznMe2HwIY0=;
 b=EPe/qMyK6MwGmDBloDXCvvUn9OecGoyQ0PXIRUag4ymyhSmvT2X74OxvjymbkO9HBS
 gq4AiGh6lUkv9fL+DvzwvPu/UplYNJAnqJyQnusC+HvIjHzSenzuLjVoW7ls+9OkU7eX
 Zp9mBLvXkElUBHP0e97PE/SBp36QGy9Mp8n/8QxmAJ3tP2JcVXFlijlzuN/A+osWy1ZS
 rSfDz/irhpsTXVFaKKEL9Gs0f/oShPD1FBM/d6jHJkOBkpaJ5iGzfWZhUspoV811FC5R
 q2+GIVE2Dl+bT9w0rGinux+6OxmF7vgJn/84ML4gwo1BNy6M5KhFshctZdmdjOHPNUvA
 IiRg==
X-Gm-Message-State: AOAM530k45WpdvVtUTSAXxym7q11F7nk9NawakCfVFQt0xhIMjAvqc3v
 ULlSnyaG06gfBXt19/7Zq6OdcZRx85M=
X-Google-Smtp-Source: ABdhPJxUuJyikiZYGJls1Quzd9iRd9EtR8AzT5Itg+H95OEVj7JDKo/nr0LjspoPp5Zp+9EfTS7JAw==
X-Received: by 2002:a5d:4e07:0:b0:207:9a41:842f with SMTP id
 p7-20020a5d4e07000000b002079a41842fmr7932761wrt.232.1650278458868; 
 Mon, 18 Apr 2022 03:40:58 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 d18-20020a05600c34d200b0038ed14b7ac3sm12466203wmq.40.2022.04.18.03.40.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Apr 2022 03:40:58 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 18 Apr 2022 12:38:47 +0200
Message-Id: <20220418103847.273865-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/pixman: fix mips build
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Disable Loongson MMI fast paths to fix the following mips build failure:

./loongson-mmintrin.h:407:2: error: impossible constraint in 'asm'
  407 |  asm("pinsrh_%3 %0, %1, %2\n\t"
      |  ^~~

Fixes:
 - http://autobuild.buildroot.org/results/75267aa5b5a631f091d4c8cb6ad9baeb5f72ee11
 - http://autobuild.buildroot.org/results/55b7431a50b85c24406131af1932d6f3f6853de6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/pixman/pixman.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/pixman/pixman.mk b/package/pixman/pixman.mk
index 6fab539593..64302fa49a 100644
--- a/package/pixman/pixman.mk
+++ b/package/pixman/pixman.mk
@@ -19,7 +19,9 @@ HOST_PIXMAN_DEPENDENCIES = host-pkgconf
 PIXMAN_AUTORECONF = YES
 
 # don't build gtk based demos
-PIXMAN_CONF_OPTS = --disable-gtk
+PIXMAN_CONF_OPTS = \
+	--disable-gtk \
+	--disable-loongson-mmi
 
 # The ARM SIMD code from pixman requires a recent enough ARM core, but
 # there is a runtime CPU check that makes sure it doesn't get used if
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
