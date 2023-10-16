Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94EA5CDB465
	for <buildroot@archiver.kernel.org>; Mon, 16 Oct 2023 17:05:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F02FE40474;
	Mon, 16 Oct 2023 17:05:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F02FE40474
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 18fz8FTT7woZ; Mon, 16 Oct 2023 17:05:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E8462404D5;
	Mon, 16 Oct 2023 17:05:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E8462404D5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DF9541BF575
 for <buildroot@lists.busybox.net>; Mon, 16 Oct 2023 17:05:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B7A41611CB
 for <buildroot@lists.busybox.net>; Mon, 16 Oct 2023 17:05:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B7A41611CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B2j2nd9WKWPn for <buildroot@lists.busybox.net>;
 Mon, 16 Oct 2023 17:05:16 +0000 (UTC)
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6C45260C20
 for <buildroot@buildroot.org>; Mon, 16 Oct 2023 17:05:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6C45260C20
Received: by mail-wm1-x344.google.com with SMTP id
 5b1f17b1804b1-40675f06f1fso36050025e9.1
 for <buildroot@buildroot.org>; Mon, 16 Oct 2023 10:05:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697475914; x=1698080714;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Gf1TAE3NpLmX0eQkoGp9XljX2Y/YQzR6ZPSFbhi/uSs=;
 b=oL49UiTnb9XWRHWx5Ade/ldBz7SA7MHbe8BZziv+rf2pLhdhwl7uXVTHkaVvQVb4yo
 pjZIiiuxQHyA0/ssbHJISVnVBBFaGccJFGBjn7WE2hALhLlM3SPBEIesE2PPNilBLb6t
 Mmz2tWYjDAj+Ho4uY9jeK0xRbb+QYLD8Xo70GXeOLPlTnof2gRG0f5kP7jG8C1jV3dF2
 1LunQ/Jij47gnfAX+/omcUg4tN2bcz4r1zgqbE2Ue4XRDq+pwFQb7f6z19sitqaWC+d1
 w1cbApWZUfaLQQjEGa/IvGokgEw/FtYEuL/EFWxNYuGYKb8dbdDdMN7FYQ3wuc5qJz7E
 EAAA==
X-Gm-Message-State: AOJu0Yx5kP2j2l5UEu24kliK0CV22d/J8KfF86nPkPUM1WUl/DqVUU9/
 8+f0C98r4jNmwaTPMSeLM7gogMmNYuNEii9qy5uHZ/8X3pY=
X-Google-Smtp-Source: AGHT+IEyUJYSugN85FQD6UZlB8sEe3o7/jtudCkC6t5DwppQpAszKXkL/1WL0F2CvuOBFYhjljHJ1g==
X-Received: by 2002:a05:600c:314d:b0:405:3ab3:e640 with SMTP id
 h13-20020a05600c314d00b004053ab3e640mr5593872wmo.20.1697475914135; 
 Mon, 16 Oct 2023 10:05:14 -0700 (PDT)
Received: from localhost.localdomain (net-91-81-8-146.cust.vodafonedsl.it.
 [91.81.8.146]) by smtp.gmail.com with ESMTPSA id
 e10-20020a5d65ca000000b0032da6f17ffdsm5700905wrw.38.2023.10.16.10.05.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Oct 2023 10:05:13 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 16 Oct 2023 19:05:06 +0200
Message-ID: <20231016170506.1868429-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1697475914; x=1698080714;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Gf1TAE3NpLmX0eQkoGp9XljX2Y/YQzR6ZPSFbhi/uSs=;
 b=GUT1zHUMG9dGTrb7XlABm5JpU0Aw/P2Prp/VUXNY4OtGOCVLmjAyrJLXu61DvC5Zi2
 dBwyOtEigC7P8yY2HHpVxp+M8HwQ5Nwifyw3oHLif40nIhpcAO9TcXtCmUx7ePfGZJQ/
 UH8mRfOjOzxKg2LQ0mpt43COgNEMP2QNUKfMo=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=GUT1zHUM
Subject: [Buildroot] [PATCH 1/1] docs/website/support.html: Add Amarula
 Solutions to the commercial support list
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

After talking with Thomas Petazzoni, it is agreed that Amarulasolutions should
be added to the list of companies that can provide commercial support for
Buildroot.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 docs/website/support.html | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/docs/website/support.html b/docs/website/support.html
index 90231f601c..9be816f836 100644
--- a/docs/website/support.html
+++ b/docs/website/support.html
@@ -111,6 +111,9 @@
 	    <a href="https://www.smile.eu/en/offers/embedded-iot">
 	      <img src="images/smile-logo.png" style="max-width:200px; margin-right:40px;"/>
 	    </a>
+	    <a href="https://www.amarulasolutions.com/services/integrated-system/">
+	      <img src="images/amarula-solutions-logo.png" style="max-width:200px; margin-right:40px;"/>
+	    </a>
 	  </center>
 	</div>
       </div>
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
