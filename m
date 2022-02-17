Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28409C433F5
	for <buildroot@archiver.kernel.org>; Thu, 17 Feb 2022 15:56:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B65C83F7D;
	Thu, 17 Feb 2022 15:56:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I-YksNvfNDPR; Thu, 17 Feb 2022 15:56:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D985E833CD;
	Thu, 17 Feb 2022 15:56:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 370801BF2B9
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 15:55:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 26044833CD
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 15:55:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R-_9KHmsfI_D for <buildroot@lists.busybox.net>;
 Thu, 17 Feb 2022 15:55:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mout-b-206.mailbox.org (mout-b-206.mailbox.org [195.10.208.51])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7341983367
 for <buildroot@buildroot.org>; Thu, 17 Feb 2022 15:55:58 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:1:0])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-b-206.mailbox.org (Postfix) with ESMTPS id 4JzzvH4MSGz9sSg
 for <buildroot@buildroot.org>; Thu, 17 Feb 2022 16:55:55 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=othermo.de; s=MBO0001; 
 t=1645113353;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=vgMZ/O8Ci8g8mALwndhNO35BhYfZR0091e6DFvmdMnM=;
 b=hztEEZzzvgvw9vyp8im2rPHNtsmxcUsN+Kl2rW2GQQXOY1CIzlyvDIClb130Sk/JQ4SrC6
 hpEH7W2EZVVzZwDXctWKn+YKY4AxGxfglNqvzvJovjwfobnZDv2jID43r2QTvEy4YeOeeY
 TqGMKpiWtlv1BEcdWzmKL/J5ntqP+PNDB1WU2+MI1TydMrvldd2FxWJ2S3w21GJ56BLd4U
 5dGI6w/EWBj6nWo+XpPoUigx69KLb+5sg0whwItE2GeobNv921okH2gngOWFel5qI1tR1/
 MfrEyxs1J7uyM7tfOQMKLjVi0bulObaVbSXUQzMyYqk5pU87nP4LzeILgOEI9g==
From: Marcus Hoffmann <marcus.hoffmann@othermo.de>
To: buildroot@buildroot.org
Date: Thu, 17 Feb 2022 16:55:47 +0100
Message-Id: <20220217155549.1084829-1-marcus.hoffmann@othermo.de>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 0/2] defconfig fixes
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

I was looking at some of the defconfigs and found these two easy to 
fix issues. I don't have those boards, so these are not tested besides
being able to compile them again.

Changes v1 -> v2:
  - Add references to gitlab CI's defconfig run failures (Giulio Benetti)

Marcus Hoffmann (2):
  configs/friendlyarm_nanopi_r2s_defconfig: uboot needs openssl
  board/orangepi/orangepi-rk3399/genimage: fix partition types for gpt

 board/orangepi/orangepi-rk3399/genimage.cfg | 3 +--
 configs/friendlyarm_nanopi_r2s_defconfig    | 1 +
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
