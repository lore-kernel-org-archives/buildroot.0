Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 738B9EB64D9
	for <buildroot@archiver.kernel.org>; Mon, 19 Jun 2023 19:56:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 292AB4156D;
	Mon, 19 Jun 2023 19:56:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 292AB4156D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Bodh4_HKMgNy; Mon, 19 Jun 2023 19:56:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 586C641558;
	Mon, 19 Jun 2023 19:56:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 586C641558
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E82FA1BF2E4
 for <buildroot@lists.busybox.net>; Mon, 19 Jun 2023 19:56:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C1C5F81E99
 for <buildroot@lists.busybox.net>; Mon, 19 Jun 2023 19:56:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C1C5F81E99
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZiiUAtcYTMyP for <buildroot@lists.busybox.net>;
 Mon, 19 Jun 2023 19:56:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 21D5B81E38
Received: from mail-oo1-xc36.google.com (mail-oo1-xc36.google.com
 [IPv6:2607:f8b0:4864:20::c36])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 21D5B81E38
 for <buildroot@buildroot.org>; Mon, 19 Jun 2023 19:56:48 +0000 (UTC)
Received: by mail-oo1-xc36.google.com with SMTP id
 006d021491bc7-557c27145d4so254054eaf.1
 for <buildroot@buildroot.org>; Mon, 19 Jun 2023 12:56:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687204607; x=1689796607;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1SQ7fVQ5uLVJlBuqCFK1Bc+NsoolJCY3QiQMidwiWAk=;
 b=EZZu+FyZ5PyP/9UdQiKJdVAsTTos/WrjKkN/cdZBR2R1qYPR9oN2ol7Z/O4MQ4dbZJ
 V5+CEn0LOT8YOyFHDQNwscx0MoliKJdeD2TdGyVl7T3rfZlT2dK1Aybc39hR1u9nK/y9
 +S8Gh1Z31Oz6SgjTcf9S8dNSDjtyMXLRo/Tgt7UFLs1+jluYHSH9ggfJtzdQFmGAsgyD
 kflhamgSHpdwzab49x9cG5BwxprknQs9eoYdqeUhKs3tgXrzIYm4OM3tv9I1NIK2kV3U
 l4mUFlT7NqhQ2dMq1XnupdkRrWFalA/C/nPsMiq1S9XHxfdNXhbkubqhV1NbqVmDUpFj
 kWBA==
X-Gm-Message-State: AC+VfDwr9AxS8RrJhnQUI8/0LftrhUciKakYQ1/sP3KRYL6Z6N9PJDUO
 NkTPJSriPrh1a2MLDnVAZaaL/+opYvU=
X-Google-Smtp-Source: ACHHUZ7WKq7tbO7zRLMcOi0P4o7t049cjA9hh3BtU3wnVv7rcfCcv0H6TzbJ8yvuWprjBawOdSVEGw==
X-Received: by 2002:a4a:e40c:0:b0:54f:e817:6827 with SMTP id
 t12-20020a4ae40c000000b0054fe8176827mr6206782oov.1.1687204606769; 
 Mon, 19 Jun 2023 12:56:46 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:242a:9de7:857c:2e7d])
 by smtp.gmail.com with ESMTPSA id
 x12-20020a4ae78c000000b0056084a91c74sm296687oov.24.2023.06.19.12.56.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jun 2023 12:56:46 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 19 Jun 2023 16:56:37 -0300
Message-Id: <20230619195637.595586-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687204607; x=1689796607;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1SQ7fVQ5uLVJlBuqCFK1Bc+NsoolJCY3QiQMidwiWAk=;
 b=Ph7DUmuRmrI7XIsVKmzU2EyYA/QSD+dwDZHfEztxQAQVY7rMoZfs1DEdgAyC/pI/bC
 3cNUP6SJnvjEYrsdFtC1WGapuztMLZUU7NkybxnQyaKjNPcJs4sas9K9Z/ir/C7fdGKx
 lE3xbMh9f9Xzh31XRCAX8dlBMlEhwY7S7sg2rDwJusT4zh8cmDIUf93pPiCmH1Fx/xPK
 55O33fcFzEKVDS29r2qTxhWPUS8LeTwpIHKqXVG48NIU4A5rQzVx0GSCV00wEApVN8JV
 VXazlTPSi0ybm5rJENu1E7o0UnzwgKfLlFVXASZaAttKmKUPc8gzQlGa/MuVoBooq9i/
 5HoQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=Ph7DUmuR
Subject: [Buildroot] [PATCH] package/crucible: bump to version 2023.04.12
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
Cc: Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bump to version 2023.04.12.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 package/crucible/crucible.hash | 2 +-
 package/crucible/crucible.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/crucible/crucible.hash b/package/crucible/crucible.hash
index d0a2a63fab..256513da6b 100644
--- a/package/crucible/crucible.hash
+++ b/package/crucible/crucible.hash
@@ -1,2 +1,2 @@
-sha256  1229c7d1587a97e9f3d456392e06c7be288bacf6ffb68c940d497bf55edab20b  crucible-2022.05.25.tar.gz
+sha256  bfeaa9b1c8bb95f02d33bd915892e748eb8939fd8b901e1d31d2efa7f7aefcb3  crucible-2023.04.12.tar.gz
 sha256  d88514630470aec9fa7abdc990a1e0a8751a752321bffa868188c49009d64d59  LICENSE
diff --git a/package/crucible/crucible.mk b/package/crucible/crucible.mk
index fdad709dde..dad89b2149 100644
--- a/package/crucible/crucible.mk
+++ b/package/crucible/crucible.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CRUCIBLE_VERSION = 2022.05.25
+CRUCIBLE_VERSION = 2023.04.12
 CRUCIBLE_SITE = $(call github,usbarmory,crucible,v$(CRUCIBLE_VERSION))
 CRUCIBLE_LICENSE = GPL-3.0
 CRUCIBLE_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
