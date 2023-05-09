Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCE7AC7EE22
	for <buildroot@archiver.kernel.org>; Tue,  9 May 2023 20:12:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B9A542778;
	Tue,  9 May 2023 20:12:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B9A542778
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ARNJZtwLs476; Tue,  9 May 2023 20:12:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A50F142773;
	Tue,  9 May 2023 20:12:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A50F142773
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4DF971BF2FF
 for <buildroot@lists.busybox.net>; Tue,  9 May 2023 20:12:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 27361846A6
 for <buildroot@lists.busybox.net>; Tue,  9 May 2023 20:12:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 27361846A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XCRKtu-X1eb5 for <buildroot@lists.busybox.net>;
 Tue,  9 May 2023 20:12:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D271846AA
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2D271846AA
 for <buildroot@buildroot.org>; Tue,  9 May 2023 20:12:35 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-50db91640d3so2006095a12.0
 for <buildroot@buildroot.org>; Tue, 09 May 2023 13:12:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683663153; x=1686255153;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m5/VVCAJgb8gt+nu4nvSKjTht8HvNC/1nWvE0sR18b4=;
 b=I476DzC+3k7eClWmNrPoJIOXaC2a4rP8Hw3OlPTmhZ4239c889egmvkeEZ2Do7pHhi
 idvsjK0rmicoVEV14T0qnB62XUdF5B1dMJ4DdOESKvJ9vJ49vn9k6C/KVa28d2FkqSFI
 ERIpNofVREZ4o7p5BV98RVczR4UfSoi2Elgxv2ubd8Rqty6Fo8dfkMz4g7GZZOGM5Aqm
 dfP0MxxwENUVLsW2Dx77uvMzbeg2Q5msaw/wiMb93l2qKzYO+Tq3uoWRPZnsoRvTlVC7
 z1im81HtiwmoRk+uNHLThwLxea8ibUHahA557r+ZPm0YLgGTaAswTuPhjSWNl1/KKmw5
 TraA==
X-Gm-Message-State: AC+VfDwUDyF0koAjMiBYkGfur7NiSwSv1OmsKf21KqLXCkrBZz624X9I
 huP/0hWOucEa2podSOac446RWvrkrHQl3ftUUsC4cA==
X-Google-Smtp-Source: ACHHUZ6KOZtLoKEQpOGZUEhHMUkMgpqMS/jILNSUQn5IsXbGt3QlVTvERTrQYaRaKhheqjMuf4FIww==
X-Received: by 2002:a05:6402:31f6:b0:50c:358:1eba with SMTP id
 dy22-20020a05640231f600b0050c03581ebamr11119530edb.35.1683663152820; 
 Tue, 09 May 2023 13:12:32 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-40-97-5.business.telecomitalia.it. [79.40.97.5])
 by smtp.gmail.com with ESMTPSA id
 r23-20020aa7da17000000b00506987c5c71sm1157936eds.70.2023.05.09.13.12.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 May 2023 13:12:32 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue,  9 May 2023 22:11:50 +0200
Message-Id: <20230509201153.2413972-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20230509201153.2413972-1-dario.binacchi@amarulasolutions.com>
References: <20230509201153.2413972-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1683663153; x=1686255153;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m5/VVCAJgb8gt+nu4nvSKjTht8HvNC/1nWvE0sR18b4=;
 b=fBZZVsiRsOR3vnTI4VCWVZ3IhtpsKMqUTMrDp3iUPkOkVhjwU2Vvxn5i1OAhaIb3iY
 UxreRV+D7gfn1IGSYEGYMUo+51jOrfSodUVokxfIiyWX0VNSMeEQiwSdnm/3WVay2GIC
 HOGHS8wDdN8QwLMfkW2bFgY1gGDhpAW0zMZaQ=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=fBZZVsiR
Subject: [Buildroot] [PATCH 1/4] package/can-utils: bump to version 2023.03
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Marc Kleine-Budde <mkl@pengutronix.de>, Dario Binacchi <dariobin@libero.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes: https://github.com/linux-can/can-utils/releases/tag/v2023.03

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/can-utils/can-utils.hash | 2 +-
 package/can-utils/can-utils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/can-utils/can-utils.hash b/package/can-utils/can-utils.hash
index 4e47143f313b..e539e05b4569 100644
--- a/package/can-utils/can-utils.hash
+++ b/package/can-utils/can-utils.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  c9b8f29515ad34af7f78450ec55c983abc5393e86b1f128a92ac0dfd141baaf7  can-utils-2021.08.0.tar.gz
+sha256  2790dfb57fe3ec22b6fd512838c6480c39f7c9ae193e59f1ae01221216505a7e  can-utils-2023.03.tar.gz
 sha256  c3dc748f5e725cf5ed89784fe78e4ff1b05d309bf1e7ade4c572e8fde1b8406c  LICENSES/BSD-3-Clause
 sha256  995a31f60a9ddb4c609214cc7d17ca94cc3cbc7f37e1e64dba81e7f8ea9d4f91  LICENSES/GPL-2.0-only.txt
diff --git a/package/can-utils/can-utils.mk b/package/can-utils/can-utils.mk
index 5b8a2aeea3b8..462e123c6d92 100644
--- a/package/can-utils/can-utils.mk
+++ b/package/can-utils/can-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CAN_UTILS_VERSION = 2021.08.0
+CAN_UTILS_VERSION = 2023.03
 CAN_UTILS_SITE = $(call github,linux-can,can-utils,v$(CAN_UTILS_VERSION))
 CAN_UTILS_LICENSE = BSD-3-Clause or GPL-2.0
 CAN_UTILS_LICENSE_FILES = LICENSES/BSD-3-Clause LICENSES/GPL-2.0-only.txt
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
