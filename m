Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C03CC433F5
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 09:46:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2750660BC2;
	Thu, 30 Dec 2021 09:46:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cwjX2iMNzc7f; Thu, 30 Dec 2021 09:46:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 86D8C60B95;
	Thu, 30 Dec 2021 09:46:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 647DB1BF346
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 09:46:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 612CB60B95
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 09:46:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m6g7Bxi932Gh for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 09:46:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7357F60B6D
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 09:46:49 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id v11so49394254wrw.10
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 01:46:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CR1WuyY5Shudi5MxIU3iUU7AXFBLaX+haOvxsq7+EKI=;
 b=a58ZAUO72oUBJGKEqN3gQ8H2PXgIHalQ4s32GpEXnWS+zNGb834n8rV3THjCiANHRK
 yXYurCQYovYBICFL7fhY/uFtaOhmPrmqVOsBpHplW6rJA+4XwO7UrpaBzKRx23XvLtlj
 k8GTHvGkkRak9zwLKcQ4G4crdI5vLOS9YIV6xpLD9apmHor2eB04BuJImpnuTQvkIxpO
 7ErsTj/VNLtkKWkQF1Lfr6iE1rbTU8v6/5xrSWukJ0PY2xQE2MOkO9lYiYqvwWYNOu81
 eIHZusQgTe+Yu+PcjikAvMG0DaXqoO10nryI/efcXJGcnJIWOV7yUMrTwoVM4FbnuS9e
 hOGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CR1WuyY5Shudi5MxIU3iUU7AXFBLaX+haOvxsq7+EKI=;
 b=49fo2QC4nlfpxpUODrygo6YzLfZy3l4Bfnz7F/8g9jZnxGcQk5VH1dHhTlmo+l086o
 vokWFNIrZwKmJQruTurlibi8fsfrAR2l0YFaRdlwO7ORGqh8/8VpNaAYGY3SSGN/rBaN
 QAcQA7Xx2P0r3kov+nQGez5Grg+X7PVrCzuBepfFHH69xDEOYfJ4hJQ47h1yBxq8sek0
 a+vtxHawZfR8+bxp+WgngOLB0FUa9FTivOykPs+AoiM3foNm2fqmy8gd6xrruAqrxwRT
 BoM40+56KODpKKNRiT7EdE/UJPt7/FuUOD3jRoTfgA3dDulP5fErgd7YYheA/AF2GJoV
 ldtA==
X-Gm-Message-State: AOAM533sO2sxUQdiKs7v9r0fW2RTtnS4hEoMB7Gud/Bh7/SNK06fE0mS
 2p5hlOeqPFYH6OIy3dMWb7j0JydrBf0=
X-Google-Smtp-Source: ABdhPJySljySQcMEXQOB8ims6Jy5lyeuw+R+s76bY8fM1QxAMJ6Uoz0lcBEZd8buI8dpoSRmYWqLkA==
X-Received: by 2002:adf:dc92:: with SMTP id r18mr24214838wrj.584.1640857607433; 
 Thu, 30 Dec 2021 01:46:47 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id r20sm22232317wmd.37.2021.12.30.01.46.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Dec 2021 01:46:47 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 30 Dec 2021 10:46:02 +0100
Message-Id: <20211230094602.1746612-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/dnsmasq: bump to version 2.86
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://thekelleys.org.uk/dnsmasq/CHANGELOG

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/dnsmasq/dnsmasq.hash | 4 ++--
 package/dnsmasq/dnsmasq.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/dnsmasq/dnsmasq.hash b/package/dnsmasq/dnsmasq.hash
index 2a7cda4a04..804012821e 100644
--- a/package/dnsmasq/dnsmasq.hash
+++ b/package/dnsmasq/dnsmasq.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://www.thekelleys.org.uk/dnsmasq/dnsmasq-2.85.tar.xz.asc
-sha256  ad98d3803df687e5b938080f3d25c628fe41c878752d03fbc6199787fee312fa  dnsmasq-2.85.tar.xz
+# https://www.thekelleys.org.uk/dnsmasq/dnsmasq-2.86.tar.xz.asc
+sha256  28d52cfc9e2004ac4f85274f52b32e1647b4dbc9761b82e7de1e41c49907eb08  dnsmasq-2.86.tar.xz
 # Locally calculated
 sha256  dcc100d4161cc0b7177545ab6e47216f84857cda3843847c792a25289852dcaa  COPYING
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING-v3
diff --git a/package/dnsmasq/dnsmasq.mk b/package/dnsmasq/dnsmasq.mk
index 972be10935..0569475fc4 100644
--- a/package/dnsmasq/dnsmasq.mk
+++ b/package/dnsmasq/dnsmasq.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DNSMASQ_VERSION = 2.85
+DNSMASQ_VERSION = 2.86
 DNSMASQ_SOURCE = dnsmasq-$(DNSMASQ_VERSION).tar.xz
 DNSMASQ_SITE = http://thekelleys.org.uk/dnsmasq
 DNSMASQ_MAKE_ENV = $(TARGET_MAKE_ENV) CC="$(TARGET_CC)"
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
