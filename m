Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BFA0EB64D9
	for <buildroot@archiver.kernel.org>; Sat, 17 Jun 2023 07:21:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C65DA42130;
	Sat, 17 Jun 2023 07:21:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C65DA42130
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sNFVm4KVYB_o; Sat, 17 Jun 2023 07:21:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA62B41E47;
	Sat, 17 Jun 2023 07:21:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA62B41E47
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 618111BF5B4
 for <buildroot@lists.busybox.net>; Sat, 17 Jun 2023 07:21:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3AE2683EC6
 for <buildroot@lists.busybox.net>; Sat, 17 Jun 2023 07:21:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3AE2683EC6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eCSRR1wiM-SO for <buildroot@lists.busybox.net>;
 Sat, 17 Jun 2023 07:21:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 06D7983EA7
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 06D7983EA7
 for <buildroot@busybox.net>; Sat, 17 Jun 2023 07:21:38 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-3f8d0d68530so14433315e9.0
 for <buildroot@busybox.net>; Sat, 17 Jun 2023 00:21:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686986497; x=1689578497;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hxYDc4fDLGEUy8cJdLsHF+2wpSIP04NX6KSyFvi329I=;
 b=TypkLIaV7hMt6xCjOLxxz2h0dOxHrICdjlVuR21nBxoaVL7v1XwTTlkwN3sacH1W3j
 OP/W4eKjWCTutgA7JiH5tRitqEA/MiyNVOjKK95o3HrpIxAJ5+/qCTKjW1vlUxdZB1Po
 oD2AGz8wa/Td35XDE9atZbRZpKYsArZzk8WyEmg+LemJoYcN1gtn31vgPJpfAwGUcx+v
 dintmMBS3kumtxXu1zly4N8K1ITO/vRtRC4TJyxCZdT92sNyojJOytzCNIJhMMX291sg
 4iGiHhsNcGI3sys1sKUD0AF3amHKJ1qbqXksHpMqP+476JlO6zUsSgPYt1Zt1ghpHTMN
 Trbw==
X-Gm-Message-State: AC+VfDxzoMIGgC9hhq+fyzLEkxGirSUaSrLOqiY1JSrCkdSyWu34K4YS
 95Zu7K0NgjsFQY4myRRAVJVQjIdtcbI=
X-Google-Smtp-Source: ACHHUZ4jFEDGAlEPXQlb5j12lP0eXWEG5lcZ1fbsEm/8dgw0pFKtKo44DvWiRXX+w3BYqbw3csXu4A==
X-Received: by 2002:a05:600c:2211:b0:3f7:e655:a498 with SMTP id
 z17-20020a05600c221100b003f7e655a498mr3707785wml.14.1686986496799; 
 Sat, 17 Jun 2023 00:21:36 -0700 (PDT)
Received: from vm.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 v5-20020a05600c214500b003f7f87ba116sm1363282wml.19.2023.06.17.00.21.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Jun 2023 00:21:36 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sat, 17 Jun 2023 09:21:30 +0200
Message-Id: <20230617072130.1823415-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686986497; x=1689578497;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hxYDc4fDLGEUy8cJdLsHF+2wpSIP04NX6KSyFvi329I=;
 b=kHob117btCFzN/3miyGoUbQqIwHBT/2jw0BMLXq65rkMS4hMpEp2578brr1BLvc+Vw
 MokTiBtDncCRsLufp4mkTWEkbCP2pgSKIQ2Yk8t5wEaIwxX4ihjddlIUhFk4zZ9GdOKw
 NhgmJRVjZYLfti0Qrdt8BshtyWaibXvH8TBgiOYIPNau7+mMjnTmD9MZSXrIYyS1cBWQ
 Yec1yJa+JerV0jeJswyBev4V8nGh4F5p8K71jjla+4ozsOO7R/gK/JDVSl+56eozhEu8
 QvinqtV1gip1e6uU0mPZ34IU/h6AKDUxv4AldkjmhWwTishs2rpQh7XQVvEpjf1HvZV6
 QFIw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=kHob117b
Subject: [Buildroot] [PATCH] package/luaposix: bump to version 36.2.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/luaposix/luaposix.hash | 2 +-
 package/luaposix/luaposix.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/luaposix/luaposix.hash b/package/luaposix/luaposix.hash
index 2d54a6901..d54395c29 100644
--- a/package/luaposix/luaposix.hash
+++ b/package/luaposix/luaposix.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  7944c2b4fbcef0667d407302740d87645325e751fd8d819f2b253c5d9ad0d497  luaposix-36.1.tar.gz
+sha256  44e5087cd3c47058f9934b90c0017e4cf870b71619f99707dd433074622debb1  luaposix-36.2.1.tar.gz
 sha256  ea0fdaae50b0d31a81c2c99f4354264783c71043fd40522feaa40eecc069599b  LICENSE
diff --git a/package/luaposix/luaposix.mk b/package/luaposix/luaposix.mk
index d17c8188b..d09a1bcd1 100644
--- a/package/luaposix/luaposix.mk
+++ b/package/luaposix/luaposix.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUAPOSIX_VERSION = 36.1
+LUAPOSIX_VERSION = 36.2.1
 LUAPOSIX_SITE = $(call github,luaposix,luaposix,v$(LUAPOSIX_VERSION))
 LUAPOSIX_LICENSE = MIT
 LUAPOSIX_LICENSE_FILES = LICENSE
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
