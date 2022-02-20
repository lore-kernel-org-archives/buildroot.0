Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D117AC433F5
	for <buildroot@archiver.kernel.org>; Sun, 20 Feb 2022 21:42:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B41260BD5;
	Sun, 20 Feb 2022 21:42:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HwGkLHqWYQlB; Sun, 20 Feb 2022 21:42:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A055660ADB;
	Sun, 20 Feb 2022 21:42:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A18771BF3D7
 for <buildroot@lists.busybox.net>; Sun, 20 Feb 2022 21:42:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8FDEC8140B
 for <buildroot@lists.busybox.net>; Sun, 20 Feb 2022 21:42:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FI2lp3kcHOyh for <buildroot@lists.busybox.net>;
 Sun, 20 Feb 2022 21:42:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5D234813FF
 for <buildroot@buildroot.org>; Sun, 20 Feb 2022 21:42:06 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id k1so23848306wrd.8
 for <buildroot@buildroot.org>; Sun, 20 Feb 2022 13:42:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bX0vsgCtfM8sFVLkeufdB23AMb0ZO7Gt6By6PGnm19k=;
 b=Gs7A1RZBsVwLrLnh4fEbGgVR0rKy9vy1b0Y5Q6jKzcvOmt7zeqKc0ajDrdzZjZDp9a
 StOq9yqJrgNUEplG8uGVEwaLoF75tqfzLlqpM9zC//2H/eI0f1FyvYPcUmss8NZ7KIzV
 bQoaXcbFQ+Nq3ci/8bW6B6DRPx7NrYhujb2KO7gd4crsDjb2jthNrKtaBHu+SEwaTWs+
 3kzZQGgqq0/B9Vwq0HmhAsR3OdLMAMq32BD97g442iR66B1BeqSqsFM5P/uVuXliriVl
 OspTp1Wv4PEFbMurAleQXNjd1t01HwyB79qAvZBXaNh43n4adrzzpP020xpq1I+lH2Hx
 qa7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bX0vsgCtfM8sFVLkeufdB23AMb0ZO7Gt6By6PGnm19k=;
 b=H71tyc1gnIs56H9JzA5uVjMe+K/SkiInK+4Tm302JebRTCSV1YGZwc0P8jvpsyV0E+
 BSd2Fo8h6/rlY1uR5o8fRORDsmct2dN/MPKrr7j5ae6qf9pVDiyUfQA5C4Xx50AQ9FSz
 mkyAFF/CoxbFC4QiQU9q9LCDDQQuef/8cPTcYlXQYQiULSmXbbx/lKRilu1fYKmoecxE
 xQaLQk/Ch9hldweeX7MzB3AT2dbZldKaCB3hFWWrNs2qY5aqPOJTLe5Es7+NFvdCWB35
 wY+OwapgVhSZkx6Ydbm9E/0yVkxB5FgR7RgdY5k8z7P0vFK9GutXeeK8PrgAIAmXKcZF
 3eSA==
X-Gm-Message-State: AOAM532APx90BKpb1cOFVaH+2KZWICgQxbPOyCHXP0EQ1Yfnljy7o1GD
 g2BP6F8jP2Lr7F2r9rzzoDorR+v+7co=
X-Google-Smtp-Source: ABdhPJwvmbJ10lqGUzGlgEs3YaXK4YthrLcmOwglDewkPh7AdmO3JQhRkwHe+qHStgY/BdpNLqB/yA==
X-Received: by 2002:a05:6000:1acf:b0:1ea:f20:cbed with SMTP id
 i15-20020a0560001acf00b001ea0f20cbedmr2927130wry.217.1645393324373; 
 Sun, 20 Feb 2022 13:42:04 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id d14sm39611565wri.93.2022.02.20.13.42.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Feb 2022 13:42:03 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 20 Feb 2022 22:42:03 +0100
Message-Id: <20220220214203.1739006-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xdriver_xf86-video-mach64:
 don't override XDRIVER_XF86_VIDEO_MACH64_CONF_OPTS
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

XDRIVER_XF86_VIDEO_MACH64_CONF_OPTS is wrongly overridden in a
conditional since commit cf26ae7dd14f35dd917811f5a23c54a19ea6ed07

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.mk      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.mk b/package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.mk
index e6f8d7471c..eee8fec2e8 100644
--- a/package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.mk
+++ b/package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.mk
@@ -13,7 +13,7 @@ XDRIVER_XF86_VIDEO_MACH64_AUTORECONF = YES
 XDRIVER_XF86_VIDEO_MACH64_DEPENDENCIES = xserver_xorg-server xorgproto
 
 ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),)
-XDRIVER_XF86_VIDEO_MACH64_CONF_OPTS = --disable-dri
+XDRIVER_XF86_VIDEO_MACH64_CONF_OPTS += --disable-dri
 endif
 
 $(eval $(autotools-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
