Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0755FC433F5
	for <buildroot@archiver.kernel.org>; Sun, 20 Feb 2022 21:43:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B66B560BD8;
	Sun, 20 Feb 2022 21:43:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DwhDQuSY74Ok; Sun, 20 Feb 2022 21:43:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1BCE860B7A;
	Sun, 20 Feb 2022 21:43:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 692771BF3D7
 for <buildroot@lists.busybox.net>; Sun, 20 Feb 2022 21:43:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5689F40187
 for <buildroot@lists.busybox.net>; Sun, 20 Feb 2022 21:43:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id puc4He8MhEAY for <buildroot@lists.busybox.net>;
 Sun, 20 Feb 2022 21:43:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6ED22400C8
 for <buildroot@buildroot.org>; Sun, 20 Feb 2022 21:43:28 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id k1so23851418wrd.8
 for <buildroot@buildroot.org>; Sun, 20 Feb 2022 13:43:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gI4pv9Ba+yi+vnhIUsUNDLJyco3llNDSuZ4gdaoZxXo=;
 b=TKpCo53G3avYFNVlBHzLadm9o6YfECwjvZE61jwgDux9TYl7RSlE4Lk1+zWEqbfi1Q
 oxu5EUcfc0V5CCQNNNoTEnjWQZAvLW0eL+we5aIZRaOWrQyNfbY5fH6L9B2JK8WZKFWG
 1NAjRC9w6640N/XdxsSFbkIkcncjZvso//gDtOeCIkWfPG5b5kVCweKQIsJZeYvQg7RM
 2+h2HwmCmynP+fVN0KmAmeQaZoXfPuvnFed2Y9YflqhLoWSaoATHirbcHLdpDWk1nJH4
 xeczdnv2oaPPpY8U/JyhBaW4Fj4z/y0MnjESoxzj8WRCxYmzhR3MX3Xj8nqlXNwcdiY5
 0LSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gI4pv9Ba+yi+vnhIUsUNDLJyco3llNDSuZ4gdaoZxXo=;
 b=fUIqus1GGCB+kOixhbHGzkTbQwvChyNO1fu+pdmeJ/gMYYrcjEFvz2EUHs1cdN8/cC
 Yff9q3ir2ObzNnMVMkvLudKcRspEq1Xi34ZzlKoM65COBNnNyuBVDT03z6WnwiiOaXv+
 fZ3dCT/mkAb5Nv4dVGkm+J3k0zeiZAzVutLVQMveBgTq/h/pDDArrWtZk3zI8TSLibij
 1GNJEDyuca3vMj8NKyjWjb/WTJF8cUns2HoX65Cm17Oq9jStCClMcCZGeOmApSVq3p5y
 vWry/flANmd9Y6rodRXb/oJvKkvM8JN8rdJTi8loYsi5F3MrCsErITO04k0dMQoThUsm
 KnGQ==
X-Gm-Message-State: AOAM5300vK8uUF3G9eFgPkoimzJ24Ud2IU4O7OkzQB+DdeasBTldrPi0
 NJgWhzb2Dod3WmVde/KxheqSuoXoGOQ=
X-Google-Smtp-Source: ABdhPJyevNNGGTN7qzWbeNM4wb0aTemUqMzmkMdZ2wBGUhG7rTMAj/8STT/4Hu/EFldeqvqtR+lqtA==
X-Received: by 2002:adf:e948:0:b0:1e4:a213:b857 with SMTP id
 m8-20020adfe948000000b001e4a213b857mr13628545wrn.535.1645393406560; 
 Sun, 20 Feb 2022 13:43:26 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id e3sm41593281wrr.94.2022.02.20.13.43.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Feb 2022 13:43:25 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 20 Feb 2022 22:43:28 +0100
Message-Id: <20220220214328.1739123-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xdriver_xf86-video-tdfx:
 don't override XDRIVER_XF86_VIDEO_TDFX_CONF_OPTS
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

XDRIVER_XF86_VIDEO_TDFX_CONF_OPTS is wrongly overridden in a conditional
since commit 7614ca037b2f82ac8e7cca1db3bf173d3655e0e2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx.mk    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx.mk b/package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx.mk
index 8975334f90..14c40e4d89 100644
--- a/package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx.mk
+++ b/package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx.mk
@@ -16,7 +16,7 @@ XDRIVER_XF86_VIDEO_TDFX_DEPENDENCIES = \
 	xserver_xorg-server
 
 ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),)
-XDRIVER_XF86_VIDEO_TDFX_CONF_OPTS = --disable-dri
+XDRIVER_XF86_VIDEO_TDFX_CONF_OPTS += --disable-dri
 endif
 
 $(eval $(autotools-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
