Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 844A5C433EF
	for <buildroot@archiver.kernel.org>; Thu, 17 Feb 2022 21:50:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 26AC26F755;
	Thu, 17 Feb 2022 21:50:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PjlDFRHXCA6q; Thu, 17 Feb 2022 21:50:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F7516F73B;
	Thu, 17 Feb 2022 21:50:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 39E861BF37A
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 21:50:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 280D783FFD
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 21:50:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LodQX8Ejnzic for <buildroot@lists.busybox.net>;
 Thu, 17 Feb 2022 21:50:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 809BB83FFC
 for <buildroot@buildroot.org>; Thu, 17 Feb 2022 21:50:39 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id v12so11315181wrv.2
 for <buildroot@buildroot.org>; Thu, 17 Feb 2022 13:50:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FONLWCnC1i/jNdP7BdBbvGie+9MRgOEkfp9KjlQkga8=;
 b=Uegk0h2HUoU+WqFo/5vj22/9e8D77XUbxU4rYfiDSGrIk95SBHjY3YR3Zvj+NWstfK
 OCLMVXBTYeFx4/7FKvdFEDM4s0D+PEFdrSSyW7HG79gD6/yyw3LNcwwkdbJ3rrrM3RWK
 MqlDxGyposx+Ibrxrd3CqhP/aXIVJP7WDPTCNww3EYRHs7lqIIaheAzcczm3SqRB8eVz
 0lM0rrazbEKYj6nG0RJMGlTlOD6eXEZwIs40TxYpwJXelNK7VJdmPZqSdD/zI5tYtBSi
 zxkPxyGf3t4atjhUvHK5GUPn+pLGAAkuk+64cs5/N37sI4+WbFv9y3FWIIX6kzC51toI
 EZBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FONLWCnC1i/jNdP7BdBbvGie+9MRgOEkfp9KjlQkga8=;
 b=ASGjkFRdQj4uPKzWIP+vpiYkAwFfuKSEoMmVFXdal+lmYrEpIPG6Wc3qGRsHGfseNb
 scOeVW4dMqkmwI37n9bPFbbY6Xp+umsnQPT5eNRkl1w+zOlfHeB4D0dvj1o295pGt7lH
 HojsL2wccy0pCobuZF6xkz9jhlRRj/yxxQQ0x/M7jVqVENDvL6KkG8jo/gUNcO/AKk3M
 mTX5BFIXjzWpeJmL8ZNuUreh4TeZj9dv0JDW3J6cTUW58jK/jFR+jMWahIA9wVvOS6yA
 +GCuGXIJjWtAuwm+K31tcWUR6W0vVnSmKozGNQDd4FOsGjD0SUUH3Y0MsgzxkWS9UCTJ
 U5Vw==
X-Gm-Message-State: AOAM531MOaYwuFrMe53mGKbEql+vQQAj43v9zrS+5txqctE9z0WcW7RI
 jHAQdBqWOqq94q5yEEEJpUeJ9tXP/nM=
X-Google-Smtp-Source: ABdhPJyH2Opa4Ds6jfkuDXR7yvhKUZ0r9cJ645yqxGIXgYR8Tajdu4r1W4cn5nRAQB/OJvYH3rBcnA==
X-Received: by 2002:a5d:584b:0:b0:1e8:b478:ca0 with SMTP id
 i11-20020a5d584b000000b001e8b4780ca0mr3662303wrf.377.1645134637588; 
 Thu, 17 Feb 2022 13:50:37 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id u7sm31418322wrq.112.2022.02.17.13.50.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Feb 2022 13:50:37 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 17 Feb 2022 22:50:49 +0100
Message-Id: <20220217215049.556036-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xdriver_xf86-video-mga: don't
 override XDRIVER_XF86_VIDEO_MGA_CONF_OPTS
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

XDRIVER_XF86_VIDEO_MGA_CONF_OPTS is wrongly overridden in a conditional
since commit 105c7c7573ee2c7771db49c3e0dc168bc0eee84b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.mk b/package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.mk
index 2720848a17..3c668a5c98 100644
--- a/package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.mk
+++ b/package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.mk
@@ -13,7 +13,7 @@ XDRIVER_XF86_VIDEO_MGA_AUTORECONF = YES
 XDRIVER_XF86_VIDEO_MGA_DEPENDENCIES = xserver_xorg-server libdrm xorgproto
 
 ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),)
-XDRIVER_XF86_VIDEO_MGA_CONF_OPTS = --disable-dri
+XDRIVER_XF86_VIDEO_MGA_CONF_OPTS += --disable-dri
 endif
 
 $(eval $(autotools-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
