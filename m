Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5215FC433EF
	for <buildroot@archiver.kernel.org>; Thu, 17 Feb 2022 15:11:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F260D41BF7;
	Thu, 17 Feb 2022 15:11:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id or_X111SZuqZ; Thu, 17 Feb 2022 15:11:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2776441BD7;
	Thu, 17 Feb 2022 15:11:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5C0B41C113E
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 15:11:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 478714027A
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 15:11:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=othermo.de
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yDaiupT3TVie for <buildroot@lists.busybox.net>;
 Thu, 17 Feb 2022 15:11:03 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mout-b-105.mailbox.org (mout-b-105.mailbox.org [195.10.208.50])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5365640165
 for <buildroot@buildroot.org>; Thu, 17 Feb 2022 15:11:03 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [80.241.60.233])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-b-105.mailbox.org (Postfix) with ESMTPS id 4JzyvR2bJ8z9snB
 for <buildroot@buildroot.org>; Thu, 17 Feb 2022 16:10:59 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=othermo.de; s=MBO0001; 
 t=1645110657;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=QmGWPXg7g+4LAntURCC34JNsRxpLkKA1un7qjzssEuA=;
 b=MOL23h18GJn00f9aGeFKJRE+GT2ci5PAnzQxaqLRhbpLJwS7dWqOBFplZxBqmdg2G/D3me
 4ETKDM0wR0cQY05tVXn03f5gToRmnlg/IS2zXDrUWuFYG/ijllY2/9LEK/rNhh+cpEGH3R
 3SgtjCfLstYMwh+z0j5eV7ZTmfX9pVv65fCVT66F3fyR1LRmTmeMe0MrJrKE1TAKnDwXbD
 mL4fv2O6bcynB3KCLwWKq7PFWOrNv5gohd8bmhuzqkSMakxKg5Q8e7fTHODIFlVwEq44u8
 fOX4iEdoOtM4XaZk4x1M+G1KZ21F0EvOXcyzHNXYNUtniaCCv9Yc7MneuuvbYA==
From: Marcus Hoffmann <marcus.hoffmann@othermo.de>
To: buildroot@buildroot.org
Date: Thu, 17 Feb 2022 16:10:52 +0100
Message-Id: <20220217151054.865073-1-marcus.hoffmann@othermo.de>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 0/2] defconfig fixes
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
