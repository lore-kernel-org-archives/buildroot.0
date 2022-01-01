Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E127FC433F5
	for <buildroot@archiver.kernel.org>; Sat,  1 Jan 2022 14:30:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 82BDF40292;
	Sat,  1 Jan 2022 14:30:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AiR_qphpxqlM; Sat,  1 Jan 2022 14:30:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E8A554027F;
	Sat,  1 Jan 2022 14:30:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 820661BF59D
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 14:29:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7E21A81461
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 14:29:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3sExNGw75BFH for <buildroot@lists.busybox.net>;
 Sat,  1 Jan 2022 14:29:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A999D813EA
 for <buildroot@buildroot.org>; Sat,  1 Jan 2022 14:29:55 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id q16so60824859wrg.7
 for <buildroot@buildroot.org>; Sat, 01 Jan 2022 06:29:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PFZTRGeND6Mv05eum44Hs7q3t1ZJfrohhG6Gp3sjADI=;
 b=pNj8hSt4hTGof0gUwdHw8eDn/4u0cCuaPZVoyf0xYt2SoKmg2KolZzkhZtxvwcxqHV
 i6otKeLINvsMUIrC4IthC39tp8iIuUtwKSqTfRlrTWFtr8jjdqQoNviX4uzsAR0feOVs
 MSg9+S3j2u7qcm4Gbj6KThLYa75eNNE9p4Q70I2H/U9dNQzcZI/37RZTNXFdv+WXSQGA
 YEI02AA0F/LDqfs2nSvHsUMdZ59br3kARWXe9bnq/v08IOntzTY4qctW9ajBIJe6X/Hr
 90qYptXCSYzP61RUPb5huDy1oeGM+skRQU6Y/X5d1Ab5PPhxx3Ns7JCPaR+zwGfrVyP+
 SMNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PFZTRGeND6Mv05eum44Hs7q3t1ZJfrohhG6Gp3sjADI=;
 b=Bd7q4bYW6xJJ5le5MfM8tFGoJF8h8AdomJLNmDSYuBe3+izaiWW5JG/74KznHA9BEP
 3p/cKn52ry2tFLUbsrc4IA95o3oCom7beCazLOL3fYAtOTSZwGOxquhEf4lCPlLg1nFM
 67k4O2HNkrkKYQQnt48avs1HMQpKnE+WKNc5mU3oZ8ofPfpStut+uTVDlDzGt7vAcYd6
 YTvD8DeUJXVEDfuou2MBlinkvWwEhS38M5pa7Q8+FOtzVnCHDO2xP1zjXz+LAhyRnMWa
 0xgY52trq16D6WaJIli19jOwCSeCcvHbS2o+ExUFfq+/+MFqiDCDRX9Zvs+zDbMWI8/j
 IXiA==
X-Gm-Message-State: AOAM531GmSMt5bt9eh2b2ScMvd9TGdpgN8Zs7xllGu0SDWUM8sk6r+P9
 nZSkvmRCTvtCTPrR6TDsRf4rEdckjWM=
X-Google-Smtp-Source: ABdhPJzeS6dZbozmC9Pf+IQ1kPj4ctF64Xb4HrvODsMwqeik1nsjIUF3izsPvbGbRHl5WFSMSXF0Vg==
X-Received: by 2002:adf:ee45:: with SMTP id w5mr31265961wro.0.1641047393855;
 Sat, 01 Jan 2022 06:29:53 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id l2sm30905072wrs.43.2022.01.01.06.29.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Jan 2022 06:29:53 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  1 Jan 2022 15:26:16 +0100
Message-Id: <20220101142616.1176357-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/pipewire: fix avahi build
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since commit
27908c6eab768d0b9fd3444a929b3f1b1510da71:

../output-1/build/pipewire-0.3.40/meson.build:348:0: ERROR: Dependency "avahi-client" not found, tried pkgconfig

Fixes:
 - http://autobuild.buildroot.org/results/d1707ad82159aafbddb69c503109bf2e830f0f29

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/pipewire/pipewire.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/pipewire/pipewire.mk b/package/pipewire/pipewire.mk
index efda3ad695..7043745cc1 100644
--- a/package/pipewire/pipewire.mk
+++ b/package/pipewire/pipewire.mk
@@ -82,7 +82,8 @@ else
 PIPEWIRE_CONF_OPTS += -Dalsa=disabled -Dpipewire-alsa=disabled
 endif
 
-ifeq ($(BR2_PACKAGE_AVAHI),y)
+# avahi support needs avahi-client, which needs avahi-daemon and dbus
+ifeq ($(BR2_PACKAGE_AVAHI)$(BR2_PACKAGE_AVAHI_DAEMON)$(BR2_PACKAGE_DBUS),yyy)
 PIPEWIRE_CONF_OPTS += -Davahi=enabled
 PIPEWIRE_DEPENDENCIES += avahi
 else
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
