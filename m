Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F917C35274
	for <buildroot@archiver.kernel.org>; Mon, 18 Dec 2023 07:20:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0D4354010C;
	Mon, 18 Dec 2023 07:20:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0D4354010C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pBErZPCU4kiK; Mon, 18 Dec 2023 07:20:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 06D1640503;
	Mon, 18 Dec 2023 07:20:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 06D1640503
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9AEA11BF3F4
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 07:20:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 72B8C815CF
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 07:20:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 72B8C815CF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PLHk73PHhGvp for <buildroot@lists.busybox.net>;
 Mon, 18 Dec 2023 07:20:33 +0000 (UTC)
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7634F81463
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 07:20:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7634F81463
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2cc6ea4452cso7811471fa.1
 for <buildroot@buildroot.org>; Sun, 17 Dec 2023 23:20:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702884031; x=1703488831;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Xk87PIBcNzItJE9z8qP11eqJXHOnyhbO/XLpx/jxfMI=;
 b=Mawz5AZ501tfMH6v5fB9jYHt7pHeWaQ03qYcCOz7MNSMJSXBgxSCrtM5f6es/SWc1Z
 99Wjd31DQec5LkY1iCC/GtUQJw/P+eKiM1DmHGl9GhANyrvhUmuppiTzoo6K3f+iuq++
 cg25MbB6eRraPD1H6YNUv0pJ2dZ8oKv3cs1qjqrkcFvyPOy6tnkPautS6pN3yOrFg5jv
 4cr3M/SacoFn+E6ApN1LtyZ9BLRxZVRocetS8LPCTFLkh9klsMyuh16kcbpK3BadlSoN
 tKNK5pPC1kkvlA2V9PIX3D8BAGDvk4awKBucGT+iM4xvxHHxFEElCiS2XMBIR7HMt52T
 XsFA==
X-Gm-Message-State: AOJu0YwQdw9xbRCIBt/xyL+nPOm5tf1dlA3gxzjx3wbTKBcRB6Xky+8u
 rJsDUscHrvsOQ19Hq2jr24UBLGEYIME=
X-Google-Smtp-Source: AGHT+IGjwPmtCtMoUkHydYeq2Xgazsr/X2d9MkYqC99k74Z26Z7V901bIlQvSV6flAVEwTQ7D7moQg==
X-Received: by 2002:a05:651c:1a25:b0:2cc:7546:3681 with SMTP id
 by37-20020a05651c1a2500b002cc75463681mr211288ljb.97.1702884030586; 
 Sun, 17 Dec 2023 23:20:30 -0800 (PST)
Received: from localhost.localdomain (83-233-6-197.cust.bredband2.com.
 [83.233.6.197]) by smtp.gmail.com with ESMTPSA id
 t13-20020a2e534d000000b002cc32fbe2e5sm1798195ljd.51.2023.12.17.23.20.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Dec 2023 23:20:30 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 18 Dec 2023 08:25:06 +0100
Message-ID: <20231218072506.162870-1-marcus.folkesson@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702884031; x=1703488831; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Xk87PIBcNzItJE9z8qP11eqJXHOnyhbO/XLpx/jxfMI=;
 b=KGhMMQCAQkDpyI4hGmQcnwHpDbNv45QKzTzoPTx3iYInrGQwaJvv4TuLqiXmxEADbq
 IuYZIzmnuNbqHqoPpu2vaGJn1md8SBdB0xXDduYFJ50JQi0uVq+vURoSu8Anlr/R3JcQ
 fLSuqae2kSkFmxF3SA0wfEcvY9LIq4+EmHZ69u7S2Xw/pwbwXVeIdbgyyj0Zd8oSCN4m
 F0Ws6mS8yXL7kFE29k24fIFo8Qn4Alph2iyTx+XqUUHIDvlW4SD6p8JEYX7ktchCYN0Z
 WyHYvS/VzUJq6Itnyv7UbTk9b1yuriJ1sq49XKZ0IxgIlKZzloPx4Y1OuGJCLg3ZqZgu
 28Sg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=KGhMMQCA
Subject: [Buildroot] [PATCH] package/criu: bump to version 3.19
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 package/criu/criu.hash | 2 +-
 package/criu/criu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/criu/criu.hash b/package/criu/criu.hash
index 2c4a07252b..c3fcdbc03f 100644
--- a/package/criu/criu.hash
+++ b/package/criu/criu.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  6a9997981c9fe4730c848ce59346b3a22fad69b803607cb67a3f6ec0557fa474  criu-3.18.tar.gz
+sha256  990cdd147cb670a5d5d14216c2b5c2fc2b9a53ef19396569a6413807ba2a6aa2  criu-3.19.tar.gz
 sha256  568a1fa9d90e18a1a1a61ea58ec2eece16b56a5042cc72c1b4f8d4455ae6fcb7  COPYING
diff --git a/package/criu/criu.mk b/package/criu/criu.mk
index 7f70c89068..3b72a1131e 100644
--- a/package/criu/criu.mk
+++ b/package/criu/criu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CRIU_VERSION = 3.18
+CRIU_VERSION = 3.19
 CRIU_SITE = $(call github,checkpoint-restore,criu,v$(CRIU_VERSION))
 
 CRIU_LICENSE = GPL-2.0, LGPL-2.1 (for lib/), MIT (for images/)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
