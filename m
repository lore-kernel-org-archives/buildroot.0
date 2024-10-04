Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84A90CF885B
	for <buildroot@archiver.kernel.org>; Fri,  4 Oct 2024 21:55:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E2B514187E;
	Fri,  4 Oct 2024 21:55:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GVWjIUbNu24f; Fri,  4 Oct 2024 21:55:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 309B441868
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 309B441868;
	Fri,  4 Oct 2024 21:55:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 025C71BF5F5
 for <buildroot@lists.busybox.net>; Fri,  4 Oct 2024 21:55:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DA29440E52
 for <buildroot@lists.busybox.net>; Fri,  4 Oct 2024 21:55:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZG1BWAa1h5uG for <buildroot@lists.busybox.net>;
 Fri,  4 Oct 2024 21:55:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7EC3D40D27
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7EC3D40D27
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7EC3D40D27
 for <buildroot@buildroot.org>; Fri,  4 Oct 2024 21:55:01 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-42e5e758093so22561185e9.1
 for <buildroot@buildroot.org>; Fri, 04 Oct 2024 14:55:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728078899; x=1728683699;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/L4c7/Dqis5xfMTWF1O1Uf0enRGILuMN9c2h20w00V4=;
 b=Xl27+GoVXxKEAiOBBFJqQl7nDYPUzzxDmCn6OrAfW04UyvOQq9ZqB3EYhj0Aa6hi23
 dXhE7M4i4vNv9nH30Xlg4rN8GnfE7lsyNpxQKkwA112EZNbQo+NTFqZrD8C6QQY2RQ+A
 2sI3hLrIyUTqv8NpWKQ7ZDSdM0hfIzX3Wcsw0C57nXH0frbCM0o0pG8aFrKGDLRL5d6E
 SI+ZD7pTymadOjjoxbSpEZrGVO34dASOSH8URFNAWkR4phCtIVBXTZf461XseY6c4MGg
 1b+Fxrn764JGMO8J6imellaKy/XbZObRSN+3gLU17m/g8C5/2Ale9hp2YM1OFkr7gLxS
 YshQ==
X-Gm-Message-State: AOJu0YwROrRutSg3bvK+BwB1eggm2RvKDzHUv01niVBFnMjFDAUrmuqq
 cMvVdTBv+YIaltIH5IF5t96sML+akhPoCf1Sv6R2pR3TC6unNkkor8iEmZi/GYJBYwIu8bJV7dB
 jetI=
X-Google-Smtp-Source: AGHT+IHKpz+QGOjkPzb5G3+jYvK26JZ+0t9bZudUz2duHEXQhjcYZnzgZrT+lBddhzPaRL8eWYWFgA==
X-Received: by 2002:adf:edc9:0:b0:371:8c9c:d97f with SMTP id
 ffacd0b85a97d-37d0e6f2461mr2376292f8f.10.1728078899062; 
 Fri, 04 Oct 2024 14:54:59 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.43.206])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42f89e39aebsm6972005e9.0.2024.10.04.14.54.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Oct 2024 14:54:58 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Fri,  4 Oct 2024 23:54:46 +0200
Message-ID: <20241004215451.1198861-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241004215451.1198861-1-dario.binacchi@amarulasolutions.com>
References: <20241004215451.1198861-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1728078899; x=1728683699;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/L4c7/Dqis5xfMTWF1O1Uf0enRGILuMN9c2h20w00V4=;
 b=FqcDFpGGTC1ZB3w9rmZb0A8JTaj5yu6X2M49DWL0Dhb/GNU4eAHqbmQD+W2qs7KfEe
 6CUEE7hjri/uqybNltYdZdWvJukjaMkWewV0RBrvnug9aI1sFpn9i4RiwA6gyXAeAgTN
 pTuOFNg7OV8qwyrnXWHSFuuor9ngIByfqoMmY=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=FqcDFpGG
Subject: [Buildroot] [PATCH 3/3] DEVELOPERS: add Dario Binacchi for bsdiff
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
 linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 458da4e4e051..fea34b53d696 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -797,6 +797,7 @@ F:	configs/stm32f746_disco_sd_defconfig
 F:	configs/stm32f769_disco_sd_defconfig
 F:	package/armadillo/
 F:	package/babeld/
+F:	package/bsdiff/
 F:	package/iana-assignments/
 F:	package/libdivsufsort/
 F:	package/sscep/
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
