Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92741C4332F
	for <buildroot@archiver.kernel.org>; Tue,  7 Nov 2023 22:17:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E14E60AE7;
	Tue,  7 Nov 2023 22:17:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E14E60AE7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J8KNloiH1PoW; Tue,  7 Nov 2023 22:17:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C55E60ACA;
	Tue,  7 Nov 2023 22:17:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C55E60ACA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3FC411BF59B
 for <buildroot@lists.busybox.net>; Tue,  7 Nov 2023 22:17:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 115D981AF4
 for <buildroot@lists.busybox.net>; Tue,  7 Nov 2023 22:17:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 115D981AF4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id srtChA-Sb61m for <buildroot@lists.busybox.net>;
 Tue,  7 Nov 2023 22:17:53 +0000 (UTC)
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B8FDA81AA7
 for <buildroot@buildroot.org>; Tue,  7 Nov 2023 22:17:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B8FDA81AA7
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-6b7f0170d7bso6181287b3a.2
 for <buildroot@buildroot.org>; Tue, 07 Nov 2023 14:17:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699395473; x=1700000273;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fU0AXXyPScDGxY0LFQz1o3H+RIbG0KdUg7/zZdtqaiY=;
 b=WKJ+xo/w4QYO9DFuB5YVBfQxfEkWvRaGNf11KtVHjRL0UjaabsEQMWvEjNA6TsEpeJ
 YhjcUzuMgQKlW+ae9HHR70o4Meug5/0v63TvdWV1Rv01vCCNZ+YP/Xam7AcnAD4egKoh
 GJfrqNLKCP1cs18y0Ca18ZM0DesX6JeuXz/pcGvDPwsHK7wIJF2ggpsvMgoXyUareQDR
 UX3LM7k+AaD1UX3anGjoqUMB1oyUjJgEylRiTM+0AgwvXfkpXmFeYtcikEBVm3LXbsTB
 xTBdvlcPeXf/abg5tQ/u/ujRQKfsHgXACbu7/M85gMpQn0GkcseVAjs0+WWTfS8ugF0N
 THPQ==
X-Gm-Message-State: AOJu0Yz/7clE+r9V+yKlSUrc3DgxGHWkugsSAEFEyzKcjRPLIniORfFb
 LYXWaLYDC7bWMfvCshmxxUKFzNH4IVWn5tt3SbBuKg==
X-Google-Smtp-Source: AGHT+IF9UDuzgGfJIpYfwo6V/mciXmixX54oqblumh47UVl9n1OLQbXJOJ17adbt3IJNeJ4uF8pYIQ==
X-Received: by 2002:a05:6a20:728e:b0:17e:1f9a:91f5 with SMTP id
 o14-20020a056a20728e00b0017e1f9a91f5mr354216pzk.44.1699395472724; 
 Tue, 07 Nov 2023 14:17:52 -0800 (PST)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 r18-20020aa78452000000b006c34768a37fsm7671380pfn.114.2023.11.07.14.17.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Nov 2023 14:17:52 -0800 (PST)
To: buildroot@buildroot.org
Date: Tue,  7 Nov 2023 14:17:45 -0800
Message-ID: <20231107221745.2722636-1-christian@aperture.us>
X-Mailer: git-send-email 2.42.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1699395473; x=1700000273; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fU0AXXyPScDGxY0LFQz1o3H+RIbG0KdUg7/zZdtqaiY=;
 b=Tl8ApVYVisStbEOLEVFYvdPZRTCx37Az4CdtJ8zisJBJ+p1NCwzrlrdzAng79tA6yC
 XHp6bIdJRA2/6NrjgwoOFjHgKydo2xKZW9kuDxleWDllpP2F0kiLNj2V9aZR9YjMOKoT
 ldChj2ci898GxjgrFHbehBcHkN6F3gZ4ZDjXEe3fgPqlTiNWZtMaBR+JaPIwoylCQD3H
 OP1U1gjG6xb3D45UtXi55w4xZ7DcjkmPwviIwUcd8yV8Tf6Cq7/PJpBQpFzVCDxmCO6C
 PTdu1Ra3xJluQGQyDPIJNIiAnifmskdrWdROhJeCAjz0DTCAKHRm04XOFdoUjzLYJDP2
 kscQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aperture.us header.i=@aperture.us
 header.a=rsa-sha256 header.s=google header.b=Tl8ApVYV
Subject: [Buildroot] [PATCH v1 1/1] package/go: security bump to go1.21.4
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: Christian Stewart <christian@aperture.us>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Go version 1.21.4 includes the following security fixes:

CVE-2023-45283: path/filepath: recognize \??\ as a Root Local Device path prefix.
CVE-2023-45284: path/filepath: recognize device names with trailing spaces and superscripts

https://go.dev/doc/devel/release#go1.21.4

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index 9499f50964..74b18a9b38 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://go.dev/dl
-sha256  186f2b6f8c8b704e696821b09ab2041a5c1ee13dcbc3156a13adcf75931ee488  go1.21.3.src.tar.gz
+sha256  47b26a83d2b65a3c1c1bcace273b69bee49a7a7b5168a7604ded3d26a37bd787  go1.21.4.src.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index ef27f32835..7bd7866a05 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.21.3
+GO_VERSION = 1.21.4
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
-- 
2.42.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
