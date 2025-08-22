Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFC94CA0EED
	for <buildroot@archiver.kernel.org>; Fri, 22 Aug 2025 08:17:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F0F081C6E;
	Fri, 22 Aug 2025 08:17:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lNHOjcZqKEfS; Fri, 22 Aug 2025 08:17:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9EF1681C44
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9EF1681C44;
	Fri, 22 Aug 2025 08:17:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6512D1C8
 for <buildroot@buildroot.org>; Fri, 22 Aug 2025 08:17:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 55EC781BA8
 for <buildroot@buildroot.org>; Fri, 22 Aug 2025 08:17:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HjZKFTkgq8xN for <buildroot@buildroot.org>;
 Fri, 22 Aug 2025 08:17:18 +0000 (UTC)
X-Greylist: delayed 344 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 22 Aug 2025 08:17:17 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 51DAB81C46
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 51DAB81C46
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.bonnefille@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 51DAB81C46
 for <buildroot@buildroot.org>; Fri, 22 Aug 2025 08:17:17 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id CE2791A0984
 for <buildroot@buildroot.org>; Fri, 22 Aug 2025 08:11:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 9ECB6604AD;
 Fri, 22 Aug 2025 08:11:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id EAC811C22D0C9; 
 Fri, 22 Aug 2025 10:11:15 +0200 (CEST)
Date: Fri, 22 Aug 2025 10:11:06 +0200
Message-Id: <20250822-update_star64-v1-0-83fe87fbe8ea@bootlin.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIABomqGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDC0NL3dKClMSS1PjiksQiMxPdFOMkkzSTNEsLk0QzJaCegqLUtMwKsHn
 RsbW1AAsy+StfAAAA
X-Change-ID: 20250819-update_star64-d3b4f4f984a6
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1755850290; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding; bh=HKL4fsPnt6sSpYGozGVhRz+7kENrlZJw7gbVJXiB8+w=;
 b=wqqcO9BVdabazzwUkCVvRdoaI03D9wKoMZDKZl/AsbLZyDdm3yK5hGWQKOwwkFd5mgESys
 IC4jq07rkhOzZMhJDMb2sa769VabOWsDJbUQMKCCEMY08maojknSg2ZVYeP6PtmsuNIMPW
 YRA2LtPABY1j00qxwaZwxri0rLPnsIHJsYfiR0rcr6pdS3QnmuB9Cz44S93Z7BlAXXJfyz
 l5Itu9N1ztZqqX19KNytzPOoo2EuxQC6R6ToV9H073qY0zsZZqNCQMHe9ycaRGmqW8du7p
 Tkh7THYMUiipSxg4z4bmtxn/htZnBt1eQ1vk9upDCeWC6kHWUkcMgbZTy1pvpA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=wqqcO9BV
Subject: [Buildroot] [PATCH 0/2] Port the Pine64 Star64 defconfig to use
 mainline components
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Bonnefille via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
---
Thomas Bonnefille (2):
      configs/pine64_star64: update defconfig to use mainline components
      package/starfive-spltool: remove the starfive-spltool package

 board/pine64/star64/genimage.cfg                   |  33 +-
 board/pine64/star64/linux_defconfig                | 570 +++++++++++++++++++++
 .../patches/linux-headers/linux-headers.hash       |   1 +
 board/pine64/star64/patches/linux/linux.hash       |   2 +
 board/pine64/star64/patches/opensbi/opensbi.hash   |   2 +
 board/pine64/star64/patches/uboot/uboot.hash       |   2 +
 board/pine64/star64/post-build.sh                  |   9 -
 board/pine64/star64/post-image.sh                  |   3 +
 board/pine64/star64/star64-uboot-fit-image.its     |  29 --
 board/pine64/star64/uboot_defconfig                | 145 ++++++
 configs/pine64_star64_defconfig                    |  39 +-
 package/Config.in.host                             |   1 -
 package/starfive-spltool/Config.in.host            |   8 -
 package/starfive-spltool/starfive-spltool.hash     |   2 -
 package/starfive-spltool/starfive-spltool.mk       |  20 -
 15 files changed, 767 insertions(+), 99 deletions(-)
---
base-commit: ded3e0045aeeab226d2770fe8de522422c174434
change-id: 20250819-update_star64-d3b4f4f984a6

Best regards,
-- 
Thomas Bonnefille <thomas.bonnefille@bootlin.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
