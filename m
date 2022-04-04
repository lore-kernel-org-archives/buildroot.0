Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89C34C433EF
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 21:47:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1CB5840232;
	Mon,  4 Apr 2022 21:47:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C8FWMjW240E2; Mon,  4 Apr 2022 21:47:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 28B824017C;
	Mon,  4 Apr 2022 21:47:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D85AF1BF23C
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 21:47:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BD016827CE
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 21:47:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6VTM9kASl7Ga for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 21:47:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 18314827A8
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 21:47:22 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id
 a16-20020a17090a6d9000b001c7d6c1bb13so624559pjk.4
 for <buildroot@buildroot.org>; Mon, 04 Apr 2022 14:47:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8kgj/4OHuKC/6gFS8u5lEBq8Oye2IZnCicWpYdClUJM=;
 b=Z64UPxFQWwHArdE6CJtzf5eR8IHqtPuxc20I/5LSARisOMsSn/B/sx5RmhHI/iDRTI
 afpQBQEgUNP1R4sHT7KjptCsTw9TSjlOLxE8TLW4L6hIeF7Q97pBlWwqS1jtNRX3Y8Ne
 TtdBomNKi3srpmXZ/DPRvTU12CwKlz4WUMkk6EgEF5uLD0/EmK9hMmdv4TvhMTqqy0/i
 DOaRhdAdLWFruzNhC2bSfzZf0jcJ5p8N8O0sFIbVe944Oe4DUBPzV3yjHkdU8WErXpPS
 6jU0UtpzHCrsjgSS0woBQvjRztEJJUREpO3xsusIi/SxdAR4kNoqtW5kmVJchLQwZos/
 LYIw==
X-Gm-Message-State: AOAM531qTebA8LhA95HBAMqV92BHGYraA8SgUyHu0ACjYAPkUDNaaxCY
 IH+tLvuTv/9TZDCBYQV4y2BR8CEjZzXsTQ==
X-Google-Smtp-Source: ABdhPJwiAgDZ2hbzizNwS8dEkAc6h/NSqZxIQDBW4uG8k5AtfHccmWnMM55Gq1T5daY/gzQ4+c3zqg==
X-Received: by 2002:a17:903:1108:b0:156:73a7:7c1 with SMTP id
 n8-20020a170903110800b0015673a707c1mr69684plh.101.1649108842247; 
 Mon, 04 Apr 2022 14:47:22 -0700 (PDT)
Received: from localhost.localdomain (ip68-6-95-5.sb.sd.cox.net. [68.6.95.5])
 by smtp.gmail.com with ESMTPSA id
 om16-20020a17090b3a9000b001c7bc91a89bsm93270pjb.52.2022.04.04.14.47.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Apr 2022 14:47:21 -0700 (PDT)
To: buildroot@buildroot.org
Date: Mon,  4 Apr 2022 14:47:16 -0700
Message-Id: <20220404214717.587193-1-christian@paral.in>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/docker-cli: bump to version
 v20.10.14
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
Reply-To: Christian Stewart <christian@paral.in>
Cc: Christian Stewart <christian@paral.in>, Anisse Astier <anisse@astier.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/moby/moby/releases/tag/v20.10.14

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/docker-cli/docker-cli.hash | 2 +-
 package/docker-cli/docker-cli.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-cli/docker-cli.hash b/package/docker-cli/docker-cli.hash
index f2fe316540..9a07acf89f 100644
--- a/package/docker-cli/docker-cli.hash
+++ b/package/docker-cli/docker-cli.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  d86e3e6e10669634ee02b5e071e5ee504457a9d03941bbc5b7f2bd3683ebdb19  docker-cli-20.10.12.tar.gz
+sha256  bda289b27b18675d6a6ff07568453768fe68c16c27b5e52724e46896d5464a55  docker-cli-20.10.14.tar.gz
 sha256  2d81ea060825006fc8f3fe28aa5dc0ffeb80faf325b612c955229157b8c10dc0  LICENSE
diff --git a/package/docker-cli/docker-cli.mk b/package/docker-cli/docker-cli.mk
index d5cca34efc..c7458f85dd 100644
--- a/package/docker-cli/docker-cli.mk
+++ b/package/docker-cli/docker-cli.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_CLI_VERSION = 20.10.12
+DOCKER_CLI_VERSION = 20.10.14
 DOCKER_CLI_SITE = $(call github,docker,cli,v$(DOCKER_CLI_VERSION))
 
 DOCKER_CLI_LICENSE = Apache-2.0
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
