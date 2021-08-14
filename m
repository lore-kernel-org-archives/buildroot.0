Return-Path: <SRS0=c1N3=NF=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D29F5C4338F
	for <buildroot@archiver.kernel.org>; Sat, 14 Aug 2021 23:05:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6CAAB60F48
	for <buildroot@archiver.kernel.org>; Sat, 14 Aug 2021 23:05:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6CAAB60F48
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 36EE880E8E;
	Sat, 14 Aug 2021 23:05:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MVVPW8XYQ60o; Sat, 14 Aug 2021 23:05:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B86EC80E92;
	Sat, 14 Aug 2021 23:05:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B1CDD1BF314
 for <buildroot@lists.busybox.net>; Sat, 14 Aug 2021 23:05:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AEE72402FB
 for <buildroot@lists.busybox.net>; Sat, 14 Aug 2021 23:05:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MCXqW01I0NN6 for <buildroot@lists.busybox.net>;
 Sat, 14 Aug 2021 23:05:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd12141.aruba.it (smtpcmd12141.aruba.it [62.149.156.141])
 by smtp4.osuosl.org (Postfix) with ESMTP id D4101402ED
 for <buildroot@buildroot.org>; Sat, 14 Aug 2021 23:05:11 +0000 (UTC)
Received: from ubuntu.localdomain ([141.136.135.234])
 by Aruba Outgoing Smtp  with ESMTPSA
 id F2bMmrQy6nxSqF2bPmsL4t; Sun, 15 Aug 2021 00:58:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1628981889; bh=imImx/jo25u5KLyVyoK+bjxbceBYkCLPQUvaZDQUB5U=;
 h=From:To:Subject:Date:MIME-Version;
 b=NrfPYgS84ej/g/wJij4eqKwNFEWEshp7pT7lcJuQzqxMHT3vJ9yt60YwYUUQYlyyO
 W4xy2QthpKWmVEsreLssDB4t2wiJDkpI0MrLRro9yEq+4WUqGrucLc0P0c9I2lBrQQ
 8jPh8cZZJ51InI3IUu6fORSaJsave66Ai+DKJTUC8pj3mjHtBXysCzUKLOiKAEW0UR
 rsmmHM1VP7QvWwocJC4LZ+AI1yDqgTF1W6w4hJj74h+SePqYDuVs3im0eomXrfSZuP
 GbGouzwOCVV0C/QI+1Nvt5wD3tw3Pr7mUmdrjKOBQSDY7RUEa55+M8JzYPXL0ROTty
 AXoWIZZEsBGKg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun, 15 Aug 2021 00:58:03 +0200
Message-Id: <20210814225803.812478-3-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210814225803.812478-1-giulio.benetti@benettiengineering.com>
References: <20210814225803.812478-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfEUIAhnfLkzCf7okfYdOADzwPhlCgxthD3HHGK++leDNszeZ8WxOUivqj0e66esK7oEg3ke+QoUPnmmz+o0I/K/WaVJUftOph49nsthUedfhQuDYcxvs
 0+Ef3JO/cGjHX0wv86n5bVwoRsigl8qtQQ9UOh2KSi6qkAc6TnDWfupl6X7ygLB0tiZfRd7iFPsCWTZ7nyAn9TXC0kFaAAUHhthu5wYxYJTbFO0X6GI4qTk9
 2M0nGkSWQrx3vcc7+eAkJCNNd9goH2iU3Xw0FZmLOwiLNTREfOWmJxqK+FDgpdwgBudT9ElyHiEohDFTIAehkgudZHkCB3XuBQq5RddMRbEOFv9c4S13067D
 pSGuOyGu5KJxvomqAdvz2xeupsm6f/SAbh+WNll68e/dV+bXDgc=
Subject: [Buildroot] [PATCH 2/2] package/heirloom-mailx: fix build failure
 due to gcc bug 101916
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

The heirloom-mailx package exhibits gcc bug 101916 when built for the
SH4 architecture with optimization enabled, which causes a build failure.

As done for other packages in Buildroot work around this gcc bug by
setting optimization to -O0 if BR2_TOOLCHAIN_HAS_GCC_BUG_101916=y.
Also introduce HEIRLOOM_MAILX_CFLAGS as done for other packages and move
the already present -fPIC CFLAG to it.

Fixes:
http://autobuild.buildroot.net/results/911/911f5c024834741754102ff1bbb05c4a64c54a0b/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/heirloom-mailx/heirloom-mailx.mk | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/package/heirloom-mailx/heirloom-mailx.mk b/package/heirloom-mailx/heirloom-mailx.mk
index b3cece0cfc..e851e1dfcc 100644
--- a/package/heirloom-mailx/heirloom-mailx.mk
+++ b/package/heirloom-mailx/heirloom-mailx.mk
@@ -20,10 +20,18 @@ define HEIRLOOM_MAILX_CONFIGURE_CMDS
 	(cd $(@D); $(TARGET_CONFIGURE_OPTS) $(SHELL) ./makeconfig)
 endef
 
+HEIRLOOM_MAILX_CFLAGS = $(TARGET_CFLAGS)
+
 # -fPIC is needed to build with NIOS2 toolchains.
+HEIRLOOM_MAILX_CFLAGS += -fPIC
+
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_101916),y)
+HEIRLOOM_MAILX_CFLAGS += -O0
+endif
+
 define HEIRLOOM_MAILX_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(MAKE) \
-		CFLAGS="$(TARGET_CFLAGS) -fPIC" \
+		CFLAGS="$(HEIRLOOM_MAILX_CFLAGS)" \
 		-C $(@D)
 endef
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
