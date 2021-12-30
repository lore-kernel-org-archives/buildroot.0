Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BA47C433EF
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 09:38:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 92A4340542;
	Thu, 30 Dec 2021 09:38:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7CJT7gbj2QsC; Thu, 30 Dec 2021 09:38:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9C6DC404F2;
	Thu, 30 Dec 2021 09:38:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C48981BF346
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 09:38:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B337A410BB
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 09:38:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YiWcGqzdATS7 for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 09:38:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BB3F840243
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 09:38:43 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id t26so49329012wrb.4
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 01:38:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HVidq2SUF2EaBhrSM/eIPwPJjwIKxgQppUJdCwY4WBI=;
 b=C4bepnR+Y2MFP8K0J8gqW8rFpYghkjgHbPMxUSgeHmcAyHa159b3Qmnqx85NDgi4Fy
 OmKvxtLBZGl7MCqAOQfRHOXj0lV9I8GUsGOtJAiiCgjwwYno2tTlNVr/Ss3XY8nUQDE0
 uaOAgsL8r8WShbYO7JzOOpaCGa5a8HxoUeIWwx1qFnxMEgpV0lppZOAxMfo0wyARQhr+
 DENZEHkMMCOk9qH8WJ8EXPKjIm5Q6U+SzsdDBj4gDLsnOGS45aNOE8Noz7rU1VpG4BIx
 nilnoIc+MtrRK8YNoR3MZwPAJxdSpszLPx5ywMXygPTIS+izLWGJcPOWK7FHhZEEPa+C
 aQKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HVidq2SUF2EaBhrSM/eIPwPJjwIKxgQppUJdCwY4WBI=;
 b=dyjD9qIMKDmyXt+2qRt6Y+jMzhHf7RBW6lAN9JlYNJr6b/2z+btN2vfWFnU9vqcZ0n
 uhxuf8lp2v/i0kuMhgzrrjlPsMbvtdod7QQI/EGRgeweQ0T3BR6TUqZznZ9XJBX6s61I
 xgddeLqJ17go1Cg3jMBQTmRLZlpCM9m9v53+46QnQIVaidcXbOtUZfvlOFTBowx8uuMH
 BzbABbhhqnDGVchvvQyOtUZtCppN0EcENIk0dp1LJKBBckwymN4VfilKahiPg5e0ybo7
 /AnBh7RiYgbZKD41509FMIub5g/kK14ehG8S6mQcJKK7YmN0PtibTUMpPPOJnyZPKwrX
 zVjQ==
X-Gm-Message-State: AOAM531J3CabGGse/OoiIVBfofueWSg6hadDBVecBW/pGVytVKLP65gB
 WyEtl6Pv7ZAQo6MmtLdDYup7rD83Ue8=
X-Google-Smtp-Source: ABdhPJyZ1SdYhv2+puP1vdFPgAgTIgJ58sJxLMaNf6ZzveIlOiccVzeU5+K/vdOEUPhPG49SDRjaiA==
X-Received: by 2002:a5d:5744:: with SMTP id q4mr23928464wrw.698.1640857121255; 
 Thu, 30 Dec 2021 01:38:41 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id l12sm28774835wmq.2.2021.12.30.01.38.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Dec 2021 01:38:40 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 30 Dec 2021 10:37:50 +0100
Message-Id: <20211230093750.1719744-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libcli: bump to version 1.10.7
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Steve James <ste@junkomatic.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/dparrish/libcli/releases/tag/V1.10.5
https://github.com/dparrish/libcli/releases/tag/V1.10.6
https://github.com/dparrish/libcli/releases/tag/V1.10.7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libcli/libcli.hash | 2 +-
 package/libcli/libcli.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libcli/libcli.hash b/package/libcli/libcli.hash
index a17a176fe5..deecb77be9 100644
--- a/package/libcli/libcli.hash
+++ b/package/libcli/libcli.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  43efade6f3deb621e1e226b7854274a869fca57e12e74e61c5496d5dea7c445d  libcli-1.10.4.tar.gz
+sha256  43efade6f3deb621e1e226b7854274a869fca57e12e74e61c5496d5dea7c445d  libcli-1.10.7.tar.gz
 sha256  376b54d4c5f4aa99421823fa4da93e3ab73096fce2400e89858632aa7da24a14  COPYING
diff --git a/package/libcli/libcli.mk b/package/libcli/libcli.mk
index 2dedc9d5df..a18daa911c 100644
--- a/package/libcli/libcli.mk
+++ b/package/libcli/libcli.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCLI_VERSION = 1.10.4
+LIBCLI_VERSION = 1.10.7
 LIBCLI_SITE = $(call github,dparrish,libcli,V$(LIBCLI_VERSION))
 LIBCLI_LICENSE = LGPL-2.1
 LIBCLI_LICENSE_FILES = COPYING
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
