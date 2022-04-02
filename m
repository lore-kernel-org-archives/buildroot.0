Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42D41C433F5
	for <buildroot@archiver.kernel.org>; Sat,  2 Apr 2022 03:29:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D82B860F84;
	Sat,  2 Apr 2022 03:29:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ej8VwU1Pgki9; Sat,  2 Apr 2022 03:29:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 08AF760F7B;
	Sat,  2 Apr 2022 03:29:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 926FA1C1135
 for <buildroot@lists.busybox.net>; Sat,  2 Apr 2022 03:29:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8A11A8409C
 for <buildroot@lists.busybox.net>; Sat,  2 Apr 2022 03:29:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Cw1gAQsaAnhr for <buildroot@lists.busybox.net>;
 Sat,  2 Apr 2022 03:29:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C789284076
 for <buildroot@buildroot.org>; Sat,  2 Apr 2022 03:29:18 +0000 (UTC)
Received: by mail-il1-x133.google.com with SMTP id x9so3265874ilc.3
 for <buildroot@buildroot.org>; Fri, 01 Apr 2022 20:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=f+M/5w6daUfE7G9v3gMlZOoN6HP4GYri81YeYMmxA1Q=;
 b=qE/Y6D/AfjavjUaC6I5NF0zWpZFcWyVzyPQ1PxOFnA6jHGGtqxRlDWdX0/Aqn9Ck87
 gxBLf4Zww1IJPM0au9VNrWmTUiZ8cWNdm0sPAyZo5WyEyQ3BDu2wZdkwdQpHLCwKSedj
 6gj1RNlx/Xw8eWnVlpk+Q8+PbxzUkZQFZpUoJFBt/kfSNGg7+PiCq5Lxo5EYpOcHMf+M
 JyvtesyTgoZh4OOKff2Iwx7tGm+UKlW9e4ExJjWjwOumkpKCNTL4TL7nbwYpdtBWd7MF
 DYJgqfUMVTZYadpoCeb4jg07Ju+FC0vs8hwB/o9S4lZNzDLSjz70Ev7rU9TPARcJgga1
 pz7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=f+M/5w6daUfE7G9v3gMlZOoN6HP4GYri81YeYMmxA1Q=;
 b=XyHZapY4hRS5bPPRIsOvWD95b/cT4iQmFJqbKJjo8k7/n1OwT7bAbiaa8uSwrDdTO+
 MwizipcC3pk5UeouNwbvjcBxZAiKlXlbmt1VVWL3E07/nSERG2zzt6Nd7+eBBvYk7Mys
 I9LpDSsA+KgbEZ7TR5u/QS+HmFe/H6SbDHix7LeBHx2CiqVtbkNq8iV4WkjQqVWVQCTv
 Y9D/AHMlrYo6BKM4CJQE5/zCXmBCKorqQ2RXnczNbuts0/e6Bgdiq/3zLiXZa8nxOMts
 r5q68uGZWt7e5w6ByH4TYhGI5hwWNHx2Y1BWBR/h31c9ezSp0/loesWiHmE9Adacx4++
 n2/w==
X-Gm-Message-State: AOAM532mr/fb2kHK7/CwdDJDs6ZQCg5XxlRaaYkenar5gh9GyeBXT79Y
 sLoIF93A6qIuE6D7/Npr9P4oi4+LIk5Y/w==
X-Google-Smtp-Source: ABdhPJxYqhL93RNijjPuEdd7dw9dHBC83v9VDqITSwZLXL6iNrNCqfnQhxMSqWAdrVaWh65OxcO7Kw==
X-Received: by 2002:a05:6e02:b2a:b0:2ca:703:59d2 with SMTP id
 e10-20020a056e020b2a00b002ca070359d2mr1266024ilu.218.1648870157677; 
 Fri, 01 Apr 2022 20:29:17 -0700 (PDT)
Received: from james-x399.localdomain (71-218-122-133.hlrn.qwest.net.
 [71.218.122.133]) by smtp.gmail.com with ESMTPSA id
 c22-20020a5ea816000000b00649d360663asm2416385ioa.40.2022.04.01.20.29.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Apr 2022 20:29:17 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  1 Apr 2022 21:29:12 -0600
Message-Id: <20220402032912.504809-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/linux-headers: ensure tarball
 location is set
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Validate that BR2_KERNEL_HEADERS_CUSTOM_TARBALL_LOCATION is set when
required.

Fixes:
http://autobuild.buildroot.net/results/f5e/f5e25cbb571c42f8a1728afa856a4fd54f4ad105

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/linux-headers/linux-headers.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/linux-headers/linux-headers.mk b/package/linux-headers/linux-headers.mk
index a8d1c2ccaf..2a62dc2026 100644
--- a/package/linux-headers/linux-headers.mk
+++ b/package/linux-headers/linux-headers.mk
@@ -35,6 +35,9 @@ endif # BR2_KERNEL_HEADERS_AS_KERNEL
 
 # Compute LINUX_HEADERS_SOURCE and LINUX_HEADERS_SITE from the configuration
 ifeq ($(LINUX_HEADERS_CUSTOM_TARBALL),y)
+ifeq ($(LINUX_HEADERS_CUSTOM_TARBALL_LOCATION),)
+$(error No kernel headers tarball location set, check your BR2_KERNEL_HEADERS_CUSTOM_TARBALL_LOCATION setting)
+endif
 LINUX_HEADERS_SOURCE = $(notdir $(LINUX_HEADERS_CUSTOM_TARBALL_LOCATION))
 LINUX_HEADERS_SITE = $(patsubst %/,%,$(dir $(LINUX_HEADERS_CUSTOM_TARBALL_LOCATION)))
 else ifeq ($(LINUX_HEADERS_CUSTOM_GIT),y)
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
