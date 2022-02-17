Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4502DC433EF
	for <buildroot@archiver.kernel.org>; Thu, 17 Feb 2022 21:54:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DBB8A8402A;
	Thu, 17 Feb 2022 21:54:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KmZwDbQ9Al3Q; Thu, 17 Feb 2022 21:54:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8184383FA0;
	Thu, 17 Feb 2022 21:54:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 753891BF37A
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 21:54:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6494183E00
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 21:54:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J8nMnAXz8_oZ for <buildroot@lists.busybox.net>;
 Thu, 17 Feb 2022 21:54:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B966D83DF8
 for <buildroot@buildroot.org>; Thu, 17 Feb 2022 21:54:03 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id w11so11293009wra.4
 for <buildroot@buildroot.org>; Thu, 17 Feb 2022 13:54:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=blaYZiHeJgLQEXeeT3kV5w0kAqPNo8y6C+Uzk8nwqC4=;
 b=o2MoVvjncrbVKkq7k6hnkCxn6EIdVVACm3IlGIyFixH9ZctD8jqbOPed8LIPa9MbbV
 vnlUCjvsZK8W0OcZkDVX+RteaSOxNWvMowCwITEwktNn+GY1s+O7ZL7Y7zkskkJBtNmB
 dOeTf+T5mEt5dDstB9jh/HHHGLAEbvSKeAukjMPDjF0RnQWQ034up9TfuVupKW2glG9F
 7XvvOcArXyXWeLHgP/HH0sTThTaVmws/1r3yWFzxtVN0T4s5vIIYQUOetwrqZDX4/3x0
 rABaNHFDHxKDPJ5ZEAh6okl3UxGl7fWVmNHeISoSVUm4URyOgzP4CBU53mr2CcbRe/Y9
 Dbhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=blaYZiHeJgLQEXeeT3kV5w0kAqPNo8y6C+Uzk8nwqC4=;
 b=7QdeoYnzZzryBsBb+d2I0yzJNrJpVl/TZ+1xTHu4o6lUGZ86V4TzeROaF1Dn7m0beZ
 q3jo5vdO90QAqTFoj74k1NAnnPrxFTsGOLPD38piK6UvgMBQYF9ayO8+W/OvBgKy0Wkp
 /V+2xwGvhJI2LSWlEjamYm82G7g+/V1WS7Ewjc3+SVkAeeFzzidB688mUFB+rhgcQlqQ
 +a+/JSOf8Ma8eBj3IoYlFlJ4JfT2CQhsuVfeHwnavx291T2JaNp9qId8tpNtBXccoJiy
 GwWkvug8aL7+FWUDolNHoVxylewTkgODi4RYeUqdM3TDushaBBMZkPhnOYhVmOfXQQ1H
 llJw==
X-Gm-Message-State: AOAM530j1wxKqAUZ3+B6DA+ojYDwsQlrAqT37nJ4yd/L0CtPD2qBnsQI
 bGul+bXpxviTLLD9Pvw7RXs+k/m0qFM=
X-Google-Smtp-Source: ABdhPJy11K7d6V2mvKv3lDPFmG45gy85m9LXss55KdwYGqcA8Hmu+UIw5+dtZLOU+YPxPNCxc4MaFQ==
X-Received: by 2002:adf:fe02:0:b0:1e3:266:d1c with SMTP id
 n2-20020adffe02000000b001e302660d1cmr3720738wrr.582.1645134841640; 
 Thu, 17 Feb 2022 13:54:01 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id s26sm2369289wmh.47.2022.02.17.13.54.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Feb 2022 13:54:01 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 17 Feb 2022 22:54:13 +0100
Message-Id: <20220217215413.556297-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xdriver_xf86-video-ati: don't
 override XDRIVER_XF86_VIDEO_ATI_CONF_OPTS
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

XDRIVER_XF86_VIDEO_ATI_CONF_OPTS is wrongly overridden in a conditional
since commit daa433bff6d2d9934705feacd3619a7618d13ae5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk b/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk
index f7aeba8ba6..edb8b11add 100644
--- a/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk
+++ b/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk
@@ -16,9 +16,9 @@ XDRIVER_XF86_VIDEO_ATI_DEPENDENCIES = \
 	xserver_xorg-server
 
 ifeq ($(BR2_PACKAGE_HAS_LIBEGL)$(BR2_PACKAGE_HAS_LIBGL)$(BR2_PACKAGE_LIBEPOXY),yyy)
-XDRIVER_XF86_VIDEO_ATI_CONF_OPTS = --enable-glamor
+XDRIVER_XF86_VIDEO_ATI_CONF_OPTS += --enable-glamor
 else
-XDRIVER_XF86_VIDEO_ATI_CONF_OPTS = --disable-glamor
+XDRIVER_XF86_VIDEO_ATI_CONF_OPTS += --disable-glamor
 endif
 
 # xdriver_xf86-video-ati requires O_CLOEXEC
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
